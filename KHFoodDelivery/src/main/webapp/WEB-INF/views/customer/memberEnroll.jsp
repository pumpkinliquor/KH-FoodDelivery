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
      div#enroll-container{width:400px; margin:0 auto;}
      div#enroll-container input, div#enroll-container select {margin-bottom:10px;}
     
	
	 div#enroll-container .btn-ser{position:absolute;display:inline;margin-left: 78%; }
    /*중복아이디체크관련*/
    div#enroll-container{position:relative; padding:0px;}
    div#enroll-container span.guide {display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
    div#enroll-container span.guide1 {display:none;font-size: 12px;position:absolute; top:105px; right:10px;}
     div#enroll-container span.guide2 {display:none;font-size: 12px;position:absolute; top:200px; right:10px;}
     div#enroll-container span.guide3 {display:none;font-size: 12px;position:absolute; top:300px; right:10px;}
    div#enroll-container span.ok,span.ok1,span.ok2,span.ok3{color:blue;}
    div#enroll-container span.error,span.error2,span.error3{color:red;}
	    .submitBtn{
	    border-color:rgb(250, 163, 148);
	    color:black;
	    float:right;
	    }
       
</style>      
 <script>
 
 
 function address() {	         
     new daum.Postcode({ 	
        oncomplete: function(data) {	
            // 각 주소의 노출 규칙에 따라 주소를 조합한다.	
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.	
            var fullAddr = data.address; // 최종 주소 변수	
            var extraAddr = ''; // 조합형 주소 변수	
	
            // 기본 주소가 도로명 타입일때 조합한다.	
            if(data.addressType === 'R'){	
                //법정동명이 있을 경우 추가한다.	
                if(data.bname !== ''){	
                    extraAddr += data.bname;	
                }	
                // 건물명이 있을 경우 추가한다.	
                if(data.buildingName !== ''){	
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);	
                }	
                	
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.	
                 fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 	
            }	
	
            // 주소 정보를 해당 필드에 넣는다.	
            $('#memberAddress').val(fullAddr); 	
             /* document.getElementById("location").value = fullAddr;  */	
            // 주소로 상세 정보를 검색	
            geocoder.addressSearch(data.address, function(results, status) {	
                // 정상적으로 검색이 완료됐으면	
                if (status === daum.maps.services.Status.OK) {	
	
                    var result = results[0]; //첫번째 결과의 값을 활용	
	
                    // 해당 주소에 대한 좌표를 받아서	
                    var coords = new daum.maps.LatLng(result.y, result.x);	
                   	
                 	
                }	
            });	
        }	
     }).open(); 	
}
 
	 function noSpaceForm1(obj) { // 공백사용못하게
		    var str_space = /\s/;  // 공백체크
		
		   
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		   
			}
	 function noSpaceForm2(obj) { // 공백사용못하게  , 특수문자 사용못하게
		    var str_space = /\s/;  // 공백체크
		    var pattern = /[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi; //특수문제체크
		   	var val=obj.value;
		   
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		    if (pattern.test(val)) {
		    	alert("해당 항목에는 특수문자를 사용할수 없습니다.\n특수문자는 자동적으로 제거 됩니다.");
		        obj.value = val.replace(pattern, "");

		       }
		
			}
	 
	 
	 //이메일 한글 공백막기
	  function noSpaceForm3(obj) { // 공백사용못하게  , 특수문자 사용못하게
		    var str_space = /\s/;  // 공백체크
		   	var val=obj.value;
		   	var pattern2 =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		   	
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		    if (pattern2.test(val)) {
		    	alert("영어와 숫자만 가능합니다.\n한글은 자동적으로 제거 됩니다.");
		    	obj.value = val.replace(pattern2, "");
				return false;
		       }
	 }
	 
	 //아이디
	 function noSpaceForm(obj) { // 공백사용못하게  , 특수문자 사용못하게
		    var str_space = /\s/;  // 공백체크
		    var pattern = /[^가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]/gi; //특수문제체크
		    var pattern2 =  /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
		   	var val=obj.value;
		   
		    if(str_space.exec(obj.value)) { //공백 체크
		        alert("해당 항목에는 공백을 사용할수 없습니다.\n공백은 자동적으로 제거 됩니다.");
		        obj.focus();
		        obj.value = obj.value.replace(' ',''); // 공백제거
		        return false;
		    }
		    if (pattern.test(val)) {
		    	alert("해당 항목에는 특수문자를 사용할수 없습니다.\n특수문자는 자동적으로 제거 됩니다.");
		        obj.value = val.replace(pattern, "");

		       }
		    if (pattern2.test(val)) {
		    	alert("영어와 숫자만 가능합니다.\n한글은 자동적으로 제거 됩니다.");
		    	obj.value = val.replace(pattern2, "");
				return false;
		       }
		
			}
            var id="";
            var memberId="";
            var nick="";
            $(function(){
            	
            	
            	
            	$('#memberPhone').bind("keyup", function(event) {
            	    var regNumber = /^[0-9]*$/;
            	    var temp = $('#memberPhone').val();
            	    if(!regNumber.test(temp))
            	    {
            	        alert('숫자만 입력하세요');
            	        $('#memberPhone').val(temp.replace(/[^0-9]/g,""));
            	    }
            	});
            	
            	//비밀번호 확인
            		$('#memberPw2').blur(function(){
            			memberPw = $("#memberPw").val();
            			var passwordRules =  /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{6,20}$/;		
             		   	if(passwordRules.test(memberPw) == false)
             		   	if($('#memberPw2').val()!=''){
             		   		{
             		   			alert(" 6~20 영문 대소문자 , 최소 1개의 숫자 혹은 특수 문자를 포함 하세요!");
             		   			$('#memberPw2').val('');
             		   			$('#memberPw2').focus();
             		   		
             		   		}
             		   	}
            			if($('#memberPw').val() != $('#memberPw2').val()){
            		    	if($('#memberPw2').val()!=''){
            			    alert("비밀번호가 일치하지 않습니다.");
            		    	    $('#memberPw2').val('');
            		          $('#memberPw2').focus();
            		       }
            		    	
            		    }
            		  
            		   else{
            			   $(".guide1.ok1").show();
            		   }
            		});  	   
            	});


	            function maxLengthCheck(object){
	                if (object.value.length > object.maxLength){
	                  object.value = object.value.slice(0, object.maxLength);
	                }    
	              }
	            
	            
            	$(function(){
            		$("#memberId").keyup(function(){
            			memberId=$("#memberId").val().trim();
            			if(memberId.length<4)
            			{
            				
            				$(".guide").hide();
            				return;
            			}
            			$.ajax({
            				url:"${path}/member/checkId.do",
            				data:{"memberId":memberId},
            				success:function(data){          
            					id=data.isId;
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
            	
            	$(function(){
            		$("#nickName").keyup(function(){
            			nickName=$("#nickName").val().trim();
         
            			$.ajax({
            				url:"${path}/member/checkNick.do",
            				data:{"nickName":nickName},
            				success:function(data){          
            					nick=data.isNick;     					
            					if(data.isNick==false){
            						$(".guide2.ok2").show();
            						$(".guide2.error2").hide();
            					
            					}else{
            						
            						$(".guide2.error2").show();
            						$(".guide2.ok2").hide();
            						
            					}
            					
            					
            				}
            			});
            		});
            	});
            	
            	//이메일 중복막기
            	$(function(){
            		$("#memberEmail").keyup(function(){
            			memberEmail=$("#memberEmail").val().trim();
         
            			$.ajax({
            				url:"${path}/member/checkEmail.do",
            				data:{"memberEmail":memberEmail},
            				success:function(data){          
            					memberEmail=data.isEmail;     					
            					if(data.isEmail==false){
            						$(".guide3.ok3").show();
            						$(".guide3.error3").hide();
            					
            					}else{
            						
            						$(".guide3.error3").show();
            						$(".guide3.ok3").hide();
            						
            					}
            					
            					
            				}
            			});
            		});
            	});
            	function validate(){
            		
            		function phone(){
            			
            			var regExp = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

            			if ( !regExp.test( $('#memberPhone').val() ) ) {

            			      alert("잘못된 휴대폰 번호입니다.  숫자만 입력하세요.");
            			      return false;
            			} 

            			return true;
            			}

            		
            		if(id==true)
            			{
            				alert("아이디를 확인해주세요");
            				return false;
            			}
            		if(memberId.length<4)
            			{
            				alert("아이디를 4글자 이상 입력해주세요");
            				return false;
            			}
            		if(nick==true)
            			{
            				alert("닉네임을 확인해주세요");
            				return false;
            			}
            	
            		return true;
            		
            	}
            	
         
            
            </script>
           
       <br/><br/><br/><br/><br/><br/><br/>
             <div id="enroll-container" class="col-sm-12" >
        <form name="enroll" action="${path}/member/memberEnrollEnd.do" method="post" onsubmit="return validate();">
       <input type="text" class="form-control" placeholder="아이디 (4글자이상)" name="memberId" id="memberId" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this)" required="required"/>
            <span class="guide ok">사용 가능한 아이디입니다. </span>
            <span class="guide error">아이디가 존재합니다. </span>
            <input type="password" class="form-control" placeholder="비밀번호" name="memberPw" id="memberPw"onkeyup="noSpaceForm1(this);" onchange="noSpaceForm1(this)" required="required"/>
            <input type="password" class="form-control" placeholder="비밀번호확인"name="memberPw2" id="memberPw2"onkeyup="noSpaceForm1(this);" onchange="noSpaceForm1(this)" required="required"/>
            	<span class="guide1 ok1">비밀번호가 일치합니다. </span>
        
            <input type="text" class="form-control" placeholder="이름" name="memberName" id="memberName"onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this)" required="required"/>
             <input type="text" class="form-control" placeholder="닉네임" name="nickName" id="nickName"onkeyup="noSpaceForm2(this);" onchange="noSpaceForm2(this)" required="required"/>
             <span class="guide2 ok2">사용 가능한 닉네임입니다. </span>
            <span class="guide2 error2">닉네임이 존재합니다. </span>
            <input type="date" class="form-control" placeholder="생년월일(예:910729)" name="memberBirth" id="memberBirth" max="2018-12-31" min="1900-01-01"required="required"/>
            <input type="email" class="form-control" placeholder="이메일" name="memberEmail" id="memberEmail" onkeyup="noSpaceForm3(this);" onchange="noSpaceForm3(this)"required="required" >
             
             <span class="guide3 ok3">사용 가능한 이메일입니다. </span>
            <span class="guide3 error3">이메일이 존재합니다. </span>
             <input type="button" class="btn-ser btn btn-default" onclick="address();" value="주소검색"/>
             
            <input type="text" class="add form-control"  placeholder="주소" name="memberAddress" id="memberAddress" required="required"/>
            <input type="text" class="form-control" placeholder="상세주소" name="memberAddress1" id="memberAddress1" required="required"/>
              <select class="form-control" name="memberGender" required="required">
               <option value="" disabled selected>성별</option>
               <option value="M">남</option>
               <option value="F">여</option>
            </select>
             <input type="hidden" name="profileImage" value="user.jpg"/>
  
     																					
            <br />
            
            <input  type="submit" class="btn btn-outline-light submitBtn"  value="가입"/>&nbsp;&nbsp;
            <input type="reset" class="btn btn-outline-light submitBtn"  value="취소"/>
         </form>
      </div>
      
     
      
  
 
     


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>