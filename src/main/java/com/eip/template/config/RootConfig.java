package com.eip.template.config;

import org.apache.tiles.Attribute;
import org.apache.tiles.Definition;
import org.apache.tiles.definition.UnresolvingLocaleDefinitionsFactory;
import org.apache.tiles.request.Request;
import org.springframework.context.annotation.*;
import org.springframework.http.MediaType;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

import java.nio.charset.Charset;
import java.util.*;

/**
 * 루트 설정용 클래스.
 * 이 클래스는 스프링의 root-context.xml 의 역할을 대신한다.
 * Created by 이주환 on 2015-09-16.
 */
@Configuration
@ComponentScan(basePackages = "com.eip.template", excludeFilters = @ComponentScan.Filter( value= Controller.class, type = FilterType.ANNOTATION))
public class RootConfig {

    @Bean
    public ViewResolver viewResolver(){
        UrlBasedViewResolver urlBasedViewResolver = new UrlBasedViewResolver();
        urlBasedViewResolver.setViewClass(TilesView.class);
        urlBasedViewResolver.setOrder(1);

        return urlBasedViewResolver;
    }

    @Bean
    public TilesConfigurer getTilesConfigurer() {
        TilesConfigurer tilesConfigurer = new TilesConfigurer();
        tilesConfigurer.setCheckRefresh(true);
        tilesConfigurer.setDefinitionsFactoryClass(TilesConfig.class);

        // Add apache tiles definitions
        TilesConfig.addDefinitions();

        return tilesConfigurer;
    }

    @Bean
    public InternalResourceViewResolver internalResourceViewResolver(){
        InternalResourceViewResolver jspViewResolver = new InternalResourceViewResolver();
        jspViewResolver.setPrefix("/WEB-INF/views/");
        jspViewResolver.setSuffix(".jsp");

        return jspViewResolver;
    }

    @Bean
    public RequestMappingHandlerAdapter requestMappingHandlerAdapter(){
        StringHttpMessageConverter stringHttpMessageconverter = new StringHttpMessageConverter();
        stringHttpMessageconverter.setSupportedMediaTypes(Arrays.asList(new MediaType("text", "html", Charset.forName("UTF-8"))));

        List<HttpMessageConverter<?>> converter = new ArrayList<HttpMessageConverter<?>>();
        converter.add(stringHttpMessageconverter);
        RequestMappingHandlerAdapter rmha = new RequestMappingHandlerAdapter();
        rmha.setMessageConverters(converter);

        return rmha;
    }

    @Bean
    public CommonsMultipartResolver commonsMultipartResolver(){
        CommonsMultipartResolver commonsMultipartResolver = new CommonsMultipartResolver();
        commonsMultipartResolver.setMaxUploadSize(1000000);

        return commonsMultipartResolver;
    }

}
