package com.kh.food.owner.onevsone.model.vo;

import java.sql.Date;

public class OwnerQnaReview {
	private int qnaCode;
	private Date writeDate;
	private String reviewContext;
	
	public OwnerQnaReview() {
		// TODO Auto-generated constructor stub
	}

	public OwnerQnaReview(int qnaCode, Date writeDate, String reviewContext) {
		super();
		this.qnaCode = qnaCode;
		this.writeDate = writeDate;
		this.reviewContext = reviewContext;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public String getReviewContext() {
		return reviewContext;
	}

	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}

	@Override
	public String toString() {
		return "OwnerQnaReview [qnaCode=" + qnaCode + ", writeDate=" + writeDate + ", reviewContext=" + reviewContext
				+ "]";
	}

}
