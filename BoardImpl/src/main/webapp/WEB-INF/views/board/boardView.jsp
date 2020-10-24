<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
<c:set var="perPageBlock" value="${list.perPageBlock}" />
<c:set var="list" value="${list.lists}" />
				<div class="mt-5"></div>
				
				<form action="/board/boardView/1" class="float-right mb-3">
					<div class="input-group mb-3">
					  <select class="custom-select" id="inputGroupSelect01" name="select">
					    <option value="none" selected>----</option>
					    <option value="bTitle">제목</option>
					    <option value="bUserId">아이디</option>
					  </select>
					</div>
					<input type="text" name="keyword">
					<input type="submit" value="검색" >
				</form>
				
				<a href="/board/boardWrite/0" type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
  					글쓰기
				</a>
				<a href="/board/boardView/${curPage}" type="button" class="btn btn-primary" data-toggle="button" aria-pressed="false">
  					목록으로
				</a>
				
				<table class="table table-hover mt-3">
				  <thead>
				    <tr>
				      <th scope="col">등록일자</th>
				      <th scope="col">이름(아이디)</th>
				      <th scope="col">제목</th>
				      <th scope="col">조회수</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="i" items="${list}">
						<tr>
							<td>${i.bDate}</td>
							<td>${i.bUsername}(${i.bUserId})</td>
							<td>
							<c:forEach begin="1" end="${i.bIndent}">
					      		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
					      	</c:forEach>
					      	<c:if test="${i.bIndent > 0}">
					      		L
					      	</c:if>
							  <a href="/board/boardRead/${i.bId}/${curPage}">${i.bTitle}</a>
							</td>
							<td>${i.bHit}</td>
						</tr>
				    </c:forEach>
				  </tbody>
				</table>
				
				<nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	<c:set var="pre" value="${pageNumInfo[0]/perPageBlock}" />
				  	<c:if test="${pre > 1}">
				    <li class="page-item disabled">
				      <a href="/board/boardView/${pageNumInfo[0]/perPageBlock}"  class="page-link" tabindex="-1" aria-disabled="true">Previous</a>
				    </li>
				    </c:if>
				    <c:forEach var="j" begin="${pageNumInfo[0]}" end="${pageNumInfo[1]}">
				    	<li class="page-item"><a class="page-link" href="/board/boardView/${j}">${j}</a></li>
				    </c:forEach>
				    <c:if test="${pageNumInfo[1] > perPageBlock}" >
				    <li class="page-item">
				      <a class="page-link" href="#">Next</a>
				    </li>
				    </c:if>
				  </ul>
				</nav>
				
				
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
