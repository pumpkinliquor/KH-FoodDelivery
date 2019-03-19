<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>
     <style>
        div.store{border:1px solid #E4E4E4; background-color:#FFFFFF;position: relative; display:inline-block;margin-bottom:20px;}
        div.store a{text-decoration:none; color:black; text-align:left;}   
        div.me{margin-top:-3%;}  
       body{background-color:#F6F6F6;} 
       
        div.me div.a .option{text-align:center;}  
        div.searchMenu_row{margin-top:150px;}
        .a_pay{font-size: 15px;}
        .menuSearch_Div1{margin-top: 2%;}
        .rowDiv1{font-size: 15px; height: 30px;}
     </style>


<section>

        <div class="me container">
            
                <div class="row searchMenu_row">
                	<c:forEach var="i" items="${list }">
                    <div class="col-6" style="overflow:hidden;">
                        <div class="store col-11">
                            <div class="col-md-8" style="float:left;" >
                                <div class="row">
                                    <div class="col-12" style="margin-top:10%;">
                                        <a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><h4>${i.storeName}</h4></a>
                                    </div>
                                </div>   
                                <div class="row rowDiv1">
                                    <label for="username" class="col-6 col-form-label">최소주문금액</label> 
                                    <div class="col-6 menuSearch_Div1">
                                        <a class="" href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}">12000원</a>
                                    </div>
                                </div>  
                                <div class="row rowDiv1">
                                    <label for="username" class="col-6 col-form-label">배달비</label> 
                                    <div class="col-6 menuSearch_Div1">
                                        <a class="" href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}">12000원</a>
                                    </div>
                                </div>   
                                <div class="row rowDiv1">
                                    <label for="username" class="col-6 col-form-label">가게번호</label> 
                                    <div class="col-6 menuSearch_Div1">
                                        <a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><b>02-2668-4624</b></a><br/>
                                    </div>
                                </div>   
                            </div>
                            <div class="col-md-4" style="float:left; margin-top:10%; margin-bottom:10%;">
                                <a href="${path }/customer/menuInfo.do?businessCode=${i.businessCode}"><img src="${path }/resources/upload/owner/storeMainImage/${i.storeImage}" style="width:113px; height:113px;"/></a><br/>
                            </div>
                        </div>    
                    </div>  
                    </c:forEach>    
                </div>
                <div>${pageBar }</div>
       		 </div>

    </section>



<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>