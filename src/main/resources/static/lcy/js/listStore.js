
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    if($("input[name='userId']").val() === "") {
        $("input[id='checkset-e-5-1']").attr("checked", "");
    } else {
        $("input[id='checkset-e-5-2']").attr("checked", "");
    }

    $(".listStoreSearchButton").on("click", function() {
        // $("input[name='searchCondition']").val("0");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    });
    $(".viewWork").on("click", function() {
        let workNo = $(this).parents("tr").children("td").eq(3).children("input").val();
        viewWork(workNo);
    });
    $(".viewUser").on("click", function() {
        let userId = $(this).parents("tr").children("td").eq(7).children("input").val();
        viewUser(userId)
    });

    $("input[name='tranCnt']").on("change", function() {
        if ($(this).val() < 1) {
            $(this).val(1);
        }
    });

    $("input[value='충전하기']").on("click", function() {
        let prodNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        addPurchaseKakao(prodNo);
    });

    $("input[value='구매하기']").on("click", function() {
        let prodNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        let prodPrice = $(this).parents("tr").children("td").eq(4).text().replace(/\s/g, '');
        addPurchase(prodNo, prodPrice);
    });

    $("input[value='수정하기']").on("click", function() {
        let prodNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        updateProduct(prodNo);
    });

    $("input[value='삭제하기']").on("click", function() {
        let prodNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        deleteProduct(prodNo);
    });
});

function fncGetProductList(currentPage) {
    $("input[name='currentPage']").val(currentPage);
    let sessionUserId = $("input[name='sessionUserId']").val();
    let spanText = event.target.innerText;

    if (spanText === "상품 조회") {
        $("input[name='userId']").val("");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
        // $(self.location).attr("href", "/product/listProduct");
    } else if (spanText === "나의 저작권") {
        $("input[name='userId']").val(sessionUserId);
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    } else if (spanText === "저작권 등록") {
        $(self.location).attr("href", "/product/addProduct?prodCategory=2").submit();
    } else if (spanText === "팝콘 등록") {
        $(self.location).attr("href", "/product/addProduct?prodCategory=0").submit();
    } else if (spanText === "구매 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='tranCategory']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    } else if (spanText === "판매 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='tranCategory']").val(0);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    } else if (spanText === "팝콘 총 매출") {
        $("input[name='userId']").val("");
        //$("input[name='userId']").val("${sessionScope.user.userId}");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    }
}

function addPurchaseKakao(prodNo) {
    let tranCnt = $("input[name='tranCnt']").val();
    $.ajax({
        url: '/purchase/json/kakaopayReady',
        method: 'GET',
        data: {
            prodNo: prodNo,
            tranCnt: tranCnt
        },
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
        dataType: 'json',
        success: function(resp) {
            // alert(resp); //결제 고유 번호
            var box = resp.next_redirect_pc_url;
            kakaopayBox = window.open(box, "kakaopayBox", "width=500px, height=500px, scrollbars=yes"); // 새창 열기
            // location.href = box;
        },
        error: function(error) {
            alert(error);
        }
    });
}

function addPurchase(prodNo, prodPrice) {
    if (parseInt($("input[name='popcornCnt']").val()) < parseInt(prodPrice)) {
        alert("팝콘이 부족합니다. 충전 후 구매해주세요.");
        return;
    }
    $(self.location).attr("href", "/purchase/addPurchase?prodNo=" + prodNo + "&tranCnt=1&tranMethod=0");
}

function viewWork(workNo) {
    $(self.location).attr("href", "/work/getDetailWork?workNo=" + workNo);
}

function viewUser(userId) {
    $(self.location).attr("href", "/user/getUser?userId=" + userId);
}

function updateProduct(prodNo) {
    $(self.location).attr("href", "/product/updateProduct?prodNo=" + prodNo);
}

function deleteProduct(prodNo) {
    $.ajax({
        url: "/product/json/deleteProduct?prodNo=" + prodNo,
        method: "GET",
        dataType: "text",
        data: {},
        success: function(returnMessage, status) {
            // alert(returnMessage);
            $("input[value='" + prodNo + "']").parents("tr").children("td").remove();
        },
        error: function(status) {
            //Debug...
            alert("error");
        }
    });
}