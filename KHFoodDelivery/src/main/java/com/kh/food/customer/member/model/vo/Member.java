package com.kh.food.customer.member.model.vo;

import java.sql.Date;

public class Member {

	private int memberNum;
	private String memberId;
	private String memberPw;
	private String memberName;
	private String memberAddress;
	private String memberBirth;
	private String memberPhone;
	private String memberEmail;
	private String nickName;
	private Date memberEnrollDate;
	private String gender;
	private String mileage;
	private int isAdmin;
	private String rlongitude;
	private String atitude;
	
	


	public Member(int memberNum, String memberId, String memberPw, String memberName, String memberAddress,
			String memberBirth, String memberPhone, String memberEmail, String nickName, Date memberEnrollDate,
			String gender, String mileage, int isAdmin, String rlongitude, String atitude) {
		super();
		this.memberNum = memberNum;
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberAddress = memberAddress;
		this.memberBirth = memberBirth;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.nickName = nickName;
		this.memberEnrollDate = memberEnrollDate;
		this.gender = gender;
		this.mileage = mileage;
		this.isAdmin = isAdmin;
		this.rlongitude = rlongitude;
		this.atitude = atitude;
	}

	



	public int getMemberNum() {
		return memberNum;
	}





	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}





	public String getMemberId() {
		return memberId;
	}





	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}





	public String getMemberPw() {
		return memberPw;
	}





	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}





	public String getMemberName() {
		return memberName;
	}





	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}





	public String getMemberAddress() {
		return memberAddress;
	}





	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}





	public String getMemberBirth() {
		return memberBirth;
	}





	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}





	public String getMemberPhone() {
		return memberPhone;
	}





	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}





	public String getMemberEmail() {
		return memberEmail;
	}





	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}





	public String getNickName() {
		return nickName;
	}





	public void setNickName(String nickName) {
		this.nickName = nickName;
	}





	public Date getMemberEnrollDate() {
		return memberEnrollDate;
	}





	public void setMemberEnrollDate(Date memberEnrollDate) {
		this.memberEnrollDate = memberEnrollDate;
	}





	public String getGender() {
		return gender;
	}





	public void setGender(String gender) {
		this.gender = gender;
	}





	public String getMileage() {
		return mileage;
	}





	public void setMileage(String mileage) {
		this.mileage = mileage;
	}





	public int getIsAdmin() {
		return isAdmin;
	}





	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}





	public String getRlongitude() {
		return rlongitude;
	}





	public void setRlongitude(String rlongitude) {
		this.rlongitude = rlongitude;
	}





	public String getAtitude() {
		return atitude;
	}





	public void setAtitude(String atitude) {
		this.atitude = atitude;
	}





	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberAddress=" + memberAddress + ", memberBirth=" + memberBirth + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", memberEnrollDate=" + memberEnrollDate + ", gender="
				+ gender + ", mileage=" + mileage + ", isAdmin=" + isAdmin + ", rlongitude=" + rlongitude + ", atitude="
				+ atitude + "]";
	}
	
	
	
	
}
