<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<title>게시판</title>
<style type="text/css">
	li {list-style:none; float:left; padding: 6px;}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		var actionForm = $("#actionForm");
		
		$(".paginate_button a").on("click", function(e) {
			
			e.preventDefault();
			
			console.log('click');
			
			actionForm.find("input[name='page']").val($(this).attr("href"));
			actionForm.submit();	
		});

		$(".move").on("click", function(e) {

			e.preventDefault();
			actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>");
			actionForm.attr("action","/board/readView");
			actionForm.submit();
		})
	});
</script>

</head>

<body>
	<div id="root">
		<header>
			<h1>게시판</h1>
		</header>
		<hr />
		<div>
			<%@include file="nav.jsp" %>
		</div>
		<hr/>
		<section id="container">
			<form role="form" method="post" action="/board/write">
				<table>
					<tr><th>번호</th><th>제목</th><th>작성자</th><th>등록일</th></tr>
					
					<c:forEach items="${list }" var="list">
						<tr>
							<td><c:out value="${list.bno}" /></td>
							<td>
								<a class="move" href="<c:out value="${list.bno }" />"><c:out value="${list.title}" /></a>
							</td>
							<td><c:out value="${list.writer }" /></td>
							<td><fmt:formatDate value="${list.regdate }" pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
				
				<div class='pull-right'>
					<ul class="pagination">
					
						<c:if test="${pageMaker.prev }">
							<li class="paginate_button previous"><a href="${pageMaker.startPage-1 }">Previous</a></li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
							<li class="paginate_button ${pageMaker.cri.page == num ? "active":""}" >
								<a href="${num}">${num }</a>
							</li>
						</c:forEach>
						
						<c:if test="${pageMaker.next }">
							<li class="paginate_button next">
								<a href="${pageMaker.endPage + 1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</form>
			
			<form id='actionForm' action="/board/list" method='get'>
				<input type="hidden" name="page" value='${pageMaker.cri.page }'>
				<input type="hidden" name="perPageNum" value='${pageMaker.cri.perPageNum }'>
			</form>
			
 		</section>
	</div>
</body>
</html>