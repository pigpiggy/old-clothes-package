package com.kosta.clothes.security;

public interface EncryptHelper {
	String encrypt(String password);
	
	boolean isMatch(String password, String hashed);

}
