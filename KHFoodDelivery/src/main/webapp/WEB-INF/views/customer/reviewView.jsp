<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<style>
	div#context-area{ min-height: 200px; }
	.bt-group{float:right;}
	button.b1 {
		background-color: black;
		border-color: white;
		color:white;
	}
	div.de{margin-top:-10%;}
	.avatar:hover {

  -webkit-transform: scale(1.8);

	
}

	span#grade{
		font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	}
	.star_rating {font-size:0; letter-spacing:-4px;}
	.star_rating span {
	    font-size:22px;
	    letter-spacing:0;
	    display:inline-block;
	    margin-left:5px;
	    color:#ccc;
	    text-decoration:none;
	    cursor:pointer;
	}
	.star_rating span.on {color:crimson;}
</style>

<script>	

var str = $('.#textarea').val();

str = str.split('<br/>').join("\r\n");

$('#textarea').val(str);
	/* 문의 글 삭제 */
	function deleteReview(){
		location.href="${path}/customer/deleteReview.do?no=${review.REVIEWNUM}&memberId=${sessionScope.logined}";
	}
	

</script>

<section>
	<div class="container">  
		<div class="row" >			
			<div class="col-sm-8">
				<h4 style="display: inline;"><b>${review.STORENAME}</b></h4>			
				<c:forEach begin="1" end="${review.GRADE }">
					<span id="grade" style="color:crimson;">★</span>
				</c:forEach>
				<c:forEach begin="1" end="${5 - review.GRADE }">
					<span id="grade">★</span>
				</c:forEach>
				<c:out value="${review.WRITEDATE }"/>
			</div>						
			<div class="bt-group col-sm-4">	
				<button type="button" class="btn btn-default b1" onclick="deleteReview()">삭제</button>
				<button type="button" class="btn btn-default b1" onclick="location.href='${path }/member/myReview.do?memberId=${sessionScope.logined}'">목록으로</button>			
			</div>	
		</div>
		<hr/> <br/>	
		<div class="row">			
			<div class="col-sm-12" id="context-area">				
				<c:if test="${review.REVIEWIMAGE != null }">
					<img width="500px" height="400px" src="${path }/resources/upload/member/review/${review.REVIEWIMAGE}"/> <br/>
				</c:if>
				<h4><c:out value="${review.REVIEWCONTEXT }"/></h4>
			</div>
		</div>
	</div>
</section>
	
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

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

$(function(){
	$('[name=upFile]').on('change',function(){
		var filename=this.files[0].name;
		$(this).next('.custom-file-label').html(filename);
   });
});

function noSpaceForm(obj){		
	var str_space = /(<([^>]+)>)/ig;  // 태그체크
	
    if(str_space.test(obj.value)) { //태그체크
        obj.focus();
        obj.value = obj.value.replace(str_space,''); // 태그제거
        return false;
    }
}

$(".star_rating span").click(function() {
	console.log("ㅡㄹ릭");
    $(this).parent().children("span").removeClass("on");
    $(this).addClass("on").prevAll("span").addClass("on");
    return false;
});
	
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
      		$("#noImg1").attr("src",e.target.result).css('width','150px').css('height','150px');      
      }
      reader.readAsDataURL(f);
  });
  
}
function mark(e)
{
	
	var score=$(e).attr('id');
	$("#star").val(score);
	console.log(e)
	console.log(score)
	
	
	}

</script>


<!-- 모달 구현 -->
<div class="modal" id="updateReview" role="dialog">
	<div class="modal-dialog">
		<!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">리뷰 수정</h4>
			</div>
			<form action="${path }/customer/updateReview.do" method="post" enctype="multipart/form-data">
				<div class="modal-body">
					<table class="table">
						<tr>
							<th style="vertical-align: middle; font-weight:bold; width:100px;">별점</th>
							<td>
								<p class="star_rating">
								    <span id="1" onclick=mark(this) class="on">★</span>
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
							</th>
							<td>
								<textarea id="context" name="context" cols="50" rows="5" onkeyup="noSpaceForm(this);" onchange="noSpaceForm(this)" required="required"></textarea>
							</td>					
						</tr>
						<tr>
							<th style="vertical-align: middle;">
							<td>
							<label for="jdd_file1">
								<c:if test="${review.REVIEWIMAGE != null }">
									<img class="defaultImg" id="noImg1" src="${path}/resources/upload/member/review/${review.REVIEWIMAGE}" style="width:150px; height:150px; border: 1px solid #d9d9d9;">
								</c:if>
								<c:if test="${review.REVIEWIMAGE == null }">
									<img class="defaultImg" id="noImg1" src="${path}/resources/images/noImg.png" style="width:150px; height:150px; border: 1px solid #d9d9d9;">
								</c:if>
							</label>
								<input id="jdd_file1" type="file" class="jdd_file" name="img"/>
							</td>
						</tr>
					</table>
				</div>
				<div class="modal-footer">
					<input type="hidden" id="reviewNum" name="reviewNum"/>
	        		<button type="submit" class="btn btn-secondary" >수정</button>
	        		<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	      		</div>
	      	</form>
		</div>  
	</div>
</div>