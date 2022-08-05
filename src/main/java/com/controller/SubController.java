
package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.bean.AccountBean;
import com.bean.SubCategoryBean;
import com.bean.UserBean;
import com.dao.AccountDao;
import com.dao.CategoryDao;

@RestController
public class SubController {

	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountDao accountDao;

	@GetMapping("/subcategories")
	public List<SubCategoryBean> getAllCategory(@RequestParam("cId") int cId) {
		List<SubCategoryBean> categories = categoryDao.getSubCategory(cId);
		return categories;
	}

	@GetMapping("/accounts")
	public List<AccountBean> getAllAccountDetails(HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		//int userId = user.getUserId();
		List<AccountBean> accounts = accountDao.getAcType(user.getUserId());
		return accounts;
	}
}
