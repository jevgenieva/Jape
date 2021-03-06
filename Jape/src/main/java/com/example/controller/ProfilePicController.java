package com.example.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.CopyOption;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.example.model.User;

import io.undertow.attribute.RequestMethodAttribute;

@Controller
@SessionAttributes("filename")
@MultipartConfig
public class ProfilePicController {
	
	private String vzemiToqImage;

	private static final String FILE_LOCATION = "D:\\pics\\";
//	private static final String FILE_LOCATION = "/Users/user-05/Desktop/pics/";
	
	@RequestMapping(value="error/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void errorPag(@PathVariable("fileName") String fileName,HttpServletRequest request, HttpServletResponse resp, Model model) throws IOException {
		
			fileName = "Error-Page.png";
		
		
		File file = new File(FILE_LOCATION + fileName);
		Files.copy(file.toPath(), resp.getOutputStream());
	}
	
	@RequestMapping(value="profilePic/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void profilePic(@PathVariable("fileName") String fileName,HttpServletRequest request, HttpServletResponse resp, Model model) throws IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		if(user == null ){
			fileName = "Error-Page.png";
		}
		else{
			 fileName = user.getProfilePic();
		}
		
		File file = new File(FILE_LOCATION + fileName );
		Files.copy(file.toPath(), resp.getOutputStream());
	}
	
	
	@RequestMapping(value="/profileJapes/{fileName}", method=RequestMethod.GET)
	@ResponseBody
	public void profileJapes(@PathVariable("fileName") String Id,HttpServletRequest request, HttpServletResponse resp, Model model) throws IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		Long gagId =Long.valueOf(Id);
		
		String fileName = user.getGags().get(gagId).getGag();
		System.out.println("Gag id in profile japes: " + fileName);
		File file = new File(FILE_LOCATION + fileName);
		Files.copy(file.toPath(), resp.getOutputStream());
	}
	
}
