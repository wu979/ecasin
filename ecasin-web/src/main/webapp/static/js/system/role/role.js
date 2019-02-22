selectLoad();
loadPage();
/* 分页 */
function loadPage(){
    jQuery("#jqTable").jqGrid({
        url:ctx + "/role/findByPage",
        datatype:'json',
        // page:pageControl.getPage(),
        // rowNum:pageControl.getRowNum(),
        // postData:pageControl.getJson(),
        rowNum:10,
        rowList:[10, 20, 30],
        pager:"#grid-pager",
        mtype:"POST",
        height:"100%",
        caption:"角色列表",
        colNames:
            [
                "id",'',"角色类型","角色类型","类型值","角色名称","角色标识码","创建时间","修改时间","操作"
            ],
        colModel:
            [
                {name:"roleId",index:"roleId",width:1,key:true,hidden:true,sortable: false},
                {name:"action", index: "action", width: 2, hidden: false,sortable: false},
                {name:"roleType",index:"roleType",width:12,hidden:true,sortable: false},
                {name:"entityConstantName",index:"entityConstantName",width:12,hidden:false,sortable: false},
                {name:"entityConstantValue",index:"entityConstantValue",width:12,hidden:true,sortable: false},
                {name:"roleName",index:"roleName",width:5,hidden:false,sortable: false},
                {name:"roleCode",index:"roleCode",width:10,hidden:false,sortable: false},
                {name:"roleCreateTime",index:"roleCreateTime",width:10,hidden:false,sortable: false},
                {name:"roleUpdateTime",index:"roleUpdateTime",width:10,hidden:false,sortable: false},
                {name:"operation",index:"operation",width: 4, hidden: false,sortable: false},
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
                operation =
                    "<button class='btn btn-light btn-sm page-button-update' data-record=\""+ all.roleId +"\" title=\"修改\">" +
                    "<svg class='icon' aria-hidden='true'>"+
                    "<use xlink:href='#icon-xiugai4'></use>"+
                    "</svg>"+
                    "</button>" +
                    "<button class='btn btn-light btn-sm page-button-delete' data-record=\""+ all.roleId +"\" title=\"删除\">" +
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
            });
        }
    })
}
/* 下拉框 */
function selectLoad(){
    selectUtil.findSelect("#optionSelect","roleType");
}
/* 条件查询 */
$('#select').on('click',function () {

    var option = $("#optionSelect option:selected").val();
    console.log(option);
    if(option == 0){
        option = '';
    }
    var json =
        {
            startTime: $("#startTime").val(),
            endTime: $("#endTime").val(),
            selectOption: option
        };
    jQuery("#jqTable").jqGrid('setGridParam', { postData: json }).jqGrid('setGridParam', { 'page': 1 }).trigger("reloadGrid");
    pageControl.getSearch(json);
})
/* 条件查询全部 */
$('#selectAll').on('click',function () {
    var json =
        {
            startTime: '',
            endTime: '',
            selectOption: ''
        };
    jQuery("#jqTable").jqGrid('setGridParam', { postData: json }).jqGrid('setGridParam', { 'page': 1 }).trigger("reloadGrid");
    $("#startTime").val('');
    $("#endTime").val('');
    $("#optionSelect").val(0);
    pageControl.getSearch(json);
})
/* 添加按钮 */
$('.save').on('click',function () {
    save();
})
/* 更新按钮 */
$('.update').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    var recordType = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
        recordType.push(rowData.entityConstantValue);
    }
    if(recordIds.length > 1){
        layer.msg("最多只能选择一条数据");
    }else if(recordIds.length < 1){
        layer.msg("请选择至少一条数据");
    }else {
        $.ajax({
            url: ctx + '/role/checkRoleType',
            type: 'post',
            dataType: 'json',
            data:
                {
                    roleType:recordType[0],
                    type:'3'
                },
            success:function (data) {
                if(data.status == 0){
                    var ids = CommUtils.getJqgridSelected("jqTable");
                    var rowData = $("#jqTable").jqGrid("getRowData", ids[0]);
                    update(rowData);
                }else {
                    layer.msg(data.message);
                }
            }
        })

    }
})
/* 删除按钮 */
$('.delete').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
    }
    del(recordIds);
})
/* 菜单授权按钮 */
$('.menu-authority').on('click',function () {
    var ids = CommUtils.getJqgridSelected("jqTable");
    var recordIds = [];
    var recordType = [];
    for (var i = 0; i < ids.length; i++) {
        var rowData = $("#jqTable").jqGrid('getRowData', ids[i]);
        recordIds.push(rowData.roleId);
        recordType.push(rowData.entityConstantValue);
    }
    if(recordIds.length > 1){
        layer.msg("最多只能选择一条数据");
    }else if(recordIds.length < 1){
        layer.msg("请至少选择一条数据");
    }else {
        $.ajax({
            url: ctx + '/role/checkRoleType',
            type: 'post',
            dataType: 'json',
            data:
                {
                    roleType:recordType[0],
                    type:'1'
                },
            success:function (data) {
                if(data.status == 0){
                    menuAuthority(recordIds[0]);
                }else {
                    layer.msg(data.message);
                }
            }
        })
    }
})
/* 职位授权按钮 */
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
        $.ajax({
            url: ctx + '/role/checkRoleType',
            type: 'post',
            dataType: 'json',
            data:
                {
                    roleType:recordType[0],
                    type:'2'
                },
            success:function (data) {
                if(data.status == 0){
                    jobAuthority(recordIds[0],recordType[0]);
                }else {
                    layer.msg(data.message);
                }
            }
        })
    }
})
/* 调用方法 */
function save() {
    layer.open({
        id: 'save-click',
        type:2,
        content:ctx + '/role/savePage',
        area: ['22%','25%'],
        title: '新增角色',
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
                        // jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
                        $("#jqTable").trigger("reloadGrid");
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
        layer.open({
            id: 'update-click',
            type:2,
            content:ctx + '/role/updatePage',
            area: ['22%','32%'],
            title: '修改角色',
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
                            // jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': pageControl.getPage()}).trigger("reloadGrid");
                            $("#jqTable").trigger("reloadGrid");
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
    }else {
        layer.msg("请选择至少一条数据");
    }
}
function del(recordIds) {
    if(recordIds.length > 0){
        layer.confirm('确认要删除吗？', {
            btn: ['确认','取消'],
            title: "提示",
            anim: 1
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
                        jQuery("#jqTable").trigger("reloadGrid");
                    } else {
                        layer.msg(data.message);
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
        type:2,
        content:ctx + '/role/menuPage',
        area: ['30%','65%'],
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
            iframeWin.showMenu();
            layer.iframeAuto(index);
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

            body.find("#page-button-save").on('click',function () {
                iframeWin.createJob(1);
            });
            body.find("#page-button-delete").on('click',function () {
                iframeWin.createJob(2);
            });
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
        var json = {
            depId: treeNode.id,
            roleId: $("#roleId").val(),
            roleType: $("#roleType").val()
        };
        jQuery("#jqTable-unSelect").jqGrid('setGridParam', {postData: json}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
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
function showMenu() {
    var roleId = $("#roleId").val();
    jQuery("#jqTable-menu").jqGrid({
        treeGrid:true,
        treeGridModel:"adjacency",
        ExpandColumn:"menuName",
        ExpandColClick:false,
        autoScroll:false,
        treeIcons:{plus:'fa fa-plus',minus:'fa fa-minus'},
        autowidth:true,
        jsonReader:{
            repeatitems:false
        },
        url:ctx + "/menu/findRoleByMenuList",
        datatype:'json',
        postData:{ roleId: roleId },
        pager:false,
        mtype:"POST",
        height:'100%',
        caption:"菜单列表",
        colNames:
            [
                "id", "菜单名称", "菜单顺序", "菜单编码", "菜单URL", "上级菜单", "是否有子级", "层级","是否已授权" ,"操作"
            ],
        colModel : [
            {name:"menuId",index:"menuId",width:1,key:true,hidden:true,sortable: false},
            {name:"menuName",index:"menuName",width:20,hidden:false,sortable: false},
            {name:"menuOrder",index:"menuOrder",width:5,hidden:true,sortable: false},
            {name:"menuCode",index:"menuCode",width:10,hidden:true,sortable: false},
            {name:"menuUrl",index:"menuUrl",width:10,hidden:true,sortable: false},
            {name:"menuPid",index:"menuPid",width:1,hidden:true,sortable: false},
            {name:"hasChild",index:"hasChild",width:1,hidden:true,sortable: false},
            {name:"menuLevel",index:"menuLevel",width:1,hidden:true,sortable: false},
            {name:"menuIsNull",index:"menuIsNull",width:1,hidden:true,sortable: false},
            {name:"operation",index:"operation",width: 3, hidden: false,sortable: false},
        ],
        treeReader: {
            level_field: "menuLevel",
            parent_id_field: "menuPid",
            leaf_field: "hasChild",
            expanded_field: "expanded",
        },

        onSelectRow:function (id){
        },
        gridComplete:function (){
            var ids = jQuery("#jqTable-menu").jqGrid('getDataIDs');
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                var all = $("#jqTable-menu").jqGrid('getRowData', cl);
                if(all.menuIsNull == null || all.menuIsNull == ''){
                    operation =
                        "<button class='btn btn-light btn-sm page-button-save' data-record=\""+ all.menuId +"\">" +
                        "<svg class='icon' aria-hidden='true'>"+
                        "<use xlink:href='#icon-cuo'></use>"+
                        "</svg>"+
                        "</button>"
                    jQuery("#jqTable-menu").jqGrid('setRowData', ids[i], { operation: operation });
                }else {
                    operation =
                        "<button class='btn btn-light btn-sm page-button-delete' data-record=\""+ all.menuId +"\">" +
                        "<svg class='icon' aria-hidden='true'>"+
                        "<use xlink:href='#icon-dui'></use>"+
                        "</svg>"+
                        "</button>"
                    jQuery("#jqTable-menu").jqGrid('setRowData', ids[i], { operation: operation });
                }
            }
            $('#jqTable-menu').on('click','.page-button-save',function () {
                var menuId = $(this).attr('data-record');
                saveMenu(menuId);
            })
            $('#jqTable-menu').on('click','.page-button-delete',function () {
                var menuId = $(this).attr('data-record');
                deleteMenu(menuId);
            })

            /**
             * 点击菜单边框收缩菜单时，动态变化表格宽度
             */
            $('#sidebar-collapse').click (function(){
                var winwidth = $('.page-content .col-xs-12').width(); // 当前窗口中，一行的宽度
                $("#jqTable-menu").setGridWidth(winwidth);
                $('.ui-jqgrid-bdiv').css('width',winwidth);
            });
            /**
             * 设置宽度
             */
            $(window).resize(function () {
                var winwidth = $('.page-content').width();
                $("#jqTable-menu").setGridWidth(winwidth);
                $('.ui-jqgrid-bdiv').css('width', winwidth);
            });
            setTimeout(function () {
                var winwidth = $('.page-content').width();
                $("#jqTable-menu").setGridWidth(winwidth);
                $('.ui-jqgrid-bdiv').css('width', winwidth);
            }, 0);
        }
    })
}
function createJob(type) {
    var roleId = $("#roleId").val();
    var roleType = $("#roleType").val();
    var jobIds = [];
    if(type == 1){
        var rowIds = CommUtils.getJqgridSelected("jqTable-unSelect");
        if (rowIds.length > 0) {
            for (var i = 0; i < rowIds.length; i++) {
                var rowData = $("#jqTable-unSelect").jqGrid('getRowData', rowIds[i]);
                jobIds.push(rowData.jobId);
            }
            addJob(roleId,jobIds,roleType);
        }else {
            layer.msg("请选择至少一条数据");
        }
    }else {
        var rowIds = CommUtils.getJqgridSelected("jqTable-select");
        if (rowIds.length > 0) {
            for (var i = 0; i < rowIds.length; i++) {
                var rowData = $("#jqTable-select").jqGrid('getRowData', rowIds[i]);
                jobIds.push(rowData.jobId);
            }
            deleteJob(roleId,jobIds,roleType);
        }else {
            layer.msg("请选择至少一条数据");
        }
    }
}
function addJob(roleId,jobIds,roleType) {
    $.ajax({
        url: ctx + '/role/addJob',
        type: 'post',
        dataType: 'json',
        traditional: true,
        data:
            {
                roleId: roleId,
                jobIds: jobIds,
                roleType: roleType
            },
        success: function (data) {
            var json =
                {
                    roleId: $("#roleId").val(),
                    roleType: $("#roleType").val()
                }
            if (data.status == 0) {
                jQuery("#jqTable-unSelect").jqGrid('setGridParam', {postData: json}).trigger("reloadGrid");
                jQuery("#jqTable-select").jqGrid('setGridParam', {postData: json}).trigger("reloadGrid");
            } else {
                layer.msg(data.message);
            }
        }
    })
}
function deleteJob(roleId,jobIds,roleType) {
    $.ajax({
        url: ctx + '/role/deleteJob',
        type: 'post',
        dataType: 'json',
        traditional: true,
        data:
            {
                roleId: roleId,
                jobIds: jobIds,
                roleType: roleType
            },
        success: function (data) {
            var json =
                {
                    roleId: $("#roleId").val(),
                    roleType: $("#roleType").val()
                }
            if (data.status == 0) {
                jQuery("#jqTable-unSelect").jqGrid('setGridParam', {postData: json}).trigger("reloadGrid");
                jQuery("#jqTable-select").jqGrid('setGridParam', {postData: json}).trigger("reloadGrid");
            } else {
                layer.msg(data.message);
            }
        }
    })
}
function saveMenu(menuId) {
    if(menuId != null){
        var roleId = $("#roleId").val();
        $.ajax({
            url:ctx + '/role/addMenu',
            type:'post',
            dataType:'json',
            data:
                {
                    menuId : menuId,
                    roleId : roleId,
                    roleType : '1' //没用,就是过一下验证类
                },
            success:function (data) {
                if(data.status == 0){
                    console.log("ok")
                }else {
                    layer.msg(data.message);
                }
            }
        })
    }else {
        layer.msg("数据错误,请重试");
    }
}
function deleteMenu(menuId) {
    if(menuId != null){
        var roleId = $("#roleId").val();
        $.ajax({
            url:ctx + '/role/deleteMenu',
            type:'post',
            dataType:'json',
            data:
                {
                    menuId : menuId,
                    roleId : roleId,
                    roleType : '2' //没用,就是过一下验证类
                },
            success:function (data) {
                if(data.status == 0){
                    console.log("ok")
                }else {
                    layer.msg(data.message);
                }
            }
        })
    }else {
        layer.msg("数据错误,请重试");
    }
}