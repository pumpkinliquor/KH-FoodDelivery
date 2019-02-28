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
	<div class="col-md-12">
		<table class="table table-bordered">
		    <tbody>
		        	<tr>
		        		<th>작성자</th>
		        		<td><input type="text" name="userId" class="form-control" value="hwang3324" required readonly/></td>
		        	</tr>
		            <tr>
		                <th>제목</th>
		                <td><input type="text" placeholder="제목 " name="subject" class="form-control"/></td>
		            </tr>
		            <tr>
		                <th>내용</th>
		                <td><textarea cols="10" placeholder="내용" name="content" class="form-control" style="resize:none; height:15em;"></textarea></td>
		            </tr>
		            <tr>
		                <th>첨부파일</th>
		                <td>
		                	<input type="file" name="filename" class="form-control"/>
		                	<input type="file" name="filename" class="form-control"/>
	                	</td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td><input type="password" placeholder="비밀번호를 입력하세요" class="form-control"/></td>
		            </tr>
		            <tr>
		                <td colspan="2">
		                    <input type="button" value="문의하기" onclick="" class="btn btn-outline-success" style="float:right;"/>
		                </td>
		            </tr>
		    </tbody>
		</table>
	</div>
</div>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>