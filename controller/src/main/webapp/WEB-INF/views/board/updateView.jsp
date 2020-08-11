<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../includes/header.jsp" %>

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");

			$(".list_btn").on("click", function(){
					formObj.attr("action","/board/list").attr("method","get");
					
					var pagTag = $("input[name='page']").clone();
					var amountTag = $("input[name='perPageNum']").clone();
					var keywordTag = $("input[name='keyword']").clone();
					var typeTag = $("input[name='type']").clone();

					formObj.empty();

					formObj.append(pagTag);
					formObj.append(amountTag);
					formObj.append(keywordTag);
					formObj.append(typeTag);

					formObj.submit();
			}
			
			$(".modify_btn").on("click", function(){		
					formObj.attr("action","/board/update");
					formObj.attr("method","post");
					formObj.submit();
			}
		});
	
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
		      					<form name="updateForm" role="form" method="post" action="/board/update">
									<table>
										<tbody>
											<tr>
												<td>
													<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk form-control" title="제목을 입력하세요."/>
												</td>
											</tr>	
											<tr>
												<td>
													<label for="content">내용</label><textarea id="content" name="content" class="chk form-control" cols="30" rows="10" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
												</td>
											</tr>
											<tr>
												<td>
													<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${update.writer}" readonly="readonly"/>
												</td>
											</tr>
											<tr>
												<td>
													<label for="regdate">작성날짜</label>
													<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd"/>					
												</td>
											</tr>
											<tr>
												<td>
													<button type="submit" class='modify_btn'>Save</button>
													<button type="submit" class='list_btn'>List</button>
												</td>
											</tr>
										</tbody>	
									</table>
									<div>
										<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
										<input type="hidden" name="page" value="<c:out value='${cri.page }'/>">
										<input type="hidden" name="perPageNum" value="<c:out value='${cri.perPageNum }'/>">
										<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
										<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<%@include file="../includes/footer.jsp" %>
					
						
							
							