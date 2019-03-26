package com.kh.food.owner.sale.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.order.model.vo.Pay;

@Repository
public class OrderStoreSalesDaoImpl implements OrderStoreSalesDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectSalesDateList(int cPage,int numPerPage,Map<String, String> map) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerSale.selectSalesDateList",map,rb);
	}

	@Override
	public int selectSaleDateCount(Map<String, String> map) {
		return sqlSession.selectOne("ownerSale.selectSaleDateCount",map);
	}

	@Override
	public String selectTodaySales(String businessCode) {
		return sqlSession.selectOne("ownerSale.selectTodaySales",businessCode);
	}

	@Override
	public String selectMonthSales(String businessCode) {
		return sqlSession.selectOne("ownerSale.selectMonthSales",businessCode);
	}

	@Override
	public String selectYearSales(String businessCode) {
		return sqlSession.selectOne("ownerSale.selectYearSales",businessCode);
	}
	
	@Override
	public List<Map<String, String>> selectCaMenuList(int menuCategorycode) {
		return sqlSession.selectList("ownerSale.selectCaMenuList",menuCategorycode);
	}

	@Override
	public List<Map<String, String>> menuCateList(int cPage,int numPerPage,Map<String, String> map) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerSale.menuCateList",map,rb);
	}

	@Override
	public int selectMenuCount(Map<String, String> map) {
		return sqlSession.selectOne("ownerSale.selectMenuCount",map);
	}

	@Override
	public List<Map<String, String>> selectSalePriceList(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerSale.selectSalePriceList",map,rb);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage, int numPerPage, int businessCode1) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerSale.selectOrderOneList",businessCode1,rb);
	}

	@Override
	public int selectOrderCount(int businessCode1) {
		return sqlSession.selectOne("ownerSale.selectOrderCount",businessCode1);
	}

	@Override
	public String selectWeekSales(String businessCode) {
		return sqlSession.selectOne("ownerSale.selectWeekSales",businessCode);
	}
	
	
	
}
