package com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bean.AccountBean;
import com.bean.CategoryBean;
import com.bean.ExpenseBean;
import com.bean.UserBean;
import com.dao.AccountDao;
import com.dao.CategoryDao;
import com.dao.ExpenseDao;

@Controller
public class ExpenseController {

	@Autowired
	ExpenseDao expenseDao;
	@Autowired
	CategoryDao categoryDao;

	@Autowired
	AccountDao accountDao;

	@GetMapping("/expense")
	public String expense(ExpenseBean expense, Model model, CategoryBean category, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<CategoryBean> categories = categoryDao.getAllCategory(userId);
		model.addAttribute("categories", categories);
		model.addAttribute("expense", expense);
		List<AccountBean> acTypes = accountDao.getAcType(user.getUserId());
		model.addAttribute("acTypes", acTypes);
		return "AddExpense";
	}

	@PostMapping("/saveexpense")
	public String saveExpense(@Valid @ModelAttribute("expense") ExpenseBean expense, BindingResult result, Model model,
			HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		expense.setUserId(user.getUserId());
		int userId = expense.getUserId();
		if (result.hasErrors()) {
			model.addAttribute("expense", expense);
			return "AddExpense";
		} else {

			model.addAttribute("message", "added");
			// expenseBean.setUserId(userBean.getUserId());
			// System.out.println(expenseBean.getCategoryName());
			// System.out.println(expenseBean.getTypeOfPayment());

			List<AccountBean> account = accountDao.getAccountDetails(userId);
			System.out.println("get type  " + account.get(0).getAcType());
			System.out.println("get ammount in expense controller" + account.get(0).getAmmount());

			int acid = Integer.parseInt(expense.getTypeOfPayment());
			int fAm = 0;
			//boolean flag = false;
			for (int i = 0; i < account.size(); i++) { //

				if (acid == account.get(i).getAcId() && expense.getAmmount() < account.get(i).getAmmount()) {
					fAm = account.get(i).getAmmount() - expense.getAmmount();

					int acId = account.get(i).getAcId();
					accountDao.updatedfAm(acId, fAm); //
					expenseDao.addExpense(expense, userId); // return "CustomerHome"; flag = true;
				}
			}

			if (user.getUserType().contentEquals("customer")) {
				return "Home";
			} else {
				return "AdminHome";
			}

			// expenseDao.addExpense(expenseBean,userId);
			// return "CustomerHome";
		}
	}

	@GetMapping("/getallexpense")
	public String getAllExpense(Model model, HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		int userId = user.getUserId();
		List<ExpenseBean> expense = expenseDao.getAllExpense(userId);
		model.addAttribute("expense", expense);

		return "ListAllExpense";
	}

	@GetMapping("/deleteexpense")
	public String deleteExpense(@RequestParam("expenseId") int expenseId) {
		expenseDao.deleteExpense(expenseId);
		return "redirect:/getallexpense";
	}

	@GetMapping("/editexpense")
	public String saveUpdateOfExpense(@RequestParam("expenseId") int expenseId, Model model) {
		ExpenseBean expense = expenseDao.getExpenseById(expenseId);
		System.out.println(expenseId);
		model.addAttribute("expense", expense);
		return "UpdateExpense";
	}

	@PostMapping("/updateexpense")
	public String updateExpense(ExpenseBean expenseBean) {
		System.out.println(expenseBean.getDate());
		System.out.println(expenseBean.getAmmount());
		System.out.println(expenseBean.getExpenseId());
		expenseDao.updateExpense(expenseBean);
		return "redirect:/getallexpense";
	}
}
