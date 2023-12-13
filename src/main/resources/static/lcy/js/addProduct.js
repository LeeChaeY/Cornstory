
$(function() {

    $("input[name='prodCnt']").on("input", function() {
        fncProdNameCheck();
    });

    $("input[type='button'][value='취소']").on("click", function() {
        history.go(-1);
    });

    $("input[type='button'][value='등록']").on("click", function() {
        addProduct();
    });

    $("input[type='button'][value='수정']").on("click", function() {
        updateProduct();
    });

    $(".dropset").on("click", function() {
        $(self.location).attr("href", "/");
    });

    $("span").on("click", function() {
        fncGetProductList('1');
    });

    $("select[name='workSelect']").on("change", function() {
        workSelect();
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
    } else if (spanText === "팝콘 소비 내역") {
        //$("input[name='userId']").val("${sessionScope.user.userId}");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    } else if (spanText === "팝콘 충전 내역") {
        //$("input[name='userId']").val("${sessionScope.user.userId}");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    } else if (spanText === "팝콘 총 매출") {
        $("input[name='userId']").val("");
        //$("input[name='userId']").val("${sessionScope.user.userId}");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    }
}

function addProduct() {
    let prodCategory = $("input[name='prodCategory']").val();

    if (prodCategory === "2" && ($("select[name='workSelect']").val() === "작품 선택")) {
        alert("작품을 선택해주세요.");
        return false;
    }
    if (prodCategory === "0") {
        if ($("input[name='prodCnt']").val() === "") {
            alert("1개 이상의 팝콘 수량을 입력해주세요.");
            return false;
        }
    }
    if ($("input[name='prodPrice']").val() === "") {
        alert("가격을 입력해주세요.");
        return false;
    }
    if (prodCategory === "2") {
        $("input[name='workNo']").val($("select[name='workSelect']").val());
    }
    $("form[name='addProduct']").attr("method", "post").attr("action", "/product/addProduct").submit();
}

function updateProduct() {
    let prodCategory = $("input[name='prodCategory']").val();

    if (prodCategory === "0") {
        if ($("input[name='prodCnt']").val() === "") {
            alert("1개 이상의 팝콘 수량을 입력해주세요.");
            return false;
        }
    }
    if ($("input[name='prodPrice']").val() === "") {
        alert("가격을 입력해주세요.");
        return false;
    }
    $("form[name='updateProduct']").attr("method", "post").attr("action", "/product/updateProduct").submit();
}

function fncProdNameCheck() {
    if ($(".prodNameCheck").css("display") === "block") {
        $(".prodNameCheck").css("display", "none");
    }
    if ($(".check").css("display") === "block") {
        $(".check").css("display", "none");
    }

    if ($("input[name='prodCnt']").val() === "0") {
        $("input[name='prodCnt']").val("");
        $(".check").css("display", "block");
    }

    if ($("input[name='prodCnt']").val() !== "") {
        $.ajax({
            url: "/product/json/prodNameCheck?prodCnt=" + $("input[name='prodCnt']").val(),
            method: "GET",
            dataType: "text",
            success: function(data, status) {
                if (data === "1") {
                    $(".prodNameCheck").css("display", "block");
                }
            },
            error: function(status) {
                //Debug...
                alert("error");
            }
        });
    }
}

function workSelect() {
    $("input[name='prodPrice']").val(100);
    $("input[name='prodPrice']").attr("type", "number");
    $(".free").css("display", "none");
    $(".freeCheck").css("display", "none");

    if ($("select[name='workSelect']").val() !== "작품 선택") {
        if ($("input[name='" + event.target.value + "']").val() === "0") {
            $("input[name='prodPrice']").val(0);
            $("input[name='prodPrice']").attr("type", "hidden");
            $(".free").css("display", "inline");
            $(".freeCheck").css("display", "block");
        }
    }
}