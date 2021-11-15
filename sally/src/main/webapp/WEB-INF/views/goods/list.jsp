<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../main_header.jsp"></jsp:include>
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<link href="${path}/resources/css/top.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<title>Insert title here</title>
</head>
<body>
	    <div class="container">
        <div class="container_in">
        <!--  
            <div class="title">
                <h2>BEST ITEMS</h2>
                <p>이번주 가장 많이 사랑받은 아이템</p>
            </div>
            <div class="best_item">
                <ul>
                    <li><a href=""><img src="../top/tb1.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb2.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb3.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb4.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb5.gif" alt=""></a></li>
                    <li><a href=""><img src="../top/tb6.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb7.webp" alt=""></a></li>
                    <li><a href=""><img src="../top/tb8.webp" alt=""></a></li>
                </ul>
            </div>
            -->
            <div class="menu_top">
                <c:forEach items="${list}" var="list" begin="1" end="1"> 
                <h2>${list.cateCode}</h2>
                </c:forEach>
                <ul>
                	<c:forEach items="${list}" var="list" begin="1" end="1"> 
                	<c:if test="${list.cateCode eq 'TEE'|| list.cateCode eq 'BLOUSE'|| list.cateCode eq 'SHIRT' || list.cateCode eq 'KNIT'}">
                   		<%@include file="../include/cateList/top.jsp" %>
                   	</c:if>
                   	<c:if test="${list.cateCode eq 'JACKET'|| list.cateCode eq 'CARDIGAN'|| list.cateCode eq 'COAT' || list.cateCode eq 'JUMPER'}">
                   		<%@include file="../include/cateList/outer.jsp" %>
                   	</c:if>
                   	<c:if test="${list.cateCode eq 'DENIM'|| list.cateCode eq 'SLACKS'|| list.cateCode eq 'PANTS' || list.cateCode eq 'SHORT PANTS'}">
                   		<%@include file="../include/cateList/pants.jsp" %>
                   	</c:if>
                   	<c:if test="${list.cateCode eq 'OPS'|| list.cateCode eq 'MINI'|| list.cateCode eq 'MIDI' || list.cateCode eq 'LONG'}">
                   		<%@include file="../include/cateList/ops&skirt.jsp" %>
                   	</c:if>
                   	<c:if test="${list.cateCode eq 'HAIR'|| list.cateCode eq 'RING'|| list.cateCode eq 'EARRING' || list.cateCode eq 'BRACELET' || list.cateCode eq 'WATCH' || list.cateCode eq 'ETC'}">
                   		<%@include file="../include/cateList/acc.jsp" %>
                   	</c:if>
                	</c:forEach>
                </ul>
            </div>
            <div class="item_list">
                <div class="item_list_menu">
                    <div class="item_count">

                      <!--   Total : <span>1</span>items -->
                    </div>
                    <div class="item_sort">
                        <ul><!--  
                            <li><a href="">신상품</a></li>
                            <li><a href="">상품명</a></li>
                            <li><a href="">낮은가격</a></li>
                            <li><a href="">높은가격</a></li>
                            <li><a href="">제조사</a></li>
                            <li><a href="">사용후기</a></li>-->
                        </ul>
                    </div>    
                </div>
                <div class="item">
                    <ul>
                    	<c:forEach items="${list}" var="list">
                        <li>
                            <div class="item_photo">
                                <a href=""><img src="../top/t1.gif" alt=""></a>
                            </div>
                            <div class="item_text">
                                <p class="item_name">
                                    <a href="">${list.gdsName}</a>
                                </p>
                                <p class="item_price">
                                    <span>${list.gdsPrice}</span>원
                                </p>
                            </div>
                        </li>
                        </c:forEach>
                    </ul>
<!--  
                    <div class="item_pager">
                        <div class="item_pager_in">
                            <a href="" class="first"><img src="../top/btn_page_first.gif" alt=""></a>
                            <a href="" class="prev"><img src="../top/btn_page_prev.gif" alt=""></a>
                            <ul>
                                <li class="on"><a href="">1</a></li>
                                <li><a href="">2</a></li>
                                <li><a href="">3</a></li>
                                <li><a href="">4</a></li>
                                <li><a href="">5</a></li>
                            </ul>
                            <a href="" class="next"><img src="../top/btn_page_next.gif" alt=""></a>
                            <a href="" class="last"><img src="../top/btn_page_last.gif" alt=""></a>
                        </div>
                    </div>
                    -->
                </div>
            </div>
        </div>
    </div>
    <%@include file="../include/footer.jsp" %>
    
    <script>
	    $('.menu_top li a').on('click', function(){
	        $('.menu_top li a').removeClass("on");
	        $(this).addClass("on");
	    })
    </script>
    
    <jsp:include page="../main_footer.jsp"></jsp:include>