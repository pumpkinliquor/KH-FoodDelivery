<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>

.info-item {
     margin-top: 50px;
}
.info-item-title {
    color: #333;
    font-size: 16px;
    font-weight: bold;
    border-bottom: 1px solid #999;
    padding: 0 0 7px 5px;
    margin-bottom: 18px;
    background-size: 16px;
    }
    
.info-item i{

    color: #999;
    font-style: normal;
    display: table-cell;
    width: 120px;
    letter-spacing: -1px;}
.info-item .tc {
    display: table-cell;
}

</style>

<div id="info" class="info-list">
      <div class="info-item">
        <div class="info-item-title info-icon">사장님알림</div>
		 <div ng-bind-html="introduction_text()|strip_html" class="info-text ng-binding">
    			${storeList.storeProfile }
      	 </div>

      <div class="info-item">
        <div class="info-item-title info-icon1">업체정보</div>
        
        <p><i>영업시간</i> <span class="tc ng-binding">24시간</span></p>
      </div>

      <div class="info-item">
        <div class="info-item-title">결제정보</div>
        <p><i>최소주문금액</i> <span class="tc ng-binding">${storeList.minPrice}원</span></p>
        <p><i>결제수단</i> 
     		<span class="tc ng-binding">신용카드,</span>
            <span class="tc ng-binding">현금</span>
            
      </div>

      <div class="info-item">
        <div class="info-item-title">사업자정보</div>
        <p><i>상호명</i> <span class="tc ng-binding">${storeList.storeName}</span></p>
        <p><i>사업자등록번호</i> <span class="tc ng-binding">${storeList.businessNum}</span></p>
      </div>

      
     
    </div>
   </div>
   