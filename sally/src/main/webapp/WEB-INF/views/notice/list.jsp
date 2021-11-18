<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="../include/include_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/list.css" rel="stylesheet"/> 	
</head>
<body>		
    <div class="container">
        <div class="container_in">
            <h2>NOTICE</h2>
            <div class="board_menu">
                <ul>
                    <li class="on"><a href="/notice/list">공지사항</a></li>
                    <li><a href="">상품문의</a></li>
                    <li><a href="">상품후기</a></li>
                </ul>
            </div>
            <div class="notice_list">		
				<table>
					<thead>
						<tr>
					   		<th>번호</th>
					   		<th>제목</th>
					   		<th>작성자</th>
					   		<th>작성일</th>
					   		<th>조회</th>
					  	</tr>
					</thead>
			 		<tbody>
				  		<c:forEach items="${list}" var="list">
							<tr class="notice">	
								<td class="notice_number">${list.bno}</td>
								<td class="notice_title">
									<a href="/notice/view?bno=${list.bno}">${list.title}</a>
								</td>
								<td class="notice_name">${list.writer}</td>
								<td class="notice_date">
									<fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/>
								</td>
								<td class="notice_view">${list.viewCnt}</td>
							</tr>
						</c:forEach>
			 		</tbody>
				</table>
				<fieldset>
                    <legend>게시물 검색</legend>
                      <!--  <select name="search_date" id="search_date">
                            <option value="week">일주일</option>
                            <option value="month">한달</option>
                            <option value="3month">세달</option>
                            <option value="all">전체</option>
                        </select> --> 
					<select name="searchType" id="search_key">
					    <option selected value="T" <c:out value="${pageMake.cri.type eq 'T'?'selected':'' }"/>>제목</option>
						<option value="C" <c:out value="${pageMake.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					    <option value="W" <c:out value="${pageMake.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
	                </select>	                        
	            	<div class="search_wrap">
       					<div class="search_area">
	                        <input type="text" id="search_box" name="keyword" value="${pageMake.cri.keyword}">
	                        <button type="button" id="searchBtn" class="search_btn" style="cursor: pointer">찾기</button>
                		</div>
                	</div>
                </fieldset>
			</div>
			<div class="notice_pager">
				<div class="notice_pager_in">			
					<ul id="pageInfo" class="pageInfo">
						<c:forEach var="num" begin="${pageMake.startPage}" end="${pageMake.endPage}">
							<li class="pageInfo_btn "><a href="${num}">${num}</a></li>
						</c:forEach>
					</ul>
				</div>
        	</div>
        	<form id="moveForm" method="get">
        		<input type="hidden" name="pageNum" value="${pageMake.cri.pageNum}">
        		<input type="hidden" name="amount" value="${pageMake.cri.amount}"> 
        		<input type="hidden" name="keyword" value="${pageMake.cri.keyword}">
        		<input type="hidden" name="type" value="${pageMake.cri.type}">
            </form>
		</div>
    </div>
    
    <script>
    let moveForm = $("#moveForm");
    
    $(".move").on("click", function(e){
    	e.preventDefault();
    	
    	moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+"'>");
    	moveForm.attr("action", "notice/view");
    	moveForm.submit();
    })
    
    
    $(".pageInfo a").on("click", function(e){
    	 
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this).attr("href"));
        moveForm.attr("action", "/notice/list");
        moveForm.submit();
        
    });
    
    $(".search_area button").on("click", function(e){
        e.preventDefault();
        
        let type = $(".search_area select").val();
        let keyword = $(".search_area input[name='keyword']").val();
        
        if(!type){
            alert("검색 종류를 선택하세요.");
            return false;
        }
        
        if(!keyword){
            alert("키워드를 입력하세요.");
            return false;
        }        
        
        moveForm.find("input[name='type']").val(type);
        moveForm.find("input[name='keyword']").val(keyword);
        moveForm.find("input[name='pageNum']").val(1);
        moveForm.submit();
    });
    
    
    
    
    </script>
   <%@include file="../include/include_footer.jsp"%>
</body>
</html>