package com.eip.template.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.web.servlet.config.annotation.*;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

/**
 * Created by 이주환 on 2015-09-16.
 */
@Configuration
@EnableWebMvc
@EnableAsync // @Async 어노테이션을 사용하기 위함
@ComponentScan(basePackages = "com.eip.template.controller.admin")
public class AdminServletConfig extends WebMvcConfigurerAdapter {
    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
        configurer.enable();
    }

    // context root에 요청이 왔을 때 표시 될 페이지를 등록
    /*@Override
    public void addViewControllers(ViewControllerRegistry registry) {
        registry.addViewController("/login").setViewName("login");
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }*/

    // static resource 등록
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/resources/**").addResourceLocations("/resources/").setCachePeriod(31556926);
        registry.setOrder(Ordered.HIGHEST_PRECEDENCE);
    }

}