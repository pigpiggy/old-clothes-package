package com.kosta.clothes.bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

import com.kosta.clothes.handler.MyTextWebSocketHandler;



@Configuration
@EnableWebSocket
public class WebSocketConfig implements WebSocketConfigurer {
 
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(new MyTextWebSocketHandler(), "/_chat");
	}

	
}
