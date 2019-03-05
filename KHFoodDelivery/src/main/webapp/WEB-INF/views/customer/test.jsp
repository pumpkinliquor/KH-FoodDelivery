<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="pageTitle" />
</jsp:include>
  



  <script>
$(function(){
    var autocomplete_text = ["자동완성기능","Autocomplete","개발로짜","국이"];
         $("#autocomplete").autocomplete({
            source: autocomplete_text
         });
})


</script>

<section>
<h2>자동완성기능</h2>
<input id="autocomplete" type="text" />



</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>