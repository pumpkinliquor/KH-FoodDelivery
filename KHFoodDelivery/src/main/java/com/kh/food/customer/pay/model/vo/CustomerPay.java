package com.kh.food.customer.pay.model.vo;

import java.util.Date;

public class CustomerPay {

	private int payNum;
	private int bisinessCode;
	private Date payDate;
	private int menuCode;
	private int sideCode;
	private int drinkCode;
	private int tasteCode;
	private int price;
	private int count;
	private int memberNum;
	private int payOrdernum;
	private String payRequest;
	private String payOrderMethod;
	
	public CustomerPay() {}

	public CustomerPay(int payNum, int bisinessCode, Date payDate, int menuCode, int sideCode, int drinkCode,
			int tasteCode, int price, int count, int memberNum, int payOrdernum, String payRequest,
			String payOrderMethod) {
		super();
		this.payNum = payNum;
		this.bisinessCode = bisinessCode;
		this.payDate = payDate;
		this.menuCode = menuCode;
		this.sideCode = sideCode;
		this.drinkCode = drinkCode;
		this.tasteCode = tasteCode;
		this.price = price;
		this.count = count;
		this.memberNum = memberNum;
		this.payOrdernum = payOrdernum;
		this.payRequest = payRequest;
		this.payOrderMethod = payOrderMethod;
	}

	public int getPayNum() {
		return payNum;
	}

	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}

	public int getBisinessCode() {
		return bisinessCode;
	}

	public void setBisinessCode(int bisinessCode) {
		this.bisinessCode = bisinessCode;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getMenuCode() {
		return menuCode;
	}

	public void setMenuCode(int menuCode) {
		this.menuCode = menuCode;
	}

	public int getSideCode() {
		return sideCode;
	}

	public void setSideCode(int sideCode) {
		this.sideCode = sideCode;
	}

	public int getDrinkCode() {
		return drinkCode;
	}

	public void setDrinkCode(int drinkCode) {
		this.drinkCode = drinkCode;
	}

	public int getTasteCode() {
		return tasteCode;
	}

	public void setTasteCode(int tasteCode) {
		this.tasteCode = tasteCode;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getPayOrdernum() {
		return payOrdernum;
	}

	public void setPayOrdernum(int payOrdernum) {
		this.payOrdernum = payOrdernum;
	}

	public String getPayRequest() {
		return payRequest;
	}

	public void setPayRequest(String payRequest) {
		this.payRequest = payRequest;
	}

	public String getPayOrderMethod() {
		return payOrderMethod;
	}

	public void setPayOrderMethod(String payOrderMethod) {
		this.payOrderMethod = payOrderMethod;
	}

	@Override
	public String toString() {
		return "CustomerPay [payNum=" + payNum + ", bisinessCode=" + bisinessCode + ", payDate=" + payDate
				+ ", menuCode=" + menuCode + ", sideCode=" + sideCode + ", drinkCode=" + drinkCode + ", tasteCode="
				+ tasteCode + ", price=" + price + ", count=" + count + ", memberNum=" + memberNum + ", payOrdernum="
				+ payOrdernum + ", payRequest=" + payRequest + ", payOrderMethod=" + payOrderMethod + "]";
	}
	
}
