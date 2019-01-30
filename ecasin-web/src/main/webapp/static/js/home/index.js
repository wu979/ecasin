
var count = 0;
getTreeList();

function getTreeList(){
    $.ajax({
        url:ctx + "/home/getTreeList",
        type:'post',
        dataType:'json',
        success:function (data) {
            if(data.status == 0) {
                if(data.data != null && data.data.length > 0){

                    //生成菜单
                    var e = menuFor(data.data);
                    $("#navMenu").append(e);

                    //刷新   加载页面和菜单
                    if(count == 0) {
                        var clickParent = sessionStorage.getItem('clickParent');
                        var clickUrl = sessionStorage.getItem('clickUrl');
                        var clickTitle = sessionStorage.getItem('clickTitle');
                        if (clickUrl == null || clickUrl == '') {
                            $("#content-page").load(ctx + "/home/index", function () {

                            });
                        } else {
                            $("#content-page").load(ctx + clickUrl, function () {
                                commonOpen(clickUrl);
                            });
                        }

                        //加载上方菜单导航
                        if(clickUrl == null || clickUrl == ''){
                            clickUrl = '/home/index'
                        }
                        if(clickTitle == null || clickUrl == ''){
                            clickTitle = '首页'
                        }
                        $("#topMenu").html('');
                        menuTop(clickParent,clickUrl,clickTitle);
                        count = 0;
                    }

                    //点击菜单事件
                    $(".menu-url").on('click',function () {

                        var menuUrl = $(this).attr('menu_url');
                        var menuTitle = $(this).attr('menu_title');

                        //调用递归
                        commonOpen(menuUrl);

                        //加载上方菜单导航
                        var menuParent = $(this).attr('menu_parent');
                        $("#topMenu").html('');
                        menuTop(menuParent,menuUrl,menuTitle);

                        //将页面路径存储到 session
                        $("#content-page").load(ctx + menuUrl,function () {
                            sessionStorage.setItem('loadUrl',menuUrl);
                            sessionStorage.setItem('clickParent',menuParent);
                            sessionStorage.setItem('clickUrl',menuUrl);
                            sessionStorage.setItem('clickTitle',menuTitle);
                        });

                        count ++;
                    });


                }
            }else {
                myAlert(data.message,function (f) {},false);
            }

        }
    })
}
function commonOpen(menuUrl) {

    //清除所有的 li ul 属性
    $("#navMenu ul").css('cssText','display : none;');
    $("#navMenu li").removeClass('active');
    var open = $("#navMenu .open");
    $.each(open , function (a,b) {
        $(b).removeClass('open');
    })

    //取到所有 A
    var navMenuA = $('#navMenu a');
    $.each(navMenuA , function (a,b) {
        var navUrl = $(b).attr('menu_url');
        if(navUrl == menuUrl){
            var navLevel = $(b).attr('menu_level');
            //层级为1 就只有一个. 只是打开 li 标签
            if(navLevel == 1){
                $(b).parent('li').addClass('active');
            }else {
                checkOpen(b,navMenuA);
            }
        }
    })
}
function checkOpen(b,navMenuA) {
    //给点击的对象的父级 li  加上 open
    $(b).parent('li').addClass('active open');
    //给点击的对象的父级 li 的父级 ul 修改 display 属性
    $(b).parent('li').parent('ul').css('cssText','display: block;');
    //获取点击对象的父级id 循环判断所有 A 标签  找到父级 A 标签 递归
    var menuParentId = $(b).attr('menu_parent');
    $.each(navMenuA , function (aA,bA) {
        var menuId = $(bA).attr('menu_id');
        if(menuParentId == menuId){
            checkOpen(bA,navMenuA);
        }
    })

    //递归到 层级为1  给最外面一层加上 open  return
    var navLevel = $(b).attr('menu_level');
    if(navLevel == 1 ){
        $(b).parent('li').addClass('open');
        return ;
    }
}
var topCount = 0;
var arr = [];
function menuTop(menuParent,menuUrl,menuTitle) {
    var html = '';
    var navMenuA = $('#navMenu a');
    if(menuUrl != '/home/index' && menuTitle != '首页') {
        if (topCount == 0) {
            arr.push('<li class="active" style="padding: 0 4px 0 4px;">' + menuTitle + '</li>')
            topCount++;
        }
        $.each(navMenuA, function (a, b) {
            var menuId = $(b).attr('menu_id');
            if (menuParent == menuId) {
                var levelB = $(b).attr('menu_level');
                var parentB = $(b).attr('menu_parent');
                var titleB = $(b).attr('menu_title');
                if (levelB == 1) {
                    arr.push(
                        '<li class="active" style="padding: 0 4px 0 4px;">' + titleB + '</li>'
                    )
                    arr.push(
                        '<li class="active" style="padding: 0 4px 0 4px;">' +
                        '<svg class="icon top-menu-home" aria-hidden="true">'+
                        '<use xlink:href="#icon-home"></use>'+
                        '</svg>'+
                        '首页' +
                        '</li>'
                    )


                    for(var v = arr.length-1 ; v >= 0; v--) {
                        html += arr[v];
                    }
                    $("#topMenu").append(html);
                    return;
                } else {
                    arr.push(
                        '<li class="active" style="padding: 0 4px 0 4px;">' + titleB + '</li>'
                    )
                    menuTop(parentB, null, null);
                }
            }
        })
    }else {
        arr.push(
            '<li class="active" style="padding: 0 4px 0 4px;">' +
            '<svg class="icon top-menu-home" aria-hidden="true">'+
            '<use xlink:href="#icon-home"></use>'+
            '</svg>'+
            '首页' +
            '</li>'
        )
        for(var v = arr.length-1 ; v >= 0; v--) {
            html += arr[v];
        }
        $("#topMenu").append(html);
    }
    arr = [];
    topCount = 0;
}
function menuFor(data) {
    var src = '';
    for(var i = 0 ; i< data.length ; i ++){
        var string = '';
        if(data[i].children == null  || data[i].children.length < 1){
            if(data[i].title == '首页' &&  data[i].code == 'MENU_HOME'){
            string =
                '<li class="active">'+
                    '<a href="javascript:;" class="menu-url li-A" menu_id="'+data[i].id+ '" menu_url="'+ data[i].url + '" menu_level="'+ data[i].level  +'" menu_isLast= "' +data[i].isLast+ '" menu_parent="'+ data[i].parentId+'" menu_title="'+ data[i].title +'">'+
                        '<svg class="icon left-menu" aria-hidden="true">'+
                            '<use xlink:href="#icon-home"></use>'+
                        '</svg>'+
                        '<span class="menu-text"> '+ data[i].title +' </span>'+
                    '</a>'+
                '</li>'
            }else {
                if(data[i].level == 1){
                    string =
                        '<li>'+
                            '<a href="javascript:;" class="menu-url li-A" menu_id="'+data[i].id+ '" menu_url="'+ data[i].url + '" menu_level="'+ data[i].level  +'" menu_isLast= "' +data[i].isLast+ '" menu_parent="'+ data[i].parentId+'" menu_title="'+ data[i].title +'">'+
                                '<svg class="icon left-menu" aria-hidden="true">'+
                                    '<use xlink:href="#icon-list"></use>'+
                                '</svg>'+
                                '<span class="menu-text"> '+ data[i].title +' </span>'+
                            '</a>'+
                        '</li>'
                }else {
                    var iClass = '';
                    if(data[i].level > 2){

                        iClass = '<svg class="icon left-menu" aria-hidden="true">'+
                            '<use xlink:href="#icon-star"></use>'+
                            '</svg>';

                    }else {
                        iClass = '<i class="icon-caret-right"></i>'
                    }

                    string =
                        '<li>'+
                            '<a href="javascript:;" class="menu-url li-A" menu_id="'+data[i].id+ '" menu_url="'+ data[i].url + '" menu_level="'+ data[i].level  +'" menu_isLast= "' +data[i].isLast+ '" menu_parent="'+ data[i].parentId+'" menu_title="'+ data[i].title +'">'+
                                iClass+
                                '<span class="menu-text"> '+ data[i].title +' </span>'+
                            '</a>'+
                        '</li>'
                }
            }
        }else {
            var iClass = '';
            if(data[i].level == 1) {
                iClass = '<svg class="icon left-menu" aria-hidden="true">'+
                            '<use xlink:href="#icon-list"></use>'+
                         '</svg>'
            }

            if(data[i].level > 1){
                iClass = '<i class="icon-caret-right"></i>';
            }
            string =
                '<li>'+
                    '<a href="javascript:;" class="dropdown-toggle li-A"  menu_id="'+data[i].id+ '" menu_url="'+ data[i].url + '" menu_level="'+ data[i].level  +'" menu_isLast= "' +data[i].isLast+ '" menu_parent="'+ data[i].parentId+'" menu_title="'+ data[i].title +'">'+
                        iClass +
                        '<span class="menu-text"> '+ data[i].title +' </span>'+
                        '<b class="arrow icon-angle-down"></b>'+
                    '</a>'+
                    '<ul class="submenu"> '+
                        menuFor(data[i].children) +
                    '</ul>'+
                '</li>'
        }
        src += string;
    }
    return src;
}
function logout() {
    localStorage.clear();
    sessionStorage.clear();
}
function updatePagerIcons (table) {
    var replacement =
        {
            'ui-icon-seek-first' : 'icon-double-angle-left bigger-140',
            'ui-icon-seek-prev' : 'icon-angle-left bigger-140',
            'ui-icon-seek-next' : 'icon-angle-right bigger-140',
            'ui-icon-seek-end' : 'icon-double-angle-right bigger-140'
        };
    $ ('.ui-pg-table:not(.navtable) > tbody > tr > .ui-pg-button > .ui-icon').each (function ()
    {
        var icon = $ (this);
        var $class = $.trim (icon.attr ('class').replace ('ui-icon', ''));

        if ($class in replacement)
            icon.attr ('class', 'ui-icon ' + replacement[$class]);
    })
}


