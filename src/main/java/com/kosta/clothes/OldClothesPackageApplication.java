package com.kosta.clothes;

import java.util.Date;
import java.util.TimeZone;

import javax.annotation.PostConstruct;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class OldClothesPackageApplication {
	@PostConstruct
	public void started() {
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		System.out.println("현재시각 : "+new Date());
	}
	

	public static void main(String[] args) {
		SpringApplication.run(OldClothesPackageApplication.class, args);
	}

}
