<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>    
   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
 <style>
      div#enroll-container{width:400px; margin:0 auto; text-align:center;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
	
	
    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.ok{color:blue;}
    div#enroll-container span.error{color:red;}
	    
       
</style>      
      <div id="enroll-container">
         <form action="${path }/member/memberEnrollEnd.do" method="post" >
            <span class="guide ok">이 아이디는 사용할 수 있음 </span>
            <span class="guide error">이 아이디는 사용할 수 없음 </span>
            <input type="hidden" name="checkId" value="0"/>
       <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="userId" id="userId_" required>
            <script>
            	$(function(){
            		$("#userId_").keyup(function(){
            			var userId=$("#userId_").val().trim();
            			if(userId.length<4)
            			{
            				$(".guide").hide();
            				return;
            			}
            			$.ajax({
            				url:"${path}/member/checkId.do",
            				data:{"userId":userId},
            				success:function(data){
            					console.log(data);
            					console.log(data.num+" : "+typeof data.num);
            					console.log(decodeURI(data['char'])+" : "+typeof data['char']);
            					console.log(data.isId+" : "+typeof data.isId);
            					/* console.log(data.list+" : "+typeof data.list);
            					for(var i=0; i<data.list.length;i++){
            						console.log("for: "+data.list[i]);
            					} */
            					if(data.isId==false){
            						$(".guide.ok").show();
            						$(".guide.error").hide();
            					
            					}else{
            						$(".guide.error").show();
            						$(".guide.ok").hide();
            						
            					}
            				}
            			});
            		});
            	});
            
            
            </script>
            <input type="password" class="form-control" placeholder="비밀번호" name="memberPw" id="memberPw2" required>
            <input type="password" class="form-control" placeholder="비밀번호확인"name="memberPw2" id="memberPw2" required>
            <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName" required>
             <input type="text" class="form-control" placeholder="닉네임" name="nickName" id="nickName" required>
            <input type="number" class="form-control" placeholder="생년월일(예:910729)" name="memberBirth" id="memberBirth" maxlength="6" oninput="maxLengthCheck(this)">
            <input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="memberEmail" required>
            <input type="tel" class="form-control" placeholder="전화번호 (예:01012345678)" name="memberPhone" id="memberPhone" maxlength="11" required>
            <input type="text" class="form-control" placeholder="주소" name="memberAddress" id="memberAddress">
            <select class="form-control" name="gender" required>
               <option value="" disabled selected>성별</option>
               <option value="M">남</option>
               <option value="F">여</option>
            </select>
         
         
            <br />
            <input type="submit" class="btn btn-outline-secondary" value="가입" >&nbsp;
            <input type="reset" class="btn btn-outline-secondary" value="취소">
         </form>
      </div>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>