<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<script>
$(function () {
    $("dd:not(:first)").css("display", "none"); //first dd 빼고 나머지 dd를 none으로 해라

    $("dl dt").click(function () {
        if ($("+dd", this).css("display") == "none") {
            $(this).siblings("dd").slideUp("slow");
            $("+dd", this).slideDown("slow");
        }
    });
}); 
</script>
  <div id="menubox">
                    <dl>
                        <dt>인기메뉴</dt>
                        <dd>

                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="mnl">
                                        <p>감자전<br /><a>12,000원</a></p>
                                    </div>


                                </div>

                                <div class="col-sm-3">
                                    <img class="mnlogo" src="8.jpg"><br />
                                </div>

                            </div>
                            <hr>
                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="mnl">
                                        <p>낚지볶음<br /><a>18,000원</a></p>
                                    </div>


                                </div>

                                <div class="col-sm-3">
                                    <img class="mnlogo" src="9.jpg"><br />
                                </div>

                            </div>
                            <hr>

                            <div class="row">
                                <div class="col-sm-9">
                                    <div class="mnl">
                                        <p>달걍양배추토스트<br /><a>5,000원</a></p>
                                    </div>


                                </div>

                                <div class="col-sm-3">
                                    <img class="mnlogo" src="7.jpg"><br />
                                </div>

                            </div>
                            <hr>
                            <div class="row">
                                    <div class="col-sm-9">
                                        <div class="mnl">
                                            <p>부대찌개<br /><a>16,000원</a></p>
                                        </div>
    
    
                                    </div>
    
                                    <div class="col-sm-3">
                                        <img class="mnlogo" src="6.jpg"><br />
                                    </div>
    
                            </div>
                            
                        </dd>
                        <dt>족발 / 보쌈 메뉴</dt>
                        <dd>
                                <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>감자전<br /><a>12,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="8.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>낚지볶음<br /><a>18,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="9.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
        
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>달걍양배추토스트<br /><a>5,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="7.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
                                    <div class="row">
                                            <div class="col-sm-9">
                                                <div class="mnl">
                                                    <p>부대찌개<br /><a>16,000원</a></p>
                                                </div>
            
            
                                            </div>
            
                                            <div class="col-sm-3">
                                                <img class="mnlogo" src="6.jpg"><br />
                                            </div>
            
                                    </div>
                        </dd>
                        <dt>요리류 / 안주류</dt>
                        <dd>
                                <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>감자전<br /><a>12,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="8.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>낚지볶음<br /><a>18,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="9.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
        
                                    <div class="row">
                                        <div class="col-sm-9">
                                            <div class="mnl">
                                                <p>달걍양배추토스트<br /><a>5,000원</a></p>
                                            </div>
        
        
                                        </div>
        
                                        <div class="col-sm-3">
                                            <img class="mnlogo" src="7.jpg"><br />
                                        </div>
        
                                    </div>
                                    <hr>
                                    <div class="row">
                                            <div class="col-sm-9">
                                                <div class="mnl">
                                                    <p>부대찌개<br /><a>16,000원</a></p>
                                                </div>
            
            
                                            </div>
            
                                            <div class="col-sm-3">
                                                <img class="mnlogo" src="6.jpg"><br />
                                            </div>
            
                                    </div>
                        </dd>
                    </dl>
                
                    
                </div>
           


          