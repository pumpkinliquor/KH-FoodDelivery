<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
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
 <c:forEach var="st" items="${rv }">

<div class="row">
<div class="col-sm-2">
               		 ${st.STORENAME }
            </div>

            <div class="sol-sm-10" style="margin-left: 50px;">
             	
	             	<c:if test="${st.GRADE==1 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <a>${st.MEMBERID }님</a>
					        <small>${st.WRITEDATE }</small>
	    				</p>
	    				
	             	</c:if>
	             	<c:if test="${st.GRADE==2 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
	    					<a>${st.MEMBERID }님</a>
	    					<small>${st.WRITEDATE }</small>
	    				
	    				</p>
	    				
	             	</c:if>
	             	<c:if test="${st.GRADE==3 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <span class="off">★</span>
					        <a>${st.MEMBERID }님</a>
					        <small>${st.WRITEDATE }</small>
	    				</p>
	             	</c:if>
	             	<c:if test="${st.GRADE==4 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="off">★</span>
					        <a>${st.MEMBERID }님</a>
					        <small>${st.WRITEDATE }</small>
	    				</p>
	             	</c:if>
	             	<c:if test="${st.GRADE==5 }">
	             		<p class="star_rating">
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <span class="on">★</span>
					        <a>${st.MEMBERID }님</a>
					        <small>${st.WRITEDATE }</small>
	    				</p>
	    				
	             	</c:if>
               		
               	
                	<a class="review">${st.REVIEWCONTEXT }</a>
            </div>
        
            </div>
         <%-- <c:if test="${!empty orr }"> --%>
        	<div class="rounded row" style="padding-bottom:1em; padding-right:1em; padding-left:1em; padding-top:1em;">
        		<p>${orr.reviewContext}</p>
        		
        		 
        		 <p>${orr.businessCode}</p>
        	</div>
        
      <%--   </c:if>  --%>
        
         
            
        <%-- <c:if test="${empty orr}"> --%>
        <form action="${path }/owner/insertReviewRe.do" method="post">
            <div class="rounded row" style="padding-bottom:1em; padding-right:1em; padding-left:1em; padding-top:1em;">
                        <div class="re">                          
                            <input type="hidden" name="qnaNo" value="${st.REVIEWNUM}"/>
                            <input type="hidden" name="qnaCode" value="${st.BUSINESSCODE}"/>
                            <input type="hidden" name="ownerId" value="${st.OWNERID}"/>                            
                            <textarea id="textarea" name="context" cols="70" rows="5" placeholder="답글을 달아주세요" style="margin-left: 250px;"></textarea><br/>
                            <input type="submit" class="btn" value="사장님 댓글 등록" style=" width:200px; margin-top:15px; float: right;"/>  
                        </div>              
            </div>                
        </form>
         <%-- </c:if>  --%>
        <hr/>
            
            </c:forEach>