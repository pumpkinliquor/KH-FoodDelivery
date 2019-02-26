<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style>
/* .footer_info {
	padding-top: 10px;
	list-style: none;
	font-style: inherit;
	font-weight: bold;
	color: white;
} */

.footercopy {
	text-align: center;
	color: white;
}

.footerlist {
	color: white;
}

#footer {
	background: black !important;
	opacity: 0.7;
	height: 200px;
}

#footer h5 {
	padding-left: 10px;
	border-left: 3px solid #eeeeee;
	padding-bottom: 6px;
	margin-bottom: 20px;
	color: #ffffff;
}

#footer a {
	color: #ffffff;
	text-decoration: none !important;
	background-color: transparent;
	-webkit-text-decoration-skip: objects;
}

#footer ul {
	list-style: none;
	padding-top: 5px;
}

#footer li {
	display: inline;
	border-left: 1px solid #999;
	padding: 0 10px;
	float: left;
	margin: 0px 20px;
}

#footer ul.quick-links li {
	padding: 3px 0;
	-webkit-transition: .5s all ease;
	-moz-transition: .5s all ease;
	transition: .5s all ease;
}

#footer ul.quick-links li:hover {
	padding: 3px 0;
	margin-left: 5px;
	font-weight: 700;
}

#footer ul.quick-links li a i {
	margin-right: 5px;
}

#footer ul.quick-links li:hover a i {
	font-weight: 700;
}

@media ( max-width :767px) {
	#footer h5 {
		padding-left: 0;
		border-left: transparent;
		padding-bottom: 0px;
		margin-bottom: 10px;
	}
}
</style>

 <!-- Footer -->
    	<footer id="footer">
    		<!-- <div class="container"> -->
    			<div class="row text-center text-xs-center text-sm-left text-md-left">
    				<div class="col-xs-12 col-sm-4 col-md-4">
    					<ul class="list-unstyled quick-links">
    						<li><a href="${path }"><i class="fa fa-angle-double-right"></i>Home</a></li>
    						<li><a href="${path }"><i class="fa fa-angle-double-right"></i>사장님페이지</a></li>
    						<li><a href="${path }"><i class="fa fa-angle-double-right"></i>공지사항</a></li>
    						<li><a href="${path }"><i class="fa fa-angle-double-right"></i>1:1문의</a></li>
    					</ul>
    					<br/>
    			</div>
    			</div>
    				<!-- <ul class="footer_info">
                    <li> KH delivery(주)</li>
                    <br>
                    <li>   주소 :  서울특별시 강남구 역삼동 823-25  </li>
                    <li>   대표자 :  KH delivery</li>
                    <li>   대표전화 : 1544-9970</li>
                    <li>   사업자등록번호 : 104-86-09535</li>
                    <li>   개인정보보호책임자 :  KH delivery</li>
                </ul> -->
                <br>
                
                <p class="footercopy">Copyright 2019 ⓒ KH delivery Corp. All rights reserved.</p>
    					
    				
    			
    				
    			
    			
    				<!-- <div class="col-xs-12 col-sm-12 col-md-12 mt-2 mt-sm-5">
    						<ul class="footer_info">
                    <li> KH delivery(주)</li>
                    <br>
                    <li>   주소 :  서울특별시 강남구 역삼동 823-25  </li>
                    <li>   대표자 :  KH delivery</li>
                    <li>   대표전화 : 1544-9970</li>
                    <li>   사업자등록번호 : 104-86-09535</li>
                    <li>   개인정보보호책임자 :  KH delivery</li>
                </ul>
                <br>
                <p class="footercopy">Copyright 2019 ⓒ KH delivery Corp. All rights reserved.</p>
    					
    				</div>
    				</div> -->
    			<!-- </div> -->

    		
    	</footer>
</body>
</html>