<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<form class="mt-5" action="/board/boardModSubmit/${board.bId}/${curPage}">
	  <div class="col-md-10 mb-3">
      		제목 <input type="text" readonly class="form-control-plaintext" name="bTitle" value="${board.bTitle}">
      </div>
	  <div class="col-md-10 mb-3">
      		글쓴이 <input type="text" readonly class="form-control-plaintext" name="bUsername" value="${board.bUserId}/(${board.bUsername})">
      </div>
	  <div class="form-group">
	     	내용<textarea class="form-control" id="exampleFormControlTextarea1" name="bContent" rows="3">${board.bContent}</textarea>
	  </div>
	  <input type="submit" class="btn btn-primary" data-toggle="button" aria-pressed="false" value="수정완료"></button>
	</form>
	
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>
	  