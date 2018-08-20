<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#mainDiv{
	width: 1100px;
	text-align: left;
}
.Navigation div {
	margin: 0 0 6px;
	padding: 0 0 6px 19px;
	height: 21px;
	background: url(/ackProject_01/image/icon_BlueWing.png) no-repeat 0 0;
}
.tab-title d1>a, .tab-title d1>a:hover, .tab-title d1>a:visited, .tab-title d1>a:focus {
	color: #555;
}
.Navigation ul {
	font-size: 12px;
	float: right;
}
.Navigation {
	width: auto;
	clear: both;
	height: 23px;
	padding: 10px 0 6px 0;
	border-bottom: 4px solid #00BFFF;
	margin: 0 auto;
}
.Navigation ul li {
	float: left;
	padding-right: 5px;
	color: #898989;
}
.clearfix {
	display: block;
}
#Contentwrap {
	width: 870px;
}

#Leftwrap {
    float: left;
    width: 150px;
}
.snb-section {
	margin-top: 61px;
	width: 180px;
}

.snb-title {
    display: block;
    padding: 0 0 9px 11px;
    border-bottom: 4px solid #4c5467;
    margin: 0;
}
.section {
    margin-top: 12px;
    margin-bottom: 12px;
    padding-bottom: 12px;
    border-bottom: 1px solid #e3e3e3;
}
.snb h2 {
    position: relative;
    margin: 0;
    padding: 0;
}
.snb h2 a {
    padding: 16px 0 16px 11px;
    font-size: 17px;
    font-weight: normal;
    color: #333;
}
 /* table css */
 .common_view {
    width: 870px;
    margin: 20px 0 0 0;
}
.common_view thead td.subject {
    padding: 11px 0;
    line-height: 1em;
    border-top: 1px solid #e3e3e3;
    color: #666666;
    text-align: left;
}
.common_view thead th.subject {
    padding: 11px 0;
    line-height: 1em;
    border-top: 1px solid #e3e3e3;
    text-align: center;
}
.common_view tbody td.content {
    padding: 18px;
    line-height: 20px;
    color: #676767;
    border-bottom: 1px solid #e3e3e3;
}
.common_view thead th, .common_view thead td {
    padding: 13px 0;
    font: 12px Gulim;
    background: url(/ackProject_01/image/bg_tview.gif) round;
    text-align: center;
}
.common_view tbody td.function_list {
    padding: 10px 0 20px;
    text-align: left;
}
.common_view tfoot th.txt_prev {
    padding: 11px 0 12px;
    border-top: 1px solid #00BFFF;
    border-bottom: 1px solid #e3e3e3;
    text-align: center; 
}
.common_view tfoot td.txt_prev {
    padding: 11px 0 12px;
    color: #686667;
    border-top: 1px solid #00BFFF;
    border-bottom: 1px solid #e3e3e3;
}
.common_view tfoot th.txt_next {
    padding: 11px 0 12px;
    border-bottom: 1px solid #e3e3e3;
    text-align: center;
}
.common_view tfoot td.txt_next {
    padding: 11px 0 12px;
    color: #686667;
    border-bottom: 1px solid #e3e3e3;
}
.txt_next >a, .txt_next >a:hover, .txt_next >a:visited, .txt_next >a:focus {
	color: #555;
	text-decoration: none;
}
.txt_prev >a, .txt_prev >a:hover, .txt_prev >a:visited, .txt_prev >a:focus {
	color: #555;
	text-decoration: none;
}
</style>
</head>
<body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('#boardListBtn').on('click','',function(){
		location.href="/ackProject_01/board/boardList.do?pg=${pg}";
	});
	$('#boardUpdateBtn').on('click','',function(){
		location.href="/ackProject_01/board/boardUpdateForm.do?pg=${pg}&seq=${list.seq}";
	});
	$('#boardDeleteBtn').on('click','',function(){
		$.ajax({
			type : 'POST',
			url : '/ackProject_01/board/boardDelete.do',
			data : {"pg":"${pg}",
					"seq":"${list.seq}"},
			success : function(data) {
				alert('삭제되었습니다.');
				location.href='/ackProject_01/board/boardList.do';
			}
		});
	});
});
</script>
<div id="mainDiv">
	<div id="Contentwrap">
		<table border="0" cellpadding="0" cellspacing="0" class="common_view"style="">
			<colgroup>
				<col width="61" />
				<col width="473" />
				<col width="50" />
				<col width="78" />
				<col width="51" />
				<col width="47" />
			</colgroup>
			<thead>
				<tr>
					<th class="subject"><img
						src="/ackProject_01/image/txt_subject.gif" width="21" height="11" alt="제목" /></th>
					<td colspan="5" class="subject">${list.subject}
						<input type="hidden" name="seq" value="${list.seq}"/>
						<input type="hidden" name="pg" value="${pg}"/>
					</td>
				</tr>
				<tr>
					<th><img
						src="/ackProject_01/image/txt_author.gif"
						width="31" height="11" alt="작성자"/></th>
					<td class="author" style="text-align: left;">${list.name}</td>
					<th><img
						src="/ackProject_01/image/txt_date.gif"
						width="30" height="11" alt="작성일"/></th>
					<td>${list.logtime}</td>
				</tr>
			</thead>
			<tbody>
			
				<tr>
					<td colspan="6" class="content"><pre>${list.content}</pre></td>
				</tr>
			</tbody>
		</table>
		<div id="button" style="text-align:center;">
			<input style="cursor: pointer;" type="button" id="boardUpdateBtn" value="수정">
			<input style="cursor: pointer;" type="button" id="boardDeleteBtn" value="삭제">
			<input style="cursor: pointer;" type="button" id="boardListBtn" value="목록으로">
		</div>
	</div>
</div>
</body>
</html>