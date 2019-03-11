package com.kh.food.qna.model.vo;

import java.util.Date;

import com.kh.food.customer.member.model.vo.Member;

public class MemberQnaReview {
	private int qnaCode;
	private Date writeDate;
	private String reviewContext;
	private String formatWriteDate;
	
	public MemberQnaReview() {
		// TODO Auto-generated constructor stub
	}

	public MemberQnaReview(int qnaCode, Date writeDate, String reviewContext, String formatWriteDate) {
		super();
		this.qnaCode = qnaCode;
		this.writeDate = writeDate;
		this.reviewContext = reviewContext;
		this.formatWriteDate = formatWriteDate;
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

	public String getFormatWriteDate() {
		return formatWriteDate;
	}

	public void setFormatWriteDate(String formatWriteDate) {
		this.formatWriteDate = formatWriteDate;
	}

	@Override
	public String toString() {
		return "MemberQnaReview [qnaCode=" + qnaCode
				+ ", writeDate=" + writeDate + ", reviewContext=" + reviewContext
				+ ", formatWriteDate=" + formatWriteDate + "]";
	}

}
