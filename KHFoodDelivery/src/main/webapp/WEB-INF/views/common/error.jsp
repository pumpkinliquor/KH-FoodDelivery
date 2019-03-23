<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<style>
#errorContainer{
	vertical-align: middle;
	text-align: center;
	margin-top:auto;
	margin-bottom:auto;
}
</style>
<body>
<section>
      <div class="container" id="errorContainer">
      <br><br><br><br><br> <br><br> <br><br> 
         <div class="col-md-12">
            <img src="${pageContext.request.contextPath }/resources/images/error.png">
              <br><br><br>
              <h3><a href="${pageContext.request.contextPath }/">홈</a> &nbsp;&nbsp; 
              <a href="#" onClick="history.back()">이전 페이지</a></h3> 
        </div>
      </div>
  </section>

</body>
</html>