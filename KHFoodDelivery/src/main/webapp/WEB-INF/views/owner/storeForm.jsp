<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=키값받아오기"></script>
<script>
$(function(){
   $('[name=storeImage]').on('change',function(){
      var filename=this.files[0].name;
      $(this).next('.custom-file-label').html(filename);
   });
});

function execDaumPostcode(){
	new daum.Postcode({
		oncomplete: function(data){
			// 팝업에서 검색결과 항목을 클릭했을 때 실행할 코드를 작성하는 부분
			
			// 도로명 주소의 노출 규칙에 따라 주소를 조합.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기한다.
			var fullRoadAddr=data.roadAddress; // 도로명 주소 변수
			var extraRoadAddr=''; // 도로명 조합형 주소 변수
			
			// 법정동명이 있을 경우 추가한다. (법정리는 제외)
			// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
			if(data.bname!==''&&/[동|로|가]$/g.test(data.bname)){
				extraRoadAddr+=data.bname;
			}
			// 건물명이 있고, 공동주택일 경우 추가한다.
			if(data.buildingName!==''&&data.apartment==='Y'){
				extraRoadAddr+=(extraRoadAddr!==''?', '+data.buildingName:data.buildingName);
			}
			// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
			if(extraRoadAddr!==''){
				extraRoadAddr=' ('+extraRoadAddr+')';
			}
			// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
			if(fullRoadAddr!==''){
				fullRoadAddr+=extraRoadAddr;
			}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('zip').value=data.zonecode; // 5자리 새우편번호 사용
			document.getElementById('addr1').value=fullRoadAddr; // 선택 주소
			document.getElementById('addr2').focus(); // 상세 주소
		}
	}).open();
}
</script>
<style>
    div#update-container{
		background-color:white;
		width:80%; 
		margin:0 auto;
		text-align:center;
		}
    div#update-container input, div#update-container select {margin-bottom:10px;}
</style>
<section>
	<div class="container">
		<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">업체 등록 신청</h2>
	</div>
	<div class="col-md-12">
		<form action="${path }/owner/storeFormEnd.do" method="post" enctype="multipart/form-data">
			<table class="table table-bordered">
			    <tbody>
			        	<tr>
			        		<th>사업자 아이디</th>
			        		<td>
				        		<input type="text" id="ownerId" name="ownerId" class="form-control" value="${sessionScope.ownerId }" readonly/>
			        		</td>
			        	</tr>
			        	 <tr>
			                <th>사업자 이름</th>
			                <td><input type="text" name="businessName" placeholder="10글자 미만으로 입력하세요." class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>사업자 연락처</th>
			                <td><input type="tel" name="businessPhone" placeholder="010-1234-5678" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>사업자 등록 번호</th>
			                <td><input type="text" name="businessNum" class="form-control" placeholder="123-45-67890 형식에 맞춰서 입력하세요." required></td>
			            </tr>
			        	<tr>
			        		<th>카테고리</th>
			        		<td>
			        			<select name="storeCategory">
			        				<option value="돈까스/일식">돈까스/일식</option>
				   					<option value="프랜차이즈">프랜차이즈</option>
				   					<option value="치킨">치킨</option>
				   					<option value="피자">피자</option>
				   					<option value="중식">중식</option>
				   					<option value="한식">한식</option>
				   					<option value="족발/보쌈">족발/보쌈</option>
				   					<option value="분식">분식</option>
				   					<option value="디저트">디저트</option>
			        			</select>
			        		</td>
			        	</tr>
			            <tr>
			                <th>업체명</th>
			                <td><input type="text" name="storeName" placeholder="25글자 미만으로 입력하세요." class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>업체 연락처</th>
			                <td><input type="tel" name="storePhone" placeholder="02-123-4567 or 02-1234-5678" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>주소</th>
			                <td>
			                	<button onclick="execDaumPostcode();" class="btn btn-default" style="float:left; margin-right:1em; ">주소찾기</button>
			                	<input type="text" id="zip" class="form-control" style="width:7em;" placeholder="우편주소" value=""/>
			                	<input type="text" id="addr1" name="frontAddress" placeholder="기본주소" class="form-control" style="width:30em; margin-top:1em;" value=""/>
			                	<input type="text" id="addr2" name="backAddress" placeholder="상세주소" class="form-control" style="width:30em; margin-top:1em;" value=""/>
			                </td>
			            </tr>
			             <tr>
			                <th>배달 최저금액</th>
			                <td><input type="number" name="minPrice" placeholder="배달 시 최저주문금액을 적어주세요." class="form-control" required></td>
			            </tr>
			            <tr>
			                <th>업체소개</th>
			                <td><textarea cols="10" id="storeProfile" name="storeProfile" class="form-control" style="resize:none; height:15em;" required></textarea></td>
			            </tr>
			            <tr>
			                <th>
								<div class="input-group-prepend" style="padding:0px;">
			                    	<label for="upFile"><span class="input-group-text">메인이미지</span></label>
				                </div>
							</th>
			                <td>
           	 					<div class="custom-file">
				                    <input type="file" class="custom-file-input" name="storeImage" id="upFile">
				                    <label class="custom-file-label" for="upFile">반드시 이미지를 넣어주세요.</label>
		               	 		</div>
		                	</td>
			            </tr>
			            <tr>
			                <td colspan="2">
			                    <input type="submit" value="신청" class="btn btn-outline-success" style="float:right;"/>
			                </td>
			            </tr>
			    </tbody>
			</table>
		</form>
	</div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>