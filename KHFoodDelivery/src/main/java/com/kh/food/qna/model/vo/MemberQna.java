package com.kh.food.qna.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.food.customer.member.model.vo.Member;

public class MemberQna implements Serializable {

	private static long serialVersionUID = 588749761937435426L;
	private int qnaCode;
	private Date writeDate;
	private String memberId;
	private String qnaCategory;
	private String qnaContent;
	private String qnaTitle;
	private Member member;
	private String formatWriteDate;
	
	public MemberQna() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberQna(int qnaCode, Date writeDate, String memberId, String qnaCategory,
			String qnaContent, String qnaTitle, Member member, String formatWriteDate) {
		super();
		this.qnaCode = qnaCode;
		this.writeDate = writeDate;
		this.memberId = memberId;
		this.qnaCategory = qnaCategory;
		this.qnaContent = qnaContent;
		this.qnaTitle = qnaTitle;
		this.member = member;
		this.formatWriteDate = formatWriteDate;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public static void setSerialVersionUID(long serialVersionUID) {
		MemberQna.serialVersionUID = serialVersionUID;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getQnaCategory() {
		return qnaCategory;
	}

	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}

	public String getQnaContent() {
		return qnaContent;
	}

	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
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
		return "MemberQna [qnaCode=" + qnaCode + ", writeDate=" + writeDate + ", memberId=" + memberId
				+ ", qnaCategory=" + qnaCategory + ", qnaContent=" + qnaContent + ", qnaTitle=" + qnaTitle
				+ ", member=" + member + ", formatWriteDate=" + formatWriteDate + "]";
	}

	
	
}
