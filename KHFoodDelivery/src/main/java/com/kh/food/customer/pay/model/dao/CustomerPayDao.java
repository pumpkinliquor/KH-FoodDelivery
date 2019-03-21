package com.kh.food.customer.pay.model.dao; 
  
  import java.util.List;
import java.util.Map;

import com.kh.food.customer.member.model.vo.WishList;
import com.kh.food.owner.menu.model.vo.Menu;
  
  public interface CustomerPayDao {
  
	/* Map<String, String> pay(int totalPrice, String title, String memberId); */

  Map<String,String> customerPayDao(Map<String,String> setPay);
  List<Map<String,String>> payWishList(Map<String,String> setPay);
  int customerPayEnd(Map<String, Object> maps);
  
  
  }
 