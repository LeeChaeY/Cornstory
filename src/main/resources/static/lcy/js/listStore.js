
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    if($("input[name='userStatus']").val() === "0") {
        $("input[id='checkset-e-5-1']").attr("checked", "");
    } else {
        $("input[id='checkset-e-5-2']").attr("checked", "");
    }

    $(".listStoreSearchButton").on("click", function() {
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
    $(self.location).attr("href", "/purchase/addPurchase?prodNo=" + prodNo);
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