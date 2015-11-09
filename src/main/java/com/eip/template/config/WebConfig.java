package com.eip.template.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.access.SecurityConfig;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

/**
 * Created by 이주환 on 2015-09-16.
 */
public class WebConfig implements WebApplicationInitializer {
    @Override
    public void onStartup(ServletContext sc) throws ServletException {
        // Spring Root Context
        AnnotationConfigWebApplicationContext rootContext = new AnnotationConfigWebApplicationContext();
        rootContext.register(RootConfig.class);
        rootContext.register(DataConfig.class);
        //rootContext.register(SecurityConfig.class);
        rootContext.register(SocialConfig.class);
        sc.addListener(new ContextLoaderListener(rootContext));

        // Spring AdminServlet Context
        AnnotationConfigWebApplicationContext adminServletContext = new AnnotationConfigWebApplicationContext();
        adminServletContext.register(AdminServletConfig.class);
        ServletRegistration.Dynamic adminDispatcher = sc.addServlet("adminServlet", new DispatcherServlet(adminServletContext));
        adminDispatcher.setLoadOnStartup(1);
        adminDispatcher.addMapping("/admin/*");

        // Spring KorServlet Context
        AnnotationConfigWebApplicationContext korServletContext = new AnnotationConfigWebApplicationContext();
        korServletContext.register(KorServletConfig.class);
        ServletRegistration.Dynamic korDispatcher = sc.addServlet("korServlet", new DispatcherServlet(korServletContext));
        korDispatcher.setLoadOnStartup(2);
        korDispatcher.addMapping("/kor/*");

        CharacterEncodingFilter characterEncodingFilter = new CharacterEncodingFilter();
        characterEncodingFilter.setEncoding("UTF-8");
        characterEncodingFilter.setForceEncoding(true);
        sc.addFilter("Encoding Filter", characterEncodingFilter);

    }

}
