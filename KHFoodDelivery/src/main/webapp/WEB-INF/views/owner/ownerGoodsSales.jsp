<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
.counter {
    background-color:#f5f5f5;
    padding: 20px 0;
    border-radius: 5px;
}

.count-title {
    font-size: 40px;
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
</style>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>

	<div class="container">
	<div class="row">
	    <br/>
	   <div class="col text-center">
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
	                          		<a href="${path }/owner/selectStoreGoodsSales.do?businessCode=${businessCode}" class="list-group-item list-group-item-action active menu">상품별</a>
	                          	</div>
	                          	<div class="col-md-2">
	                          		<a href="${path }/owner/selectStoreSales.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">기간별</a>                 
	                          	</div>
	                          	<div class="col-md-8"></div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="card categoryDiv">
                          <div class="card-body">
                          	<form action="${path}/owner/selectStoreGoodsSalesEnd.do" method="post">
                              <div class="row">
                              	  <div class="col-md-2">
                              	  	<p>카테고리</p>
                              	  </div>
                                  <div class="col-md-2">
                                  	<select id="menuCategory1" name="menuCategory1" class="custom-select" required="required" onchange="itemChange(this)">                         
	                                   	<option value="" selected disabled hidden>==선택하세요==</option>                   
	                                   <c:forEach var="c" items="${category }">
                                       <option value="${c.MENUCATEGORYCODE }">${c.MENUCATEGORY }</option>
                                       </c:forEach>
	                                </select>        
                                  </div>
                                  <div class="col-md-3">
                                  	<select id="menuCategory2" name="menuCategory2" class="custom-select" required="required">                                      
                                    	<option value="" selected disabled hidden>==선택하세요==</option>
                                    </select>
                                  </div>
                                  <div class="col-md-5">
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
	
<script>
	function itemChange(e){
		
		$('#menuCategory2').empty();
		
		var html = "";
		console.log($(e).val());
		var menucategorycode = $(e).val();
		$.ajax({
			url:"${path}/owner/selectCaMenuList.do",
			data:{"menuCategorycode" : menucategorycode},
			success : function(data)
			{
				console.log(data);
				for(var i=0; i<data.length; i++)
					{
						html += "<option value='"+data[i].MENUCODE+"'>"+data[i].MENUNAME+"</option>";
					}
				console.log(html);
				$('#menuCategory2').append(html);
			}
		});
		
	}
</script>	
</section>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>