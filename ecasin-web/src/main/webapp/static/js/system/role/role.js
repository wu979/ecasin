loadPage();
function loadPage(){
    jQuery("#jqTable").jqGrid({
        url:ctx + "/role/findByPage",
        datatype:'json',
        pager:"#grid-pager",
        mtype:"POST",
        height:"100%",
        caption:"角色列表",
        colNames:
            [
                "id",'',"角色类型","角色类型","角色名称","角色标识码","创建时间","修改时间","操作"
            ],
        colModel : [
            {name:"roleId",index:"roleId",width:1,key:true,hidden:true,sortable: false},
            {name:"action", index: "action", width: 2, hidden: false,sortable: false},
            {name:"roleType",index:"roleType",width:12,hidden:true,sortable: false},
            {name:"contantsName",index:"contantsName",width:12,hidden:false,sortable: false},
            {name:"roleName",index:"roleName",width:5,hidden:false,sortable: false},
            {name:"roleCode",index:"roleCode",width:10,hidden:false,sortable: false},
            {name:"roleCreateTime",index:"roleCreateTime",width:10,hidden:false,sortable: false},
            {name:"roleUpdateTime",index:"roleUpdateTime",width:10,hidden:false,sortable: false},
            {name:"operation",index:"operation",width: 4, hidden: false,sortable: false},
        ],
        viewrecords: true,
        rowNum: 10,
        rowList: [10, 20, 30],
        rownumbers: true,
        rownumWidth: 30,
        altRows: true,
        autowidth: true,
        multiselect: false,
        multiboxonly: false,
        jsonReader: {
            root: "result",
            total: 'totalPages',
            page: 'page',
            records: 'records'
        },
        onSelectRow:function (id){
            var all = $("#jqTable").jqGrid('getRowData', id);
            // var recordId = all.menuId;
            // var rowData = $("#groupManage-table").jqGrid("getRowData", ids[0]);
            rowData = all;
        },
        loadComplete: function () {
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
                operation =
                    "<button class='btn btn-light btn-sm page-button-update' data-record=\""+ all.roleId +"\">" +
                    "<svg class='icon' aria-hidden='true'>"+
                    "<use xlink:href='#icon-xiugai4'></use>"+
                    "</svg>"+
                    "</button>" +
                    "<button class='btn btn-light btn-sm page-button-delete' data-record=\""+ all.roleId +"\">" +
                    "<svg class='icon' aria-hidden='true'>"+
                    "<use xlink:href='#icon-shanchu3'></use>"+
                    "</svg>"+
                    "</button>"
                jQuery("#jqTable").jqGrid('setRowData', ids[i], { operation: operation });
            }
            $('#jqTable').on('click','.page-button-update',function () {
                var roleId = $(this).attr('data-record');
                var row = forCheck(roleId);
                update(row);
            })
            $('#jqTable').on('click','.page-button-delete',function () {
                var recordIds = [];
                var roleId = $(this).attr('data-record');
                recordIds.push(roleId);
                del(recordIds);
            })
        }
    })
}

$('.save').on('click',function () {
    save();
})
$('.update').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
    }
    if(recordIds.length > 1){
        layer.msg("最多只能选择一条数据");
    }else {
        var ids = CommUtils.getJqgridSelected("jqTable");
        var rowData = $("#jqTable").jqGrid("getRowData", ids[0]);
        update(rowData);
    }
})
$('.delete').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
    }
    del(recordIds);
})
$('.menu-authority').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
    }
    if(recordIds.length > 1){
        layer.msg("最多只能选择一条数据");
    }else if(recordIds.length < 1){
        layer.msg("请至少选择一条数据");
    }else {
        menuAuthority(recordIds[0]);
    }
})
$('.job-authority').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    var recordType = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
        recordType.push(rowData.roleType);
    }
    if(recordIds.length > 1){
        layer.msg("最多只能选择一条数据");
    }else if(recordIds.length < 1){
        layer.msg("请至少选择一条数据");
    }else {
        jobAuthority(recordIds[0],recordType[0]);
    }
})
function save() {
    layer.open({
        id: 'save-click',
        type:2,
        content:ctx + '/role/savePage',
        area: ['22%','25%'],
        title: '新增菜单',
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
                success:function (data) {
                    if(data.status == 0){
                        layer.close(index);
                        layer.msg('保存成功');
                        jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
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
function update(rowData) {
    if(rowData != null || rowData != ''){
        if(rowData.roleType == 0){
            layer.msg("该条数据不能进行操作");
        }else {
            layer.open({
                id: 'update-click',
                type:2,
                content:ctx + '/role/updatePage',
                area: ['22%','32%'],
                title: '新增菜单',
                scrollbar: false,
                anim: 1,
                resize:false,
                zIndex: 1050,
                btn: ['修改','取消'],
                success: function(layero, index){
                    var roleName = rowData.roleName;
                    var roleId = rowData.roleId;
                    var body = layer.getChildFrame('body', index);
                    body.find("#roleName").val(roleName);
                    body.find("#roleId").val(roleId);
                },
                yes: function (index, layero) {
                    $.ajax({
                        url: ctx + '/role/update',
                        type: 'post',
                        dataType: 'json',
                        data: $('#form_update',layero.find("iframe")[0].contentWindow.document).serialize(),
                        success:function (data) {
                            if(data.status == 0){
                                layer.close(index);
                                layer.msg('修改成功');
                                jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
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
    }else {
        layer.msg("请选择至少一条数据");
    }
}
function del(recordIds) {
    if(recordIds.length > 0){
        layer.confirm('确认要删除吗？', {
            btn: ['确认','取消'],
            title: "提示"
        }, function() {
            $.ajax({
                url: ctx + '/role/delete',
                type: 'post',
                dataType: 'json',
                traditional:true,
                data:
                    {
                        ids: recordIds
                    },
                success: function (data) {
                    if (data.status == 0) {
                        layer.close();
                        layer.msg(data.data);
                        jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
                    } else {
                        layer.msg(data.message);
                        jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
                    }
                }
            })
        }, function () {
            //点击取消事件
        });
    }else {
        layer.msg("请选择至少一条数据");
    }
}
function forCheck(roleId) {
    var row;
    var ids = jQuery("#jqTable").jqGrid('getDataIDs');
    for (var i = 0; i < ids.length; i++) {
        var cl = ids[i];
        var all = $("#jqTable").jqGrid('getRowData', cl);
        if(all.roleId == roleId){
            row = all;
        }
    }
    return row;
}
function menuAuthority(recordId) {
    layer.open({
        id: 'save-click',
        type:2,
        content:ctx + '/role/menuPage',
        area: ['50%','50%'],
        title: '菜单授权',
        scrollbar: true,
        anim: 1,
        resize:false,
        zIndex: 1050,
        btn: ['完成'],
        success: function(layero, index){
            var body = layer.getChildFrame('body', index);
            body.find("#roleId").val(recordId);
            var iframeWin = window[layero.find('iframe')[0]['name']];

        },
        yes: function (index, layero) {
            layer.close(index);
        }
    })
}
function jobAuthority(recordId,recordType) {
    layer.open({
        type: 2,
        content:ctx + '/role/jobPage',
        area: ['75%','50%'],
        title: '菜单授权',
        scrollbar: true,
        anim: 1,
        resize:false,
        zIndex: 1050,
        btn: ['完成'],
        success: function(layero, index){
            var body = layer.getChildFrame('body', index);
            body.find("#roleId").val(recordId);
            body.find("#roleType").val(recordType);
            var iframeWin = window[layero.find('iframe')[0]['name']];
            iframeWin.showTree();
            iframeWin.unSelectJob();
            iframeWin.selectJob();
        },
        yes: function (index, layero) {
            layer.close(index);
        }
    })
}

function showTree() {
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

    }
}
function unSelectJob(){
    var roleId = $("#roleId").val();
    var roleType = $("#roleType").val();
    jQuery("#jqTable-unSelect").jqGrid({
        url:ctx + "/job/findRoleByUnJobList",
        postData:{ roleId: roleId , jobType: roleType},
        datatype:'json',
        pager:'#grid-pager-unSelect',
        mtype:"POST",
        height:"63%",
        caption:"待选职位列表",
        colNames:
            [
                "id",'',"公司名称","部门名称","角色名称"
            ],
        colModel : [
            {name:"jobId",index:"jobId",width:1,key:true,hidden:true,sortable: false},
            {name:"action", index: "action", width: 2, hidden: false,sortable: false},
            {name:"entityOrgName",index:"entityOrgName",width:5,hidden:false,sortable: false},
            {name:"entityDepName",index:"entityDepName",width:5,hidden:false,sortable: false},
            {name:"jobName",index:"jobName",width:5,hidden:false,sortable: false},
        ],
        viewrecords: true,
        rownumbers: true,
        rownumWidth: 30,
        altRows: true,
        autowidth: true,
        multiselect: false,
        multiboxonly: false,
        jsonReader: {
            root: "result",
            total: 'totalPages',
            page: 'page',
            records: 'records'
        },
        loadComplete: function () {
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
            var ids = $("#jqTable-unSelect").jqGrid('getDataIDs');
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                checkbox = "<label style=\"padding-left:2px;padding-top:3px\"><input name=\"grid-checkbox\" value=\""
                    + cl + "\"type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label>";
                $("#jqTable-unSelect").jqGrid('setRowData', ids[i], {action: checkbox});
            }
        }
    })
}
function selectJob(){

    var roleId = $("#roleId").val();

    jQuery("#jqTable-select").jqGrid({
        url:ctx + "/job/findRoleByJobList",
        postData:{ roleId: roleId },
        datatype:'json',
        pager:'#grid-pager-select',
        mtype:"POST",
        height:"63%",
        caption:"已选职位列表",
        colNames:
            [
                "id",'',"公司名称","部门名称","角色名称"
            ],
        colModel:
            [
                {name:"jobId",index:"jobId",width:1,key:true,hidden:true,sortable: false},
                {name:"action", index: "action", width: 3, hidden: false,sortable: false},
                {name:"entityOrgName",index:"entityOrgName",width:10,hidden:false,sortable: false},
                {name:"entityDepName",index:"entityDepName",width:10,hidden:false,sortable: false},
                {name:"jobName",index:"jobName",width:10,hidden:false,sortable: false},
            ],
        viewrecords: true,
        rownumbers: true,
        rownumWidth: 30,
        altRows: true,
        autowidth: true,
        multiselect: false,
        multiboxonly: false,
        jsonReader: {
            root: "result",
            total: 'totalPages',
            page: 'page',
            records: 'records'
        },
        loadComplete: function () {
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
            var ids = $("#jqTable-select").jqGrid('getDataIDs');
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                checkbox = "<label style=\"padding-left:2px;padding-top:3px\"><input name=\"grid-checkbox\" value=\""
                    + cl + "\"type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label>";
                $("#jqTable-select").jqGrid('setRowData', ids[i], {action: checkbox});
            }
            $(window).resize(function () {
                var winwidth = $('#jqTable-select').width();
                $("#jqTable-select").setGridWidth(winwidth - 20);
                $('#jqTable-select .ui-jqgrid-bdiv').css('width', winwidth - 10);
            });
            setTimeout(function () {
                var winwidth = $('#jqTable-select').width();
                $("#jqTable-select").setGridWidth(winwidth - 20);
                $('#jqTable-select .ui-jqgrid-bdiv').css('width', winwidth - 10);
            }, 0);
        }
    })
}