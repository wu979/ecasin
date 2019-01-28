package com.csd.web;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;


@SpringBootApplication(scanBasePackages = {"com.csd.web", "com.csd.system","com.csd.busines"})
public class EcasinWebApplication extends SpringBootServletInitializer {

    /**
     * tomcat 容器
     * @param builder
     * @return
     */
    @Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(MybatisConfig.class);
    }


}

