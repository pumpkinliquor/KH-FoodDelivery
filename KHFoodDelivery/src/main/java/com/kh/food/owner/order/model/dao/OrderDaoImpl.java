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
	public List<Pay> selectOrderList() {
		return sqlSession.selectList("ownerOrder.selectOrderList");
	}

	@Override
	public List<Map<String,String>> selectPayOrderNum(String payOrderNum) {
		return sqlSession.selectList("ownerOrder.selectPayOrderNum",payOrderNum);
	}

	@Override
	public List<Pay> selectOrderOneList(int cPage,int numPerPage) {
		RowBounds rb = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("ownerOrder.selectOrderOneList",null,rb);
	}

	@Override
	public int selectOrderCount() {
		return sqlSession.selectOne("ownerOrder.selectOrderCount");
	}
	
	
	
}
