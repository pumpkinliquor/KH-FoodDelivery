<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
     section .section-title {
    text-align: center;
    color: #007b5e;
    margin-bottom: 50px;
    text-transform: uppercase;
}

a {
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
  font-family: 'Open Sans', sans-serif;
  color: #000;
}
a:hover {
  -webkit-transition: all 0.5s;
  -moz-transition: all 0.5s;
  transition: all 0.5s;
  color: #000;
  text-decoration: none;
}
.menuEnrollDiv{
margin-top : 20px;
}

h1,h2,h3,h4,h5{
       font-family: 'Open Sans', sans-serif;
}
p, ul,li{
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    line-height: 25px;
}
.form-inline .form-control.custom-file-upload {
  border: 1px solid #ccc;
  
  padding: 6px 12px;
  cursor: pointer;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  width: 100%;
}

.wrap-input-container {
  display: inline-block;
  position: relative;
  overflow: hidden;
}
.wrap-input-container input {
position: absolute;
font-size: 400px;
opacity: 0;
z-index: 1;
top: 0;
left: 0;
}

.categoryDiv{
  height:200px;
}

.bt1{
	border-color: #4D4D4D !important;
	background-color:white !important;
	color:#4D4D4D !important;
}

</style>

<jsp:include page="/WEB-INF/views/common/ownerHeader.jsp"></jsp:include>
<script>

</script>
<section>
	<div class="container">
                <div class="row">
                    <div class="col-md-3 ">
                         <div class="list-group ">
                          <a href="${path }/owner/menuEnroll.do?businessCode=${businessCode}" class="list-group-item list-group-item-action active menu">메뉴/카테고리 등록</a>
                          <a href="${path }/owner/menuManage.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">메뉴관리</a>
                          <a href="${path }/owner/menuSoldOut.do?businessCode=${businessCode}" class="list-group-item list-group-item-action menu">품절관리</a>                   
                        </div> 
                    </div>
                    <div class="col-md-9">
                    	 <div class="card categoryDiv">
                          <div class="card-body">
                              <div class="row">
                                  <div class="col-md-12">
                                      <h4>카테고리 등록</h4>
                                      <hr>
                                  </div>
                              </div>
                              <div class="row">
                                  <div class="col-md-12">
                                      <form action="${path }/owner/enrollCategory.do?businessCode=${businessCode}" method="post">
                                        <div class="form-group row">
                                          <label for="menuCategory" class="col-4 col-form-label">카테고리명</label> 
                                          <div class="col-8">
                                            <input id="menuCategory" name="menuCategory" placeholder="" class="form-control here" required="required" type="text">
                                          </div>
                                        </div>                                  
                                        <div class="form-group row">
                                          <div class="offset-4 col-8">
                                            <button name="submit" type="submit" class="btn btn-primary bt1">등록</button>
                                          </div>
                                        </div>
                                      </form>
                                  </div>
                              </div>
                              
                                

                          </div>
                      </div>
                        <div class="card menuEnrollDiv">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12">
                                        <h4>메뉴 등록</h4>
                                        <hr>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-12">
                                        <form action="${path }/owner/enrollMenu1.do?businessCode=${businessCode}" method="post" enctype="multipart/form-data" onsubmit="return fn_enroll_validate();" >
                                          <div class="form-group row">
                                            <label for="username" class="col-4 col-form-label">메뉴명</label> 
                                            <div class="col-8">
                                              <input id="menuName" name="menuName" placeholder="" class="form-control here" required="required" type="text">
                                            </div>
                                          </div>                                      
                                          <div class="form-group row">
                                            <label for="select" class="col-4 col-form-label">메뉴카테고리</label> 
                                            <div class="col-8">
                                              <select id="select" name="menuCategoryCode" class="custom-select" required="required">
                                              	<c:forEach var="c" items="${category }">
                                              	<c:if test="${c.CATEGORYSTATE eq 0 }">
                                                <option value="${c.MENUCATEGORYCODE }">${c.MENUCATEGORY }</option>
                                                </c:if>
                                                </c:forEach>
                                              
                                              </select>
                                            </div>
                                          </div>    
										  <div class="form-group row">
                                            <label for="website" class="col-4 col-form-label">가격</label> 
                                            <div class="col-8">
                                              <input id="menuPrice" name="menuPrice" placeholder="" class="form-control here" type="number" required="required">
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="publicinfo" class="col-4 col-form-label">메뉴설명</label> 
                                            <div class="col-8">
                                              <textarea id="menuContent" name="menuContent" cols="40" rows="4" class="form-control"></textarea>
                                            </div>
                                          </div>
                                          <div class="form-group row">
                                            <label for="newpass" class="col-4 col-form-label">메뉴사진</label> 
                                              <div class="col-sm-8 wrap-input-container">
                                                <label id="menuImage1" class="custom-file-upload form-control">
                                                  Upload Image
                                                </label>
                                                <input id="menuImage" class="file-upload" name="menuImage" type="file" onchange="chk_file_type(this);" accept="image/gif,image/jpeg,image/png"/>
                                              </div>
                                          </div>                                
                                          <div class="form-group row">
                                            <div class="offset-4 col-8">
                                              <button name="submit" type="submit" class="btn btn-primary bt1">등록</button>
                                            </div>
                                          </div>
                                        </form>
                                    </div>
                                </div>
                                
                                  

                            </div>
                        </div>

                    </div>
                </div>
            </div>




</section>


<script>
$(function(){
	
	$('#menuName').keyup(function(){
		var a = $('#menuName').val();
		var pattern = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s)]/gi;
	        if(pattern.test(a)){
	        	$('#menuName').val("");
	        }
	});
	
 	$('#menuCategory').keyup(function(){
		var a = $('#menuCategory').val();
		var pattern = /[^(가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9\s)]/gi;
	        if(pattern.test(a)){
	        	$('#menuCategory').val("");
	        }
	}); 
	
});

$('#menuImage').change(function(){
/* 	$('label[id*="menuImage1"]').text($('#menuImage').val());  */
})

function fn_enroll_validate()
{
	var menuImage = $('#menuImage').val();
	if(menuImage.trim().length==0)
		{
			alert("사진 등록을 해주세요");
			return false;
		}
	return true
}

function chk_file_type(el) {
	
	if(!/\.(jpeg|jpg|png|gif|bmp)$/i.test(el.value)){ 

        alert('이미지 파일만 업로드 가능합니다.'); 
        $('label[id*="menuImage1"]').text('Upload Image');
        el.value = ''; 
        el.focus(); 

    }
	else
		{
			$('label[id*="menuImage1"]').text($('#menuImage').val()); 
		}
	}

</script>


<jsp:include page="/WEB-INF/views/common/ownerFooter.jsp"></jsp:include>