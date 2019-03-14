selectActiveLoad();
selectStateLoad();
loadPage();
var setting = {
    data: {
        simpleData: {enable: true, idKey: "id", pIdKey: "parent", rootPId: 0},
        key: {name: "text"}
    },
    view: {showLine: true, selectedMulti: false, dblClickExpand: false, fontCss: {"font-size": "20px"}},
    callback: {
        beforeClick: companyTreeCall
    }
};
//公司架构树形
$.ajax({
    url: ctx + "/company/companyTreeByNotAll",
    type: 'POST',
    dataType: 'JSON',
    success: function (data) {
        $.fn.zTree.init($("#contentTree"), setting, data);
        var treeObj = $.fn.zTree.getZTreeObj("contentTree");
        treeObj.expandAll(true);
    }
});
//单击事件
function companyTreeCall(treeId, treeNode, clickFlag) {
    var depId = treeNode.id;
    var json = {
        depId: depId
    };
    jQuery("#jqTable").jqGrid('setGridParam', {postData: json}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
}

/* 分页 */
function loadPage(){
    jQuery("#jqTable").jqGrid({
        url:ctx + "/archives/findByPage",
        datatype:'json',
        rowNum:10,
        rowList:[10, 20, 30],
        pager:"#grid-pager",
        mtype:"POST",
        height:"100%",
        caption:"档案列表",
        colNames:
            [
                "ID",'',"部门名称","员工工号","员工姓名","员工手机号","员工性别","员工状态","是否激活","操作",
                "公司ID","部门ID"
            ],
        colModel:
            [
                {name:"userId",index:"userId",width:1,key:true,hidden:true,sortable: false},
                {name:"action", index:"action", width: 2, hidden: false,sortable: false},
                {name:"entityDepName",index:"entityDepName", width: 5, hidden: false,sortable: false},
                {name:"userNumber", index: "userNumber", width: 5, hidden: false,sortable: false},
                {name:"userName",index:"userName",width:5,hidden:false,sortable: false},
                {name:"userPhone",index:"userPhone",width:5,hidden:false,sortable: false},
                {name:"userSex",index:"userSex",width:5,hidden:false,sortable: false},
                {name:"userState",index:"userState",width:5,hidden:false,sortable: false,formatter:userState},
                {name:"userIsActive",index:"userIsActive",width:5,hidden:false,sortable: false,formatter:userActive},
                {name:"operation",index:"operation",width: 4, hidden: false,sortable: false},
                {name:"userOrgId",index:"userOrgId",width: 4, hidden: true,sortable: false},
                {name:"userDepId",index:"userDepId",width: 4, hidden: true,sortable: false},
            ],
        viewrecords:true,
        rownumbers:true,
        rownumWidth:30,
        altRows:true,
        autowidth:true,
        autoScroll: false,
        multiselect:false,
        multiboxonly:false,
        jsonReader:{
            root:"result",
            total:"totalPages",
            page:"page",
            records:"records"
        },
        onSelectRow:function (id){
            var all = $("#jqTable").jqGrid('getRowData', id);
            rowData = all;
        },
        loadComplete: function () {
            //设置当前页码和行数
            pageControl.setPage('#jqTable');
            pageControl.setSearch();

            $('td').css({
                'text-align': 'center'
            })
            $('th div').css({
                'text-align': 'center'
            });
            var table = this;
            setTimeout(function () {
                updatePagerIcons(table);
            }, 0);
            updatePagerIcons(table);
        },
        gridComplete:function (){
            var ids = jQuery("#jqTable").jqGrid('getDataIDs');
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                checkbox = "<label style=\"padding-left:2px;padding-top:3px\"><input name=\"grid-checkbox\" value=\""
                    + cl + "\"type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label>";
                jQuery("#jqTable").jqGrid('setRowData', ids[i], {action: checkbox});

                var all = $("#jqTable").jqGrid('getRowData', cl);
                var operation = '';
                var userIsActive = all.userIsActive;
                switch (userIsActive) {
                    case "激活待确认":
                        operation =
                            "<button class='btn btn-light btn-sm page-button page-button-ok' data-record=\""+ all.userId +"\" data-type='3' title=\"确认\">" +
                            "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-querengou'></use>"+
                            "</svg>"+
                            "</button>";
                        break;
                    case "已激活":
                        operation =
                            "<button class='btn btn-light btn-sm page-button page-button-frozen' data-record=\""+ all.userId +"\" data-type='4' title=\"冻结\">" +
                            "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-suo1'></use>"+
                            "</svg>"+
                            "</button>";
                        break;
                    case "冻结":
                        operation =
                            "<button class='btn btn-light btn-sm page-button page-button-recovery' data-record=\""+ all.userId +"\" data-type='3' title=\"恢复\">" +
                            "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-jiesuo2'></use>"+
                            "</svg>"+
                            "</button>";
                        break;
                    default:
                        operation = ''
                        break;
                }
                jQuery("#jqTable").jqGrid('setRowData', ids[i], { operation: operation });
            }
            $('#jqTable').on('click','.page-button',function () {
                var userId = $(this).attr('data-record');
                var clickType = $(this).attr('data-type');
                updateUserType(userId,clickType);
            })
        }
    })
}
/* 判断类型 */
function userState(a,b,c) {
    var state = '';
    switch (c.userState) {
        case "1":
            state = '在职人员';
            break;
        case "2":
            state = '离职人员';
            break;
        case "3":
            state = '休假人员';
            break;
        case "4":
            state = '停职人员';
            break;
        default:
            state = '';
            break;
    }
    return state;
}
/* 判断类型 */
function userActive(a,b,c) {
    var active = '';
    switch (c.userIsActive) {
        case "1":
            active = '待激活';
            break;
        case "2":
            active = '激活待确认';
            break;
        case "3":
            active = '已激活';
            break;
        case "4":
            active = '冻结';
            break;
        default:
            active = '';
            break;
    }
    return active;
}
/* 下拉框 */
function selectActiveLoad(){
    selectUtil.findSelectByValue("#active","userIsActive");
}
/* 下拉框 */
function selectStateLoad(){
    selectUtil.findSelectByValue("#state","userState");
}
/* 更新员工激活类型 */
function updateUserType(userId,clickType) {
    layer.confirm('确认进行此操作？', {
        btn: ['确认','取消'],
        title: "提示",
        anim: 1
    }, function() {
        $.ajax({
            url: ctx + '/archives/updateUserType',
            type: 'post',
            dataType: 'json',
            data:
                {
                    userId: userId,
                    activeType: clickType
                },
            success: function (data) {
                if (data.status == 0) {
                    layer.close();
                    layer.msg(data.message);
                    $("#jqTable").trigger("reloadGrid");
                } else {
                    layer.msg(data.message);
                }
            }
        })
    }, function () {
        //点击取消事件
    });
}
/* 新增员工 */
$('.save').on('click',function () {
    save();
})
/* 修改员工 */
$('.update').on('click',function () {
    update();
})
function save() {
    layer.open({
        id: 'save-click',
        type:2,
        content:ctx + '/archives/savePage',
        area: ['50%','60%'],
        title: '新增员工',
        scrollbar: true,
        anim: 1,
        resize:false,
        zIndex: 1050,
        btn: ['保存','取消'],
        success: function(layero, index){

        },
        yes: function (index, layero) {
            $.ajax({
                url: ctx + '/role/save',
                type: 'post',
                dataType: 'json',
                data: $('#form_save',layero.find("iframe")[0].contentWindow.document).serialize(),
                beforeSend: function (request) {
                    layerLoad = layer.load(2);
                },
                success:function (data) {
                    if(data.status == 0){
                        setTimeout(function () {
                            layer.close(layerLoad);
                            layer.close(index);
                            layer.msg('保存成功');
                            $("#jqTable").trigger("reloadGrid");
                        },500);
                    }else {
                        layer.msg(data.message);
                    }
                }
            })
        },
        btn2: function(index){
            layer.close(index);
        },
    })
}
function update() {

}