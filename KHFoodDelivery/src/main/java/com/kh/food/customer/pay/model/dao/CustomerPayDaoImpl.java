package com.kh.food.customer.pay.model.dao;

  import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
  
  import org.mybatis.spring.SqlSessionTemplate; import
  org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.owner.menu.model.vo.Menu;
  @Repository
  public class CustomerPayDaoImpl implements CustomerPayDao {
  
  @Autowired 
  SqlSessionTemplate sqlSession;

  @Override
  public Map<String,String> customerPayDao(Map<String,String> setPay) {
	// TODO Auto-generated method stub
	  return sqlSession.selectOne("pay.pay",setPay);
  	}

@Override
public List<Map<String,String>> payWishList(Map<String, String> setPay) {
	return sqlSession.selectList("pay.payWishList", setPay);
}

@Override
public int customerPayEnd(Map<String, Object> maps) {
	// TODO Auto-generated method stub
	return sqlSession.selectOne("pay.payEnd", maps);
}

@Override
public List<Map<String, String>> selectWishList(String memberId) {
	return sqlSession.selectList("pay.selectWishList",memberId);
}

@Override
public int insertPay(Map<String, String> map) {
	return sqlSession.insert("pay.insertPay",map);
}

@Override
public int insertPay2(Map<String, String> map) {
	return sqlSession.insert("pay.insertPay2",map);
}

@Override
public int deleteWishList(String memberId) {
	// TODO Auto-generated method stub
	return sqlSession.delete("pay.deleteWishList",memberId);
}



  }
 