package com.kh.food.qna.model.vo;

import java.util.Date;

import com.kh.food.customer.member.model.vo.Member;

public class MemberQnaReview {
	private int qnaReviewCode;
	private int qnaCode;
	private int memberNum;
	private Date writeDate;
	private String reviewContext;
	private Member member;
	private String formatWriteDate;
	
	public MemberQnaReview() {
		// TODO Auto-generated constructor stub
	}

	public MemberQnaReview(int qnaReviewCode, int qnaCode, int memberNum, Date writeDate, String reviewContext,
			Member member, String formatWriteDate) {
		super();
		this.qnaReviewCode = qnaReviewCode;
		this.qnaCode = qnaCode;
		this.memberNum = memberNum;
		this.writeDate = writeDate;
		this.reviewContext = reviewContext;
		this.member = member;
		this.formatWriteDate = formatWriteDate;
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

	public String getReviewContext() {
		return reviewContext;
	}

	public void setReviewContext(String reviewContext) {
		this.reviewContext = reviewContext;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public String getFormatWriteDate() {
		return formatWriteDate;
	}

	public void setFormatWriteDate(String formatWriteDate) {
		this.formatWriteDate = formatWriteDate;
	}

	@Override
	public String toString() {
		return "MemberQnaReview [qnaReviewCode=" + qnaReviewCode + ", qnaCode=" + qnaCode + ", memberNum=" + memberNum
				+ ", writeDate=" + writeDate + ", reviewContext=" + reviewContext + ", member=" + member
				+ ", formatWriteDate=" + formatWriteDate + "]";
	}

}
