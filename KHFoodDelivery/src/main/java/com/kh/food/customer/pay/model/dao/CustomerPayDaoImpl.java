package com.kh.food.customer.pay.model.dao;

  import java.util.Map;
  
  import org.mybatis.spring.SqlSessionTemplate; import
  org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
  @Repository
  public class CustomerPayDaoImpl implements CustomerPayDao {
  
  @Autowired 
  SqlSessionTemplate sqlSession;

  @Override
  public int customerPayDao(String memberId) {
	// TODO Auto-generated method stub
	  return sqlSession.selectOne("pay.pay",memberId);
  	}

  }
 