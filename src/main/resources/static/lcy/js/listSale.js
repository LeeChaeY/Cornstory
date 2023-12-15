
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    $("input[id='checkset-e-5-6']").attr("checked", "");

    $(".listStoreSearchButton").on("click", function() {
        // $("input[name='searchCondition']").val("0");
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

});


function viewWork(workNo) {
    $(self.location).attr("href", "/work/getDetailWork?workNo=" + workNo);
}

function viewUser(userId) {
    $(self.location).attr("href", "/user/getUser?userId=" + userId);
}