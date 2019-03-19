<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
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
	console.log("비지니스코드!!!!!"+businessCode)
	location.href = "${path}/owner/orderService.do?businessCode="+businessCode
}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>