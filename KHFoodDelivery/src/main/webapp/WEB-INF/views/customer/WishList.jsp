<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.3.1.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/Mstyle.css" />

   <div id="deletedd${maps.menuCode }">
         <ul>
            <li style="list-style: none; float: left;">${maps.menuTitle }</li>
         </ul>
         <br>
         <ul>
            <li style="list-style: none; float: left;">
            <a id="deleteMenuCount${maps.menuCode }" style="cursor:pointer;"><img src="${path }/resources/images/owner/icons/deleteIcon.png" width=16px;/></a> ${maps.menuPrice }원</li>
            <li   style="list-style: none; margin-right: 1em; text-align: right; padding-top: 5px;">
               <!-- <a id="minusMenuCount" class="btn btn-minus">-</a> -->
               <span id="countUpdate${maps.menuCode }">${maps.menuCount } 개</span>
               <input type="hidden" class="gg" id="countUpdate${maps.menuCode }" value="${maps.menuCode}"/>
               <!-- <a id="plusMenuCount"  class="btn btn-plus">+</a> -->
            </li>
         </ul>
         <hr>
   </div>
         <script>
         $(document).ready(function(){
            $("#deleteMenuCount${maps.menuCode}").click(function(){
            var menuCode=${maps.menuCode};
            var businessCode=${maps.businessCode};
               $.ajax({
                  type:"POST",
                  url:"${path}/customer/deleteMenuCount.do",
                  data:{"menuCode" : menuCode},
                  dataType:"JSON",
                  success: function(data){
                    $('#deletedd${maps.menuCode}').html("");
                 	$.ajax({
						type:"POST",
						url:"${path}/customer/wishResult.do?businessCode="+businessCode,
						dataType:"html",
						success: function(data) {
							$('#plusMenuPrice_result').html(data);
						}
					});
                  }
               });
            });
         });
         
         
        /*  $(document).ready(function(){
        	 var oriMenuCode=${maps.menuCode};
        	 var newMenuCode=${selectMenuCode};
	         if(newMenuCode==oriMenuCode){
	        	 var html="<ul>";
	        	 html+="<li style='list-style: none; float:left;'>${maps.menuTitle}</li>";
	        	 html+="</ul>";
	        	 html+="<br>";
	        	 html+="<ul>";
	        	 html+="<li style='list-stylie:none; float:left;'>";
	        	 html+="<a id='deleteMenuCount${maps.menuCode}' style='cursor:pointer;'>x</a>${maps.menuPrice}원</li>";
	        	 html+="<span id='countUpdate${maps.menuCode}'>${maps.menuCount}개</span>";
	        	 html+="<input type='hidden' id='countUpdate${maps.menuCode}' value=''/>";
	        	 html+="</li>";
	        	 html+="</ul>";
	        	 html+="<hr>";
	        	 $('deletedd${maps.menuCode}').html(html);
	         }
         }) */
         
         /* var count=0;
         var minusCount=${maps.menuCount};
         var plusCount=${maps.menuCount};
         
         $(document).ready(function(){
             $("#minusMenuCount").click(function(e){

            count++;
            if(count==1){
               minusCount--;
            }
            else{
               minusCount=Number($("#countUpdate${maps.menuCode}").val())-1;
            }
            if(minusCount==0){
               alert("수량 0은 입력하실 수 없습니다.");
               return false;
            }
            var menuCode=${maps.menuCode};
               $.ajax({
                  type:"POST",
                  url:"${path}/customer/minusMenuCount.do",
                  data:{"menuCode" : menuCode, "minusCount" : minusCount},
                  dataType:"JSON",
                  success: function(data){
                     $('#countUpdate${maps.menuCode}').html(data);
                     $('#countUpdate${maps.menuCode}').val(minusCount);
                     alert($('#countUpdate${maps.menuCode}').val(minusCount));
                  }
               });
            }); 
         });
         
         $(document).ready(function(){
             $("#plusMenuCount").click(function(){
            count++;
            if(count==1){
               plusCount++;
            }
            else{
               plusCount=Number($("#countUpdate${maps.menuCode}").val())+1;
            }
            var menuCode=${maps.menuCode};
               $.ajax({
                  type:"POST",
                  url:"${path}/customer/plusMenuCount.do",
                  data:{"menuCode" : menuCode, "plusCount" : plusCount},
                  dataType:"JSON",
                  success: function(data){
                     $('#countUpdate${maps.menuCode}').html(data);
                     $('#countUpdate${maps.menuCode}').val(plusCount);
                  }
               });
            }); 
         });
         
         
         /* function fn_(e)
         {
            console.log("a태그"+e);   
            console.log($(e).next());
            
            count++;
            if(count==1){
               var minusCount=${maps.menuCount}-1;
            }
            else{
               minusCount=Number($(e).next().next().val())-1;
            }
            if(minusCount==0){
               alert("수량 0은 입력하실 수 없습니다.");
               return false;
            }
            var menuCode=${maps.menuCode};
               $.ajax({
                  type:"POST",
                  url:"${path}/customer/minusMenuCount.do",
                  data:{"menuCode" : menuCode, "minusCount" : minusCount},
                  dataType:"JSON",
                  success: function(data){
                     $(e).next().html(data);
                     $(e).next().next().val(minusCount);
                     
                  }
               });
         } */
         
        /*  function fn_plus(e)
         {
            console.log("+에들어옴");
               count++;
               if(count==1){
                  var plusCount=${maps.menuCount}+1;
               }
               else{
                  plusCount=Number($(e).prev().val())+1;
               }
               var menuCode=${maps.menuCode};
                  $.ajax({
                     type:"POST",
                     url:"${path}/customer/plusMenuCount.do",
                     data:{"menuCode" : menuCode, "plusCount" : plusCount},
                     dataType:"JSON",
                     success: function(data){
                        $(e).prev().prev().html(data);
                        $(e).prev().val(plusCount);
                  
                     }
                  });
         } */
         </script>