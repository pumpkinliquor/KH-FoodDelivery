package com.kh.food.owner.notice.attachment.vo;

import java.util.Date;

public class OwnerNoticeAttachment {
	
	private int ownerNoticeAttachmentNo;
	private int ownerNoticeNum;
	private String ownerOriginalFileName;
	private String ownerRenamedFileName;
	private Date ownerUploadDate;
	private String status;

	public OwnerNoticeAttachment() {}

	public OwnerNoticeAttachment(int ownerNoticeAttachmentNo, int ownerNoticeNum, String ownerOriginalFileName,
			String ownerRenamedFileName, Date ownerUploadDate, String status) {
		super();
		this.ownerNoticeAttachmentNo = ownerNoticeAttachmentNo;
		this.ownerNoticeNum = ownerNoticeNum;
		this.ownerOriginalFileName = ownerOriginalFileName;
		this.ownerRenamedFileName = ownerRenamedFileName;
		this.ownerUploadDate = ownerUploadDate;
		this.status = status;
	}

	public int getOwnerNoticeAttachmentNo() {
		return ownerNoticeAttachmentNo;
	}

	public void setOwnerNoticeAttachmentNo(int ownerNoticeAttachmentNo) {
		this.ownerNoticeAttachmentNo = ownerNoticeAttachmentNo;
	}

	public int getOwnerNoticeNum() {
		return ownerNoticeNum;
	}

	public void setOwnerNoticeNum(int ownerNoticeNum) {
		this.ownerNoticeNum = ownerNoticeNum;
	}

	public String getOwnerOriginalFileName() {
		return ownerOriginalFileName;
	}

	public void setOwnerOriginalFileName(String ownerOriginalFileName) {
		this.ownerOriginalFileName = ownerOriginalFileName;
	}

	public String getOwnerRenamedFileName() {
		return ownerRenamedFileName;
	}

	public void setOwnerRenamedFileName(String ownerRenamedFileName) {
		this.ownerRenamedFileName = ownerRenamedFileName;
	}

	public Date getOwnerUploadDate() {
		return ownerUploadDate;
	}

	public void setOwnerUploadDate(Date ownerUploadDate) {
		this.ownerUploadDate = ownerUploadDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "OwnerNoticeAttachment [ownerNoticeAttachmentNo=" + ownerNoticeAttachmentNo + ", ownerNoticeNum="
				+ ownerNoticeNum + ", ownerOriginalFileName=" + ownerOriginalFileName + ", ownerRenamedFileName="
				+ ownerRenamedFileName + ", ownerUploadDate=" + ownerUploadDate + ", status=" + status + "]";
	}
	
	
}
