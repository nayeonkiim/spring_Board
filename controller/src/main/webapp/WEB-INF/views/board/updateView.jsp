<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form");

			$('button').on("click", function(e){

				e.preventDefault();

				var operation = $(this).data("oper");

				cosole.log(operation);

				if(operation === 'remove'){
					formObj.attr("action","/board/delete");
				}else if(operation === 'list'){
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
				}
				formObj.submit();
			});			

		});
	
	</script>
	<body>
	
		<div id="root">
			<header>
				<h1> 게시판</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				
				<form name="updateForm" role="form" method="post" action="/board/update">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${update.title}" class="chk" title="제목을 입력하세요."/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content" class="chk" title="내용을 입력하세요."><c:out value="${update.content}" /></textarea>
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
									<button type="submit" data-oper='modify'>Modify</button>
									<button type="submit" data-oper='remove'>Remove</button>
									<button type="submit" data-oper='list'>List</button>
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
			</section>
			<hr />
		</div>
	</body>
</html>