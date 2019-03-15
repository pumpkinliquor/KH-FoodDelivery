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
							교촌 간장치킨<br /> 19500원
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
		//모달
		function menuModal(no) {
			$.ajax({
				type:"POST",
				url:"${path}/customer/menuSelect.do",
				data:{"menuCode" : no},
				dataType:"JSON",
				success: function(data) {
					console.log(data);
					$('#menuSelectModal').modal();
					$('#menuImage').empty().append('<img src="${path}/resources/upload/owner/menu/'+data.menuImage+'" style="width:100%; height:333px;"/>');
					$('#menuTitle').empty().append(data.menuName);
					$('#menuTitle').val(data.menuTitle);
					$('#menuPrice').empty().append(data.menuPrice);
					$('#menuPrice').val(data.menuPrice);
				}
			});
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
        				html+="<div class='row menuCategoryStyle' onclick='menuModal("+data[i].MENUCODE+");' id='menuCategoryId"+data[i].MENUCODE+"'>";
        				html+="<div class='col-sm-9'>";
        				html+="<div class='mnl'>";
        				html+="<p style='margin-top:8px; margin-bottom:8px;'><span style='font-weight:bold;'>"+data[i].MENUNAME+"</span><br/><span style='color:black;'>"+data[i].MENUPRICE+"원</span></p>";
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

<script>
function cookiesInsert(){
	var count=$('#menuCount').val();
	if(count.trim().length==0||count==0){
		alert('수량이 0 입니다.');
		return false;
	}
	$("#menuInsertFrm").submit();
	return true;
}


function plusCount() {
	var price=$('#menuPrice').val();
	var plus=$('#menuCount').val();
	$('#plusMenuPrice').html(price*plus);
	$('#plusMenuPrice').val(price*plus);
}

</script>

<!-- 모달 -->
<div class="modal" id="menuSelectModal" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<form action="${path }/customer/menuInsert.do" id="menuInsertFrm">
		<div class="modal-content">
			<div class="modal-header">
				<p class="modal-title" id="menuTitle" style="font-weight:bold;"></p>
				<input type="hidden" id="menuTitle" name="menuTitle" value=""/>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<div class="modal-body" style="height: auto;">
				<div class="menu-image" id="menuImage"></div>
				<br/>
				<h6 class="menu-priceM" style="float:left;">가격</h6>
				<h6 class="menu-price" id="menuPrice" style="text-align:right;"></h6>
				<input type="hidden" id="menuPrice" name="menuPrice" value=""/>
				<br/>
				<h6 class="menu-countM" style="float:left; margin-bottom:0px; margin-top:8px;">수량</h6>
				<input type="number" onkeyup="plusCount();" name="menuCount" id="menuCount" class="form-control" style="float:right; width:3em;"/>
				<br/>
				<br/>
				<div style="background-color:rgb(231, 231, 231); height:5em; margin-top:2em;">
				<h5 style="font-weight:bold; float:left; padding-left:1em; line-height:80px;">총 주문금액</h5>
				<h5 style="float:right; padding-right:1em; line-height:80px;" id="plusMenuPrice"></h5>
				<input type="hidden" id="plusMenuPrice" name="plusMenuPrice" value=""/>
				</div>
			</div>
			<div class="modal-footer">
				<div class="container">
				<div class="row">
				<div class="col-sm-6" style="padding-left:0px; padding-right:0px;">
				<button type="button" onclick="cookiesInsert();" class="btn btn-success btn-lg btn-block">장바구니담기</button>
				</div>
				<div class="col-sm-6" style="padding-left:0px; padding-right:0px;">
				<button type="button" class="btn btn-danger btn-lg btn-block">결제하기</button>
				</div>
				</div>
				</div>
			</div>
		</div>  
		</form>
	</div>
</div>



