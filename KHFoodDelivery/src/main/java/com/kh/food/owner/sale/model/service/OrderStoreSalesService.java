package com.kh.food.owner.sale.model.service;

import java.util.List;
import java.util.Map;

public interface OrderStoreSalesService {

	List<Map<String, String>> selectSalesDateList(int cPage, int numPerPage, Map<String, String> map);

	int selectSaleDateCount(Map<String, String> map);

	String selectTodaySales(String businessCode);

	String selectMonthSales(String businessCode);

	String selectYearSales(String businessCode);

	List<Map<String,String>> selectCaMenuList(int menuCategorycode);

	List<Map<String, String>> menuCateList(int cPage, int numPerPage, Map<String, String> map);

	int selectMenuCount(Map<String, String> map);

}
