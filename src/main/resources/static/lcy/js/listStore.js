
// opilsol-N24 [XZlQ1o5z61]
$(function() {

    $(".listStoreSearchButton").on("click", function() {
        $("form[name='form']").attr("method", "post").attr("action", "/product/listProduct").submit();
    });
    // $(".viewWork").on("click", function() {
    //     let workNo = parseInt($(this).parents("tr").children("td").eq(3).children("input").val());
    //     viewWork(workNo);
    // });
    // $(".viewUser").on("click", function() {
    //     let userId = $(this).parents("tr").children("td").eq(7).children("input").val();
    //     viewUser(userId)
    // });

    $("input[name='tranCnt']").on("keyup", function(e) {
        inputNumberFormat(e.target);
    });

    $("input[value='충전하기']").on("click", function() {
        let prodNo = $(this).parents().parents().children("input").val();
        let tranCnt = parseInt(uncomma($(this).parents("tr").children("td").eq(6).children("input").eq(0).val()));
        let prodName = $(this).parents("tr").children("td").eq(2).text().trim();
        let prodPrice = parseInt(uncomma($(this).parents("tr").children("td").eq(3).text().trim()));
        let userId = $("input[name='userId']").val();
        alert(prodNo);
        // addPurchaseKG(prodNo,tranCnt,prodName,prodPrice,userId);
    });

    $("input[value='구매하기']").on("click", function() {
        let prodNo = $(this).parents().parents().children("input").val();
        let prodPrice = parseInt($(this).parents("tr").children("td").eq(4).text().replace(/\s/g, ''));
        addPurchase(prodNo, prodPrice);
    });

    $("input[value='수정하기']").on("click", function() {
        let prodNo = $(this).parents().parents().children("input").val();
        updateProduct(prodNo);
    });

    $("input[value='삭제하기']").on("click", function() {
        let prodNo = $(this).parents().parents().children("input").val();
        deleteProduct(prodNo);
    });
});

function addPurchaseKG(prodNo,tranCnt,prodName,prodPrice,userId) {
    let IMP = window.IMP;
    let amount = prodPrice * tranCnt;
    IMP.init('imp23000431');

    const formattedDate = new Date().toLocaleString('ko-KR', { timeZone: 'Asia/Seoul', year: 'numeric', month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit' }).replace(/[^\d]/g, '');
    let merchantUid = userId+"_"+prodNo+"_"+formattedDate;
    console.log(merchantUid);
    let tranMethod;

    IMP.request_pay({
        pg: "html5_inicis.INIpayTest",
        pay_method: "card",
        merchant_uid: merchantUid,   // 주문번호
        name: prodName+"",
        amount: amount,                        // 숫자 타입
        buyer_name: $("input[name='userName']").val(),
        buyer_email: $("input[name='email']").val(),
        buyer_tel : $("input[name='phone']").val()   //필수 파라미터 입니다.
    }, rsp => {
        if (rsp.success) {
            alert("결제가 완료되었습니다.");
            console.log(rsp);
            // console.log(`pay_method: ${rsp.pay_method}`);
            // console.log(`card_name: ${rsp.card_name}`);
            console.log(`pg_type: ${rsp.pg_type}`);
            console.log(`imp_uid: ${rsp.imp_uid}`);
            let tranMethod = rsp.card_name;

            if (rsp.pg_type === "card") {
                $(self.location).attr("href", '/purchase/addPurchase?prodNo='+prodNo+'&tranCnt='+tranCnt+'&tranMethod='+tranMethod);
            } else if (rsp.pg_type === "payment") {
                $.ajax({
                    type : 'GET',
                    url : '/purchase/json/getIamportPayment?imp_uid='+rsp.imp_uid,
                    success: function(data) {
                        console.log(data.response);
                        console.log(data.response.embPgProvider);
                        if (data.response.embPgProvider !== null) {
                            tranMethod = data.response.embPgProvider;
                        }
                        $(self.location).attr("href", '/purchase/addPurchase?prodNo='+prodNo+'&tranCnt='+tranCnt+'&tranMethod='+tranMethod);
                    },
                    error: function(error) {
                        alert(error);
                    }
                });
            }

        } else {
            alert(`결제에 실패하였습니다. 에러 내용: ${rsp.error_msg}`);
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