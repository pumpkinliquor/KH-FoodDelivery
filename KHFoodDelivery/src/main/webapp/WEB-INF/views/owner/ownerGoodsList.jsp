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
   /*  padding: 20px 0; */
    border-radius: 5px;
     height:110px;
}

.count-title {
    font-size: 40px;
    font-weight: normal;
    margin-top: 10px;
    margin-bottom: 0;
    text-align: center;
}

.count-text {
    font-size: 15px;
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
margin-top:100px;
}
.saleDiv2{
background-color:rgba(61, 58, 129, 0.986);
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
                                  <input type="submit" class="btn btn-primary bt1" value="검색">
                                  </div>
                              </div>
                              </form>
                              <div class="row">
                                  <div class="col-md-12">
    									<table class="table table-hover orderTable">
					<thead>
						<tr>
							<th width=7%>번호</th>
							<th width=30%>주문날짜</th>
							<th width=18%>카테고리명</th>
							<th width=27%>메뉴명</th>
							<th width=9%>수량</th>
							<th width=9%>금액</th>					
						</tr>
					</thead>
					<tbody>
					
					<c:forEach var="o" items="${list}" varStatus="status">		
							<tr style="cursor:pointer;">						
								<td  class="td1"><c:out value="${status.count}"/></td>
								<td  class="td1">${o.PAYDATE }</td>
								<td  class="td1">${o.MENUCATEGORY}</td>
								<td  class="td1">${o.MENUNAME}</td>
								<td class="td1">${o.COUNT}</td>							
								<td  class="td1">${o.PRICE }</td>
								
															
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
						if(data[i].MENUSTATE == 1)
							{
								html += "<option value='"+data[i].MENUCODE+"'>"+data[i].MENUNAME+"(단종된메뉴)</option>";
							}
						else
						{
							html += "<option value='"+data[i].MENUCODE+"'>"+data[i].MENUNAME+"</option>";
						}
					}
				console.log(html);
				$('#menuCategory2').append(html);
			}
		});
		
	}
</script>	
</section>

<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>