var href =window.location.href;
var ctx = href.substring(0,find(href,"/",3));
function find(str,cha,num){
    var x=str.indexOf(cha);
    for(var i=0;i<num;i++){
        x=str.indexOf(cha,x+1);
    }
    return x;
}


$('#inputClick').on('click',function () {
    $.ajax({

        url: ctx + '/user/getUser',
        type:'post',
        dataType:'json',
        success:function (data) {
            if(data.status == 0){
                console.log(data);
            }else {
                console.log("抛出了异常:");
                $("#messageSpan").html(data.message);
                $("#messageSpan").css('display','block');

                console.log(data);
            }
        }

    })
})