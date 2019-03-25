package com.kh.food.owner.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.owner.order.model.vo.Pay;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Pay> selectOrderList(int businessCode) {
		return sqlSession.selectList("ownerOrder.selectOrderList",businessCode);
	}

	@Override
	public List<Map<String,String>> selectPayOrderNum(String payOrderNum) {
		return sqlSession.selectList("ownerOrder.selectPayOrderNum",payOrderNum);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage,int numPerPage,int businessCode1) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerOrder.selectOrderOneList",businessCode1,rb);
	}

	@Override
	public int selectOrderCount(int businessCode1) {
		return sqlSession.selectOne("ownerOrder.selectOrderCount",businessCode1);
	}

	@Override
	public Map<String, String> selectTodayOrderCount(int businessCode1) {
		return sqlSession.selectOne("ownerOrder.selectTodayOrderCount",businessCode1);
	}

	@Override
	public List<Map<String, String>> selectStoreList(String ownerId) {
		return sqlSession.selectList("ownerOrder.selectStoreList",ownerId);
	}

	@Override
	public int updateOrderState(Map<String, String> map) {
		return sqlSession.update("ownerOrder.updateOrderState",map);
	}

	@Override
	public Map<String, String> selectPayOne(String payOrderNum) {
		return sqlSession.selectOne("ownerOrder.selectPayOne",payOrderNum);
	}

	@Override
	public List<Map<String, String>> selectGoodsOrderList(int cPage,int numPerPage,String businessCode) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerSale.selectGoodsOrderList",businessCode,rb);
	}

	@Override
	public int selectGoodsCount(int businessCode1) {
		return sqlSession.selectOne("ownerSale.selectGoodsCount",businessCode1);
	}

	@Override
	public List<Map<String, String>> selectPayList(int cPage,int numPerPage,int businessCode1) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerOrder.selectPayList",businessCode1,rb);
	}
	
	
	
}
