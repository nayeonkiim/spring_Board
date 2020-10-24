<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>

	<form class="mt-5" action="/board/boardWriteSubmit/${bId}">
	  <div class="form-group">
	    <label for="bTitle">제목</label>
	    <input type="text" name="bTitle" class="form-control" id="bTitle">
	  </div>
	  <div class="form-group">
	    <label for="bUsername">글쓴이</label>
	    <input type="text" name="bUsername" class="form-control" id="bUsername">
	  </div>
	  <div class="form-group">
	    <label for="bUserId">글쓴이ID</label>
	    <input type="text" name="bUserId" class="form-control" id="bUserId">
	  </div>
	  <div class="form-group">
	    <label for="bContent">내용</label>
	    <textarea class="form-control" name="bContent" id="exampleFormControlTextarea1" rows="3"></textarea>
	  </div>
	  <button type="submit" class="btn btn-primary">Submit</button>
	  <a href="/board/boardView/1" type="submit" class="btn btn-primary">목록으로</a>
	</form>

<%@ include file="/WEB-INF/views/inc/footer.jsp" %>