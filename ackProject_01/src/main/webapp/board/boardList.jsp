<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제출용 게시판</title>
<style>
#Contentwrap {
	margin-top: 50px;
	width: 870px;
}
.common_list {
    margin: 20px 0 0 0;
    padding: 0;
    width: 870px;
    line-height: 14px;
    overflow: hidden;
}
.common_list thead th {
    margin: 0;
    padding: 10px 0 11px;
    font: 12px Gulim;
    line-height: 14px;
    background: url(/ackProject_01/image/bg_tlist.gif) repeat-x;
    text-align: center;
}
thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}
.common_list tbody td.question {
	cursor: pointer;
    color: #686868;
    text-align: left;
    font-size: 15px;
}

.common_pagenate {
    position: relative;
    margin: 10px 0 25px;
    padding: 0 0 1px 0;
    font: 12px/21px Dotum;
    text-align: center;
}

.common_pagenate .function {
	position: absolute;
	right: 0;
	top: 0px;
}

.common_pagenate button {
	cursor: pointer;
}

.cel_num:hover, .cel_num:focus, .cel_num:active {
	cursor: default;
}

.cel_num:visited {
	cursor: default;
	font-weight: bolder;
}
.common_list tbody td {
    margin: 0;
    padding: 13px 0 11px;
    font: 12px Gulim;
    line-height: 14px;
    color: #b9b9b9;
    border-bottom: 1px solid #e3e3e3;
    text-align: center;
}
.common_pagenate span{
	cursor: pointer;
}
</style>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#writeForm').on("click","",function(){
		location.href="/ackProject_01/board/boardWriteForm.do";
	});
	$.ajax({
		type : 'POST',
		url : '/ackProject_01/board/boardListAction.do',
		data : {'pg':'${pg}'},
		dataType : 'json',
		success : function(data) {
			$.each(data.list, function(index, items) {
				$('<tbody/>').append($('<tr/>').append($('<td/>',{
					align: 'center',
					text : items.seq
				})).append($('<td/>',{
					class : 'question',
				}).append($('<a/>',{
					text : items.subject,
					click : function() {
						location.href='/ackProject_01/board/boardView.do?pg='+data.pg+'&seq='+items.seq;
					}
				}))).append($('<td/>',{
					text : items.name
				})).append($('<td/>',{
					text : items.logtime
				}))).appendTo($('.common_list'));
			});
			
			$('.common_pagenate').html(data.boardPaging.pagingHTML);
		}
	});
});
</script>

<div id="mainDiv">
	<div id="Contentwrap">
		<div id="board_tableDiv">
		<h3 style="text-align: center;">제출용 게시판 목록</h3>
			<table border="0" cellpadding="0" cellspacing="0"
				class="common_list clearfix">
				<caption style="display: none;">공지사항 게시판</caption>
				<colgroup>
					<col width="79" />
					<col width="579" />
					<col width="89" />
					<col width="123" />
				</colgroup>
				<thead>
					<tr>
						<th scope="col">글번호</th>
						<th scope="col">글제목</th>
						<th scope="col">작성자1</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
			</table>

			<!-- 페이징 부분 -->
			<div class="common_pagenate clearfix"></div>
				<div style="margin-left: 813px; cursor: pointer;">
					<input style="cursor:pointer;" type="button" id="writeForm" value="글쓰기">
				</div>
		</div>
	</div>
</div>

</body>
</html>