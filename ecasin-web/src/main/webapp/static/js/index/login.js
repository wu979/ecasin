//登录,注册,修改 页面加载
$("#sign").on('click',function () {
    $("body").load(ctx+"/sign");
})
$("#forget").on('click',function () {
    $("body").load(ctx+"/forget");
})
$("#goLogin").on('click',function () {
    $("body").load(ctx+"/login");
})

//登录页面动画
$(function () {
    $('body').on('click', function(e) {
        if(e.target.id === 'password' || e.target.id === 'password2' ){ // 单击 密码框 举起手来
            document.getElementById('password-select').checked = true;
        }else { // 单击 密码框之外的区域 放下手
            document.getElementById('password-select').checked = false;
        }
    })
    //  密码框 失去焦点同样放下手
    $('#password').on('blur',function () {
        document.getElementById('password-select').checked = false;
    })
    $('#password2').on('blur',function () {
        document.getElementById('password-select').checked = false;
    })
})
//获取短信验证码
$("#getCode").on('click',function () {
    var phone = $("#phone").val();
    var type = $("#type").val();
    $.ajax({
        url:ctx + "/sendSms",
        type:'post',
        dataType:'json',
        data:
            {
                phone:phone,
                type:type
            },
        success:function (data) {
                if(data.status == 0) {
                    $("#getCode").css("cssText","background: #A9A9A9 !important;border-color:#A9A9A9 !important;color: rgb(26, 117, 152) !important;");
                    $("#getCode").val('60');
                    $("#getCode").attr("disabled","true");
                    var time = 60;
                    myAlert("已成功,请注意接收", function (f) {
                        var count = setInterval(function () {
                            if(time == 0){
                                $("#getCode").removeAttr('disabled');
                                $("#getCode").css("cssText","background: rgb(26, 117, 152) !important; border-color: rgb(26, 117, 152) !important;color:  #fff !important;");
                                $("#getCode").val('免费获取验证码');
                                window.clearInterval(count);
                                return ;
                            }else {
                                $("#getCode").val(time);
                                time --;
                            }
                        },1000);
                    }, false);
                }else {
                    myAlert(data.message,function (f) {},false);
                }
        }
    })
})
//激活或者忘记密码
$("#isActive").on('click',function () {
    $.ajax({
        url:ctx + '/register',
        type:'post',
        dataType:'json',
        data:$('#formSubmit').serialize(),
        success:function (data) {
            if(data.status == 0) {
                $("body").load(ctx + "/success",function () {
                    var message = "";
                    if(data.data == 1){
                        message = "恭喜你，激活成功";
                    }else {
                        message = "修改密码成功";
                    }
                    var div = "<span><span id='messageSpan'>" + message + "</span><br><span id='timeSpan'></span><span>跳转到登录页面,若没有跳转,点击</span><a href='' id='QuDengLu'>>>>前往登录页面</a></span>";
                    $("#successDivOne").html(div);
                })
            }else {
                myAlert(data.message,function (f) {},false);
            }
        }
    })
})

//加载验证码图片
loadCode();
function loadCode(){
    $("#imgCode").attr('src',ctx + '/createImageCode?time=' + new Date().getTime());
}
$("#imgCode").on('click',function () {
    loadCode();
});
codeCountMax();
function codeCountMax() {
    var code = sessionStorage.getItem("codeCountMax");
    if(code != null && code != ''){
        myAlert("请稍后在试",function (f) {},false);
    }
}