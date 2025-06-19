package cn.sijay.elegant.common.proxy;

import cn.sijay.elegant.core.properties.ProxyProperties;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.boot.web.servlet.context.ServletWebServerApplicationContext;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.reactive.function.BodyInserters;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

import java.nio.charset.StandardCharsets;
import java.time.Duration;

@Slf4j
@RequiredArgsConstructor
@RestController
public class ProxyController {

    private final ProxyProperties proxyConfig;
    private final WebClient webClient;
    private final ServletWebServerApplicationContext serverContext;

    @RequestMapping("/api/**")
    public ResponseEntity<byte[]> proxyApi(HttpServletRequest request, @RequestBody(required = false) byte[] body, @RequestHeader HttpHeaders headers) {
        String query = request.getQueryString();
        String contextPath = null;
        if (serverContext.getServletContext() != null) {
            contextPath = serverContext.getServletContext().getContextPath();
        }
        String fullPath = "http://localhost:" +
                serverContext.getWebServer().getPort() +
                StringUtils.defaultString(contextPath) +
                request.getRequestURI().replaceFirst("^/api", "");
        return new RestTemplate().exchange(
                query != null ? fullPath + "?" + query : fullPath,
                HttpMethod.valueOf(request.getMethod()),
                new HttpEntity<>(body, headers),
                byte[].class
        );
    }

    @RequestMapping({"/external/**"})
    public Mono<ResponseEntity<byte[]>> proxyRequest(HttpServletRequest request, @RequestBody(required = false) byte[] body, @RequestHeader HttpHeaders headers) {
        String path = request.getRequestURI();
        // 查找匹配的转发规则
        ProxyProperties.ProxyRule rule = proxyConfig.getRules()
                                                    .stream()
                                                    .filter(r -> path.startsWith(r.getPath()))
                                                    .findFirst()
                                                    .orElse(null);
        if (rule == null) {
            return Mono.empty();
        }
        HttpMethod method = HttpMethod.valueOf(request.getMethod());
        String target = rule.getTarget();
        if (target != null) {
            String query = request.getQueryString();
            String fullPath = target + path.replaceFirst("^" + rule.getPath(), "");
            String targetUrl = query != null ? fullPath + "?" + query : fullPath;
            // 创建请求头副本（避免修改原始头信息）
            HttpHeaders filteredHeaders = new HttpHeaders();
            filteredHeaders.addAll(headers);
            // 移除不需要转发的头信息（根据需求调整）
            filteredHeaders.remove(HttpHeaders.CONTENT_LENGTH);
            filteredHeaders.remove(HttpHeaders.COOKIE);
            filteredHeaders.remove(HttpHeaders.AUTHORIZATION);
            return webClient.method(method)
                            .uri(targetUrl)
                            .headers(h -> h.addAll(filteredHeaders))
                            .body(body != null ? BodyInserters.fromValue(body) : BodyInserters.empty())
                            .exchangeToMono(response -> response.toEntity(byte[].class))
                            .timeout(Duration.ofSeconds(rule.getTimeout()))
                            .onErrorResume(e -> Mono.just(ResponseEntity
                                    .status(HttpStatus.BAD_GATEWAY)
                                    .body(e.getLocalizedMessage().getBytes(StandardCharsets.UTF_8))));
        }
        return Mono.justOrEmpty(ResponseEntity.badRequest().body("请求转发配置错误".getBytes(StandardCharsets.UTF_8)));
    }

}
