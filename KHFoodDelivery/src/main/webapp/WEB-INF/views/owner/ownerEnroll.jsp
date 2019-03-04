<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
 	<jsp:param value="사장님 회원가입" name="pageTitle"/>
</jsp:include>
<style>
    #ownerJoinBtn{
        width:100%;
    }
</style>
<section>
	
  <div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>사장님 회원 가입</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form action="${path }/owner/ownerEnrollEnd.do" method="post">
                                          <div class="form-group row">
                                            <label for="username" class="col-4 col-form-label">아이디</label> 
                                            <div class="col-8">
                                              <input type="text" id="ownerId" name="ownerId" placeholder="아이디" class="form-control here" required="required" >
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="name" class="col-4 col-form-label">비밀번호</label> 
                                            <div class="col-8">
                                              <input type="password"  id="ownerPw" name="ownerPw" placeholder="비밀번호" class="form-control here" >
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="lastname" class="col-4 col-form-label">비밀번호 확인</label> 
                                            <div class="col-8">
                                              <input type="password" id="reownerPw" name="reownerPw" placeholder="비밀번호 확인" class="form-control here">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="text" class="col-4 col-form-label">이름</label> 
                                            <div class="col-8">
                                              <input id="ownerName" name="ownerName" placeholder="이름" class="form-control here" required="required" type="text">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="ownerPhone" class="col-4 col-form-label">연락처</label> 
                                            <div class="col-8">
                                              <input type="text" id="ownerPhone" name="ownerPhone" class="form-control here" required="required" placeholder="연락처">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="email" class="col-4 col-form-label">Email</label> 
                                            <div class="col-8">
                                              <input id="ownerEmail" name="ownerEmail" placeholder="Email" class="form-control here" required="required" type="email">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <div class="col-4"></div>
                                            <div class="col-8">
                                              <button id="ownerJoinBtn" name="submit" type="submit" class="btn btn-primary">회원가입</button>
                                            </div>
                                          </div>
                                        </form>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-3">
                    </div>
                </div>
            </div>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>