package com.kh.food.owner.member.model.vo;

import java.sql.Date;

public class Owner {

	private int ownerNum;
	private String ownerId;
	private String ownerPw;
	private String ownerName;
	private String ownerPhone;
	private String ownerEmail;
	private Date ownerEnrollDate;
	private Date lastConnectionDate;
	
	public Owner () {}
	
	
	public Owner(int ownerNum, String ownerId, String ownerPw, String ownerName, String ownerPhone, String ownerEmail,
			Date ownerEnrollDate, Date lastConnectionDate) {
		super();
		this.ownerNum = ownerNum;
		this.ownerId = ownerId;
		this.ownerPw = ownerPw;
		this.ownerName = ownerName;
		this.ownerPhone = ownerPhone;
		this.ownerEmail = ownerEmail;
		this.ownerEnrollDate = ownerEnrollDate;
		this.lastConnectionDate = lastConnectionDate;
	}



	public Date getLastConnectionDate() {
		return lastConnectionDate;
	}


	public void setLastConnectionDate(Date lastConnectionDate) {
		this.lastConnectionDate = lastConnectionDate;
	}


	public int getOwnerNum() {
		return ownerNum;
	}


	public void setOwnerNum(int ownerNum) {
		this.ownerNum = ownerNum;
	}


	public String getOwnerId() {
		return ownerId;
	}


	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
	}


	public String getOwnerPw() {
		return ownerPw;
	}


	public void setOwnerPw(String ownerPw) {
		this.ownerPw = ownerPw;
	}


	public String getOwnerName() {
		return ownerName;
	}


	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}


	public String getOwnerPhone() {
		return ownerPhone;
	}


	public void setOwnerPhone(String ownerPhone) {
		this.ownerPhone = ownerPhone;
	}


	public String getOwnerEmail() {
		return ownerEmail;
	}


	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}


	public Date getOwnerEnrollDate() {
		return ownerEnrollDate;
	}


	public void setOwnerEnrollDate(Date ownerEnrollDate) {
		this.ownerEnrollDate = ownerEnrollDate;
	}


	@Override
	public String toString() {
		return "Owner [ownerNum=" + ownerNum + ", ownerId=" + ownerId + ", ownerPw=" + ownerPw + ", ownerName="
				+ ownerName + ", ownerPhone=" + ownerPhone + ", ownerEmail=" + ownerEmail + ", ownerEnrollDate="
				+ ownerEnrollDate + ", lastConnectionDate=" + lastConnectionDate + "]";
	}
	
	
}
