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
		var searchForm = $("#searchForm");
		
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
		 
		$("#searchBnt").on("click",function(e) {

			if(!searchForm.find("option:selected").val()){
				alert("검색 종류를 입력하세요");
				return false;
			}
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하세요.");
				return false;
			}

			// 페이지의 번호가 1이 되도록 처리
			searchForm.find("input[name='page']").val("1");
			e.preventDefault();

			searchForm.submit();
		});
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
			</form>
				
				<div>
					<form id='searchForm' action="/board/list" method="get">
						<select name='type'>
							<option value=""
								<c:out value="${pageMaker.cri.type == null?'selected':'' }" />>--</option>
							<option value="T"
								<c:out value="${pageMaker.cri.type == 'T'? 'selected':''}" />>제목</option>
							<option value="C"
								<c:out value="${pageMaker.cri.type == 'C'? 'selected':''}" />>내용</option>
							<option value="W"
								<c:out value="${pageMaker.cri.type == 'W'? 'selected':''}" />>작성자</option>
							<option value="TC"
								<c:out value="${pageMaker.cri.type == 'TC'? 'selected':''}" />>제목 or 내용</option>
							<option value="TW"
								<c:out value="${pageMaker.cri.type == 'TW'? 'selected':''}" />>제목 or 작성자</option>
							<option value="TWC"
								<c:out value="${pageMaker.cri.type == 'TWC'? 'selected':''}" />>제목 or 내용 or 작성자</option>
						</select>
						<input type='text' name='keyword' value="<c:out value='${pageMaker.cri.keyword }'/>" >
						<input type='hidden' name='pageNum' value='${pageMaker.cri.page }'>
						<input type='hidden' name='perPageNum' value='${pageMaker.cri.perPageNum }'>
						<input type="button" value="Search" id="searchBnt"></input>
					</form>
				</div>
				
				
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
			
			
			<form id='actionForm' action="/board/list" method='get'>
				<input type="hidden" name="page" value='${pageMaker.cri.page }'>
				<input type="hidden" name="perPageNum" value='${pageMaker.cri.perPageNum }'>
				<input type="hidden" name="type" value='<c:out value="${pageMaker.cri.type }" />'>
				<input type="hidden" name="keyword" value='<c:out value="${pageMaker.cri.keyword }"/>'>
				
			</form>
			
 		</section>
	</div>
</body>
</html>