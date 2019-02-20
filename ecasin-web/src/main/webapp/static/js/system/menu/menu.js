var rowData;
loadPage();
function loadPage(){
    jQuery("#jqTable").jqGrid({
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

        url:ctx + "/menu/findByPage",
        datatype:'json',
        pager:false,
        mtype:"POST",
        height:"100%",
        caption:"菜单列表",
        colNames:
            [
                "id", "菜单名称", "菜单顺序", "菜单编码", "菜单URL", "上级菜单", "是否有子级", "层级", "操作"
            ],
        colModel : [
            {name:"menuId",index:"menuId",width:1,key:true,hidden:true,sortable: false},
            {name:"menuName",index:"menuName",width:12,hidden:false,sortable: false},
            {name:"menuOrder",index:"menuOrder",width:5,hidden:false,sortable: false},
            {name:"menuCode",index:"menuCode",width:10,hidden:false,sortable: false},
            {name:"menuUrl",index:"menuUrl",width:10,hidden:false,sortable: false},
            {name:"menuPid",index:"menuPid",width:1,hidden:true,sortable: false},
            {name:"hasChild",index:"hasChild",width:1,hidden:true,sortable: false},
            {name:"menuLevel",index:"menuLevel",width:1,hidden:true,sortable: false},
            {name: 'operation',index: 'operation',width: 4, hidden: false,sortable: false},
        ],
        treeReader: {
            level_field: "menuLevel",
            parent_id_field: "menuPid",
            leaf_field: "hasChild",
            expanded_field: "expanded",
        },

        onSelectRow:function (id){
            var all = $("#jqTable").jqGrid('getRowData', id);
            // var recordId = all.menuId;
            // var rowData = $("#groupManage-table").jqGrid("getRowData", ids[0]);
            rowData = all;
        },
        gridComplete:function (){
            var ids = jQuery("#jqTable").jqGrid('getDataIDs');
            for (var i = 0; i < ids.length; i++) {
                var cl = ids[i];
                var all = $("#jqTable").jqGrid('getRowData', cl);
                operation =
                    "<button class='btn btn-light btn-sm page-button-save' data-record=\""+ all.menuId +"\">" +
                        "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-hangadd'></use>"+
                        "</svg>"+
                    "</button>" +
                    "<button class='btn btn-light btn-sm page-button-update' data-record=\""+ all.menuId +"\">" +
                        "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-xiugai4'></use>"+
                        "</svg>"+
                    "</button>" +
                    "<button class='btn btn-light btn-sm page-button-delete' data-record=\""+ all.menuId +"\">" +
                        "<svg class='icon' aria-hidden='true'>"+
                            "<use xlink:href='#icon-shanchu3'></use>"+
                        "</svg>"+
                    "</button>"
                jQuery("#jqTable").jqGrid('setRowData', ids[i], { operation: operation });
            }
            $('#jqTable').on('click','.page-button-save',function () {
                var menuId = $(this).attr('data-record');
                var row = forCheck(menuId);
                save(row);
            })
            $('#jqTable').on('click','.page-button-update',function () {
                var menuId = $(this).attr('data-record');
                var row = forCheck(menuId);
                update(row);
            })
            $('#jqTable').on('click','.page-button-delete',function () {
                var menuId = $(this).attr('data-record');
                var row = forCheck(menuId);
                del(row);
            })

            /**
             * 点击菜单边框收缩菜单时，动态变化表格宽度
             */
            $('#sidebar-collapse').click (function(){
                var winwidth=$('.main-content .col-xs-12').width(); // 当前窗口中，一行的宽度
                $("#jqTable").setGridWidth(winwidth);
                $('.ui-jqgrid-bdiv').css ('width',winwidth+1);
            });
            /**
             * 设置宽度
             */
            $(window).resize(function () {
                var winwidth = $('.page-content').width();
                $("#jqTable").setGridWidth(winwidth-40);
                $('.ui-jqgrid-bdiv').css('width', winwidth -40);
            });
            setTimeout(function () {
                var winwidth = $('.page-content').width();
                $("#jqTable").setGridWidth(winwidth-40);
                $('.ui-jqgrid-bdiv').css('width', winwidth -40);
            }, 0);
        }
    })
}


$('.save').on('click',function () {
    save(rowData);
})
$('.update').on('click',function () {
    update(rowData);
})
$('.delete').on('click',function () {
    del(rowData);
})
function save(rowData) {
    if(rowData != '' && rowData != null){
        layer.open({
            id: 'save-click',
            type:2,
            content:ctx + '/menu/savePage',
            area: ['23%','53%'],
            title: '新增菜单',
            scrollbar: false,
            anim: 1,
            resize:false,
            zIndex: 1050,
            btn: ['保存','取消'],
            success: function(layero, index){
                var parentName = $('#parentName',layero.find("iframe")[0].contentWindow.document);
                var menuPid = $('#menuPid',layero.find("iframe")[0].contentWindow.document);
                parentName.val(rowData.menuName);
                menuPid.val(rowData.menuId);
            },
            yes: function (index, layero) {
                $.ajax({
                    url: ctx + '/menu/save',
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
    }else {
        layer.msg("请选择至少一条数据");
    }
}
function update(rowData) {
    if(rowData != '' && rowData != null){
        if(rowData.menuLevel == 0 && rowData.menuId == 'root_parent'){
            layer.msg("该条数据不能进行操作");
        }else {
            layer.open({
                id: 'update-click',
                type:2,
                content:ctx + '/menu/updatePage',
                area: ['23%','53%'],
                title: '新增菜单',
                scrollbar: false,
                anim: 1,
                resize:false,
                zIndex: 1050,
                btn: ['修改','取消'],
                success: function(layero, index){
                    var parentName;
                    if(rowData.menuLevel == 1){
                        parentName = "所有菜单";
                        $('#parentName',layero.find("iframe")[0].contentWindow.document).val(parentName);
                        $('#menuPid',layero.find("iframe")[0].contentWindow.document).val(rowData.menuId);
                        $('#menuName',layero.find("iframe")[0].contentWindow.document).val(rowData.menuName);
                        $('#menuCode',layero.find("iframe")[0].contentWindow.document).val(rowData.menuCode);
                        $('#menuUrl',layero.find("iframe")[0].contentWindow.document).val(rowData.menuUrl);
                        $('#menuOrder',layero.find("iframe")[0].contentWindow.document).val(rowData.menuOrder);
                    }else {
                        $.ajax({
                            url: ctx + '/menu/findParentNameById',
                            type: 'post',
                            dataType: 'json',
                            data: { recordId : rowData.menuId },
                            success:function (data) {
                                if(data.status == 0){
                                    parentName = data.data.menuName;
                                    $('#parentName',layero.find("iframe")[0].contentWindow.document).val(parentName);
                                    $('#menuPid',layero.find("iframe")[0].contentWindow.document).val(rowData.menuId);
                                    $('#menuName',layero.find("iframe")[0].contentWindow.document).val(rowData.menuName);
                                    $('#menuCode',layero.find("iframe")[0].contentWindow.document).val(rowData.menuCode);
                                    $('#menuUrl',layero.find("iframe")[0].contentWindow.document).val(rowData.menuUrl);
                                    $('#menuOrder',layero.find("iframe")[0].contentWindow.document).val(rowData.menuOrder);
                                }else {
                                    layer.close(index);
                                    layer.msg(data.message);
                                }
                            }
                        })
                    }

                },
                yes: function (index, layero) {
                    $.ajax({
                        url: ctx + '/menu/update',
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
function del(rowData) {
    if(rowData != '' && rowData != null){
        if(rowData.menuId == 'root_parent' && rowData.menuName == '所有菜单'){
            layer.msg("该条数据不能进行操作");
        }else {
            layer.confirm('确认要删除吗？', {
                btn: ['确认','取消'],
                title: "提示"
            }, function() {
                $.ajax({
                    url: ctx + '/menu/delete',
                    type: 'post',
                    dataType: 'json',
                    data:
                        {
                            ids: rowData.menuId,
                        },
                    success: function (data) {
                        if (data.status == 0) {
                            layer.close();
                            layer.msg(data.data);
                            jQuery("#jqTable").jqGrid('setGridParam', {postData: ''}).jqGrid('setGridParam', {'page': 1}).trigger("reloadGrid");
                        } else {
                            layer.msg(data.message);
                        }
                    }
                })
            }, function () {
                //点击取消事件
            });
        }
    }else {
        layer.msg("请选择至少一条数据");
    }
}
function forCheck(menuId) {
    var row;
    var ids = jQuery("#jqTable").jqGrid('getDataIDs');
    for (var i = 0; i < ids.length; i++) {
        var cl = ids[i];
        var all = $("#jqTable").jqGrid('getRowData', cl);
        if(all.menuId == menuId){
            row = all;
        }
    }
    return row;
}