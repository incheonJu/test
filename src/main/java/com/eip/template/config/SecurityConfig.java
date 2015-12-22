package com.eip.template.config;

import com.eip.template.security.OperLoginSuccessHandler;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.StandardPasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean
    public StandardPasswordEncoder passwordEncoder() {
        return new StandardPasswordEncoder();
    }

    @Bean
    public OperLoginSuccessHandler operLoginSuccessHandler() {
        return new OperLoginSuccessHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .and().formLogin().loginPage("/admin/login")
                .and().formLogin().loginProcessingUrl("/admin/j_spring_security_check")
                .and().formLogin().successHandler(operLoginSuccessHandler())
                .and().formLogin().failureUrl("/admin/login?error=true")
                .and().csrf()
                .and().exceptionHandling().accessDeniedPage("/Access_Denied");



    }

}
