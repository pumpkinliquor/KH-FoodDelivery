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
.restaurant-star-point{
text-align: center
}
.ng-binding{
    font-size: 48px;
    display: block;
}
.star-point-wrap{
    border-left: 1px solid #ddd;
    border-right: 1px solid #ddd;
    border-bottom: 1px solid #ddd;
    }
 .review-count {
    position: relative;
    border: 1px solid #ddd;
  
    background: #fff;
    color: #666;
    font-size: 15px;
}
.review-count strong {
    color: #333;
}
</style>
<ul id="review" class="list-group review-list">
       
        
        <div class="star-point-wrap">
        
        	<div class="restaurant-star-point">
        		<strong class="ng-binding">
        			${reviewAvg }
        		</strong>
        		<span class="star-point">
        								<c:if test="${reviewAvg==0 }">
						             		<a class="star_rating">
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
						    				</a>
						    				
						    				<br/>
						    				<br/>
							    				<div style="color: #666;">
							    					주문후 첫번째 리뷰를 남겨보세요.
							    				</div>
						             	</c:if>
        									<c:if test="${reviewAvg==1 }">
						             		<a class="star_rating">
										        <span class="on">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
						    				</a>
						             	</c:if>
						             	<c:if test="${reviewAvg==2 }">
						             		<a class="star_rating">
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
						    				</a>
						             	</c:if>
						             	<c:if test="${reviewAvg==3 }">
						             		<a class="star_rating">
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="off">★</span>
										        <span class="off">★</span>
						    				</a>
						             	</c:if>
						             	<c:if test="${reviewAvg==4 }">
						             		<a class="star_rating">
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="off">★</span>
						    				</a>
						             	</c:if>
						             	<c:if test="${reviewAvg==5 }">
						             		<a class="star_rating">
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
										        <span class="on">★</span>
						    				</a>
						             	</c:if>
        		</span>
        	</div>
        
        
        </div>
		<div class="review-count">
			<div style ="padding: 16px; border-top: 8px solid #fafafa;">
					리뷰 <strong>${reviewCount }</strong>개·사장님댓글<strong>${ownerReviewCount }</strong>개
			 </div>
		</div>
		<c:forEach items="${review}" var="re">
        <li class="list-group-item star-point ng-scope" ng-repeat="review in restaurant.reviews" on-finish-render="scrollCartArea()">
          <div>
            <span>${re.memberId }님</span>
            <span>${re.writeDate }</span>
           
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
