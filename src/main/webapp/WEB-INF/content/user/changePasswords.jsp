<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/15
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/userCss/changeStyle.css">
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <p>密码修改</p>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <input type="password" class="form-control " id="oldPassword" placeholder="原密码">
                </div>
                <div class="form-group" style="margin-top:35px">
                    <input type="password" class="form-control " id="newPassword" placeholder="输入新密码4到6位">
                </div>
                <div class="form-group" style="margin-top:35px">
                    <input type="password" class="form-control " id="surePassword" placeholder="新密码确认">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" id="submit_btn" class="btn btn-info">确认修改</button>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/static/js/jquery.min.js"></script>
<script>
    $(function () {
        var errMsg;
        var oldC;
        var newC;
        var sureC;
        $.each($("input"), function (i, val) {
            $(val).blur(function () {
                if ($(val).attr("id") == "oldPassword") {
                    $(".pwd0Msg").remove();
                    var pwd0Msg = val.value;
                    if (pwd0Msg == "" || pwd0Msg.trim() == "") {
                        errMsg = "<span class='pwd0Msg label label-danger' >原密码不能为空</span>";
                    } else {
                        oldC = true;
                        return null;
                    }
                    $(this).parent().append(errMsg);
                } else if ($(val).attr("id") == "newPassword") {
                    $(".pwdMsg").remove();
                    var pwd = val.value;
                    var regPwd = /^\w{4,10}$/;
                    if (pwd == "" || pwd.trim() == "") {
                        errMsg = "<span class='pwdMsg label label-danger' >新密码不能为空</span>";
                    } else if (!regPwd.test(pwd)) {
                        errMsg = "<span class='pwdMsg label label-danger' >长度4到6位</span>";
                    } else {
                        errMsg = "<span class='pwdMsg label label-success' >OK！</span>";
                        newC = true;
                    }
                    $(this).parent().append(errMsg);
                } else if ($(val).attr("id") == "surePassword") {
                    $(".pwd2Msg").remove();
                    var pwd2 = val.value;
                    var pwd = $("input")[1].value;
                    if (pwd2 == "" || pwd2.trim() == "" || pwd2 !== pwd) {
                        errMsg = "<span class='pwd2Msg label label-danger' >两次输入密码不一致</span>";
                    } else {
                        errMsg = "<span class='pwd2Msg label label-success' > OK！</span>";
                        sureC = true;
                    }
                    $(this).parent().append(errMsg);
                }
            });
        });
        $('#submit_btn').on('click', function () {
            if (oldC === true && newC === true && sureC === true) {
                $.post("/v1/api/updatePassword", {
                    "oldPassword": $("#oldPassword").val(),
                    "newPassword": $("#newPassword").val()
                }, function (data, status) {
                    if (data.upDateSuccess) {
                        window.location.href = "/index";
                    } else {
                        alert("原密码错误！");
                    }
                });
            }
        });
    });
</script>