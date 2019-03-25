<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
.counter {
    background-color:#f5f5f5;
   height:110px;
    border-radius: 5px;
}

.count-title {
    font-size: 30px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.count-text {
    font-size: 13px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.fa-2x {
    margin: 0 auto;
    float: none;
    display: table;
    color: #4ad1e5;
}
.saleDiv{
margin-top:100px
}
.saleDiv2{
background-color:#4D4D4D;
height:130px;
}
.saleDiv3{
margin-bottom:50px;
}

</style>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>

	<div class="container">
	<div class="row">
	    <br/>
	   <div class="col text-center saleDiv3">
		<h2>매출 현황</h2>
		</div>
		
             
		
	</div>
	<div class="row text-center saleDiv2">
	        <div class="col">
	        <div class="counter">
		      <p class="timer count-title count-number" data-to="100" data-speed="1500">${todaySales}원</p>
		       <p class="count-text ">오늘</p>
	    	</div>
		    </div>
            <div class="col">
              <div class="counter">
			      <p class="timer count-title count-number" data-to="1700" data-speed="1500">${monthSales }원</p>
			      <p class="count-text ">이번주</p>
    		  </div>
            </div>
            <div class="col">
             <div class="counter">
		      <p class="timer count-title count-number" data-to="11900" data-speed="1500">${monthSales }원</p>
		      <p class="count-text ">이번달</p>
    		 </div>
    		</div>
            <div class="col">
             <div class="counter">
		      <p class="timer count-title count-number" data-to="157" data-speed="1500">${yearSales }원</p>
		      <p class="count-text ">올해</p>
    		 </div>
            </div>
      </div>
         
         <div class="row saleDiv">
                     <div class="col-md-12">
                    	<div class="row">
	                         	<div class="col-md-2">
	                          		<a href="${path }/owner/selectStoreGoodsSales.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">상품별</a>
	                          	</div>
	                          	<div class="col-md-2">
	                          		<a href="${path }/owner/selectStoreSales.do?businessCode=${businessCode}" class="list-group-item list-group-item-action active menu">기간별</a>                 
	                          	</div>
	                          	<div class="col-md-8"></div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card categoryDiv">
                          <div class="card-body">
                          	<form action="${path}/owner/selectStoreSalesEnd.do" method="post">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>메뉴 관리</h4>
                                      <hr>
                                  </div>
                                  <div class="col-md-3">
                                  	<input type="date" class="form-control"  name="payDate1">
                                  </div>
                                  <div class="col-md-3">
                                  	<input type="date" class="form-control" name="payDate2">
                                  </div>
                                  <div class="col-md-6">
                                  <input type="hidden" name="businessCode" value="${businessCode}">
                                  <input type="submit" class="btn btn-primary bt1">
                                  </div>
                              </div>
                              </form>
                              <div class="row">
                                  <div class="col-md-12">
    									<table class="table table-hover orderTable">
					<thead>
						<tr>
							<th width=7%>번호</th>
							<th width=18%>주문일시</th>
							<th width=27%>주문명</th>
							<th width=9%>배달비</th>
							<th width=9%>결제금액</th>
							<th width=10%>결제방식</th>
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="o" items="${orderOneList}" varStatus="status">		
							<tr style="cursor:pointer;">						
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1"><c:out value="${status.count}"/></td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.payDate}</td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.memberName}님의 주문입니다.</td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.deliveryPrice}</td>							
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1"></td>
								<td onclick="fn_detailOrder(${o.payOrderNum});" class="td1">${o.payOrderMethod}</td>							
							</tr>
							
					</c:forEach> 
					</tbody>
				</table>
				<div class="paging">
					${pageBar}
				</div>
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>
                    </div>
                </div>
         
         
</div>
	
	
</section>

<script>


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>