package com.kosta.clothes.controller;

import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class MainController {
	
	@Autowired
	ServletContext servletContext;
	
	@GetMapping("/")
	String main() {
		return "/home";
	}
	
	@GetMapping("/image/{filename}")
	public void viewImage(@PathVariable String filename, HttpServletResponse response) {
		String path = servletContext.getRealPath("/image/");
		FileInputStream fis = null;
		try {
			fis = new FileInputStream(path+filename);
			OutputStream out = response.getOutputStream();
			FileCopyUtils.copy(fis, out);
		} catch(Exception e){
			e.printStackTrace();
		} finally {
			if(fis!=null) {
				try {
					fis.close();
				} catch(Exception e) {}
			}
		}
		
	}
}
