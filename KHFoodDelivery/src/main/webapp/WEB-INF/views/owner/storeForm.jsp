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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=72e4455e8e74d792419a0939fdffed0c&libraries=services"></script> 
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
            
			var geocoder = new daum.maps.services.Geocoder();
			// 주소로 상세 정보를 검색
            geocoder.addressSearch(data.address, function(results, status) {
                // 정상적으로 검색이 완료됐으면
                if (status === daum.maps.services.Status.OK) {

                    var result = results[0]; //첫번째 결과의 값을 활용

                    // 해당 주소에 대한 좌표를 받아서
                    var coords = new daum.maps.LatLng(result.x);
                    var coords1 = new daum.maps.LatLng(result.y);
                    
                    $('#lat').val(coords.jb); // 위도
                    $('#lng').val(coords1.jb)// 경도
                    
     
                }
            });
		}
	}).open();
}
function maxLengthCheck(object){
	if (object.value.length > object.maxLength){
		alert('최대 입력량을 초과하였습니다.');
		object.value = object.value.slice(0, object.maxLength);
	}    
}
function check(){
	var menuImage = $('#upFile').val();
	if(menuImage.trim().length==0)
		{
			alert("이미지 등록을 해주세요");
			return false;
		}
	var fileNm = $("#upFile").val();
	if (fileNm != "") {
	    var ext = fileNm.slice(fileNm.lastIndexOf(".") + 1).toLowerCase();
	    if (!(ext == "jpg" || ext == "png")) {
	        alert("이미지파일 (.jpg, .png ) 만 업로드 가능합니다.");
	        return false;
	    }
	}
	return true;
}

function enter(evt){
	$(function(){
		$('input:text').keydown(function(evt){
			if(evt.keyCode==13){
				return false;
			}
		});
	});
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
    td{
    	font-weight:bold;
    }
    .submitBtn{
    border-color: rgba(61, 58, 129, 0.986);
    color:rgba(61, 58, 129, 0.986);
    }
</style>
<section>
	<div class="container">
		<div style="text-align:center; margin-bottom:5em;">
		<h2 style="font-weight:bold;">업체 등록 신청</h2>
	</div>
	<div class="col-md-12">
		<form action="${path }/owner/storeFormEnd.do" method="post" onsubmit="return check();" enctype="multipart/form-data">
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
			                <td><input type="text" style="color:black;" id="businessName" maxlength="10" oninput="maxLengthCheck(this);" name="businessName" placeholder="10글자 미만으로 입력하세요." class="form-control" onkeydown="enter();" required></td>
			            </tr>
			             <tr>
			                <th>사업자 연락처</th>
			                <td><input type="number" maxlength="3" min="0" oninput="maxLengthCheck(this);" style="width:5em; float:left;  margin-bottom:1em; margin-right:1em; color:black;" value="010" id="frontPhone" name="frontPhone" class="form-control" onkeydown="enter(event);" required><input type="number" maxlength="4" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; color:black; float:left; margin-right:1em;" id="middlePhone" name="middlePhone" class="form-control" required><input type="number" maxlength="4" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; color:black; float:left; margin-right:1em;" id="finalPhone" name="finalPhone" class="form-control" required></td>
			            </tr>
			             <tr>
			                <th>사업자 등록 번호</th>
			                <td><input type="number" maxlength="3" min="0" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; float:left; margin-right:1em;" id="frontBusinessNum" onkeydown="enter(event);" name="frontBusinessNum" placeholder="000" class="form-control" required><input type="number" maxlength="3" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; float:left; margin-right:1em;" id="middleBusinessNum" onkeydown="enter(event);" name="middleBusinessNum" placeholder="000" class="form-control" required><input type="number" maxlength="6" oninput="maxLengthCheck(this);" style="width:13em; margin-bottom:1em; float:left; margin-right:1em;" placeholder="000000" id="finalBusinessNum" onkeydown="enter(event);" name="finalBusinessNum" class="form-control" required></td>
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
			                <td><input type="text" style="color:black;" maxlength="25" oninput="maxLengthCheck(this);" name="storeName" placeholder="25글자 미만으로 입력하세요." class="form-control" onkeydown="enter(event);" required></td>
			            </tr>
			             <tr>
			                <th>업체 연락처</th>
			                <td>
			                	<!-- <input type="number" maxlength="3" min="0" oninput="maxLengthCheck(this);" style="width:5em; margin-bottom:1em; float:left; margin-right:1em; color:black;" value="02" id="frontStorePhone" onkeydown="enter(event);" name="frontStorePhone" class="form-control" required> -->
			                	<select style="width:5em; margin-bottom:1em; float:left; margin-right:1em; color:black;" id="frontStorePhone" onkeydown="enter(event);" name="frontStorePhone" class="form-control" required>
			                		<option value="02">02</option>
			                		<option value="051">051</option>
			                		<option value="053">053</option>
			                		<option value="032">032</option>
			                		<option value="062">062</option>
			                		<option value="042">042</option>
			                		<option value="052">052</option>
			                		<option value="044">044</option>
			                		<option value="031">031</option>
			                		<option value="033">033</option>
			                		<option value="043">043</option>
			                		<option value="041">041</option>
			                		<option value="063">063</option>
			                		<option value="061">061</option>
			                		<option value="054">054</option>
			                		<option value="055">055</option>
			                		<option value="064">064</option>
			                	</select>
			                	<input type="number" maxlength="4" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; color:black; float:left; margin-right:1em;" id="middleStorePhone" onkeydown="enter(event);" name="middleStorePhone" class="form-control" required>
			                	<input type="number" maxlength="4" oninput="maxLengthCheck(this);" style="width:7em; margin-bottom:1em; color:black; float:left; margin-right:1em;" id="finalStorePhone" onkeydown="enter(event);" name="finalStorePhone" class="form-control" required>
			                </td>
			            </tr>
			             <tr>
			                <th>주소</th>
			                <td>
			                	<button onclick="execDaumPostcode();" type="button" class="btn btn-default" style="float:left; margin-right:1em;" >주소찾기</button>
			                	<!-- <input type="text" id="zip" class="form-control" style="width:7em; color:black;" placeholder="우편주소" value="" required readonly/> -->
			                	<br>
			                	<br>
			                	<input type="text" id="addr1" name="frontAddress" placeholder="기본주소" class="form-control" style="width:30em; margin-top:1em; color:black;" value="" readonly required/>
			                	<input type="text" id="addr2" name="backAddress" placeholder="상세주소" maxlength="30" oninput="maxLengthCheck(this);" class="form-control" style="width:30em; margin-top:1em; color:black;" value="" onkeydown="enter(event);" required/>
			                	<input type="hidden" id="lat" name="lat" value=""/>
			                	<input type="hidden" id="lng" name="lng" value=""/>
			                </td>
			            </tr>
			             <tr>
			                <th>배달 최저금액</th>
			                <td><input type="number" maxlength="5" min="0" max="50000" oninput="maxLengthCheck(this);" name="minPrice" style="color:black;" placeholder="배달 시 최저주문금액을 적어주세요." class="form-control" onkeydown="enter(event);" required></td>
			            </tr>
			            <tr>
			                <th>업체소개</th>
			                <td><textarea cols="10" id="storeProfile" maxlength="1000" oninput="maxLengthCheck(this);" name="storeProfile" class="form-control" style="resize:none; color:black; height:15em;" required></textarea></td>
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
			                    <input type="submit" value="신청" class="btn btn-outline-light submitBtn" style="float:right;"/>
			                </td>
			            </tr>
			    </tbody>
			</table>
		</form>
	</div>
    </div>
</section>
<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>