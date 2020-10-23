<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<form class="mt-5">
	  <div class="col-md-10 mb-3">
      		제목 <input type="text" readonly class="form-control-plaintext" value="${board.bTitle}">
      </div>
	  <div class="col-md-10 mb-3">
      		글쓴이 <input type="text" readonly class="form-control-plaintext" value="${board.bUserId}/(${board.bUsername})">
      </div>
	  <div class="form-group">
	     	내용<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${board.bContent}</textarea>
	  </div>
	  <div>
	  	<a href="#" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">공감</a>
	  	<a href="#" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">비공감</a>
	  	<a href="/board/boardWrite/${board.bId}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">댓글쓰기</a>
	  	<a href="/board/boardMod/${board.bId}/${curPage}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">수정하기</a>
	  	<a href="/board/boardView/${curPage}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">목록으로</a>
	  </div>
	</form>
	
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>