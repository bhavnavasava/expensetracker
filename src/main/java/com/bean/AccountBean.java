package com.bean;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

public class AccountBean {
	
	Integer userId;
	String active;	
	Integer acId;
	@NotBlank
	String acType;
	Integer total;
	@NotNull
	Integer ammount;
	Integer cardNo;
	Integer upiId;
	
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getCardNo() {
		return cardNo;
	}
	public void setCardNo(Integer cardNo) {
		this.cardNo = cardNo;
	}
	public Integer getUpiId() {
		return upiId;
	}
	public void setUpiId(Integer upiId) {
		this.upiId = upiId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getAcId() {
		return acId;
	}
	public void setAcId(Integer acId) {
		this.acId = acId;
	}
	public String getAcType() {
		return acType;
	}
	public void setAcType(String acType) {
		this.acType = acType;
	}
	public Integer getAmmount() {
		return ammount;
	}
	public void setAmmount(Integer ammount) {
		this.ammount = ammount;
	}
	}
