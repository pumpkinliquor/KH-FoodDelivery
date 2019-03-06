package com.kh.food.owner.menu.model.vo;

public class Menu {
	
	private int menuCode;
	private int businessCode;
	private int menuCategoryCode;
	private String menuName;
	private String menuContent;
	private int menuPrice;
	private String menuImage;
	private int menuSoldOut;
	
	
	public Menu () {}
	
	public Menu(int menuCode, int businessCode, int menuCategoryCode, String menuName, String menuContent,
			int menuPrice, String menuImage, int menuSoldOut) {
		super();
		this.menuCode = menuCode;
		this.businessCode = businessCode;
		this.menuCategoryCode = menuCategoryCode;
		this.menuName = menuName;
		this.menuContent = menuContent;
		this.menuPrice = menuPrice;
		this.menuImage = menuImage;
		this.menuSoldOut = menuSoldOut;
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

	public int getMenuCategoryCode() {
		return menuCategoryCode;
	}

	public void setMenuCategoryCode(int menuCategoryCode) {
		this.menuCategoryCode = menuCategoryCode;
	}

	public String getMenuName() {
		return menuName;
	}

	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}

	public String getMenuContent() {
		return menuContent;
	}

	public void setMenuContent(String menuContent) {
		this.menuContent = menuContent;
	}

	public int getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(int menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuImage() {
		return menuImage;
	}

	public void setMenuImage(String menuImage) {
		this.menuImage = menuImage;
	}

	public int getMenuSoldOut() {
		return menuSoldOut;
	}

	public void setMenuSoldOut(int menuSoldOut) {
		this.menuSoldOut = menuSoldOut;
	}

	@Override
	public String toString() {
		return "Menu [menuCode=" + menuCode + ", businessCode=" + businessCode + ", menuCategoryCode="
				+ menuCategoryCode + ", menuName=" + menuName + ", menuContent=" + menuContent + ", menuPrice="
				+ menuPrice + ", menuImage=" + menuImage + ", menuSoldOut=" + menuSoldOut + "]";
	}
	
	
}
