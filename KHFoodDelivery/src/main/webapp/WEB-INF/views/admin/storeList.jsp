<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

<style>
	h4#titleText{ display: inline; }	
	div#storeList{ margin-top: 15px; }
	thead#tableHead{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); }
	.pnt{ cursor: pointer; }
	table#storeTable{ table-layout: fixed; word-wrap: break-word; }
	table#storeTable th, table#storeTable td{ text-align: center; vertical-align: middle; }
	div#store-category{display: inline;}
	select{display: inline;}
	div#store-search{display: inline; float: right;}	
	input[type=checkbox], input[type=radio] {display: none; }	
</style>

<script>	
	function fn_storeView(no){
		location.href="${path}/admin/storeView.do?no="+no;		
	}		
</script>

<section>
	<div class="container">			
		
		<form class="form-controll navbar-right" role="search" action="${path }/admin/searchStore.do" method="post">
			<div class="row">
				<div class="col-sm-7">
					<h4 id="titleText">입점 리스트</h4>
				</div>
				<div class="col-sm-1">
					<div id="store-category" class="form-group">
						<select class="form-control" name="category" style="width: auto">
							<option value="전체">전체</option>
							<option value="돈까스/일식">돈까스/일식</option>
							<option value="프랜차이즈">프랜차이즈</option>
							<option value="치킨">치킨</option>
							<option value="피자">피자</option>
							<option value="중국집">중국집</option>
							<option value="한식">한식</option>
							<option value="족발/보쌈">족발/보쌈</option>
							<option value="분식">분식</option>
							<option value="디저트">디저트</option>
						</select>	
					</div>	 
				</div>
				<div class="col-sm-4">
					<div class="input-group" id="store-search" style="width: 89%">			
						<div class="form-group">						
							<div class="input-group">														
								<input type="text" class="form-control" name="keyword" id="keyword" autocomplete="off" placeholder="제목을 입력하세요"/>
								<input type="hidden" name="isFirst" value="1"/>
								<span class="input-group-btn">
									<input type="submit" class="btn btn-default" id="searchBar" value="검색"/>
								</span>
							</div>
						</div>
					</div>
				</div>		
			</div>
		</form>

		<!-- 입점 리스트 -->		
		<div id="storeList">
			<table class="table table-hover" id="storeTable">
				<thead id="tableHead">
					<tr>	
						<th>업종</th>	
						<th>점포명</th>
						<th>점주명</th>
						<th style="width: 50%">주소</th>	
						<th>입점 신청일</th>					
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="list">
						<tr class="pnt" onclick="fn_storeView(${list.businessCode})">
							<td><c:out value="${list.storeCategory }"/></td>
							<td><c:out value="${list.storeName }"/></td>
							<td><c:out value="${list.businessName }"/></td>
							<td><c:out value="${list.storeAddress }"/></td>
							<td><c:out value="${list.formatAppDate }"/></td>							
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="paging">
			${pageBar}
		</div>
	</div>
</section>
<jsp:include page="/WEB-INF/views/common/adminFooter.jsp"></jsp:include>