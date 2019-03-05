package com.kh.food.owner.onevsone.model.vo;

import java.sql.Date;

public class OwnerQnaReview {
	private int qnaReviewCode;
	private int qnaCode;
	private int ownerNum;
	private Date writeDate;
	private String reviewContext;
	
	public OwnerQnaReview() {
		// TODO Auto-generated constructor stub
	}

	public OwnerQnaReview(int qnaReviewCode, int qnaCode, int ownerNum, Date writeDate, String reviewContext) {
		super();
		this.qnaReviewCode = qnaReviewCode;
		this.qnaCode = qnaCode;
		this.ownerNum = ownerNum;
		this.writeDate = writeDate;
		this.reviewContext = reviewContext;
	}

	public int getQnaReviewCode() {
		return qnaReviewCode;
	}

	public void setQnaReviewCode(int qnaReviewCode) {
		this.qnaReviewCode = qnaReviewCode;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public int getOwnerNum() {
		return ownerNum;
	}

	public void setOwnerNum(int ownerNum) {
		this.ownerNum = ownerNum;
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
		return "OwnerQnaReview [qnaReviewCode=" + qnaReviewCode + ", qnaCode=" + qnaCode + ", ownerNum=" + ownerNum
				+ ", writeDate=" + writeDate + ", reviewContext=" + reviewContext + "]";
	}
	
	
}
