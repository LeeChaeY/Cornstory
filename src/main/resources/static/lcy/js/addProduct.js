
$(function() {
    $("input[id='checkset-e-5-3']").attr("checked", "");
    $("input[id='checkset-e-5-4']").attr("checked", "");

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

    $("select[name='workSelect']").on("change", function() {
        workSelect();
    });
});

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
        // $("input[name='workNo']").val(10024);
        // $("input[name='episodeNo']").val(10034);
        // $("input[name='prodCategory']").val(1);
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