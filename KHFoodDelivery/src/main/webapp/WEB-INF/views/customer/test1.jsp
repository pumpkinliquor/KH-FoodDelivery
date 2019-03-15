<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<style>
div .menuCategoryStyle {
	cursor:pointer;
}
</style>
<script>
	$(function() {
		$("dd:not(:first)").css("display", "none"); //선택 dd 빼고 나머지 dd를 none으로 해라

		$("dl dt").click(function() {
			if ($("+dd", this).css("display") == "none") {
				$(this).siblings("dd").slideUp("fast");
				$("+dd", this).slideDown("fast");
			}
		});
	});
	
</script>
<div id="menubox">
	<dl>
		<dt>인기메뉴</dt>
		<dd>
			<c:forEach begin="0" end="1" step="1">
			<div class="row">
				<div class="col-sm-9">
					<div class="mnl">
						<p>
							<span style='font-weight:bold;'>교촌 간장치킨</span><br /> <span style='color:red;'>19500원</span>
						</p>
					</div>
				</div>
				<div class="col-sm-3">
					<img class="mnlogo" src="${path}/resources/upload/owner/menu/20190314_142247312_830.jpg"><br />
				</div>
			</div>
			<hr>
			</c:forEach>
		</dd>
		<c:forEach var="category" items="${categoryList}">
		<dt id="categoryBtn${category.MENUCATEGORYCODE }">${category.MENUCATEGORY }</dt>
		<dd>
		<script>
		// 메뉴 누르면 메뉴코드 보내주기(모달으로 보내야함).
		function ohoh(no){
			var menuCode=no;
			location.href="${path}/customer/nono.do?menuCode="+menuCode;
		}
		// 에이젝스로 값보내기
		$(document).ready(function(){
	        	$("#categoryBtn${category.MENUCATEGORYCODE}").click(function(){
        		var businessCode=${businessCode};
        		var menuCategoryCode=${category.MENUCATEGORYCODE};
        		$.ajax({
        			type: "POST",
        			url: "${path}/customer/test1End.do",
        			data : {"businessCode" : businessCode, "menuCategoryCode" : menuCategoryCode},
        			dataType : "JSON",
        			success:function(data) {
        				console.log(data);
        				var html="<div>";
        				for(var i=0; i<data.length; i++){
        				html+="<div class='row menuCategoryStyle' onclick='ohoh("+data[i].MENUCODE+");' id='menuCategoryId"+data[i].MENUCODE+"'>";
        				html+="<div class='col-sm-9'>";
        				html+="<div class='mnl'>";
        				html+="<p style='margin-top:8px; margin-bottom:8px;'><span style='font-weight:bold;'>"+data[i].MENUNAME+"</span><br/><span style='color:red;'>"+data[i].MENUPRICE+"원</span></p>";
        				html+="</div>";
        				html+="</div>";
        				html+="<div class='col-sm-3'>";
        				html+="<img class='mnlogo' src='${path}/resources/upload/owner/menu/"+data[i].MENUIMAGE+"'><br/>";
        				html+="</div>";
        				html+="</div>";
        				html+="<hr>";
       					$("#menuList${category.MENUCATEGORYCODE}").empty().append(html);
        				}
        				html+="</div>";
       		        }
        		});
        	});
        });
		</script>
		<div id="menuList${category.MENUCATEGORYCODE }">
		</div>
		</dd>
		</c:forEach>
	</dl>
</div>



