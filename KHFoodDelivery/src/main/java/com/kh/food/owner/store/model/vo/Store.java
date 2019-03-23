package com.kh.food.owner.store.model.vo;

import java.io.Serializable;
import java.util.Date;

import com.kh.food.owner.member.model.vo.Owner;

public class Store implements Serializable
{
	private static final long serialVersionUID = -1235548025037450382L;
	private int businessCode;
	private String businessNum;
	private String businessName;
	private String businessPhone;
	private String storeName;
	private String storePhone;
	private String storeAddress;
	private String storeCategory;
	private String storeImage;
	private int minPrice;
	private String storeProfile;
	private double longitude;
	private double atitude;
	private int isConfirm;
	private Date appDate;
	private Owner owner;
	private String formatAppDate;
	private int distance;
	private int deliveryPrice;
	
	
	public Store() {}
	
	public Store(int businessCode, String businessNum, String businessName, String businessPhone, String storeName,
			String storePhone, String storeAddress, String storeCategory, String storeImage, int minPrice,
			String storeProfile, double longitude, double atitude, int isConfirm, Owner owner, Date appDate, String formatAppDate) {
		super();
		this.businessCode = businessCode;
		this.businessNum = businessNum;
		this.businessName = businessName;
		this.businessPhone = businessPhone;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddress = storeAddress;
		this.storeCategory = storeCategory;
		this.storeImage = storeImage;
		this.minPrice = minPrice;
		this.storeProfile = storeProfile;
		this.longitude = longitude;
		this.atitude = atitude;
		this.isConfirm = isConfirm;
		this.owner = owner;
		this.appDate = appDate;
		this.formatAppDate = formatAppDate;
	}

	public Store(int businessCode, String businessNum, String businessName, String businessPhone, String storeName,
			String storePhone, String storeAddress, String storeCategory, String storeImage, int minPrice,
			String storeProfile, double longitude, double atitude, int isConfirm, Date appDate, Owner owner,
			String formatAppDate, int distance, int deliveryPrice) {
		super();
		this.businessCode = businessCode;
		this.businessNum = businessNum;
		this.businessName = businessName;
		this.businessPhone = businessPhone;
		this.storeName = storeName;
		this.storePhone = storePhone;
		this.storeAddress = storeAddress;
		this.storeCategory = storeCategory;
		this.storeImage = storeImage;
		this.minPrice = minPrice;
		this.storeProfile = storeProfile;
		this.longitude = longitude;
		this.atitude = atitude;
		this.isConfirm = isConfirm;
		this.appDate = appDate;
		this.owner = owner;
		this.formatAppDate = formatAppDate;
		this.distance = distance;
		this.deliveryPrice = deliveryPrice;
	}

	public int getBusinessCode() {
		return businessCode;
	}

	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}

	public String getBusinessNum() {
		return businessNum;
	}

	public void setBusinessNum(String businessNum) {
		this.businessNum = businessNum;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getBusinessPhone() {
		return businessPhone;
	}

	public void setBusinessPhone(String businessPhone) {
		this.businessPhone = businessPhone;
	}

	public String getStoreName() {
		return storeName;
	}

	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}

	public String getStorePhone() {
		return storePhone;
	}

	public void setStorePhone(String storePhone) {
		this.storePhone = storePhone;
	}

	public String getStoreAddress() {
		return storeAddress;
	}

	public void setStoreAddress(String storeAddress) {
		this.storeAddress = storeAddress;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public String getStoreImage() {
		return storeImage;
	}

	public void setStoreImage(String storeImage) {
		this.storeImage = storeImage;
	}

	public int getMinPrice() {
		return minPrice;
	}

	public void setMinPrice(int minPrice) {
		this.minPrice = minPrice;
	}

	public String getStoreProfile() {
		return storeProfile;
	}

	public void setStoreProfile(String storeProfile) {
		this.storeProfile = storeProfile;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getAtitude() {
		return atitude;
	}

	public void setAtitude(double atitude) {
		this.atitude = atitude;
	}

	public int getIsConfirm() {
		return isConfirm;
	}

	public void setIsConfirm(int isConfirm) {
		this.isConfirm = isConfirm;
	}

	public Date getAppDate() {
		return appDate;
	}

	public void setAppDate(Date appDate) {
		this.appDate = appDate;
	}

	public Owner getOwner() {
		return owner;
	}

	public void setOwner(Owner owner) {
		this.owner = owner;
	}

	public String getFormatAppDate() {
		return formatAppDate;
	}

	public void setFormatAppDate(String formatAppDate) {
		this.formatAppDate = formatAppDate;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public int getDeliveryPrice() {
		return deliveryPrice;
	}

	public void setDeliveryPrice(int deliveryPrice) {
		this.deliveryPrice = deliveryPrice;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Store [businessCode=" + businessCode + ", businessNum=" + businessNum + ", businessName=" + businessName
				+ ", businessPhone=" + businessPhone + ", storeName=" + storeName + ", storePhone=" + storePhone
				+ ", storeAddress=" + storeAddress + ", storeCategory=" + storeCategory + ", storeImage=" + storeImage
				+ ", minPrice=" + minPrice + ", storeProfile=" + storeProfile + ", longitude=" + longitude
				+ ", atitude=" + atitude + ", isConfirm=" + isConfirm + ", appDate=" + appDate + ", owner=" + owner
				+ ", formatAppDate=" + formatAppDate + ", distance=" + distance + ", deliveryPrice=" + deliveryPrice
				+ "]";
	}

}
