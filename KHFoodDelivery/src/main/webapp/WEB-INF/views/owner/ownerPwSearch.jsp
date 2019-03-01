<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
 	<jsp:param value="사장님 비밀번호찾기" name="pageTitle"/></jsp:include>

<section>
    <div class="container">
                <div class="col-md-6 mx-auto text-center">
                   <div class="header-title">
                      <h1 class="wv-heading--title">
                        	비밀번호 찾기
                      </h1>
                   </div>
                </div>
                <div class="row">
                   <div class="col-md-4 mx-auto">
                      <div class="myform form ">
                         <form action="${path }/owner/ownerSearchPwEnd.do" method="post" name="login">
                            <div class="form-group">
                               <input type="text" name="ownerId"  class="form-control my-input" id="ownerId" placeholder="id">
                            </div>
                            <div class="form-group">
                               <input type="email" name="ownerEmail"  class="form-control my-input" id="ownerEmail" placeholder="email">
                            </div>
                            <div class="text-center loginDiv_1">
                               <button type="submit" class=" btn btn-block send-button tx-tfm">찾기</button>
                            </div>
                         </form>
                      </div>
                   </div>
                </div>
             </div>

</section>






<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>