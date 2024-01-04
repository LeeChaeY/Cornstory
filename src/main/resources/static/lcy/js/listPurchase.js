
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    if (parseInt($("input[name='tranCategory']").val()) === 1)
        $("input[id='radioset-c-1-2']").attr("checked", "");
    else if (parseInt($("input[name='tranCategory']").val()) === 2)
        $("input[id='radioset-c-1-3']").attr("checked", "");

    $(".listStoreSearchButton").on("click", function() {
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    });
    // $(".viewWork").on("click", function() {
    //     let workNo = $(this).parents("tr").children("td").eq(0).children("input").eq(0).val();
    //     viewWork(workNo);
    // });
    // $(".viewUser").on("click", function() {
    //     let userId = $(this).parents("tr").children("td").eq(7).children("input").val();
    //     viewUser(userId)
    // });

    $(".contents-figure").on("click", function() {
        if ($(this).children("h4").text().trim() === "감상하러가기"){
            $("form[name='form']").attr("method", "post").attr("action", "/work/listWork").submit();
        } else {
            $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
        }

    });

    $("input[value='삭제하기']").on("click", function() {
        // let prodNo = $(this).parents("tr").children("td").eq(0).children("input").val();
        // deleteProduct(prodNo);
    });
});


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