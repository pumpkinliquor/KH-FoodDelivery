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
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>
<div class="container">
	<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">매장 현황</h2>
	</div>
	<div class="row" style="clear:both;">
		<div class="col-md-12">
				<table class="table table-hover orderTable">
					<thead>
						<tr>
							<th width=30%>음식점이름</th>
							<th width=15%>음식카테고리</th>
							<th width=15%>사업자번호</th>
							<th width=40%>음식점주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="s" items="${storeList}">
							<tr style="cursor:pointer;" onclick="fn_storeChoice(${s.BUSINESSCODE});">						
								<td class="td1"><c:out value="${s.STORENAME}"/></td>
								<td class="td1">${s.STORECATEGORY}</td>
								<td class="td1">${s.BUSINESSNUM}</td>
								<td class="td1">${s.STOREADDRESS }</td>							
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
</section>

<script>
function fn_storeChoice(businessCode){
	console.log("비지니스코드!!!!!"+businessCode);
	location.href = "${path}/owner/selectStoreSales.do?businessCode="+businessCode
}

</script>


<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>