package com.kosta.clothes.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.kosta.clothes.bean.ChatList;
import com.kosta.clothes.bean.ChatRoom;


@Mapper
public interface ChatRoomDAO {
		
	public void addChatRoom (ChatRoom chatRoom) throws IOException;
	
	//String chatId, String pr_id, String senderId, String recipientId
	
	public List<ChatList> findByEmail(String chatuserno);
	
	public int countByChatId(@Param("ino") Integer ino, @Param("buyerno") Integer buyerno);
	
	public ChatRoom findByChatId(@Param("ino") Integer ino, @Param("buyerno") Integer buyerno);

	public void appendMessage(ChatRoom chatRoom) throws FileNotFoundException, IOException;

	public Integer getId(@Param("ino") Integer ino, @Param("buyerno") Integer buyerno);

	public void updateFileName(@Param("chatno") Integer chatno, @Param("fileName") String fileName);
	
	public void updateChatReadBuy(@Param("chatno") Integer chatno, @Param("chatReadBuy") int chatReadBuy);
	
	public void updateChatReadSell(@Param("chatno")Integer chatno, @Param("chatReadSell")int chatReadSell);

	public int getUnreadMessages(String chatuserno);
	
	public List<Integer> getUnreadChatRoom(String chatuserno);
}
