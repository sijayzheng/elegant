package cn.sijay.elegant;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("cn.sijay.elegant.**.mapper")
@SpringBootApplication
public class ElegantApplication {

    public static void main(String[] args) {
        SpringApplication.run(ElegantApplication.class, args);
    }

}
