
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    $("a:contains('나의 저작권')").on("click", function() {
        $("input[name='userStatus']").val(1);   // 0: 전체, 1: 나의~ㄴ
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    });

    $("a:contains('팝콘 총 매출')").on("click", function() {
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listTotalSale").submit();
    });

    $(".listStoreSearchButton").on("click", function() {
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listSale").submit();
    });
    $("select.selectset").on("change", function() {
        alert();
        alert($(this).val());
        $("input[name='userId']").val("");
        // $("input[name='condition']").val(0);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listTotalSale").submit();
    });
    $(".viewWork").on("click", function() {
        let workNo = $(this).parents("tr").children("td").eq(3).children("input").val();
        viewWork(workNo);
    });
    $(".viewUser").on("click", function() {
        let userId = $(this).parents("tr").children("td").eq(7).children("input").val();
        viewUser(userId)
    });

    $(".contents-figure").on("click", function() {
        $(self.location).attr("href", "/work/addWork");
    });

});


function viewWork(workNo) {
    $(self.location).attr("href", "/work/getDetailWork?workNo=" + workNo);
}

function viewUser(userId) {
    $(self.location).attr("href", "/user/getUser?userId=" + userId);
}