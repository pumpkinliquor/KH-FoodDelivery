package com.kh.food.owner.review.model.vo;

import java.util.Date;

public class OwnerReview {

	
	private int reviewNum;
	private int businessCode;
	private String reviewContext;
	private Date writeDate;
	private String formatWriteDate;
	
	public OwnerReview() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OwnerReview(int reviewNum, int businessCode, String reviewContext, Date writeDate, String formatWriteDate) {
		super();
		this.reviewNum = reviewNum;
		this.businessCode = businessCode;
		this.reviewContext = reviewContext;
		this.writeDate = writeDate;
		this.formatWriteDate = formatWriteDate;
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

	public String getReviewContext() {
		return reviewContext;
	}

	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getFormatWriteDate() {
		return formatWriteDate;
	}

	public void setFormatWriteDate(String formatWriteDate) {
		this.formatWriteDate = formatWriteDate;
	}

	@Override
	public String toString() {
		return "OwnerReview [reviewNum=" + reviewNum + ", businessCode=" + businessCode + ", reviewContext="
				+ reviewContext + ", writeDate=" + writeDate + ", formatWriteDate=" + formatWriteDate + "]";
	}
	
	
	
}