<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
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


.star_rating span.on {color:crimson;}
</style>
<ul id="review" class="list-group review-list">
       
        
        

		<c:forEach items="${review}" var="re">
        <li class="list-group-item star-point ng-scope" ng-repeat="review in restaurant.reviews" on-finish-render="scrollCartArea()">
          <div>
            <span>${re.memberId }님</span>
            <span>${re.writeDate }</span>
            <a href="#">신고</a>
          </div>
          <div>
            <div class="star-point">
            <tr>
             	
	             	<c:if test="${re.grade==1 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
	    				</p>
	             	</c:if>
	             	<c:if test="${re.grade==2 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
	    				</p>
	             	</c:if>
	             	<c:if test="${re.grade==3 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
	    				</p>
	             	</c:if>
	             	<c:if test="${re.grade==4 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
	    				</p>
	             	</c:if>
	             	<c:if test="${re.grade==5 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
	    				</p>
	             	</c:if>
             
             </tr>
            </div>
          </div>   
   
		
          <p>${re.reviewContext }</p>
          
          <c:if test="${!empty re.reviewImage }">
          <p><img src="${path }/resources/upload/member/review/${re.reviewImage}" style="width: 300px; height: 300px;"></p>
         </c:if>
          <div id="ohoh${re.reviewNum }"></div>

 		<c:forEach var="se" items="${orr}">
	        <script>
	        $(document).ready(function(){var h="<br><div style='border: 1px solid #d9d9d9;padding: 16px 16px 10px 16px;background: #f0f0f0;coler:#d9d9d9'>└<span id='ohoh${se.reviewNum}' style='font-weight:bold; font-size:19px; margin-left:10px;'>사장님 <span style='font-weight: normal; font-size:18px; margin-left:20px; color: #666;' >${se.formatWriteDate}<br/>${se.reviewContext}</span></span><div>";
	        	
	        	$('#ohoh${se.reviewNum}').empty().append(h);
	        });
	        </script>
        </c:forEach>
        
        </li>
        </c:forEach>

</ul>
