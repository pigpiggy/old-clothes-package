package com.kosta.clothes.security;

import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfiguration implements WebMvcConfigurer{
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authinterceptor())
				.addPathPatterns("/modifyuser")
				.addPathPatterns("/modifybusiness")
				.addPathPatterns("/upasscheck")
				.addPathPatterns("/bpasscheck");
//				.addPathPatterns("/*");
//				.excludePathPatterns("/loginaction","/logout","/css/**","/js/**","/lib/**","/sidebar/**");
		registry.addInterceptor(authlogininterceptor())
				.addPathPatterns("/loginaction");
		registry.addInterceptor(authlogoutinterceptor())
				.addPathPatterns("/logout");
	}
	@Bean 
	public AuthInterceptor authinterceptor() {
		return new AuthInterceptor();
	}
	@Bean
	public AuthLoginInterceptor authlogininterceptor() {
		return new AuthLoginInterceptor();
	}
	@Bean 
	public AuthLogoutInterceptor authlogoutinterceptor() {
		return new AuthLogoutInterceptor();
	}
	
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(new AuthUserHandlerMethodArgumentResolver());
	}

}
