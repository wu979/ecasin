laydate.render({
    elem: '.start-date-time',
    format: 'yyyy-MM-dd',
    closeStop: '.start-date-time',
    calendar: true,
    btns: ['clear'],
    done: function(value, date, endDate){
        var endTime = $('.end-date-time').val();
        if(value != null && value != ''){
            if(endTime != null && endTime != ''){
                if(value > endTime){
                    $('.start-date-time').val('');
                    layer.msg('开始时间不能大于结束时间');
                }
            }
        }
    }
});
laydate.render({
    elem: '.end-date-time',
    format: 'yyyy-MM-dd',
    closeStop: '.end-date-time',
    calendar: true,
    btns: ['clear'],
    done: function(value, date, endDate){
        var startTime = $('.start-date-time').val();
        if(value != null && value != ''){
            if(startTime != null && startTime != ''){
                if(value < startTime){
                    $('.end-date-time').val('');
                    layer.msg('结束时间不能小于开始时间');
                }
            }
        }
    }
});