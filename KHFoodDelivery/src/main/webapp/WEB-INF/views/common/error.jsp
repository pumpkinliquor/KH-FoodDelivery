<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
<!-- 프로젝트 완성하면 에러 이유 지울것임 -->
      <div class="container"> 
         <div class="col-md-12">
            <img src="${pageContext.request.contextPath }/resources/images/errorImage.png" style="width:300px; height:300px;">
              <br>
              <br>
              
              <h3>당신의 에러는</h3><h1><%=exception.getMessage()%></h1>
              <h3><a href="${pageContext.request.contextPath }/">에러페이지만드는중 메인 페이지 이동</a></h3>   
        </div>
      </div>
  </section>
</body>
</html>