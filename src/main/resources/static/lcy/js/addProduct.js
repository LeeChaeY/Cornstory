
$(function() {
    if (parseInt($("input[name='prodCategory']").val()) === 0)
        fncProdNameCheck();

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

    $("select[name='workSelect']").on("change", function() {
        workSelect();
    });

    $("input[name='prodCnt']").on("keyup", function(e) {
        inputNumberFormat(e.target);
    });

    $("input[name='prodPrice']").on("keyup", function(e) {
        inputNumberFormat(e.target);
    });

    $(".contents-figure").on("click", function() {
        $(self.location).attr("href", "/work/getWork");
    });

});

function addProduct() {
    let prodCategory = parseInt($("input[name='prodCategory']").val());

    if (prodCategory === 2 && ($("select[name='workSelect']").val() === "작품 선택")) {
        alert("작품을 선택해주세요.");
        return false;
    }
    if (prodCategory === 0) {
        if ($("input[name='prodCnt']").val() === "") {
            alert("1개 이상의 팝콘 수량을 입력해주세요.");
            return false;
        }
        if ($(".prodNameCheck").css("display") === "block") {
                alert("해당 수량의 팝콘이 등록되어있습니다. 팝콘 수량을 변경해주세요.");
                return false;
        }
    }
    if ($("input[name='prodPrice']").val() === "") {
        alert("가격을 입력해주세요.");
        return false;
    }

    if (prodCategory === 0) {
        $("input[name='prodCnt']").val(uncomma($("input[name='prodCnt']").val()));
    } else if (prodCategory === 2) {
        $("input[name='workNo']").val($("select[name='workSelect']").val());
    }
    $("input[name='prodPrice']").val(uncomma($("input[name='prodPrice']").val()));
    $("form[name='addProduct']").attr("method", "post").attr("action", "/product/addProduct").submit();
}

function updateProduct() {
    let prodCategory = parseInt($("input[name='prodCategory']").val());

    if (prodCategory === 0) {
        if ($("input[name='prodCnt']").val() === "") {
            alert("1개 이상의 팝콘 수량을 입력해주세요.");
            return false;
        }
        if ($(".prodNameCheck").css("display") === "block") {
            alert("해당 수량의 팝콘이 등록되어있습니다. 팝콘 수량을 변경해주세요.");
            return false;
        }
    }
    if ($("input[name='prodPrice']").val() === "") {
        alert("가격을 입력해주세요.");
        return false;
    }

    if (prodCategory === 0) {
        $("input[name='prodCnt']").val(uncomma($("input[name='prodCnt']").val()));
    }
    $("input[name='prodPrice']").val(uncomma($("input[name='prodPrice']").val()));
    $("form[name='updateProduct']").attr("method", "post").attr("action", "/product/updateProduct").submit();

}

function fncProdNameCheck() {
    let prodCnt = uncomma($("input[name='prodCnt']").val());

    if ($(".prodNameCheck").css("display") === "block") {
        $(".prodNameCheck").css("display", "none");
    }
    if ($(".check").css("display") === "block") {
        $(".check").css("display", "none");
    }

    if (prodCnt === "0") {
        $("input[name='prodCnt']").val("");
        $(".check").css("display", "block");
    }

    let result;
    if ($("input[name='prodCnt2']").val() !== prodCnt && prodCnt !== "") {
        $.ajax({
            url: "/product/json/prodNameCheck?prodCnt=" + prodCnt,
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

function comma(str) {
    str = String(str);
    return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
}

function uncomma(str) {
    str = String(str);
    return str.replace(/[^\d]+/g, '');
}

function inputNumberFormat(obj) {
    obj.value = comma(uncomma(obj.value));
}