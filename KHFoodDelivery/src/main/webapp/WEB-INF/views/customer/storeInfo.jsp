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
    width: 95px;
    letter-spacing: -1px;}
.info-item .tc {
    display: table-cell;
}

</style>

<div id="info" class="info-list">
      <div class="info-item">
        <div class="info-item-title info-icon">사장님알림</div>
		 <div ng-bind-html="introduction_text()|strip_html" class="info-text ng-binding">
    			글내용~!
      	 </div>

      <div class="info-item">
        <div class="info-item-title info-icon1">업체정보</div>
        
        <p><i>영업시간</i> <span class="tc ng-binding">11:00 - 02:00</span></p>
      </div>

      <div class="info-item">
        <div class="info-item-title">결제정보</div>
        <p><i>최소주문금액</i> <span class="tc ng-binding">12,000원</span></p>
        <p><i>결제수단</i> 
     		<span class="tc ng-binding">신용카드,</span>
            <span class="tc ng-binding">현금</span>
            
      </div>

      <div class="info-item">
        <div class="info-item-title">사업자정보</div>
        <p><i>상호명</i> <span class="tc ng-binding">지금출발했어요강남직영점</span></p>
        <p><i>사업자등록번호</i> <span class="tc ng-binding">288-85-00738</span></p>
      </div>

      <div class="info-item" ng-show="show_country_info()">
        <div class="info-item-title info-icon4">원산지정보</div>
        <p>
          </p><pre class="ng-binding">*구이삼겹, 간장구이삼겹, 매운구이삼겹 :돼지고기(독일산)
*김치찌개:김치(중국산),돼지고기(독일산),두부(외국산)
*공기밥:쌀(국내산)
*만두튀김, 미니핫도그 :돼지고기(국내산)
*국물떡볶이: 고추가루(중국산)</pre>
        <p></p>
      </div>

     
    </div>
   </div>
   