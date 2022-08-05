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
import com.bean.ExpenseBean;
import com.bean.UserBean;
import com.dao.AccountDao;
import com.dao.ExpenseDao;
import com.dao.UserDao;

@Controller
public class AccountController {
	@Autowired
	AccountDao accountDao;

	@Autowired
	ExpenseDao expenseDao;

	@Autowired
	UserDao userDao;

	@GetMapping("/createaccount")
	public String createAccount(AccountBean account, Model model) {
		model.addAttribute("account", account);
		return "CreateAccount";
	}

	@PostMapping("/saveaccount")
	public String saveAccount(@Valid @ModelAttribute("account") AccountBean account, BindingResult result, Model model,
			HttpSession session) {
		UserBean user = (UserBean) session.getAttribute("user");
		account.setActive("active");// 317995
		account.setUserId(user.getUserId());

		if (result.hasErrors()) {
			account.setUserId(user.getUserId());
			model.addAttribute("account", account);
			return "CreateAccount";
		} else {
			accountDao.addAccount(account);

			if (user.getUserType().contentEquals("customer")) {
				return "Home";
			} else {
				return "AdminHome";
				// return "Home";
			}
		}
	}

	@GetMapping("/getaccountdetail")
	public String getAccountDetails(AccountBean account, HttpSession session, Model model) {
		UserBean user = (UserBean) session.getAttribute("user");
		account.setUserId(user.getUserId());
		int userId = user.getUserId();

		// tables
		System.out.println("userId" + userId);
		System.out.println(account);
		
		List<AccountBean> accounts = accountDao.getAccountDetails(userId);
		model.addAttribute("accounts", accounts);
		
		List<AccountBean> acTypes=accountDao.getAcType(user.getUserId());
		model.addAttribute("acTypes", acTypes);
		
		System.out.println("actypes"+ acTypes);
		
		System.out.println(accounts);
		// accounts.add(account);
		for (int i = 0; i < accounts.size(); i++) {
			System.out.println("account type " + accounts.get(i).getAcType());

			/*
			 * if (accounts.get(i).getAcType().contentEquals("cash")) { List<AccountBean>
			 * cashAcType = accountDao.getAccountDetailsOfCash(userId);
			 * model.addAttribute("cashAcType", cashAcType); }
			 * 
			 * if (account.getAcType().contentEquals("creditcard")) { List<AccountBean>
			 * creditCardAcType = accountDao.getAccountDetailsOfCreditCard(userId);
			 * model.addAttribute("creditCardAcType", creditCardAcType); }
			 * 
			 * if (account.getAcType().contentEquals("debitcard")) { List<AccountBean>
			 * debitCardAcType = accountDao.getAccountDetailsOfDebitCard(userId);
			 * model.addAttribute("debitCardAcType", debitCardAcType); }
			 * 
			 * if (account.getAcType().contentEquals("paytm")) { List<AccountBean>
			 * payTmAcType = accountDao.getAccountDetailsOfPayTm(userId);
			 * model.addAttribute("payTmAcType", payTmAcType); }
			 */
			
			
			List<AccountBean> cashAcType = accountDao.getAccountDetailsOfCash(userId);
			model.addAttribute("cashAcType", cashAcType);

			List<AccountBean> debitCardAcType = accountDao.getAccountDetailsOfDebitCard(userId);
			model.addAttribute("debitCardAcType", debitCardAcType);

			List<AccountBean> creditCardAcType = accountDao.getAccountDetailsOfCreditCard(userId);
			model.addAttribute("creditCardAcType", creditCardAcType);

			List<AccountBean> payTmAcType = accountDao.getAccountDetailsOfPayTm(userId);
			model.addAttribute("payTmAcType", payTmAcType);
		}

		// plus-minus

		int total = 0;
		List<AccountBean> ac = accountDao.sum(userId);
		System.out.println("account " + ac.get(0).getAmmount());

		List<ExpenseBean> expense = expenseDao.sum(userId);
		System.out.println("expense " + expense.get(0).getAmmount());

		total = ac.get(0).getAmmount() - expense.get(0).getAmmount();
			
		//model.addAttribute("ac",ac);
		model.addAttribute("total",total);
		System.out.println(total);
		return "ViewAccountDetails";
	}

	@GetMapping("/addmoney")
	public String addMoney(@RequestParam("acId") int acId, Model model) {
		model.addAttribute("acId", acId);
		return "AddAmount";
	}

	@PostMapping("/saveammount")
	public String saveAmmount(@RequestParam("acId") int acId, AccountBean account, HttpSession session) {

		account.getAmmount();
		List<AccountBean> acc = accountDao.getAmmountById(acId);
		System.out.println(acc.get(0).getAmmount());
		int amtId = acc.get(0).getAmmount() + account.getAmmount();

		accountDao.addAmmount(account, amtId);
		return "redirect:/getaccountdetail";
	}

}
