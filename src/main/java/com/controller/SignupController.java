package com.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.bean.LoginBean;
import com.bean.UserBean;
import com.dao.UserDao;

@Controller
public class SignupController {
	@Autowired
	UserDao userDao;

	@GetMapping("/signup")
	public String signup(UserBean user, Model model) {
		model.addAttribute("user", user);
		return "Signup";
	}

	@PostMapping("/saveuser")
	public String saveUser(@ModelAttribute("user") @Valid UserBean user, BindingResult result, Model model) {

		if (result.hasErrors()) {
			model.addAttribute("user", user);
			return "Signup";

		} else {
			user.setUserType("customer");
			user.setIsActive(1);
			userDao.addUser(user);

			return "Login2";
		}
	}

	@GetMapping("/login")
	public String login() {
		//model.addAttribute("user", user);
		return "Login2";

	}

	@PostMapping("/login")
	public String authenticate( LoginBean login, Model model, HttpSession session) {
		UserBean user = userDao.login(login);
		if (user == null) {
			model.addAttribute("msg", "InvalidCredentials");
			return "Login2";
		} else {
			if (user.getUserType().contentEquals("customer") && user.getIsActive() == 1) {
				session.setAttribute("user", user);
				return "Home";
			} else if (user.getUserType().contentEquals("admin") && user.getIsActive() == 1) {
				session.setAttribute("user", user);
				return "AdminHome";

			} else {
				return "Login2";
			}
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "Login2";
	}
}
