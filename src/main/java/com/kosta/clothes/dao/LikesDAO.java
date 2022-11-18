package com.kosta.clothes.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.kosta.clothes.bean.Likes;

@Mapper
@Repository
public interface LikesDAO {
	/* 무료나눔 찜 */
	void insertSlikes(Likes likes) throws Exception; //찜 기능
	void deleteSlikes(Integer sno) throws Exception;
	//Likes selectSLikes(Likes likes) throws Exception;
	void upSlikescheck(Likes likes) throws Exception;
	void downSlikescheck(Likes likes) throws Exception;
<<<<<<< HEAD
	Long getSlikescheck(Likes likes) throws Exception;
	/* 개인판매 찜 */
	void insertIlikes(Likes likes) throws Exception;
	Long getIlikescheck(Likes likes) throws Exception;
	void upIlikescheck(Likes likes) throws Exception;
	void downIlikescheck(Likes likes) throws Exception;
	void deleteIlikes(Integer ino) throws Exception;

=======
	Long getLikescheck(Likes likes) throws Exception;
	
	List<Likes> getbno(Integer userno) throws Exception;
>>>>>>> 2bf4c1e3bd4bb197e9ab273794ceed0d8eda3d82
}
