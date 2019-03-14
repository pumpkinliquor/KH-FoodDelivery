package com.kh.food.customer.member.model.vo;

import java.util.Date;

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
	private char memberGender;
	private String mileage;
	private int longitude;
	private int atitude;
	private int isAdmin;
	private String profileImage;
	private String formatBirth;
	
	public Member() {
		super();
	}
	
	public Member(int memberNum, String memberId, String memberPw, String memberName, String memberAddress,
			String memberBirth, String memberPhone, String memberEmail, String nickName, Date memberEnrollDate,
			char memberGender, String mileage, int longitude, int atitude, int isAdmin, String profileImage,
			String formatBirth) {
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
		this.memberGender = memberGender;
		this.mileage = mileage;
		this.longitude = longitude;
		this.atitude = atitude;
		this.isAdmin = isAdmin;
		this.profileImage = profileImage;
		this.formatBirth = formatBirth;
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
	public char getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(char memberGender) {
		this.memberGender = memberGender;
	}
	public String getMileage() {
		return mileage;
	}
	public void setMileage(String mileage) {
		this.mileage = mileage;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	public int getAtitude() {
		return atitude;
	}
	public void setAtitude(int atitude) {
		this.atitude = atitude;
	}
	public int getIsAdmin() {
		return isAdmin;
	}
	public void setIsAdmin(int isAdmin) {
		this.isAdmin = isAdmin;
	}
	public String getProfileImage() {
		return profileImage;
	}
	public void setProfileImage(String profileImage) {
		this.profileImage = profileImage;
	}
	public String getFormatBirth() {
		return formatBirth;
	}
	public void setFormatBirth(String formatBirth) {
		this.formatBirth = formatBirth;
	}
	@Override
	public String toString() {
		return "Member [memberNum=" + memberNum + ", memberId=" + memberId + ", memberPw=" + memberPw + ", memberName="
				+ memberName + ", memberAddress=" + memberAddress + ", memberBirth=" + memberBirth + ", memberPhone="
				+ memberPhone + ", memberEmail=" + memberEmail + ", nickName=" + nickName + ", memberEnrollDate="
				+ memberEnrollDate + ", memberGender=" + memberGender + ", mileage=" + mileage + ", longitude="
				+ longitude + ", atitude=" + atitude + ", isAdmin=" + isAdmin + ", profileImage=" + profileImage
				+ ", formatBirth=" + formatBirth + "]";
	}
	
	

	
}