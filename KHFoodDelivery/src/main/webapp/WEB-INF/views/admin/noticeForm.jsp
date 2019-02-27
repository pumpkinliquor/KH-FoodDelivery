<%@ page language="java" contentType="text/html; charset=UTF-8"
import="java.util.*, java.sql.*" 
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/adminHeader.jsp"></jsp:include>

            src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>
        <script
            src='//production-assets.codepen.io/assets/editor/live/events_runner-73716630c22bbc8cff4bd0f07b135f00a0bdc5d14629260c3ec49e5606f98fdd.js'></script>
        <script
            src='//production-assets.codepen.io/assets/editor/live/css_live_reload_init-2c0dc5167d60a5af3ee189d570b1835129687ea2a61bee3513dee3a50c115a77.js'></script>
        <meta charset='UTF-8'>
        <meta name="robots" content="noindex">
        <link rel="shortcut icon" type="image/x-icon"
            href="//production-assets.codepen.io/assets/favicon/favicon-8ea04875e70c4b0bb41da869e81236e54394d63638a1ef12fa558a4a835f1164.ico" />
        <link rel="mask-icon" type=""
            href="//production-assets.codepen.io/assets/favicon/logo-pin-f2d2b6d2c61838f7e76325261b7195c27224080bc099486ddd6dccb469b8e8e6.svg"
            color="#111" />
        <link rel="canonical" href="https://codepen.io/frankhe/pen/MpvWrg" />

		<!-- 사용자작성 css -->
		<link rel="stylesheet" href="${path}/resources/css/style.css" />

        <script
            src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/1.0.16/vue.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0-beta1/jquery.min.js'></script>
        <script src='https://cdnjs.cloudflare.com/ajax/libs/tinymce/4.3.4/tinymce.min.js'></script>
</head>
<body>

    <!------ Include the above in your HEAD tag ---------->

     
        <script>$(function () {

                // tinymce directive
                Vue.directive('tinymce-editor', {
                    twoWay: true,
                    bind: function () {
                        var self = this;
                        tinymce.init({
                            selector: '#noticeEditor',
                            setup: function (editor) {

                                // init tinymce
                                editor.on('init', function () {
                                    tinymce.get('editor').setContent(self.value);
                                });

                                // when typing keyup event
                                editor.on('keyup', function () {

                                    // get new value
                                    var new_value = tinymce.get('editor').getContent(self.value);

                                    // set model value
                                    self.set(new_value)
                                });
                            }
                        });
                    },
                    update: function (newVal, oldVal) {
                        // set val and trigger event
                        $(this.el).val(newVal).trigger('keyup');
                    }

                })

                new Vue({
                    el: '#Noticetinymce-form',
                    // data: {
                    // 	content: '내용을 입력하세요'
                    // }
                })


            })
//# sourceURL=pen.js
        </script>
        <!-- <style class="cp-pen-styles"></style> -->


    <body>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form  action="${pageContext.request.contextPath}/notice/noticeForm.do" method="post">
                        <table class="table table-bordered board" id="board_table" name="borad_table">

                            <tbody>
                                <!-- <form action="" method="post" encType="multiplart/form-data" name="board_form"> -->
                                <tr>
                                    <th colspan="2">제목 </th>
                                    <td><input type="text" placeholder="제목을 입력하세요. " name="noticeTitle"
                                            class="form-control" /></td>
                                    <th>작성자 </th>
                                    <td><input type="text" class="form-control" name="noticeWriter" readonly="readonly"
                                            value="관리자" /></td>
                                </tr>
                                <tr aria-rowspan="2">
                                    <th>첨부파일 </th>
                                    <td colspan="2">
                                        <input type="file" class="custom-file-input" name="NoticeupFile"
                                            id="NoticeupFile1">
                                        <input type="file" class="custom-file-input" name="NoticeupFile"
                                            id="NoticeupFile1">

                                    </td>
                                    <th>첨부파일 </th>
                                    <td colspan="2">
                                        <input type="file" class="custom-file-input" name="NoticeupFile"
                                            id="NoticeupFile1">
                                        <input type="file" class="custom-file-input" name="NoticeupFile"
                                            id="NoticeupFile1">

                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="Noticetinymce-form">
                            <fieldset class="form-group">
                                <textarea class="form-control" placeholder="내용을 입력하세요." id="noticeEditor" rows="10"
                                    placeholder="Content" name="noticeContent" v-tinymce-editor="content">
  </textarea>
                            </fieldset>
                        </div>


                        <button name="noticeCancelkBtn" class="btn btn-default pull-left"
                            onclick="location.href='${path}/notice/notice'">목록</button>
                        <button type="submit" onclick="return validate();"
                            class="btn btn-default pull-right">등록</button>
                        <!-- <input type="submit" name="noticeOkBtn" class="btn btn-default pull-right" value="등록"> -->
                    </form>

                </div>
            </div>
        </div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>