<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>	

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("#writeForm");
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
			});
		})
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
	</script>
	
	 <div id="page-wrapper">
		<div class="row">
        	<div class="col-lg-12">
            	<h1 class="page-header">Board Register</h1>
           	</div>
                <!-- /.col-lg-12 -->
        </div>
		<hr />
			 
			 <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                        	Board Register
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	 <div class="panel-body">
		                         <form id="writeForm" method="post" action="/board/write">
		                        	<div class="form-group">
										<label for="title">제목</label><input type="text" id="title" name="title" class="chk form-control" title="제목을 입력하세요."/>
									</div>
									<div class="form-group">
										<label for="content">내용</label><textarea id="content" name="content" class="chk form-control"  row="3" title="내용을 입력하세요."></textarea>
									</div>
									<div class="form-group">
										<label for="writer">작성자</label><input type="text" id="writer" name="writer" class="chk form-control" title="작성자를 입력하세요."/>
									</div>
											
									<input type="button" class="write_btn btn btn-default" value="작성하기"></input>
									
								</form> 
							</div>
						</div>
					</div>
				</div>
		</div>
		<hr />
		<%@include file="../includes/footer.jsp" %>
