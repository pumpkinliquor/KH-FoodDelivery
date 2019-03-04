<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*, java.sql.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>

<section>
	<div class="container">
		<div class="row">
			<div class="col-sm-10">
				<h4>${views.QNATITLE }</h4>
			</div>
			<div class="col-sm-2">
				<button>목록으로</button>				
			</div>
			<div class="col-sm-2">
				<p>작성자 <b>${views.OWNERID }</b></p>
			</div>
			<div class="col-sm-6">
				<p>${views.WRITEDATE }</p>
			</div>
			<div class="col-sm-2"></div>
			<div class="col-sm-2">
				<button>수정</button>
				<button>삭제</button>			
			</div>	
		</div>
		<br/>	
		<div class="row">			
			<div class="col-sm-12">
				${views.QNACONTENT }
			</div>
			<div class="col-sm-2"></div>
		</div>
		<hr/>
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<textarea rows="3" cols="100" class="form-control" style="resize:none;"></textarea>
			</div>
			<div class="col-sm-1">
				<button>등록</button>
			</div>
		</div>
	</div>
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
