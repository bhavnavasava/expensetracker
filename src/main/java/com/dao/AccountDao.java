package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AccountBean;

@Repository
public class AccountDao {

	@Autowired
	JdbcTemplate stmt;

	public void addAccount(AccountBean account) {
		stmt.update("insert into account (userid,actype,ammount,cardno,upiid,active) values(?,?,?,?,?,?)",
				account.getUserId(), account.getAcType(), account.getAmmount(), account.getCardNo(), account.getUpiId(),
				account.getActive());

	}

	public List<AccountBean> getAccountDetails(int userId) {
		return stmt.query("select * from account where userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}
	
	public List<AccountBean> getAcType(int userId) {
		return stmt.query("select * from account where userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}
	
	public List<AccountBean> getAccountDetailsOfCash(int userId) {
		return stmt.query("select * from account where actype='cash' and  userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}

	public List<AccountBean> getAccountDetailsOfCreditCard(int userId) {
		return stmt.query("select * from account where actype='creditcard' and  userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}

	public List<AccountBean> getAccountDetailsOfDebitCard(int userId) {
		return stmt.query("select * from account where actype='debitcard' and  userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}

	public List<AccountBean> getAccountDetailsOfPayTm(int userId) {
		return stmt.query("select * from account where actype='paytm' and  userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });

	}

	public List<AccountBean> getAmmountById(int acId) {
		return stmt.query("select ammount from account where acid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { acId });
	}

	public List<AccountBean> sum(int userId) {
		return stmt.query("select sum(ammount) as ammount from account where userid=?",
				new BeanPropertyRowMapper<AccountBean>(AccountBean.class), new Object[] { userId });
	}

	public void disable(AccountBean account) {
		stmt.update("update account set active=? where acid=?", account.getActive(), account.getAcId());
		account.setActive("disable");

	}

	public int addAmmount(AccountBean account, int amtId) {
		return stmt.update("update account set ammount=? where acid=?", amtId, account.getAcId());
	}

	public void updatedfAm(int acId, int fAm) {
		stmt.update("update aacount set ammount=? where acid=?", acId);
	}

}
