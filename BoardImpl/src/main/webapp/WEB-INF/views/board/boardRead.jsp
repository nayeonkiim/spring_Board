<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/inc/header.jsp" %>
	
	<form class="mt-5">
		<div class="col-md-10 mb-3">
      		제목 <input type="text" readonly class="form-control-plaintext" value="${board.bTitle}">
    	</div>
	  	<div class="col-md-10 mb-3">
      		글쓴이 <input type="text" readonly class="form-control-plaintext" value="${board.bUsername}/(${board.bUserId})">
      	</div>
	  	<div class="form-group">
	     	내용<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly>${board.bContent}</textarea>
	  	</div>
	</form>
	
	<div>
		<form name="frm">
			<input type="hidden" name="bId" value="${board.bId}">
		</form>
		
	  	<a id="bGoodBtn" class="btn btn-primary active">공감</a>
	  	<script>
	  		
		  	$('#bGoodBtn').on('click', function(){
			  	var form = $("form[name=frm]").serialize();
		  		$.ajax({
		  			url : "/board/boardBGood",
		  			type : "POST",
		  			data : form,
		  			dataType : "json",
		  			success : function(data){
			  			var count = data.bGoodCount;
		  				$('#bGoodResult').text(count);
		  				alert("공감되었습니다!!!!!");
		  			},
		  			error : function(){
		  				alert("error");
		  			}
		  		});
		  	});
	  	</script>
	  	
	  	<a id="bHateBtn" class="btn btn-primary active">비공감</a>
	  	<script>
		  	$('#bHateBtn').on('click', function(){
		  		var form = $("form[name=frm]").serialize();
		  		$.ajax({
		  			url : "/board/boardBHate",
		  			type : "POST",
		  			data : form,
		  			dataType : "json",
		  			success : function(data){
		  				var count = data.bHateCount;
		  				$('#bHateResult').text(count);
		  				alert("비공감되었습니다...");
		  			},
		  			error : function(){
		  				alert("error");
		  			}
		  		});
		  	});
	  	</script>
	  	<a href="/board/boardWrite/${board.bId}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">댓글쓰기</a>
	  	<a href="/board/boardMod/${board.bId}/${curPage}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">수정하기</a>
	  	<a href="/board/boardView/${curPage}" class="btn btn-primary" data-toggle="button" role="button" aria-pressed="false">목록으로</a>
	</div>
	
	<div class="mt-3">
		공감  <a id="bGoodResult" class="mb-1">${board.bGood}</a>
		비공감  <a id="bHateResult">${board.bHate}</a>
	</div>
	
<%@ include file="/WEB-INF/views/inc/footer.jsp" %>