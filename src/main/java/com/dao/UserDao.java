package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.LoginBean;
import com.bean.UserBean;

@Repository
public class UserDao {

	@Autowired
	JdbcTemplate stmt;

	public void addUser(UserBean user) {
		stmt.update("insert into users (firstname,lastname,email,password,usertype,isactive) values(?,?,?,?,?,?)",
				user.getFirstName(), user.getLastName(), user.getEmail(), user.getPassword(),
				user.getUserType(), user.getIsActive());
	}
	
	public UserBean login(LoginBean login) {
		UserBean user = null;
		try {
			user = stmt.queryForObject("select * from users where email=? and password=?",
					new BeanPropertyRowMapper<UserBean>(UserBean.class),
					new Object[] { login.getEmail(), login.getPassword() });
		} catch (Exception e) {
			System.out.println("invalid email password");
		}
		return user;
	}
}
