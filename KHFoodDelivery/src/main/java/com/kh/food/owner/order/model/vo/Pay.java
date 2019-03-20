package com.kh.food.owner.order.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Pay {

	private int rNum;
	private int payNum;
	private int businessCode;
	private String payDate;
	private int menuCode;
	private String sideCode;
	private	String drinkCode;
	private String tasteCode;
	private int price;
	private int count;
	private int memberNum;
	private String payOrderMethod;
	private String payRequest;
	private int payOrderNum;
	private String memberId;
	private String memberName;
	private String memberPhone;
	private String menuName;
	private Date formatDate;
	private int deliveryPrice;
	
	public Pay() {}

	
	
	
	
	public Pay(int rNum, int payNum, int businessCode, String payDate, int menuCode, String sideCode, String drinkCode,
			String tasteCode, int price, int count, int memberNum, String payOrderMethod, String payRequest,
			int payOrderNum, String memberId, String memberName, String memberPhone, String menuName, Date formatDate,
			int deliveryPrice) {
		super();
		this.rNum = rNum;
		this.payNum = payNum;
		this.businessCode = businessCode;
		this.payDate = payDate;
		this.menuCode = menuCode;
		this.sideCode = sideCode;
		this.drinkCode = drinkCode;
		this.tasteCode = tasteCode;
		this.price = price;
		this.count = count;
		this.memberNum = memberNum;
		this.payOrderMethod = payOrderMethod;
		this.payRequest = payRequest;
		this.payOrderNum = payOrderNum;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.menuName = menuName;
		this.formatDate = formatDate;
		this.deliveryPrice = deliveryPrice;
	}

	public Pay(int payNum, int businessCode, String payDate, int menuCode, String sideCode, String drinkCode,
			String tasteCode, int price, int count, int memberNum, String payOrderMethod, String payRequest,
			int payOrderNum, String memberId, String memberName, String memberPhone, String menuName,
			Date formatDate) {
		super();
		this.payNum = payNum;
		this.businessCode = businessCode;
		this.payDate = payDate;
		this.menuCode = menuCode;
		this.sideCode = sideCode;
		this.drinkCode = drinkCode;
		this.tasteCode = tasteCode;
		this.price = price;
		this.count = count;
		this.memberNum = memberNum;
		this.payOrderMethod = payOrderMethod;
		this.payRequest = payRequest;
		this.payOrderNum = payOrderNum;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.menuName = menuName;
		this.formatDate = formatDate;
	}
	
	public Pay(int payNum, int businessCode, String payDate, int menuCode, String sideCode, String drinkCode,
			String tasteCode, int price, int count, int memberNum, String payOrderMethod, String payRequest,
			int payOrderNum, String memberId, String memberName, String memberPhone, String menuName
			) {
		super();
		this.payNum = payNum;
		this.businessCode = businessCode;
		this.payDate = payDate;
		this.menuCode = menuCode;
		this.sideCode = sideCode;
		this.drinkCode = drinkCode;
		this.tasteCode = tasteCode;
		this.price = price;
		this.count = count;
		this.memberNum = memberNum;
		this.payOrderMethod = payOrderMethod;
		this.payRequest = payRequest;
		this.payOrderNum = payOrderNum;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.menuName = menuName;
	}



	public Pay(int rNum, int payNum, int businessCode, String payDate, int menuCode, String sideCode, String drinkCode,
			String tasteCode, int price, int count, int memberNum, String payOrderMethod, String payRequest,
			int payOrderNum, String memberId, String memberName, String memberPhone, String menuName,
			Date formatDate) {
		super();
		this.rNum = rNum;
		this.payNum = payNum;
		this.businessCode = businessCode;
		this.payDate = payDate;
		this.menuCode = menuCode;
		this.sideCode = sideCode;
		this.drinkCode = drinkCode;
		this.tasteCode = tasteCode;
		this.price = price;
		this.count = count;
		this.memberNum = memberNum;
		this.payOrderMethod = payOrderMethod;
		this.payRequest = payRequest;
		this.payOrderNum = payOrderNum;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPhone = memberPhone;
		this.menuName = menuName;
		this.formatDate = formatDate;
	}



	public int getDeliveryPrice() {
		return deliveryPrice;
	}





	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}





	public int getrNum() {
		return rNum;
	}



	public void setrNum(int rNum) {
		this.rNum = rNum;
	}



	public int getPayNum() {
		return payNum;
	}



	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}



	public int getBusinessCode() {
		return businessCode;
	}



	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}



	public String getPayDate() {
		return payDate;
	}



	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}



	public int getMenuCode() {
		return menuCode;
	}



	public void setMenuCode(int menuCode) {
		this.menuCode = menuCode;
	}



	public String getSideCode() {
		return sideCode;
	}



	public void setSideCode(String sideCode) {
		this.sideCode = sideCode;
	}



	public String getDrinkCode() {
		return drinkCode;
	}



	public void setDrinkCode(String drinkCode) {
		this.drinkCode = drinkCode;
	}



	public String getTasteCode() {
		return tasteCode;
	}



	public void setTasteCode(String tasteCode) {
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



	public String getPayOrderMethod() {
		return payOrderMethod;
	}



	public void setPayOrderMethod(String payOrderMethod) {
		this.payOrderMethod = payOrderMethod;
	}



	public String getPayRequest() {
		return payRequest;
	}



	public void setPayRequest(String payRequest) {
		this.payRequest = payRequest;
	}



	public int getPayOrderNum() {
		return payOrderNum;
	}



	public void setPayOrderNum(int payOrderNum) {
		this.payOrderNum = payOrderNum;
	}



	public String getMemberId() {
		return memberId;
	}



	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}



	public String getMemberName() {
		return memberName;
	}



	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}



	public String getMemberPhone() {
		return memberPhone;
	}



	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}



	public String getMenuName() {
		return menuName;
	}



	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}



	public Date getFormatDate() {
		return formatDate;
	}



	public void setFormatDate(Date formatDate) {
		this.formatDate = formatDate;
	}


	@Override
	public String toString() {
		return "Pay [rNum=" + rNum + ", payNum=" + payNum + ", businessCode=" + businessCode + ", payDate=" + payDate
				+ ", menuCode=" + menuCode + ", sideCode=" + sideCode + ", drinkCode=" + drinkCode + ", tasteCode="
				+ tasteCode + ", price=" + price + ", count=" + count + ", memberNum=" + memberNum + ", payOrderMethod="
				+ payOrderMethod + ", payRequest=" + payRequest + ", payOrderNum=" + payOrderNum + ", memberId="
				+ memberId + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", menuName=" + menuName
				+ ", formatDate=" + formatDate + ", deliveryPrice=" + deliveryPrice + "]";
	}



	
	
}