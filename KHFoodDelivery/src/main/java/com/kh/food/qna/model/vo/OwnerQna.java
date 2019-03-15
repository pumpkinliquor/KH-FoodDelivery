package com.kh.food.qna.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.member.model.vo.Owner;

public class OwnerQna implements Serializable {

	private static final long serialVersionUID = 7565609828667134820L;
	private int qnaCode;
	private Date writeDate;
	private String ownerId;
	private String qnaCategory;
	private String qnaContent;
	private String qnaTitle;
	private Owner owner;
	private String formatWriteDate;
	private int isRe;
	
	public OwnerQna() {
		super();
	}

	public OwnerQna(int qnaCode, Date writeDate, String ownerId, String qnaCategory, String qnaContent, String qnaTitle,
			Owner owner, String formatWriteDate, int isRe) {
		super();
		this.qnaCode = qnaCode;
		this.writeDate = writeDate;
		this.ownerId = ownerId;
		this.qnaCategory = qnaCategory;
		this.qnaContent = qnaContent;
		this.qnaTitle = qnaTitle;
		this.owner = owner;
		this.formatWriteDate = formatWriteDate;
		this.isRe = isRe;
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

	public String getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(String ownerId) {
		this.ownerId = ownerId;
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

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	public String getFormatWriteDate() {
		return formatWriteDate;
	}

	public void setFormatWriteDate(String formatWriteDate) {
		this.formatWriteDate = formatWriteDate;
	}

	public int getIsRe() {
		return isRe;
	}

	public void setIsRe(int isRe) {
		this.isRe = isRe;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "OwnerQna [qnaCode=" + qnaCode + ", writeDate=" + writeDate + ", ownerId=" + ownerId + ", qnaCategory="
				+ qnaCategory + ", qnaContent=" + qnaContent + ", qnaTitle=" + qnaTitle + ", owner=" + owner
				+ ", formatWriteDate=" + formatWriteDate + ", isRe=" + isRe + "]";
	}	
}
