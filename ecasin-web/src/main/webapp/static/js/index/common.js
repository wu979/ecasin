var href =window.location.href;
var ctx = href.substring(0,find(href,"/",3));
function find(str,cha,num){
    var x=str.indexOf(cha);
    for(var i=0;i<num;i++){
        x=str.indexOf(cha,x+1);
    }
    return x;
}

//系统弹框
function myAlert(str,click,useCancel){
    var overflow="";
    var $hidder=null;
    var clickHandler=click||$.noop;
    var myClickHandler=function(){
        $hidder.remove();
        $("body").css("overflow",overflow);
        clickHandler($(this).html()=="确定");
    };
    var init=function(){
        $hidder = $("<div style='width:100%;height:100%;background:rgba(0,0,0,0.5);z-index:1000;text-align: center;position:fixed;left:0;top:0;'></div>");
        var $myalert = $("<div style='width:300px;position:absolute;top:30%;left:50%;margin-left:-150px;padding:20px;background:#fff;border-radius:5px;'>"+
            "<div style='padding-bottom:10px;border-bottom:1px solid #e5e5e5;font-size:20px;color:#f83;'>温馨提示</div></div>")
            .appendTo($hidder);
        $("<div style='padding:10px 0;color:#333;border-bottom:1px solid #e5e5e5;'>"+str+"</div>").appendTo($myalert);
        var $myalert_btn_div = $("<div style='padding-top:10px;'></div>").appendTo($myalert);
        var $okBtn = $("<div style='float:left;width:100%;color:#eee;border-radius:2px;padding:7px 0;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;' class='bluebg1'>确定</div>")
            .appendTo($myalert_btn_div).click(myClickHandler);
        if(useCancel){
            $okBtn.css({"width":"50%","border-right":"5px solid #fff"});
            $("<div style='float:left;width:50%;border-left:5px solid #fff;border-radius:2px;padding:7px 0;color:#fff;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;background:#ccc;'>取消</div>")
                .appendTo($myalert_btn_div).click(myClickHandler);
        }
        overflow=$("body").css("overflow");
        $("body").css("overflow","hidden").append($hidder);
    };
    init();
}

//取得jqgrid 选中
var CommUtils = {
    // 取Jqgrid的checkbox中的值
    getJqgridSelected: function (elementId) {
        var ids = [];
        var checkboxs = $(document.getElementById(elementId)).find("input[type=checkbox][name='grid-checkbox'].ace:checked");
        $.each(checkboxs, function (index, element) {
            ids.push($(element).val());
        });
        if (ids.length == 0) {
            var radios = $(document.getElementById(elementId)).find("input[type=radio].ace:checked");
            $.each(radios, function (index, element) {
                ids.push($(element).val());
            });
        }
        return ids;
    },
    commAudit: function (options) {
        options.delIds = options.delIds.join(",");
        if (!options.gridTableId) {
            options.gridTableId = "grid-table";
        }
        if (!options.url) {
            options.url = "delete";
        }
        $(document.getElementById(options.modalId)).load(ctx + "/common/auditRequest",
            {
                msg: options.msg,
                ids: options.delIds,
                modalId: options.modalId,
                gridTableId: options.gridTableId,
                url: options.url,
                seconds: '3000',
                tips: ''
            }
            , ''
        );
    },
    commConfirm: function (msg, fn) {
        swal({
            title: "操作提示",
            text: msg,
            type: "success",
            showCancelButton: false,
            cancelButtonText: "取消",
            confirmButtonColor: "#8cd4f5",
            confirmButtonText: "确定",
            closeOnConfirm: false
        }, fn);
    },
    commSuccess: function (msg) {
        sweetAlert({
            title: "操作提示",
            text: msg,
            type: "success",
            confirmButtonText: '确定',
            confirmButtonColor: '#307ECC',
        })
    },
    commwait: function (msg) {
        swal({
            title: msg,
            imageUrl: ctx + '/static/images/loading.gif',
            allowOutsideClick: false,
            showConfirmButton: false
        });
    },
    commAlert: function (modalId, msg, fn) {
        sweetAlert({
                title: "操作提示",
                text: msg,
                type: "error",
                confirmButtonText: '确定',
                confirmButtonColor: '#307ECC',
            },
            fn);
    },
    commDelete: function (options) {
        options.delIds = options.delIds.join(",");
        if (!options.gridTableId) {
            options.gridTableId = "grid-table";
        }
        if (!options.url) {
            options.url = "delete";
        }
        sweetAlert({
            title: "操作提示",
            text: options.msg,
            type: "warning",
            confirmButtonText: '确定',
            confirmButtonColor: '#307ECC',
            showCancelButton: true,
            closeOnConfirm: false,
            cancelButtonText: '取消'
        }, function () {
            $.ajax({
                url: options.url,
                data: "delIds=" + options.delIds,
                dataType: 'json'
            }).success(function (data) {
                if (data) {
                    swal("操作提示!", "操作成功!", "success");
                    if (options.gridTableId) {
                        $('#' + options.gridTableId).trigger("reloadGrid");
                    }
                    if (options.treeId) {
                        $('#' + options.treeId).jstree("refresh");
                    }
                    if (options.reload) {
                        location.reload(true);
                    }
                } else {
                    swal(" 操作提示", "服务繁忙，请稍后重试！", "error");
                }
            }).error(function (data) {
                swal(" 操作提示", "服务繁忙，请稍后重试！", "error");
            })
        });
    },
    commRefreshTree: function (elementId) {
        $(document.getElementById(elementId)).jstree("refresh");
    },
    activateSearchMore: function () {
        $(".search-more").click(function () {
            var nextShow = true;
            if ($(".search-more i").attr("class") == "icon-chevron-up") {
                nextShow = false;
            }
            if (nextShow) {
                $(".search-more i").attr("class", "icon-chevron-up");
                $("#search_more_tip").html("收起");
                $(".search-hide").slideDown(150);
            }
            else {
                $(".search-more i").attr("class", "icon-chevron-down");
                $("#search_more_tip").html("更多");
                $(".search-hide").slideUp(150);
            }
        })
    },
    checkSelect: function(ids){
        if(ids.length == 1){
            return true;
        }else{
            if(ids.length > 1){
                layer.msg("只能选择一条数据");
                return false;
            }else {
                layer.msg("请选择一条数据");
                return false;
            }
        }
    }
}

//取得jqgrid 页码
var pageControl = {
    //获取当前表格页码
    getPage: function () {
        var pageNum = 1;
        if (sessionStorage.getItem('page')) {
            pageNum = Number(sessionStorage.getItem('page'));
        }
        return pageNum;
    },
    //获取当前表格条数
    getRowNum: function () {
        var pagesNums = 10;

        if (sessionStorage.getItem('rowNum')) {
            pagesNums = Number(sessionStorage.getItem('rowNum'));
        }
        return pagesNums;
    },
    //将当前表格页码和条数放入地址栏
    setPage: function (id) {

        var page = $(id).jqGrid('getGridParam', 'page');
        var rowNum = $(id).jqGrid('getGridParam', 'rowNum');
        sessionStorage.setItem('page', page);
        sessionStorage.setItem('rowNum', rowNum);

    },
    //获取页面搜索内容，放入session；
    getSearch: function (json) {
        var searchData = {};
        $.map($(".page-content").find('input'), function (item, index) {
            if ($(item).attr('id')) {
                searchData[$(item).attr('id')] = $(item).val()
            }

        })
        $.map($(".page-content").find('select'), function (item, index) {
            if ($(item).attr('id')) {
                searchData[$(item).attr('id')] = $(item).val()
            }
        })
        sessionStorage.setItem('searchData', JSON.stringify(searchData));
        sessionStorage.setItem('json', JSON.stringify(json));
    },
    //将session放入页面的搜索框
    setSearch: function () {
        var setData = JSON.parse(sessionStorage.getItem('searchData'));
        $.map($(".page-content").find('input'), function (item, index) {
            if ($(item).attr('id')) {
                try {
                    if(setData[$(item).attr('id')]){
                        $(item).val(setData[$(item).attr('id')])
                    }
                } catch (error) {
                    // console.log(error)
                }
            }
        })
        $.map($(".page-content").find('select'), function (item, index) {
            if ($(item).attr('id')) {
                try {
                    if(setData[$(item).attr('id')]){
                        $(item).val(setData[$(item).attr('id')])
                    }
                } catch (error) {
                    // console.log(error)
                }
            }
        })
    },
    //获取搜索条件
    getJson:function(json){
        var json1=JSON.parse(sessionStorage.getItem('json'));
        if(json){
            for(var key in json){
                json1[key]=json[key];
            }
        }
        return json1;
    }
}

//下拉框赋值
var selectUtil = {
    //弹窗赋值select
    findModelSelect : function(layero,id,constantType) {
        $.ajax({
            url:ctx +  '/constant/findByList',
            type:'post',
            dataType:'json',
            data:
                {
                    constantType:constantType
                },
            success:function (data) {
                if(data.status == 0){
                    var constantList = data.data;
                    var result = '';
                    for(var i = 0; i< constantList.length; i++){
                        result += "<option value='"+ constantList[i].constantId + " '>"+ constantList[i].contantsName +"</option>";
                    }
                    $(id,layero.find("iframe")[0].contentWindow.document).html(result);
                }else {
                    layer.msg(data.message);
                }
            }
        })
    },
    //弹窗赋值select
    findSelect : function(id,constantType) {
        $.ajax({
            url:ctx +  '/constant/findByList',
            type:'post',
            dataType:'json',
            data:
                {
                    constantType:constantType
                },
            success:function (data) {
                if(data.status == 0){
                    var constantList = data.data;
                    var result = '';
                    for(var i = 0; i< constantList.length; i++){
                        result += "<option value='"+ constantList[i].constantId + " '>"+ constantList[i].contantsName +"</option>";
                    }
                    $(id).append(result);
                }else {
                    layer.msg(data.message);
                }
            }
        })
    },
}
