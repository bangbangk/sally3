$(document).ready(function () {
  var gdsNumValue = $("#gdsNum").val();
  var reviewUL = $(".rvList")
  showReviewList(1);

  var reviewPageNum = 1;
  var reviewPageFooter = $(".pdrPager");

  function showReviewPage(reviewCnt) {

    var endNum = Math.ceil(reviewPageNum / 5.0) * 5;
    var startNum = endNum - 4;

    var prev = startNum != 1;
    var next = false;

    if (endNum * 3 >= reviewCnt) {
      endNum = Math.ceil(reviewCnt / 5.0);
    }

    if (endNum * 3 < reviewCnt) {
      next = true;
    }

    var str = "<ul class='pagination'>";

    if (prev) {
      str += "<li class='paginate_button prev'><a class='page-link' href='" + (startNum - 1) + "'>이전</a></li>";
    }

    for (var i = startNum; i <= endNum; i++) {
      var active = reviewPageNum == i ? "active" : "";

      str += "<li class='paginate_button page-item " + active + " '><a class='page-link' href='" + i + "'>" + i + "</a></li>";
    }

    if (next) {
      str += "<li class='paginate_button next'><a class='page-link' href='" + (endNum + 1) + "'>다음</a></li>";
    }

    str += "</ul></div>";

    console.log(str);

    reviewPageFooter.html(str);

  }

  function showReviewList(reviewPage) { // showReviewList함수 선언 시작
    reviewService.getReviewList({
      gdsNum: gdsNumValue,
      reviewPage: reviewPage || 1
    }, function (reviewCnt, reviewList) {

      console.log("reviewList : " + reviewList);

      // page 번호가 없으면
      if (reviewPage == -1) {
        reviewPageNum = Math.ceil(reviewCnt / 10.0);
        showReviewList(reviewPageNum);
        return;
      }

      var str = "";

      // reviewList가 null이거나 reviewList의 길이가 0이면(select된 결과가 없으면)
      if (reviewList == null || reviewList.length == 0) {
        reviewUL.html("");
        return;
      }
      console.log(reviewList)
      // 초기화                                             조건식       증감식
      for (var i = 0, len = reviewList.length || 0; i < len; i++) {
        str += "<li>";
        str += "<div class='rvListIn'>";
        str += "<div class='rvBody'>";
        str += "<p class='rvScore'>" + reviewList[i].rating + "점</p>";
        str += "<div class='rvContent'><a href='#'>";
        str += "<p class='rvText'>" + reviewList[i].content + "</p>";
        str += "<p class='rvImg'>";
        str += "<img src='" + reviewList[i].reviewimg + "' alt='리뷰이미지'";
        str += "</p></a></div></div>";
        str += "<div class='rvInfo'>";
        str += "<p class='rviTitle'>작성자</p>";
        str += "<p class='rviText'>" + reviewList[i].writer + "</p>";
        str += "</div></div></li>";
      }
      reviewUL.html(str);

      showReviewPage(reviewCnt);
    }) // getReviewList 함수 호출 끝
  } // showReviewList함수 선언 끝

  // 댓글의 페이지 버튼 클릭
  reviewPageFooter.on("click", "li a", function (e) {
    e.preventDefault();
    console.log("review page click");

    var targetPageNum = $(this).attr("href");

    console.log("targetPageNum : " + targetPageNum);

    reviewPageNum = targetPageNum;

    showReviewList(reviewPageNum);
  });

});

console.log("Review Module........");

//reviewService 함수 선언
var reviewService = (function () {

  function add(review, callback, error) { // 댓글을 쓰기 위한 함수 선언
    console.log("add review........");

    $.ajax({
      type: 'post',
      url: '/reviews/new',
      data: JSON.stringify(review),
      contentType: "application/json; charset=UTF-8",
      success: function (result, status, xhr) {
        if (callback) {
          callback(result);
        }
      },
      error: function (xhr, status, er) {
        if (error) {
          error(er);
        }
      }
    }) // ajax 끝
  } // add함수 끝

  function getReviewList(param, callback, error) { // getReviewList함수 시작(목록 리스트를 처리하기 위한 함수 선언)
    var gdsNum = param.gdsNum; // 게시판번호
    var reviewPage = param.reviewPage || 1; // 페이지번호

    $.getJSON("/reviews/pages/" + gdsNum + "/" + reviewPage + ".json", // getJSON 시작
      function (data) {
        if (callback) {
          callback(data.reviewCnt, data.reviewList);
        } // getJSON 끝
      }).fail(function (xhr, status, err) { // fail 시작
      if (error) {
        error();
      }
    }); // fail 끝
  } // getReviewList함수 끝

  function remove(rno, callback, error) { // 삭제를 하기 위한 함수 선언(remove 함수 시작)
    $.ajax({ // ajax 시작
      type: "delete",
      url: "/reviews/" + rno,
      success: function (result, status, xhr) { // 삭제 성공했을 때 시작
        if (callback) {
          callback(result);
        }
      }, // 삭제 성공했을 때 끝
      error: function (xhr, status, er) { // 삭제에 실패 했을 때 시작
        if (error) {
          error(er);
        }
      } // 삭제에 실패 했을 때 끝
    }) // ajax 끝
  }
  // remove 함수 끝
  function update(review, callback, error) { // update함수 선언 시작
    console.log("RNO = " + review.rno);
    $.ajax({ // ajax 시작
      type: "put",
      url: "/reviews/" + review.rno,
      data: JSON.stringify(review),
      contentType: "application/json; charset=UTF-8",
      success: function (result, status, xhr) { // 수정 성공했을 때 시작
        if (callback) {
          callback(result);
        }
      }, // 수정 성공했을 때 끝
      error: function (xhr, status, er) { // 수정에 실패 했을 때 시작
        if (error) {
          error(er);
        }
      } // 수정에 실패 했을 때 끝
    }) // ajax 끝
  } // update함수 선언 끝

  function get(rno, callback, error) { // 상세페이지 처리하는 함수 (get함수 시작)
    $.get("/reviews/" + rno + ".json", function (result) {
      if (callback) {
        callback(result);
      }
    }).fail(function (xhr, status, err) {
      if (error) {
        error();
      }
    });
  }; // 상세페이지 처리하는 함수 (get함수 끝)
  function displayTime(timeValue) { // 시간 처리 함수 시작

    var today = new Date(); // 오늘 날짜
    // 현재 시간(today.getTime) - 화면에서 넘어온 시간(timeValue)
    var gap = today.getTime - timeValue;

    var dateObj = new Date(timeValue);
    var str = "";
    if (gap < (1000 * 60 * 60 * 24)) {
      var hh = dateObj.getHours();
      var mi = dateObj.getMinutes();
      var ss = dateObj.getSeconds();

      return [(hh > 9 ? '' : '0') + hh, ':',
        (mi > 9 ? '' : '0') + mi, ':',
        (ss > 9 ? '' : '0') + ss
      ].join('');
    } else {
      var yy = dateObj.getFullYear();
      var mm = dateObj.getMonth() + 1 // getMonth()은
      // 0,1,2,3,4,5,6,7,8,9,10,11이
      // 되니 +1을 해줘야 함.
      var dd = dateObj.getDate();

      return [yy, '/', (mm > 9 ? '' : '0') + mm, '/',
        (dd > 9 ? '' : '0') + dd
      ].join('');
    }
  }; // 시간 처리 함수 끝
  return {
    add: add,
    getReviewList: getReviewList,
    remove: remove,
    update: update,
    get: get,
    displayTime: displayTime
  };

})();

$(function () {

  // 컬러 클릭 이벤트
  $(".productInfo table .color li").click(function (e) {

    let s = $(this).hasClass("selected");
    if (s) {
      $(this).removeClass("selected");
    } else {
      $(".productInfo table .color li").removeClass("selected");
      $(this).addClass("selected");
    }

    e.preventDefault();

    totalPrice();

    return false;

  });

  // 사이즈 클릭 이벤트
  $(".productInfo table .size li").click(function (e) {

    let s = $(this).hasClass("selected");
    if (s) {
      $(this).removeClass("selected");
    } else {
      $(".productInfo table .size li").removeClass("selected");
      $(this).addClass("selected");
    }

    e.preventDefault();

    totalPrice();

    return false;

  });

  // 수량 변경 이벤트
  $(".productInfo table .mainAmount input").on("change", function () {

    let c = $(".productInfo table .color li").hasClass("selected");
    let s = $(".productInfo table .size li").hasClass("selected");

    if (!c || !s) {
      let result = "";
      if (!c && !s) {
        result += "컬러와 사이즈";
      } else if (!c) {
        result += "컬러";
      } else if (!s) {
        result += "사이즈";
      }
      result += "를 선택해주세요!";

      alert(result);

      amount = 1;
      $(this).val(1);
    }

    let amount = $(this).val();

    if (amount > 50) {
      alert("최대 구매 수량은 50개 입니다.");

      amount = 50;
      $(this).val(50);
    }

    totalPrice();
  });

  // 합계 function
  function totalPrice() {

    let color = $(".productInfo table .color li").hasClass("selected");
    let size = $(".productInfo table .size li").hasClass("selected");

    if (!color || !size) {
      return false;
    }

    let amount = $(".productInfo table .mainAmount input").val();

    var tdArr = new Array();

    var tr = $(".productInfo table tr");
    var td = tr.children();

    td.each(function (i) {
      tdArr.push(td.eq(i).text());
    });

    let totalPrice = amount *
      parseInt(td.eq(1).text().replace(",", "").replace("원", ""));

    let pdTP = $(".totalPrice p .productTotalPrice");
    let pdAmount = $(".totalPrice p .productAmount");

    pdTP.text(totalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ","));
    pdAmount.text(amount);

  }

  // 상품문의 이벤트
  $('.productQna .pdQna table .pdQna_contentShow').click(
    function (e) {
      let d = $(this).hasClass("active");
      if (d) {
        $('.productQna .pdQna table .pdQna_contentShow')
          .removeClass('active');
        $('.productQna .pdQna table .pdQna_content_wrap td')
          .slideUp();
      } else {
        $('.productQna .pdQna table .pdQna_contentShow')
          .removeClass('active');
        $('.productQna .pdQna table .pdQna_content_wrap td')
          .slideUp();
        $(this).addClass('active').next().find('td').slideDown();
      }

      e.preventDefault();
      return false;
    });

  // Top 버튼 이벤트
  $('#goTop').on('click', function (e) {
    $.smoothScroll({
      easing: 'easeOutExpo',
      speed: 1000
    });

    e.preventDefault();
    return false;
  });

  $('.detailHead').each(function () {
    let $window = $(window),
      $header = $(this)

    let sum = $header.offset().top + $header.outerHeight();

    $window.on('scroll', $.throttle(1000 / 15, function () {
      if ($window.scrollTop() > sum) {
        $('#goTop').addClass('visible');
      } else {
        $('#goTop').removeClass('visible');
      }
    }));

    $window.trigger('scroll');

  });

});