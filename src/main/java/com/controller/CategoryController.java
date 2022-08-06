package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.CategoryBean;
import com.bean.SubCategoryBean;
import com.bean.UserBean;
import com.dao.CategoryDao;

@Controller
public class CategoryController {
	@Autowired
	CategoryDao categoryDao;

	@GetMapping("/category")
	public String category(CategoryBean category, Model model) {
		model.addAttribute("category", category);
		return "AddCategory";
	}

	@PostMapping("/savecategory")
	public String saveCategory(@Valid CategoryBean category, BindingResult result, Model model, HttpSession session) {

		UserBean user = (UserBean) session.getAttribute("user");
		category.setUserId(user.getUserId());
		if (result.hasErrors()) {
			model.addAttribute("category", category);
			return "AddCategory";
		}
		categoryDao.addCategory(category);
		
		
		if (user.getUserType().contentEquals("customer")) {
			return "Home";
		} else  {
			return "AdminHome";
			// return "Home";
		}
	}

	@GetMapping("/getallcategory")
	public String getAllCategory(HttpSession session, CategoryBean category, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		// category.setUserId(user.getUserId());
		List<CategoryBean> categories = categoryDao.getAllCategory(userId);
		model.addAttribute("categories", categories);
		return "ListGategory";
	}
	
	@GetMapping("/getallcategories")
	public String getAllCategories(HttpSession session, CategoryBean category, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		// category.setUserId(user.getUserId());
		List<CategoryBean> categories = categoryDao.getAllCategories();
		model.addAttribute("categories", categories);
		
		
		
		return "ListGategory";
	}
	
	@GetMapping("/deletecategory")
	public String deleteExpense(@RequestParam("cId") int categoryId,CategoryBean category,HttpSession session) {

		UserBean user = (UserBean) session.getAttribute("user");
		category.setUserId(user.getUserId());
		categoryDao.deleteCategory(categoryId);

		if (user.getUserType().contentEquals("customer")) {
			return "redirect:/getallcategory";
		} else  {
			return "redirect:/getallcategories";
			// return "Home";
		}
	}
	
	

	@GetMapping("/subcategory")
	public String subCategory(SubCategoryBean subcategory, Model model, CategoryBean category, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<CategoryBean> categories = categoryDao.getAllCategory(userId);
		model.addAttribute("categories", categories);

		model.addAttribute("subcategory", subcategory);

		return "AddSubCategory";
	}

	@PostMapping("/savesubcategory")
	public String saveSubCategory(@Valid SubCategoryBean subCategory, BindingResult result, Model model,
			HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		subCategory.setUserId(user.getUserId());
		
		if (result.hasErrors()) {
			model.addAttribute("subCategory", subCategory);
			return "AddSubCategory";
		} else {
			categoryDao.addSubCategory(subCategory);
			return "Home";
		}
	}

	@GetMapping("/getallsubcategory")
	public String getAllSubCategory(SubCategoryBean subCategory, Model model) {
		List<SubCategoryBean> subCategories = categoryDao.getAllSubCategory(subCategory);
		model.addAttribute("subCategories", subCategories);
		return "ListGategory";
	}

}
