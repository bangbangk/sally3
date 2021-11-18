<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/include_header.jsp"%>

<div id="contents">
	<!-- 상품 정보 -->
	<section class="detailHead">
	<input type="hidden" id="gdsNum" value="${goods.gdsNum}">
		<!-- 상품 이미지 -->
		<div class="dhImg">
			<img src="https://flymodel.co.kr/web/product/big/202106/0fe6be0bfa6de4a41f27193868ff0ce5.webp">
		</div>
		<div class="productInfo">
			<h2>${goods.gdsName}</h2>

			<table border="1px">
				<tr>
					<th>판매가</th>
					<td class="price">
						<fmt:formatNumber value="${goods.gdsPrice}" pattern="#,###"/>원
					</td>
				</tr>
				<tr>
					<th>컬러</th>
					<td>
						<ul class="color">
						<c:forEach var="gdsColor" items="${goods.gdsColor.split(',')}">
							<li><a href="#">${gdsColor}</a></li>
						</c:forEach>
						</ul>
						<p>[필수] 옵션</p>
					</td>
				</tr>
				<tr>
					<th>사이즈</th>
					<td>
						<ul class="size">
						<c:forEach var="gdsSize" items="${goods.gdsSize.split(',')}">
							<li><a href="#">${gdsSize}</a></li>
						</c:forEach>
						</ul>
						<p>[필수] 옵션</p>
					</td>
				</tr>
				<tr>
					<th>수량</th>
					<td class="mainAmount">
						<input type="number" value="1" min='0' max='50' oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
					</td>
				</tr>
			</table>

			<div class="totalPrice">
				<p>
					<span style="font-weight: bold;">합계</span>
					<span> : </span>
					<span class="productTotalPrice" style="font-weight: bold;">0</span>
					<span>원 (</span> <span class="productAmount">0</span> <span>개 )</span>
				</p>
			</div>

			<div class="buttons">
				<a href="#" class="btnBuy">구매하기</a>
				<a href="#" class="btnCart">장바구니 담기</a>
				<a href="#" class="btnWish">찜하기</a>
			</div>

		</div>
		<!-- #productInfo End -->
	</section>
	<!-- .detailHead End -->

	<section class="detailBody">

		<!-- 상품 상세 페이지 -->
		<div id="productDetail">
			<ul class="pdMenu">
				<li class="selected"><a href="#productDetail">상품상세</a></li>
				<li><a href="#productRelated">관련상품</a></li>
				<li><a href="#productReview">상품후기</a></li>
				<li><a href="#productQna">상품문의</a></li>
			</ul>

			<div class="pdMain">
				<img src="${goods.gdsDes}" alt="상품 상세 설명">
			</div>
		</div>
		<!-- #productDetail End -->

		<!-- 관련상품 -->
		<div class="productRelated" id="productRelated">
			<ul class="pdMenu">
				<li><a href="#productDetail">상품상세</a></li>
				<li class="selected"><a href="#productRelated">관련상품</a></li>
				<li><a href="#productReview">상품후기</a></li>
				<li><a href="#productQna">상품문의</a></li>
			</ul>

			<div class="pdrList">
				<div class="pdrListIn">


					<div class="box">
						<p class="pdrImg">
							<a href="#"><img src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"><a href="#">A</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p id="pdrOption1" class="pdrOption">
							<select>
								<option value="*">옵션선택1</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<p id="pdrOption2" class="pdrOption">
							<select>
								<option value="*">옵션선택2</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>







					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202108/2df7099ad3285dfde38a7844100b3586.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">B</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/621b143ec8ee24b81d20de01103c4d9e.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">C</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/64f5a596d576d0306f9dc38b953854c1.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">D</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/big/202108/ead2f6e9e8e099fb51737c5d7e56d6f5.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">E</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">F</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">G</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">H</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">I</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">J</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="number" value="1" min='0' max='50'
								oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="/resources/img/source/btn_count_up.gif" alt="수량증가"
									class="up"></a> <a href="#"><img
									src="/resources/img/source/btn_count_down.gif" alt="수량감소"
									class="down"></a>
							</div>
						</div>
					</div>







					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202108/2df7099ad3285dfde38a7844100b3586.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">B</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/621b143ec8ee24b81d20de01103c4d9e.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">C</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/64f5a596d576d0306f9dc38b953854c1.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">D</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/big/202108/ead2f6e9e8e099fb51737c5d7e56d6f5.webp"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">E</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">F</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">G</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">H</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">I</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>
					<div class="box">
						<p class="pdrImg">
							<a href="#"><img
								src="https://flymodel.co.kr/web/product/medium/202109/6575e238444fd0a0bc399eb0e1aea836.gif"></a>
						</p>
						<p class="pdrName">
							<input type="checkbox"> <a href="#">J</a>
						</p>
						<p class="pdrPrice">00,000원</p>
						<p class="pdrOption">
							<select>
								<option value="*">옵션선택</option>
								<option value="**">-------------------</option>
								<option value="AA">AA</option>
								<option value="BB">BB</option>
							</select>
						</p>
						<div class="pdrAmount">
							<input type="text" value="1">
							<div class="updown">
								<a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_up.gif"
									alt="수량증가" class="up"></a> <a href="#"><img
									src="http://img.echosting.cafe24.com/skin/base_ko_KR/product/btn_count_down.gif"
									alt="수량감소" class="down"></a>
							</div>
						</div>
					</div>

				</div>
				<!-- .pdrListIn-->
			</div>
			<!-- .pdrList -->
			<div class="control">
				<p class="prev">이전으로</p>
				<p class="next">다음으로</p>
			</div>
			<div class="pdrBtn">
				<a href="#">선택상품 같이구매</a>
				<a href="#">선택상품 장바구니 담기</a>
			</div>
		</div>
		<!-- #productRelated End -->

		<!-- 상품후기 -->
		<div class="productReview" id="productReview">
			<ul class="pdMenu">
				<li><a href="#productDetail">상품상세</a></li>
				<li><a href="#productRelated">관련상품</a></li>
				<li class="selected"><a href="#productReview">상품후기</a></li>
				<li><a href="#productQna">상품문의</a></li>
			</ul>

			<div class="pdReview">
				<h3>REVIEW</h3>
				<p class="st">후기를 확인하세요</p>
				<ul class="rvList">
				</ul>
			</div>

			<div class="pdrPager">
			</div>
		</div>
		<!-- #productReview End -->

		<!-- 상품문의 -->
		<div class="productQna" id="productQna">
			<ul class="pdMenu">
				<li><a href="#productDetail">상품상세</a></li>
				<li><a href="#productRelated">관련상품</a></li>
				<li><a href="#productReview">상품후기</a></li>
				<li class="selected"><a href="#productQna">상품문의</a></li>
			</ul>

			<div class="pdQna">
				<h3>Q&amp;A</h3>
				<p>상품에 대한 문의사항을 확인해보세요</p>
				<table border="1px" class="qnaTable">
				</table>

				<div class="pdqPager">
				</div>
				<!-- .pdqPager End -->
			</div>
			<!-- .pdQna End -->

		</div>
		<!-- #productQna End -->

	</section>
	<!-- .detailBody End -->

	<section class="detailTopBtn">
		<div id="goTop">
			<a href="#" class="up"><i class="xi-angle-up"></i></a>
		</div>
	</section>
</div>
<!-- #contents End -->


<script src="/resources/js/product_detail.js"></script>
<script src="/resources/js/product_slide_slick.js"></script>

<%@include file="../include/include_footer.jsp"%>