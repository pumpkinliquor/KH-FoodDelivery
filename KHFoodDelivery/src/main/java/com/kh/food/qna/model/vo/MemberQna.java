package com.kh.food.qna.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.food.customer.member.model.vo.Member;

public class MemberQna implements Serializable {

	private static long serialVersionUID = 588749761937435426L;
	private int qnaCode;
	private Date writeDate;
	private String originalFileName;
	private String renamedFileName;
	private String qnaCategory;
	private String qnaContent;
	private String qnaTitle;
	private Member member;

	public MemberQna() {}

	public MemberQna(int qnaCode, Date writeDate, String originalFileName, String renamedFileName, String qnaCategory,
			String qnaContent, String qnaTitle, Member member) {
		super();
		this.qnaCode = qnaCode;
		this.writeDate = writeDate;
		this.originalFileName = originalFileName;
		this.renamedFileName = renamedFileName;
		this.qnaCategory = qnaCategory;
		this.qnaContent = qnaContent;
		this.qnaTitle = qnaTitle;
		this.member = member;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static void setSerialversionuid(long serialversionuid) {
		serialVersionUID = serialversionuid;
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

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getRenamedFileName() {
		return renamedFileName;
	}

	public void setRenamedFileName(String renamedFileName) {
		this.renamedFileName = renamedFileName;
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

	@Override
	public String toString() {
		return "MemberQna [qnaCode=" + qnaCode + ", writeDate=" + writeDate + ", originalFileName=" + originalFileName
				+ ", renamedFileName=" + renamedFileName + ", qnaCategory=" + qnaCategory + ", qnaContent=" + qnaContent
				+ ", qnaTitle=" + qnaTitle + ", member=" + member + "]";
	}	
}
