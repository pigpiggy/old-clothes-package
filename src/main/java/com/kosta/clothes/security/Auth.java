package com.kosta.clothes.security;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

//RetentionPolicy : 유효한 기간

@Target({ElementType.TYPE,ElementType.METHOD})//어노테이션 붙일 곳 지정
@Retention(RetentionPolicy.RUNTIME)
public @interface Auth {
	public enum Role{
		User
	}
	//이와 같이 작성하면 메서드 위에 @Auth(role=Role.USer)와 같이 작성 가능
	public Role role() default Role.User;
}
