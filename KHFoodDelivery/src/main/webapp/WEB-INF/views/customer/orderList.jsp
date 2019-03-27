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
.img-circle {
    border-radius: 50%;
   	width:150px;
   	height:150px;

}
table#table-sort{ border: 1px solid #444444; border-collapse: collapse; }
	table#table-sort th{ background-color: #4D4D4D; color: rgba(255, 255, 255, .5); border: 1px solid #444444; padding: 0; }
	table#table-sort td{ border: 1px solid #444444; padding: 0; }
	thead#tableHead{ background-color: rgb(250, 163, 148); color: white } 

.star_rating {font-size:0; letter-spacing:-4px;}
.star_rating span{
    font-size:22px;
    letter-spacing:0;
    display:inline-block;
    margin-left:5px;
    color:#ccc;
    text-decoration:none;
    cursor:pointer;
}
#activeOn{background-color: rgb(250, 163, 148); color:white;}
#activeOff:hover{
	background-color: rgb(250, 163, 148);
	color:white;
}

#noImg1{
 cursor:pointer;
}

.star_rating span.on {color:crimson;}

.menu1{
}
</style>
<script>

$(document).ready(function() {

    
    var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }
    
            reader.readAsDataURL(input.files[0]);
        }
    }
    

    $("#file").on('change', function(){
        readURL(this);
    });
});

function fileUpload(){
	$("#file").click();
}


function detailOrder1(payorderNum,menucode){
	console.log(payorderNum,menucode);
	
	$.ajax({
		url:"${path}/member/orderOne.do",
		dataType : 'json',
		data : {
			"payorderNum" : payorderNum,
			"menucode" : menucode
		},
		success : function(mem1){
			console.log(mem1);
			var menu = "";
			var sum = "";
			for(var i=0; i<mem1.length; i++)
				{
					menu += mem1[i].MENUNAME+"("+mem1[i].COUNT+") ";
					sum = Number(sum) + Number(mem1[i].PRICE);
				}
			sum = Number(sum) + Number(mem1[0].DELIVERYPAY);
			console.log(menu);
			$('.category').val(mem1[0].STORECATEGORY);
			$('.storeName').val(mem1[0].STORENAME);
			$('.payDate1').val(mem1[0].PAYDATE);
			$('.way').val(mem1[0].PAYORDERMETHOD);
			$('.price').val(sum+"원");
			$('.payRequest').val(mem1[0].PAYREQUEST);
			$('.menu1').val(menu);
			$('#orderListModal1').modal();
			
			
		},
		error: function (mem1){
			alert(mem1);
		}
		
	});
	
}

	
</script>
	
	
			
 			
 	
 	
 	
 	
 	
 	<section>
<div class="container">

 			
 			
	<div class="row" >
		<div class="col-md-3 ">
		     <div class="list-group ">
  <a href="${path }/member/orderList.do?memberId=${sessionScope.logined}&memberNum=${sessionScope.loginedno}" id="activeOn" class="list-group-item list-group-item-action" style="z-index:0;">나의 주문내역</a>
              <a href="${path}/customer/mypage.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">회원정보변경</a>
              <a href="${path }/member/markList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">즐겨찾는매장</a>
              <a href="${path }/member/qnaList.do?memberId=${sessionScope.logined}" id="activeOff" class="list-group-item list-group-item-action">나의 문의내역</a>
            </div> 
		</div>
		<div class="col-md-9">	
	
		<h4 id="titleText">${sessionScope.logined}님 주문 내역 </h4>
		
		
		<div id="qnaList">
			<table class="table table-hover" id="qnaTable">
				<thead id="tableHead">
					<tr>	
						<th>카테고리</th>	
						<th>가게명</th>
						<th>주문 날짜</th>	
						<th>주문상태</th>
						<th>리뷰작성</th>
						<th>주문취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${orderList}" var="m">
						<tr class="pnt" style='cursor:pointer;'>
						
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});"style="cursor:pointer;"><c:out value="${m.STORECATEGORY }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});"><c:out value="${m.STORENAME }"/></td>
							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});"><c:out value="${m.PAYDATE}"/></td>

							<td onclick="detailOrder1(${m.PAYORDERNUM},${m.MENUCODE});">
							<c:set var="state" value="${m.ORDERSTATE }" />
							<c:choose>
							<c:when test="${ state eq 0}">
							결제완료
							</c:when>
							<c:when test="${ state eq 1}">
							주문접수
							</c:when>
							<c:when test="${ state eq 2}">
							배달중
							</c:when>
							<c:when test="${ state eq 3}">
							배달완료
							</c:when>
							<c:when test="${ state eq 4}">
							주문취소
							</c:when>
							</c:choose>
						
							</td>
							<td><button class="btn btn-default" value="${m.MEMBERID}"  id="modal" type="button" onclick="fn_review(${m.BUSINESSCODE},${m.MEMBERNUM},this)">리뷰</button></td>
						</tr>				
					</c:forEach>
				</tbody>
			</table>
		</div>
		</div>
	</div>
</div>
${pageBar}
</section>
	
 
 
     

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

<div class="modal" id="reviewModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">리뷰 작성</h4>
			</div>
			<form action="${path }/customer/memberReview.do" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<table class="table">
						<tr>
							<th style="vertical-align: middle; font-weight:bold;">별점</th>
							<td><p class="star_rating">
								    <span id="1" onclick=mark(this)>★</span>
								    <span id="2" onclick=mark(this)>★</span>
								    <span id="3" onclick=mark(this)>★</span>
								    <span id="4" onclick=mark(this)>★</span>
								    <span id="5" onclick=mark(this)>★</span>
								<input type="hidden" id="star" name="grade"/>
								</p>
							</td>

						
						</tr>
						<tr>
							<th style="vertical-align: middle;">
							<td>
								<input type="hidden" id="businessCode" name="bsCode" value=""/>
								<input type="hidden" id="memberNum" name="memNum" value=""/>
								<input type="hidden" id="memberId" name="memId" value=""/>
								<textarea id="textarea" name="context" cols="50" rows="5" placeholder="리뷰를 작성해 주세요." ></textarea></td>
							
							</th>
						
						</tr>
						<tr>
							<th style="vertical-align: middle;">
							<td>
							<label for="jdd_file1"><img class="defaultImg" id="noImg1" src="${path}/resources/images/noImg.png" style="width:150px; height:150px; border: 1px solid #d9d9d9;"></label>
							<input id="jdd_file1" type="file" class="jdd_file" name="img"/>
							</td>
						</tr>
					</table>
					<div class="modal-footer">
	        			<button type="submit" class="btn btn-secondary" >등록</button>
	        			<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      			</div>
				</div>
			
			</form>
		
		</div>
	
	</div>

</div>

<script>

function fn_review(businessCode,membernum,e){
	
	console.log($(e).val());
	var memberId = $(e).val();
	$('#businessCode').val(businessCode);
	$('#memberId').val(memberId);
	$('#memberNum').val(membernum);
	$('#reviewModal').modal();
	
}

$( ".star_rating span" ).click(function() {
    $(this).parent().children("span").removeClass("on");
    $(this).addClass("on").prevAll("span").addClass("on");
    return false;
});


function mark(e)
{
	
	var score=$(e).attr('id');
	$("#star").val(score);
	console.log(e)
	console.log(score)
	
	
	}
	
$("#jdd_file1").hide();


$(document).ready(function(){
	
	$(document).on("change",".jdd_file", handleImgRecipeFileSelect);
});




function handleImgRecipeFileSelect(e) {
	
  var files = e.target.files;	
  var filesArr = Array.prototype.slice.call(files);
  filesArr.forEach(function(f){
      if(!f.type.match("image.*")) 
      {
          alert("확장자는 이미지 확장자만 가능합니다");
          return;
      }

      sel_file = f;

      var reader = new FileReader();
      reader.onload = function(e){
	  console.log(e.currentTarget);

      		 //$(img).attr("src",e.target.result).attr("value",$("inputHiddenImg"+count).val()).css('width','158px').css('height','200px');
      		$("#noImg1").attr("src",e.target.result).css('width','150px').css('height','150px');
      		/*  $(document).on("click",".inputHiddenImg",function(){
      			 
      		 } */
      		 console.log("미리보기123123123드렁옴");
      }
      reader.readAsDataURL(f);
  });
  
}


</script>

<!-- 모달 구현 -->
<div class="modal" id="orderListModal1" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">주문 상세정보 </h4>
				<button type="button" class="close" data-dismiss="modal">×</button>
			</div>
			<form action="${path}/customer/memberQnaUpdate.do"  method="post">
				<div class="modal-body" style="height: 700px;">
					<table class="table">
						<tr>
							<th style="vertical-align: middle">카테고리</th>
							<td><input type="text"  class="form-control category" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">가게명</th>
							<td><input type="text"  class="form-control storeName" value="" readonly/></td>						
						</tr>						
						<tr>
							<th style="vertical-align: middle">주문날짜</th>
					<td><input type="text"  id="payDate1" class="form-control payDate1"  readonly/></td>						
						</tr>	
						<tr>
							<th style="vertical-align: middle">주문메뉴</th>
							<td><textarea class="form-control menu1" rows="5" value="" readonly></textarea></td>											
						</tr>						
						<tr>
							<th style="vertical-align: middle">결제 방식</th>
							<td><input type="text"  class="form-control way" value="" readonly/></td>						
						</tr>					
						<tr>
							<th style="vertical-align: middle">가격</th>
							<td><input type="text"  class="form-control price" value="" readonly/></td>						
						</tr>						 	 
					
						<tr>
							<th style="vertical-align: middle">요청사항</th>
							<td><textarea  class="form-control payRequest" style="resize: none" rows="6" readonly></textarea></td>						
						</tr>															 
					</table>
						
				</div>
				
			</form>
		</div>  
	</div>
</div>


