package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bean.ExpenseBean;
import com.dao.ExpenseDao;

@Controller
public class ChartController {
	
	@Autowired
ExpenseDao expenseDao;
	
	@GetMapping("/mychart")
	public String myChart(ExpenseBean expense ,Model model) {
		List<ExpenseBean> expenses = expenseDao.getCategoryByAmmount(expense);
		model.addAttribute("expenses", expenses);
		return "MyChart";
	}


}
