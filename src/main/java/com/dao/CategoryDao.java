package com.dao;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CategoryBean;
import com.bean.SubCategoryBean;

@Repository
public class CategoryDao {

	@Autowired
	JdbcTemplate stmt;
	
	public void addCategory(CategoryBean category) {	
		stmt.update("insert into category (category,userid) values(?,?)", category.getCategory(),category.getUserId());
	}
	
	public List<CategoryBean> getAllCategory(int userId) {
		return stmt.query("select * from category where userid=1 or userid=?", new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class),new Object[] {userId});
	}
	
	public List<CategoryBean> getAllCategories() {
		return stmt.query("select * from category ", new BeanPropertyRowMapper<CategoryBean>(CategoryBean.class));
	}

	public void addSubCategory(SubCategoryBean subCategory) {
		stmt.update("insert into subcategory (subcategory,cid,userid) values(?,?,?)", subCategory.getSubCategory(),subCategory.getcId(),subCategory.getUserId());
	}

	public List<SubCategoryBean> getAllSubCategory(SubCategoryBean subCategory) {
			return stmt.query("select * from subcategory", new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class));
	}
	
	public List<SubCategoryBean> getSubCategory(int cId) {
		return stmt.query("select * from subcategory where cid=?", new BeanPropertyRowMapper<SubCategoryBean>(SubCategoryBean.class),new Object[] {cId});
}

	public void deleteCategory(int cId) {
		stmt.update("delete  from category where cid=?",cId);
	}
}
