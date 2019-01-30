<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2019/1/30
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div id="successDiv" style="width: 100%;height: 100%;background-color: #ebebeb;">
    <div id="successDiv2" style="position: fixed;width: 100%;height: 50%;background-color: #008ead;">
        <img id="successImg" src="${ctx}/static/images/success.png">
        <div id="successDivOne" style=""></div>
    </div>
</div>
<script>
    $(function () {
        $("body").unbind('click');
        var time = 5;
        var count = setInterval(function () {
            if(time == 0){
                clearInterval(count);
                $("body").load(ctx+"/login");
            }
            document.getElementById('timeSpan').innerHTML= time + "秒后";
            time --;
        },1000);
        $("#QuDengLu").bind('click',function () {
            clearInterval(count);
        })
    })
</script>


