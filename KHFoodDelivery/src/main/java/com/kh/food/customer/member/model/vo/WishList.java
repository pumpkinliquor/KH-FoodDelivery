package com.kh.food.customer.member.model.vo;

public class WishList {
	private int wishNum;
	private int menuCode;
	private int businessCode;
	private String memberId;
	private int menuCount;
	private int plusMenuPrice;
	
	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public WishList(int wishNum, int menuCode, int businessCode, String memberId, int menuCount, int plusMenuPrice) {
		super();
		this.wishNum = wishNum;
		this.menuCode = menuCode;
		this.businessCode = businessCode;
		this.memberId = memberId;
		this.menuCount = menuCount;
		this.plusMenuPrice = plusMenuPrice;
	}

	public int getWishNum() {
		return wishNum;
	}

	public void setWishNum(int wishNum) {
		this.wishNum = wishNum;
	}

	public int getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(int menuCode) {
		this.menuCode = menuCode;
	}

	public int getBusinessCode() {
		return businessCode;
	}

	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getMenuCount() {
		return menuCount;
	}

	public void setMenuCount(int menuCount) {
		this.menuCount = menuCount;
	}

	public int getPlusMenuPrice() {
		return plusMenuPrice;
	}

	public void setPlusMenuPrice(int plusMenuPrice) {
		this.plusMenuPrice = plusMenuPrice;
	}

	@Override
	public String toString() {
		return "WishList [wishNum=" + wishNum + ", menuCode=" + menuCode + ", businessCode=" + businessCode
				+ ", memberId=" + memberId + ", menuCount=" + menuCount + ", plusMenuPrice=" + plusMenuPrice + "]";
	}
	
}
