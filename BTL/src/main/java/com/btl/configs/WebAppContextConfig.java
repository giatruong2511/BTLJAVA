/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.configs;

import com.btl.formatter.BusHomeFormatter;
import com.btl.formatter.CarFormatter;
import com.btl.formatter.DateConverter;
import com.btl.formatter.RouteFormatter;

import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.format.FormatterRegistry;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.validation.Validator;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


/**
 *
 * @author DELL
 */
@Configuration
@EnableWebMvc
@EnableTransactionManagement
@ComponentScan(basePackages = {
    "com.btl.controllers",
    "com.btl.repository",
    "com.btl.service",
    "com.btl.formatter"
})
public class WebAppContextConfig implements WebMvcConfigurer {

    @Override
    public void configureDefaultServletHandling(DefaultServletHandlerConfigurer conf) {
        conf.enable();
    }

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registy) {
        registy.addResourceHandler("css/**").addResourceLocations("/resources/css/");
        registy.addResourceHandler("/images/**").addResourceLocations("/resources/images/");
        registy.addResourceHandler("/js/**").addResourceLocations("/resources/js/");
        registy.addResourceHandler("/assets/**").addResourceLocations("/resources/assets/");
    }
//    @Bean
//    public InternalResourceViewResolver viewResolver() {
//        InternalResourceViewResolver r = new InternalResourceViewResolver();
//        r.setViewClass(JstlView.class);
//        r.setPrefix("/WEB-INF/jsp/");
//        r.setSuffix(".jsp");
//
//        return r;
//    }

    @Bean
    public CommonsMultipartResolver multipartResolver() {
        CommonsMultipartResolver resolver
                = new CommonsMultipartResolver();
        resolver.setDefaultEncoding("UTF-8");
        return resolver;
    }
//    @Bean
//    public Cloudinary cloudinary() {
//        Cloudinary cloudinary
//                = new Cloudinary(ObjectUtils.asMap(
//                    "cloud_name", "nvt251101",
//                    "api_key", "275924889448757",
//                    "api_secret", "qYRRC1vRsr__tJXGpUfc3gdQazI",
//                    "secure", true));
//        return cloudinary;
//    }
    @Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource m = new ResourceBundleMessageSource();
        m.setBasename("messages");

        return m;
    }
    
    @Bean
    public Validator validator() {
        LocalValidatorFactoryBean v = new LocalValidatorFactoryBean();
        v.setValidationMessageSource(messageSource());

        return v;
    }

    @Override
    public Validator getValidator() {
        return validator();
    }
    @Override
    public void addFormatters(FormatterRegistry r) {
        r.addFormatter(new RouteFormatter());
        r.addFormatter(new CarFormatter());
        r.addFormatter(new BusHomeFormatter());
        r.addConverter(new DateConverter("yyyy-mm-dd"));
    }
}
