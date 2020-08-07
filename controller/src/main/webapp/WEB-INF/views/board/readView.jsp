<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	 	<style>
	 		ul{list-style:none;}
	 	</style>
	</head>
	
	<script type="text/javascript" src="/resources/js/reply.js"></script>	
	
	<script>
		console.log("=============");
		console.log("JS TEST");
	
		
	// for replyService add test
/* 		replyService.add(
			{reply:"JS Test",replyer:"tester", bno:bnoValue}
			,
			function(result){
				alert("RESULT: "+result);
			}
		); */
		
	// for reply List Test
/* 		replyService.getList({bno:bnoValue, page:1}, function(list){

			for(var i=0, len=list.length||0; i<len; i++){
				console.log(list[i]);
			}
		}); */

	// 특정 번호 댓글 삭제 테스트
/* 		replyService.remove(18, function(count) {

			console.log(count);

			if(count === "success"){
				alert("REMOVE");
			}
		}, function(err) {
			alert('ERROR....');	
		}); */

	// 특정 번호 댓글 수정
/* 		replyService.update({
			rno : 16,
			bno : bnoValue,
			reply : "Modifide Reply,,,,"
		},function(result){

			alert("수정 완료....");
		});
			 */

	// 단순히 댓글의 번호만을 전달
/* 	replyService.get(10, function(data){
		console.log(data);*/
	}) 
		
	</script>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var formObj = $("form[name='readForm']");
			
			var bnoValue = '<c:out value="${read.bno}"/>';
			var replyUL = $(".chat");

			showList(1);

			function showList(page){

				replyService.getList({bno:bnoValue,page: page || 1}, function(list){

					var str = "";
					if(list == null || list.length == 0){
						replyUL.html("");
						return;
					}
					for(var i=0, len = list.length || 0; i<len; i++){
						str += "<li data-rno='"+list[i].rno+"'>";
						str += " <div><strong>"+list[i].replyer+"</strong>";
						str += "   <small>"+list[i].replyDate+"</small></div>";
						str += "       <p>"+list[i].reply+"</p></li><hr/>";
					}
					replyUL.html(str);
				});
			}
		
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){

				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					formObj.attr("action", "/board/delete");
					formObj.attr("method", "post");
					
					formObj.submit();
				}
			})
			
			// 취소
			$(".list_btn").on("click", function(){

				formObj.attr("action","/board/list");
				formObj.attr("method", "get");
				formObj.submit();
			})
		})
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
			<hr/>
			
			<section id="container">
				<form name="readForm" role="form" method="post">
					<input type="hidden" id="bno" name="bno" value="<c:out value="${read.bno}" />">
					<input type="hidden" name='page' value='<c:out value="${cri.page }" />'>
					<input type="hidden" name="perPageNum" value='<c:out value="${cri.perPageNum }" />'>
					<input type="hidden" name="type" value='<c:out value="${cri.type }" />'>
					<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
				</form>
				<table>
					<tbody>
						<tr>
							<td>
								<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}" readonly="readonly" />
							</td>
						</tr>	
						<tr>
							<td>
								<label for="content">내용</label><textarea id="content" name="content" readonly="readonly"><c:out value="${read.content}" /></textarea>
							</td>
						</tr>
						<tr>
							<td>
								<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}"  readonly="readonly"/>
							</td>
						</tr>
						<tr>
							<td>
								<label for="regdate">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd" />					
							</td>
						</tr>		
					</tbody>			
				</table>
				<div>
					<button type="submit" class="update_btn">수정</button>
					<button type="submit" class="delete_btn">삭제</button>
					<button type="submit" class="list_btn">목록</button>	
				</div>
			</section>
			<hr />
			
			<div>
				<div>
					<i>Reply</i>
					<hr/>
				</div>
				<ul class="chat" >
					<li>
						<div>
							<strong>user00</strong>
							<small>2020-08-07</small>
						</div>
						<p>Good job!</p>
					</li>
					<hr/>
				</ul>
			</div>
		</div>
	</body>
</html>