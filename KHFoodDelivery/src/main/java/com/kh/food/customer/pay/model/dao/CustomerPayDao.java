package com.kh.food.customer.pay.model.dao; 
  
  import java.util.Map;
  
  public interface CustomerPayDao {
  
	/* Map<String, String> pay(int totalPrice, String title, String memberId); */

  int customerPayDao(String memberId);
  
  
  
  }
 