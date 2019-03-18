package com.kh.food.review.model.vo;

import java.sql.Date;



public class Review {
	
	private int reviewNum;
	private int businessCode;
	private int memberNum;
	private Date writeDate;
	private String reviewImage;
	private int grade;
	private String reviewContext;
	private String memberId;
	
	
	public Review() {}


	public Review(int reviewNum, int businessCode, int memberNum, Date writeDate, String reviewImage, int grade,
			String reviewContext, String memberId) {
		super();
		this.reviewNum = reviewNum;
		this.businessCode = businessCode;
		this.memberNum = memberNum;
		this.writeDate = writeDate;
		this.reviewImage = reviewImage;
		this.grade = grade;
		this.reviewContext = reviewContext;
		this.memberId = memberId;
	}


	public int getReviewNum() {
		return reviewNum;
	}


	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}


	public int getBusinessCode() {
		return businessCode;
	}


	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}


	public int getMemberNum() {
		return memberNum;
	}


	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}


	public Date getWriteDate() {
		return writeDate;
	}


	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}


	public String getReviewImage() {
		return reviewImage;
	}


	public void setReviewImage(String reviewImage) {
		this.reviewImage = reviewImage;
	}


	public int getGrade() {
		return grade;
	}


	public void setGrade(int grade) {
		this.grade = grade;
	}


	public String getReviewContext() {
		return reviewContext;
	}


	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}


	public String getMemberId() {
		return memberId;
	}


	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}


	@Override
	public String toString() {
		return "Review [reviewNum=" + reviewNum + ", businessCode=" + businessCode + ", memberNum=" + memberNum
				+ ", writeDate=" + writeDate + ", reviewImage=" + reviewImage + ", grade=" + grade + ", reviewContext="
				+ reviewContext + ", memberId=" + memberId + "]";
	};
	
	
	
	
}
