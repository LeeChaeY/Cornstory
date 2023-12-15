
// opilsol-N24 [XZlQ1o5z61]
$(function() {
    $("span").on("click", function() {
        fncGetProductList('1');
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
    } else if (spanText === "구매 내역" || spanText === "팝콘 충전 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='tranCategory']").val(0);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    } else if (spanText === "판매 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listSale").submit();
    } else if (spanText === "팝콘 총 매출") {
        $("input[name='userId']").val("");
        //$("input[name='userId']").val("${sessionScope.user.userId}");
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    } else if (spanText === "작품 회차 구매 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='tranCategory']").val(1);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    } else if (spanText === "저작권 구매 내역") {
        $("input[name='userId']").val(sessionUserId);
        $("input[name='tranCategory']").val(2);
        $("form[name='form']").attr("method", "post").attr("action", "/purchase/listPurchase").submit();
    }
}
