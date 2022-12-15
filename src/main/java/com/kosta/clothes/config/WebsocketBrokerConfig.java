package com.kosta.clothes.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebsocketBrokerConfig implements WebSocketMessageBrokerConfigurer {

	private static final Logger LOGGER = LoggerFactory.getLogger(WebsocketBrokerConfig.class);

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		//configureMessageBroker는 유저가 메시지를 전송하거나 받을 수 있도록 중간에서 URL prefix(접두어)를 인식하여 올바르게 전송/전달(publish/subscribe)를 중계해주는 중개자(Broker) 역할
		//for subscribe prefix
		registry.enableSimpleBroker("/user");
		//for publish prefix
		registry.setApplicationDestinationPrefixes("/app");
		// Request destination prefix에 따라 broker를 거치냐 마느냐가 정해집니다. /app으로 보냈을 땐 Controller의 @Messagemapping으로 받아서 처리해줄 수 있으며 /topic으로 보낼 경우 동일한 prefix로 subscribe한 유저에게 다이렉트로 메시지를 전달할 수 있습니다. 
		//user destination provides ability to have unique user queue
		//registry.setUserDestinationPrefix("/user");
		
	}

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		//registerStompEndpoints는 메시지의 도착지점(endpoint)을 URL로 등록해주는 메서드입니다. 등록된 URL은 Controller의 @Messagemapping 어노테이션으로 할당해줘 SimpMessagingTemplate를 통해 약속된 경로나 유저에게 메시지를 전달
		registry.addEndpoint("/broadcast")
			.withSockJS() //fallback 기능을 하는 sockJS를 할당
			.setHeartbeatTime(60_000);//heart-beat란 STOMP에서 TCP 연결이 잘 되어있는지 체킹하는 것인데, HTTP header를 통해 연결 상태를 주기적으로 확인합니다. setHeartbeatTime은 그 주기를 설정하는 메서드.언더바 [ _ ]를 int나 long에 천단위마다 사용하면 단위를 보기 쉽게 나타낼 수 있습니다.
//
//		//when browser or network cause problems fallback allows realtime connectivity 
//		registry.addEndpoint("/broadcast")
//				.withSockJS()
//				.setHeartbeatTime(60_000);
	}

//	@Override
//	public boolean configureMessageConverters(List<MessageConverter> messageConverters) {
//		
//		DefaultContentTypeResolver resolver = new DefaultContentTypeResolver();
//		resolver.setDefaultMimeType(MimeTypeUtils.APPLICATION_JSON);
//		MappingJackson2MessageConverter converter = new MappingJackson2MessageConverter();
//		converter.setObjectMapper(new ObjectMapper());
//		converter.setContentTypeResolver(resolver);
//		messageConverters.add(converter);
//		
//		return false;
//	}


	
	
	
	

	
	

}
