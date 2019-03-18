package com.kh.food.mark.model.vo;

import java.io.Serializable;

import com.kh.food.customer.member.model.vo.Member;
import com.kh.food.owner.store.model.vo.Store;

public class Mark implements Serializable{

	private static final long serialVersionUID = 6695724810522065465L;
	private int memberNum;
	private int businessCode;
	private Member member;
	private Store store;
}
