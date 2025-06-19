package cn.sijay.elegant.core.properties;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Data
@Component
@ConfigurationProperties(prefix = "proxy")
public class ProxyProperties {
    private List<ProxyRule> rules = new ArrayList<>();

    @Data
    public static class ProxyRule {
        private String path;
        private String target;
        private int timeout = 5;
    }
}