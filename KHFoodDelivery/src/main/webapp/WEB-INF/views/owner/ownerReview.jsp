<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
 	<jsp:param value="리뷰관리" name="pageTitle"/></jsp:include>
 	<style>

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating span{
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
}

.star_rating a{
    font-size:15px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:black;
    text-decoration:none;
    font-weight: bolder;
}
.star_rating small{
	font-size:12px;
	letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:black;
    text-decoration:none;
   	font-weight:lighter;
}

.review
{
	margin-left:5px;
	font-weight: bold;
}


.star_rating span.on {color:crimson;}
</style>

<section>

	<script>
		function SetSelectBox(){
			var stN=$(".form-control").val();
			

				$.ajax({
				
                type: "post",
                url: "${path}/owner/test.do",   
                data: {"stN" : stN },
                dataType:"html",
                success: function test(a){
                	$(".layer").html(a);
               	}
             });
		}
	
	</script> 
	
	
    <div class="container">
    	
        <div class="row">
            <div class="col-sm-2">
                <h2>리뷰관리</h2>
            </div>

            <div class="col-sm-10">
                <select class="form-control" onchange="SetSelectBox()";>
                    <option value="">선택</option>
                    <c:forEach items="${selectStoreList}" var="st">
                    <option value="${st.businessCode}">${st.storeName}</option>
                    
                    </c:forEach>
                </select>
            </div>
	
        </div>
        <hr/>
      
       <div class="layer">
	</div>

    </div>

</section>

<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>