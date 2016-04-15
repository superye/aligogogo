/**
 * Created by yehao on 16/4/4.
 */
function changepayment(id) {
    var url = "admin_ChangePayment.action";
    var data = "id="+id;
    $.ajax({
        type:"GET",
        url:url,
        data: data,
        success: function(Msg) {
            $("#tr"+id).remove();
            alert("修改成功");
        }
    });
}

function deleteorder(id) {
    var url = "admin_DeleteOrder.action";
    var data = "id="+id;
    $.ajax({
        type:"GET",
        url:url,
        data: data,
        success: function(Msg) {
            $("#tr"+id).remove();
            alert("删除成功");
        }
    });
}