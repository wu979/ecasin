package com.csd.web.config;

import com.csd.generator.GeneratorHelper;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.FilterType;


//@EnableWebSecurity
//@EnableGlobalMethodSecurity(prePostEnabled = true)
@EnableAspectJAutoProxy(proxyTargetClass = true)
@Configuration
@EnableAutoConfiguration
@ComponentScan(
            basePackages = {"com.csd"},
            excludeFilters =
                    {
                            @ComponentScan.Filter(type = FilterType.ASSIGNABLE_TYPE,value = GeneratorHelper.class)
                    }
              )
public class EcasinWebConfig extends SpringBootServletInitializer {

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

