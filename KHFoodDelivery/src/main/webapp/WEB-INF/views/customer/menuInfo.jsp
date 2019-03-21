<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
   <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>   
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/searchHeader.jsp"/>

<style>
.restaurant-info{
    background-color: white;
    border: 1px solid #d9d9d9;
}
.restaurant-info .list{
    margin: 0;
}
.restaurant-info .list li{
    font-size: 90%;
    line-height: 20px;
}
.restaurant-title{
     padding: 10px; 
     font-size: 110%;
     border-bottom: 1px solid #d9d9d9;
}
.restaurant-content .logo{
    float: left;
    line-height: 100px;
}
.logo{
    margin-left: 5px;
    width: 100px;
    height: 100px;
}
.restaurant-content .list{
    list-style: none;  
}
.restaurant-content{
    position: relative;
    padding: 10px;
} 
.mr-aurto{
    border: 1px solid #d9d9d9;
    margin : 10px 0 0 0 ;
    padding-bottom: 1px;
    
}
.navbar-nav{
    /* display: inline; */
    width:100%;
}
.mr-aurto li{
    width:33%;
    font-size: 115%;
    border-left : 1px solid #d9d9d9;
    text-align: center;
}
.mn_bar{
    text-shadow: 0 1px 0 #fff;
    text-decoration: none;
    opacity: .75;
    font-weight:  700;
   
    display: inline !important;
   
  }
  .menu-name{
    position: absolute;
    overflow: hidden;
    clip: rect(0 0 0 0);
    margin: -1px;
    width: 1px;
    height: 1px;
   
  }
   
.category
{
    border: 1px solid #d9d9d9;
}
.board {
    font-family:'돋움';
    font-size:16px;
    /* position:absolute; */
    margin-top: 30px; 
    /* width:410px; */
    /* height:135px; */
    visibility:hidden;
  }
  .list li {
    list-style:none;
    margin-top:5px;
  }
  
  .list li:hover {
    text-decoration:underline;
    cursor:pointer;
  } 
  #menubox dl {
      width:100%;
    }
  #menubox dt {
      padding:5px;
    font-weight:bold; 
    background:#d9d9d9; 
    border-bottom:1px solid #fff; 
    cursor:pointer;
    }
  #menubox dd{
      padding:20px; 
      color:black; 
      border:1px solid #d9d9d9; 
      border-top:none; 
      width: 100%;
      height:100%;
    }
#menubox dd :hover{
    cursor:pointer;
}
#menubox dd a{
    color:#b6b6b6;
    
}
.mnlogo{
    float: right;
    width: 100px;
    height: 70px;
   
}
.mainlogo
{
    width : 80px;
    height:80px;
    border:1px solid #d9d9d9;
    background-size: cover;
}
.mnl{
     /* border :1px solid black;  */
}
.title{
    background-color: #333;
    color: #fff;
    font-size: 110%;
    padding: 10px 10px 10px 15px;
}
.cart-empty{
    background: #fff;
    text-align: read;
    padding: 20px 0;
    border: 1px solid #d9d9d9;
}
.clearfix
{
    border: 1px solid #d9d9d9;
    padding : 10px 15px;
    text-align: right;
}
.cart-btn{
    margin-top: 10px;
    cursor:pointer;
    text-align: center;
    color: #fff;
    background-color: #DC1400;
    border-color: #DC1400;
    border-radius: 0;
}
.list li{
    color: #999; 
}
.list li span{
    color: #333; 
}
#menuReview , #menuList,#storeInfo{
   
 cursor:pointer;
 
}
.onMark{
	color: #FF0000;
}
.offMark{
	color:#ccc;
}
</style>
 <script>
 
	function fn_mark(){		
		// 찜 상태 -> 찜 취소
		if($('.onMark').length > 0) {
			alert("찜 취소");
			$('#isMark').val("1");
			$('#markFrm').submit();
		} else{
			alert("찜 성공");
			$('#isMark').val("0");
			$('#markFrm').submit();
		}
	};
 
        $(document).ready(function(){
           
           $("#menuReview").click(function(){
              
              var businessCode=${businessCode};
              
              $.ajax({
                 
                 type: "post",
                 url: "${path}/customer/menuReview.do",   
                 data : {"businessCode" : businessCode},
                 success: function test(a){$("#callback").html(a);}
              });
              
           });
           
        });
        
      $(document).ready(function(){
           $("#menuList").click(function(){
              var businessCode=${businessCode};
              $.ajax({
                 type: "post",
                 url: "${path}/customer/menuList.do",
                 data : {"businessCode" : businessCode, "menuCode" : menuCode},
                 success: function test(a){$("#callback").html(a);}
              });          
           });
        });
      
      window.onload=function(){
         var businessCode=${businessCode}
          $.ajax({
             type: "post",
             url: "${path}/customer/menuList.do",
             data : {"businessCode" : businessCode},
             success: function test(a){$("#callback").html(a);}
          });
          
      }
         
      $(document).ready(function(){
           
           $("#storeInfo").click(function(){
              
              $.ajax({
                 
                 type: "post",
                 url: "${path}/customer/storeInfo.do",   
                 success: function test(a){$("#callback").html(a);}
              });
              
              
           });
           
        });
      
       $(document).ready(function () {
           $('.nav-link').hover(function () {
               $(this).css('background-color','#d9d9d9')
           },function(){
              $(this).css('background-color','white')
           });
          
       });

   
 </script>
 
    <div class="container">
        <div class="row justify-content-start">
           
           <c:forEach items="${list}" var="i" >
            <div class="col-sm-8">
               
                <div class="restaurant-info">
                    <div class="restaurant-title">
                        <span id="storeName">${i.storeName }</span>
                        <form id="markFrm" action="${path}/store/markStore.do" method="post"style="float: right;">
                        	<button type="button" onclick="fn_mark()" style="cursor: pointer; border: 0; background-color:#FFF">
                       			<c:choose>
	                       			<c:when test="${mark != null}">
	                       				<span id="mark" class="onMark">♥</span>
	                       			</c:when>
	                       			<c:otherwise>
	                       				<span id="mark" class="offMark">♥</span>
	                       			</c:otherwise>                       			
                       			</c:choose>
                       		</button>
                       		<input type="hidden" name="bsCode" id="bsCode" value="${i.businessCode }"/>
                       		<input type="hidden" name="isMark" id="isMark" value=""/>
                        </form>
                    </div>
                    <div class="restaurant-content">
                        <div class="logo"><img class="mainlogo" src="${path }/resources/upload/owner/storeMainImage/${i.storeImage }" /></div>
                        <ul class="list">
                            <li>별점</li>
                            <li>최소주문금액 <span>${i.minPrice}원</span></li>
                            <li>배달시간</li>
                            <li>결제방법 <span>신용카드,현금</span></li>
                        </ul>
                    </div>
                </div>
                <div class="owner_massage">
                    <strong>사장님말</strong><br>
                    <span>${i.storeProfile }</span>
                </div>
                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <ul class="navbar-nav mr-aurto">
                        <li class="nav-item active">
                            <a class="nav-link" id="menuList">메뉴 <span>35</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" id="menuReview" >리뷰 <span>55</span></a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" id="storeInfo">정보</a>
                        </li>
                    </ul>
                </nav>
               
                  
            <div id="callback"></div>
            
            
              </div>
              </c:forEach>
              <div class="col-sm-4">
                <div class="jumun">
                    <div class=title>
                        <span>주문표</span><a style="float:right; cursor:pointer;" onclick="refreshWishList(${businessCode});"><img src="${path }/resources/images/owner/icons/refreshIcon.png" width=26px;/></a>
                        <script>
                        function refreshWishList(businessCode){
                        	$.ajax({
                        		type:"POST",
                        		url:"${path}/customer/refreshWishList.do",
                                data:{"businessCode" : businessCode},
                                dataType:"JSON",
                                success: function(data) {
                                	console.log(data);
                                	for(var i=0; i<data.length; i++){
                                		console.log(data[i].menuCode);
                                		$('#deleteddd'+data[i].menuCode).html("");
                                	}
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
                        }
                        </script>
                    </div>
                    <div class="cart">
                        <div class="cart-empty" id="janbgaID">
              <c:forEach var="wish" items="${wishList }">
              <div id="deleteddd${wish.MENUCODE}">
                 <ul>
                  <li style="list-style: none; float: left;">${wish.MENUNAME }</li>
               </ul>
               <br>
               <ul>
                  <li style="list-style: none; float: left;">
                  <a id="deleteMenuCount${wish.MENUCODE }" style="cursor:pointer;"><img src="${path }/resources/images/owner/icons/deleteIcon.png" width=16px;/></a> ${wish.MENUPRICE }원</li>
                  <li style="list-style: none; margin-right: 1em; text-align: right; padding-top: 5px;">
                     <!-- <a id="minusMenuCount" class="btn btn-minus">-</a> -->
                     <span id="countUpdate${wish.MENUCODE }">${wish.MENUCOUNT } 개</span>
                     <input type="hidden" id="countUpdate${wish.MENUCODE }" value=""/>
                    
                     
                     <!-- <a id="plusMenuCount"  class="btn btn-plus">+</a> -->
                  </li>
               </ul>
               <hr>
            </div>
               <script>
               $(document).ready(function(){
                   $("#deleteMenuCount${wish.MENUCODE}").click(function(){
                   var menuCode=${wish.MENUCODE};
                   var businessCode=${wish.BUSINESSCODE};
                      $.ajax({
                         type:"POST",
                         url:"${path}/customer/deleteMenuCount.do",
                         data:{"menuCode" : menuCode},
                         dataType:"JSON",
                         success: function(data){
                           $('#deleteddd${wish.MENUCODE}').html("");
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
               </script>
            </c:forEach>
                        </div>
                        <div id="plusMenuPrice_result">
                           <div class="clearfix" style="clear:both;">최소주문금액 ${minPrice.minPrice }원</div>
                           <div class="clearfix" style="background-color:ivory; color:red; font-weight:bold;">
                                    합계 : ${resultPrice }원
                           </div>


					<!-- !!!!!!!!!!!!!!!정빈 하는 중!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
                             <form id='businessCodeFrm' action='${path}/customer/pay.do'>
                           	<input type='hidden' id='businessCode' name='businessCode' value='${wishList.get(0).BUSINESSCODE }'/>
 							<button class="cart-btn clearfix" id="pay" type="submit" style="clear:both;">
							주문하기							    
							</button>
                           </form>
                           
							
							<!-- <script>
								function fn_paySubmit()
								{
									console.log($('#businessCode').val());
									$('#businessCodeFrm').submit();
								}
							</script>   -->

                         <%--   <div class="cart-btn clearfix" onclick="location.href='${path}/customer/pay.do'" id="insertMemberId" style="clear:both;">
							    <a id="pay" class="btu">주문하기</a>
							</div> --%>

                        </div>
                    </div>
                </div>
            </div>
      </div>
   
       


    </div>

 




<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>