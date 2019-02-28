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
    url: ctx + "/company/companyTree",
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
    if(depId == 'root_999'){
        depId = '';
    }
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

                // var all = $("#jqTable").jqGrid('getRowData', cl);
                // operation =
                //     "<button class='btn btn-light btn-sm page-button-update' data-record=\""+ all.roleId +"\" title=\"修改\">" +
                //     "<svg class='icon' aria-hidden='true'>"+
                //     "<use xlink:href='#icon-xiugai4'></use>"+
                //     "</svg>"+
                //     "</button>" +
                //     "<button class='btn btn-light btn-sm page-button-delete' data-record=\""+ all.roleId +"\" title=\"删除\">" +
                //     "<svg class='icon' aria-hidden='true'>"+
                //     "<use xlink:href='#icon-shanchu3'></use>"+
                //     "</svg>"+
                //     "</button>"
                // jQuery("#jqTable").jqGrid('setRowData', ids[i], { operation: operation });
            }
            // $('#jqTable').on('click','.page-button-update',function () {
            //     var roleId = $(this).attr('data-record');
            //     var row = forCheck(roleId);
            //     update(row);
            // })
            // $('#jqTable').on('click','.page-button-delete',function () {
            //     var recordIds = [];
            //     var roleId = $(this).attr('data-record');
            //     recordIds.push(roleId);
            //     del(recordIds);
            // });
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