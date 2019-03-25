<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp">
	<jsp:param value="사장님메인" name="pageTitle"/>
</jsp:include>
    <style>
        #p2{
            display: inline-block;
        }
        #p1{
            display: inline-block;
        }
        #loginBtn{
            width: 100%;
            height: 50px;
           
        }
        .loginBtn{
         background-color:rgba(61, 58, 129, 0.986);
         border-color: rgba(61, 58, 129, 0.986);
        }
        #myPageBtn{
            width: 100%;
            height: 50px;
        }
        table td{
            border-top: 1px solid #dee2e6;
        }
        .noticeDiv1{
           
        }
        .idPwSearch_Div{
            font-size: 12px;
            margin-bottom: 20px;
        }
        #enrollBtn,#logoutBtn{
            width:100%;
            height:40px;
        }
        .infoDiv{
             /* border: 1px solid black;  */
            height:200px;
            padding-top: 20px;
        }
        .infoDiv2{
            height:170px;
            border:1px solid #ccc;
             padding-top: 25px; 
            /* display: inline-flex; */
        }
        .infoDiv3{
            padding-left:10%;
        }
        .infoDiv4{
       		padding-left:15%;
            /* width: 150px; */
            /* margin-left: 30px; */
        }
        #notice_ta{
        	line-height:50px;
        }
        .main_row1{
        	margin-top:30px;
        }
        #noticePlus{
        	background-color: transparent;
			border-color: transparent;
        }
        #noticePlus:hover{
        pnt;
        }
        #p1{
        	color:rgba(61, 58, 129, 0.986);
        }
    </style>
    <section>
    <div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-12">
                <img src="${path }/resources/images/owner/main/사장님메인.png" width="100%" height="500px">
            </div>
            <div class="row main_row1">
                <div class="col-md-8">
                    <div class="col-md-12">
                    <h6 id="p1">공지사항</h6> 
                    <a href="${path}/owner/ownerNoticeListOwnerView.do" id="noticePlus" style="float:right">더보기</a>
                    </div>
                    <div class="col-sm-12 noticeDiv1">
                    <table id="notice_ta" width="100%">
                       <c:forEach var="list" items="${list }" begin="0" end="2" step="1" varStatus="vs">
							<tr style="cursor:pointer;" onclick="location.href='${path}/owner/ownerNoticeViewOwnerView.do?ownerNoticeNum=${list.OWNERNOTICENUM }'">
								
								<td><a href="#">${list.OWNERNOTICETITLE }</a></td>
								
							</tr>
					  </c:forEach>
                    </table>
                    </div>
                </div>
                <div class="col-md-4">
                   <c:if test="${sessionScope.ownerId== null }">
                    <div class="col-md-12 div1">
                        <p>사장님 로그인 해주세요!</p>
                    </div> 
                    <div class="col-md-12">
                        <button id="loginBtn" class="btn btn-secondary loginBtn" onclick="location.href='${path }/owner/login.do'">로그인</button>
                    </div>
                    <div class="row">
                    <div class="col-md-6"></div>
                    <div class="col-md-6 idPwSearch_Div">
                        <a href="${path }/owner/ownerIdSearch.do">아이디찾기</a><a href="${path }/owner/ownerSearchPw.do">비밀번호찾기</a>
                    </div>
                    </div>
                    <div class="col-md-12">
                        <button id="enrollBtn" class="btn btn-secondary loginBtn" onclick="location.href='${path }/owner/insertOwner.do'">회원가입</button>
                    </div>
                     </c:if>
                     <c:if test="${sessionScope.ownerId!=null }">
                     <div class="col-md-12 div1">
                        <p><b>${ownerId}사장님</b> 환영 합니다!</p>
                     </div>
                     <div class="col-md-12">
                        <button id="myPageBtn" class="btn btn-secondary loginBtn" onclick="location.href='${path }/owner/myPage.do'">마이페이지</button>
                     </div> 
                     <br>
                     <div class="col-md-12">
                        <button id="logoutBtn" class="btn btn-secondary loginBtn" onclick="location.href='${path }/owner/logout.do'">로그아웃</button>
                     </div> 
                     </c:if>
                </div>           
            </div>
            
            
            <div class="row">
            <div class="col-md-12">
                <div class="row">
                <div class="col-md-4 col-sm-12 infoDiv">
                    <div class="col-md-12 infoDiv2">
                        <div class="row">
                        <div class="col-md-6 col-sm-6 infoDiv3">
                        <a href="${path }/owner/menuStoreChoice.do?ownerId=${sessionScope.ownerId}">
                        <p id="p1">사장님 가게의 메뉴를  쉽게 관리해보세요.</p>
                        </div>
                        <div class="col-md-6 col-sm-6 infoDiv4">
                            <img src="${path }/resources/images/owner/main/등록.png" width="100px" height="100px">
                       </a> </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 infoDiv">
                    <div class="col-md-12 infoDiv2">
                        <div class="row">
                        <div class="col-md-6 col-sm-6 infoDiv3">
                        <a href="${path }/owner/storeForm.do">
                            <p id="p1">간단한 정보를 입력하고 입점 등록 신청을 해보세요. 아주 쉬워요!</p>
                        </div>
                        <div class="col-md-6 col-sm-6 infoDiv4">
                            <img src="${path }/resources/images/owner/main/정보수정.png" width="100px" height="100px">
                       </a> </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-12 infoDiv">
                    <div class="col-md-12 infoDiv2">
                        <div class="row">
                        <div class="col-md-6 col-sm-6 infoDiv3">
                            <a href="${path }/owner/salesStoreChoice.do?ownerId=${sessionScope.ownerId}">
                            <p id="p1">사장님 가게의 매출을 통계를 통해 확인하세요!</p>
                        </div>
                        <div class="col-md-6 col-sm-6 infoDiv4">
                            <img src="${path }/resources/images/owner/main/매출.png" width="100px" height="100px">
                        </a></div>
                        </div>
                    </div>
                </div>
                </div>
            </div>
            </div>
        </div> 
    </div>
    </div>  
    </section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>
	