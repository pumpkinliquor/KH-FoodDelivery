package com.kh.food.customer.member.model.vo;

public class MenuCookie {
	private String menuTitle;
	private int menuPrice;
	private int menuCount;
	private int plusMenuPrice;
	
	public MenuCookie() {
		// TODO Auto-generated constructor stub
	}

	public MenuCookie(String menuTitle, int menuPrice, int menuCount, int plusMenuPrice) {
		super();
		this.menuTitle = menuTitle;
		this.menuPrice = menuPrice;
		this.menuCount = menuCount;
		this.plusMenuPrice = plusMenuPrice;
	}

	public String getMenuTitle() {
		return menuTitle;
	}

	public void setMenuTitle(String menuTitle) {
		this.menuTitle = menuTitle;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
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
		return "MenuCookie [menuTitle=" + menuTitle + ", menuPrice=" + menuPrice + ", menuCount=" + menuCount
				+ ", plusMenuPrice=" + plusMenuPrice + "]";
	}
	
	
}
