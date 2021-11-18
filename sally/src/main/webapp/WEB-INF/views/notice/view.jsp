<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/include_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link href="${path}/resources/css/view.css" rel="stylesheet"/> 	
</head>
<body>
    <div class="container">
        <div class="container_in">
            <h2>NOTICE</h2>
            <table>
                <tbody>
                    <tr class="title">
                        <th scope="row">제목</th>
                        <td>${view.title}</td>
                    </tr>
                    <tr class="writer">
                        <th scope="row">작성자</th>
                        <td>
                            ${view.writer}
                            <div class="date">
                                작성일
                                <span><fmt:formatDate value="${view.regdate}" pattern="yyyy-MM-dd"/></span>
                            </div>
                            <div class="count">
                                조회수
                                <span>${view.viewCnt}</span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="content">
                                ${view.content}
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div class="list">
                <a id="list_btn" style="cursor: pointer">목록</a><!--  href="javascript:history.back();"-->
            </div>
        </div>
    </div>
<!-- 
	<div>
		<a href="/notice/modify?bno=${view.bno}">게시물 수정</a>
		<a href="/notice/delete?bno=${view.bno}">게시물 삭제</a>
	</div> -->
	
	<form id="infoForm" action="/notice/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${view.bno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="keyword" value="${pageMake.cri.keyword}">
        <input type="hidden" name="type" value="${pageMake.cri.type }">
	</form>
	
    <%@include file="../include/include_footer.jsp"%>
	
	<script>
		let form = $("#infoForm");
		
		$("#list_btn").on("click", function(e){
			form.find("#bno").remove();
			form.attr("action", "/notice/list");
			form.submit();
		})
	</script>
</body>
</html>