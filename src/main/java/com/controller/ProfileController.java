package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bean.ProfileBean;
import com.bean.UserBean;
import com.dao.ProfileDao;
import com.service.FileUploadService;

@Controller
public class ProfileController {
	@Autowired
	ProfileDao profileDao;
	
	@Autowired
	FileUploadService  fileUploadService; 
	
	@GetMapping("/newprofile")
	public String newProfile() {
		return "NewProfile";
	}

	@PostMapping("/saveprofile")
	public String saveProfile(@RequestParam("profile") MultipartFile file, HttpSession session) {
		System.out.println(file.getOriginalFilename());
		System.out.println(file.getSize());

		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();

		fileUploadService.imgUpload(file, userId);
		ProfileBean profile = new ProfileBean();
		profile.setUserId(userId);
		profile.setImgUrl("resources\\images" +"\\"+ userId + "\\" + file.getOriginalFilename());
		profile.setActive(true);
		profileDao.addProfile(profile);

		return "NewProfile";
	}
	@GetMapping("/listallproflesimages")
	public String getAllProfileImages(HttpSession session,Model model) {
		UserBean user=(UserBean) session.getAttribute("user");
		int userId=user.getUserId();
		List<ProfileBean> profile=profileDao.getAllProfiles(userId);
		model.addAttribute("profile",profile);
		System.out.println(profile);
		return "ListAllImages";
		
	}
	
	@GetMapping("/deleteimage")
	public String deletImage(@RequestParam("profileid") int profileId) {
		profileDao.deleteImages(profileId);
		return "redirect:/listallproflesimages";
	}


}
