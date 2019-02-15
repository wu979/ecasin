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
                "id",'',"角色类型","角色名称","角色标识码","创建时间","修改时间","操作"
            ],
        colModel : [
            {name:"roleId",index:"roleId",width:1,key:true,hidden:true,sortable: false},
            {name:"action", index: "action", width: 2, hidden: false,sortable: false},
            {name:"contantsName",index:"contantsName",width:12,hidden:false,sortable: false},
            {name:"roleName",index:"roleName",width:5,hidden:false,sortable: false},
            {name:"roleCode",index:"roleCode",width:10,hidden:false,sortable: false},
            {name:"roleCreateTime",index:"roleCreateTime",width:10,hidden:false,sortable: false},
            {name:"roleUpdateTime",index:"roleUpdateTime",width:1,hidden:true,sortable: false},
            {name:"operation",index:"operation",width: 4, hidden: false,sortable: false},
        ],
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
            // $('#jqTable').on('click','.page-button-update',function () {
            //     var menuId = $(this).attr('data-record');
            //     var row = forCheck(menuId);
            //     update(row);
            // })
            // $('#jqTable').on('click','.page-button-delete',function () {
            //     var menuId = $(this).attr('data-record');
            //     var row = forCheck(menuId);
            //     del(row);
            // })

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
    save();
})
$('.update').on('click',function () {
    update(rowData);
})
$('.delete').on('click',function () {
    del(rowData);
})

function save() {
    layer.open({
        id: 'save-click',
        type:2,
        content:ctx + '/role/savePage',
        area: ['23%','40%'],
        title: '新增菜单',
        scrollbar: false,
        zIndex: 1050,
        btn: ['保存','取消'],
        success: function(layero, index){
            var constantType = 'roleType';
            selectUtil.findSelect(layero,"#roleType",constantType);
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
}
function update(rowData) {

}
function del(rowData) {

}
