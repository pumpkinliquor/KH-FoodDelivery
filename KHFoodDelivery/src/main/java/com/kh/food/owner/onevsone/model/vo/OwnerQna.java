package com.kh.food.owner.onevsone.model.vo;

import java.sql.Date;

public class OwnerQna {
	private int qnaCode;
	private int ownerNum;
	private Date writeDate;
	private String qnaCategory;
	private String qnaContent;
	private String qnaTitle;
	
	public OwnerQna() {
		// TODO Auto-generated constructor stub
	}

	public OwnerQna(int qnaCode, int ownerNum, Date writeDate, 
			String qnaCategory, String qnaContent, String qnaTitle) {
		super();
		this.qnaCode = qnaCode;
		this.ownerNum = ownerNum;
		this.writeDate = writeDate;
		this.qnaCategory = qnaCategory;
		this.qnaContent = qnaContent;
		this.qnaTitle = qnaTitle;
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

	@Override
	public String toString() {
		return "OwnerQna [qnaCode=" + qnaCode + ", ownerNum=" + ownerNum + ", qnaCategory=" + qnaCategory + ", qnaContent=" + qnaContent
				+ ", qnaTitle=" + qnaTitle + "]";
	}
	
	
}
