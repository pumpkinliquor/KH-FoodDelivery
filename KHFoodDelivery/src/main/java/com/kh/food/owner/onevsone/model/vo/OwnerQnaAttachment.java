package com.kh.food.owner.onevsone.model.vo;

import java.sql.Date;

public class OwnerQnaAttachment {
	private int attachmentNo;
	private int qnaCode;
	private String originalFileName;
	private String reNamedFileName;
	private Date uploadDate;
	private String status;
	
	public OwnerQnaAttachment() {
		// TODO Auto-generated constructor stub
	}

	public OwnerQnaAttachment(int attachmentNo, int qnaCode, String originalFileName, String reNamedFileName,
			Date uploadDate, String status) {
		super();
		this.attachmentNo = attachmentNo;
		this.qnaCode = qnaCode;
		this.originalFileName = originalFileName;
		this.reNamedFileName = reNamedFileName;
		this.uploadDate = uploadDate;
		this.status = status;
	}

	public int getAttachmentNo() {
		return attachmentNo;
	}

	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
	}

	public int getQnaCode() {
		return qnaCode;
	}

	public void setQnaCode(int qnaCode) {
		this.qnaCode = qnaCode;
	}

	public String getOriginalFileName() {
		return originalFileName;
	}

	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	public String getReNamedFileName() {
		return reNamedFileName;
	}

	public void setReNamedFileName(String reNamedFileName) {
		this.reNamedFileName = reNamedFileName;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OwnerQnaAttachment [attachmentNo=" + attachmentNo + ", qnaCode=" + qnaCode + ", originalFileName="
				+ originalFileName + ", reNamedFileName=" + reNamedFileName + ", uploadDate=" + uploadDate + ", status="
				+ status + "]";
	}
	
	
}
