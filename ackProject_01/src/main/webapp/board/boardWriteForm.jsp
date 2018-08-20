<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 작성 페이지</title>
<style>
.write {
    width: 870px;
    border-top: 1px solid #00BFFF;
}
.PassChange{
    font-size: 16px;
    font-family: "맑은 고딕","Malgun Gothic","Apple SD Gothic Neo","Dotum",Helvetica,Sans-serif;
    color: #555;
    direction: ltr;
}
.write_manual {
    padding: 15px 0;
    width: 870px;
    margin-top: -10px;
    border-bottom: 1px solid #e3e3e3;
    text-align: left;
}
.write th {
    padding: 14px 0 0 20px;
    background-color: #E0FFFF;
    border-bottom: 1px solid #e3e3e3;
    text-align: left;
    vertical-align: middle;
}
.write td {
    padding: 10px;
    line-height: 14px;
    border-bottom: 1px solid #e3e3e3;
    text-align: left;
}
.write td textarea {
    margin-bottom: 10px;
    padding: 10px;
    width: 605px;
    height: 210px;
    font: 12px Gulim;
    color: #666666;
    border: 1px solid #cccccc;
}

.write_manual li {
	list-style:none;
    padding-left: 21px;
    font: 12px/18px Gulim;
    color: #777777;
    background: url(/ackProject_01/image/ico_dot2px.gif) no-repeat 10px 6px;
}
#mainDiv{
	width: 900px;
}


</style>
</head>
<body>
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#boardBtn').on('click','',function(){
		if($('#subject').val()==""){
			alert("제목을 입력하세요");
		}else if($('#content').val()==""){
			alert("내용을 입력하세요");
		}else if($('#name').val()==""){
			alert("작성자를 입력하세요");
		}else{
			alert("등록되었습니다.");
			$('#boardWriteForm').submit();
		}
	});
	$('#boardListBtn').on('click','',function(){
		location.href="/ackProject_01/board/boardList.do";
	});
});
</script>
<div id ="mainDiv">
<form id="boardWriteForm" method="post" action="/ackProject_01/board/boardWrite.do">
		
			<table border="0" cellpadding="0" cellspacing="0"
				class="write">
				<colgroup>
					<col width="115"/>
					<col />
				</colgroup>
				<tr>
					<td colspan="2" style="text-align: center;">
						<h3>글 작성</h3>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" class="input_subject" name="subject"
						id="subject" value="" title="제목입력"/></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" class="input_name" name="name"
						id="name" value="" title="이름입력"/></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><pre><textarea cols="1" rows="1" name="content" id="content"
							title="내용입력"></textarea></pre>
					</td>
				</tr>
			</table>
			<div style="text-align:center;">
				<input style="cursor: pointer;" type="button" id="boardBtn" value="등록">
				<input style="cursor: pointer;" type="reset" value="취소">
				<input style="cursor: pointer;" type="button" id="boardListBtn" value="목록으로">
			</div>
		</form>
</div>
</body>
</html>