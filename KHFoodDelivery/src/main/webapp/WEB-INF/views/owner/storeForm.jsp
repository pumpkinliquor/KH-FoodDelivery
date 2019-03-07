<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<style>
    div#update-container{
		background-color:white;
		width:80%; 
		margin:0 auto; 
		text-align:center;
		}
    div#update-container input, div#update-container select {margin-bottom:10px;}
</style>
</head>
<body>
	<div class="container">
		<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">1:1문의</h2>
	</div>
	<div class="col-md-12">
		<form name="qnaFrm" action="${path }/owner/oneVSoneFormEnd.do" method="post" onsubmit="return validate();" enctype="multipart/form-data">
			<table class="table table-bordered">
			    <tbody>
			        	<tr>
			        		<th>사업자 아이디</th>
			        		<td>
				        		<input type="text" id="ownerId" name="ownerId" class="form-control" value="${sessionScope.ownerId }" readonly/>
			        		</td>
			        	</tr>
			        	 <tr>
			                <th>사업자 이름</th>
			                <td><input type="text" name="businessName" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>사업자 연락처</th>
			                <td><input type="tel" name="businessPhone" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>사업자 번호</th>
			                <td><input type="text" name="businessNum" class="form-control" required></td>
			            </tr>
			        	<tr>
			        		<th>카테고리</th>
			        		<td>
			        			<select name="storeCategory">
			        				<option value="돈까스/일식">돈까스/일식</option>
				   					<option value="프랜차이즈">프랜차이즈</option>
				   					<option value="치킨">치킨</option>
				   					<option value="피자">피자</option>
				   					<option value="중식">중식</option>
				   					<option value="한식">한식</option>
				   					<option value="족발/보쌈">족발/보쌈</option>
				   					<option value="분식">분식</option>
				   					<option value="디저트">디저트</option>
			        			</select>
			        		</td>
			        	</tr>
			            <tr>
			                <th>업체명</th>
			                <td><input type="text" name="storeName" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>업체 연락처</th>
			                <td><input type="tel" name="storePhone" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>주소</th>
			                <td><input type="text" name="storeAddress" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>배달 최저금액</th>
			                <td><input type="number" name="minPrice" class="form-control" required></td>
			            </tr>
			            <tr>
			                <th>업체소개</th>
			                <td><textarea cols="10" id="storeProfile" name="storeProfile" class="form-control" style="resize:none; height:15em;" required></textarea></td>
			            </tr>
			            <tr>
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<label for="upFile"><span class="input-group-text">첨부파일#1</span></label>
				                </div>
							</th>
			                <td>
           	 					<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
				                    <label class="custom-file-label" for="upFile">파일을 선택하세요</label>
		               	 		</div>
		                	</td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    <input type="submit" value="문의하기" class="btn btn-outline-success" style="float:right;"/>
			                </td>
			            </tr>
			    </tbody>
			</table>
		</form>
	</div>
    </div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>