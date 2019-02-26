<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<section>
	<a href="${path }/owner/customService.do">고객센터</a>
	<a href="${path }/owner/storeForm.do">업체등록</a>
	<a href="${path }/admin/adminMain.do">관리자 화면</a>
<%-- 	<a href="${path }/admin/noticeList.do">공지사항</a>
	<a href="${path }/admin/noticeForm.do">공지사항등록</a>
	<a href="${path }/admin/memberList.do">멤버리스트</a>
	<a href="${path }/admin/appStoreList.do">입점 신청 현황</a> --%>
	<a href="${path }/map/test.do">메인구현</a>

</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
