package com.kh.food.mark.model.vo;

import java.io.Serializable;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.store.model.vo.Store;

public class Mark implements Serializable{

	private static final long serialVersionUID = 6695724810522065465L;
	private int memberNum;
	private int businessCode;
	private int markState;
	private Member member;
	private Store store;
	
	public Mark() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Mark(int memberNum, int businessCode, int markState, Member member, Store store) {
		super();
		this.memberNum = memberNum;
		this.businessCode = businessCode;
		this.markState = markState;
		this.member = member;
		this.store = store;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getBusinessCode() {
		return businessCode;
	}

	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}

	public int getMarkState() {
		return markState;
	}

	public void setMarkState(int markState) {
		this.markState = markState;
	}

	public Member getMember() {
		return member;
	}

	public void setMember(Member member) {
		this.member = member;
	}

	public Store getStore() {
		return store;
	}

	public void setStore(Store store) {
		this.store = store;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Mark [memberNum=" + memberNum + ", businessCode=" + businessCode + ", markState=" + markState
				+ ", member=" + member + ", store=" + store + "]";
	}

}
