package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;
import com.bean.CategoryBean;
import com.bean.ExpenseBean;
import com.bean.UserBean;

@Repository
public class ExpenseDao {

	@Autowired
	JdbcTemplate stmt;

	public void addExpense(ExpenseBean expense,int userId) {
		stmt.update("insert into expense (date,typeofpayment,userid,ammount,cid,subcategory) values(?,?,?,?,?,?)",
				 expense.getDate(), expense.getTypeOfPayment(), expense.getUserId(),
				expense.getAmmount(),expense.getcId(),expense.getSubCategoryId());
	}
	
	
	
	public List<ExpenseBean> getCategoryByAmmount(ExpenseBean expense) {
		return stmt.query("select c.category ,sum(e.ammount) as total from expense e,category c where e.cid=c.cid group by c.category",
				new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class));
		
		}

	public List<ExpenseBean> getAllExpense(int userId) {
		return stmt.query("select * from expense where userid=?",
				new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] { userId });
		//select e.*,c.category,c.cid from expense e,category c where e.cid=c.cid and e.userid=c.userid	
		}
	
	public void deleteExpense(int expenseId) {
		stmt.update("delete from expense where expenseid=?",expenseId);
	}
	
	public ExpenseBean getExpenseById(int expenseId) {
		ExpenseBean expense= stmt.queryForObject("select * from expense where expenseid=? ",new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] {expenseId});
		return expense;
	}
	
	public List<ExpenseBean> sum(int userId) {
		return stmt.query("select sum(ammount) as ammount from expense where userid=?",
				new BeanPropertyRowMapper<ExpenseBean>(ExpenseBean.class), new Object[] { userId });
	}

	
	public void updateExpense(ExpenseBean expense) {
		stmt.update("update expense set date=?,typeofpayment=?,ammount=? where expenseid=?", expense.getDate(),expense.getTypeOfPayment(),expense.getAmmount(),expense.getExpenseId());
		//stmt.update("update expense set date=?, typeofpayment=?,ammount=? where expenseid=? ",expense.getDate(),expense.getTypeOfPayment(),expense.getAmmount(),expense.getExpenseId());
	}
}
