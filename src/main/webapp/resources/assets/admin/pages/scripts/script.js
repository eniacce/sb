$(function () {
    $(".knob").knob({
        'dynamicDraw': true,
        'thickness': 0.2,
        'tickColorizeValues': true,
        'skin': 'tron'
    });

    $(".startLoading").click(function () {
        showLoading();
    });

    $('.bs-select').selectpicker({
        iconBase: 'fa',
        tickIcon: 'fa-check'
    });
    $('.icheck').iCheck({
        checkboxClass: 'icheckbox_minimal-blue'
    });

});

function calenderSetting(label, date, startDatej, endDatej, lang) {
    if (lang == "en") {
        label_ranges = {
            'Day': [moment(), moment()],
            'Yesterday': [moment().subtract('days', 1), moment().subtract('days', 1)],
            'Last 7 Days': [moment().subtract('days', 6), moment()],
            'Last 30 Days': [moment().subtract('days', 29), moment()],
            'This Month': [moment().startOf('month'), moment().endOf('month')],
            'Last Month': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
        };
        label_locale = {
            applyLabel: 'Run',
            fromLabel: 'Beginning',
            toLabel: 'End',
            customRangeLabel: 'Select Date',
            daysOfWeek: ['Su', 'Mo', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
            firstDay: 1
        };
    }
    else if (lang == "tr") {
        label_ranges = {
            'Bugün': [moment(), moment()],
            'Dün': [moment().subtract('days', 1), moment().subtract('days', 1)],
            'Son 7 Gün': [moment().subtract('days', 6), moment()],
            'Son 30 Gün': [moment().subtract('days', 29), moment()],
            'Bu Ay': [moment().startOf('month'), moment().endOf('month')],
            'Geçen Ay': [moment().subtract('month', 1).startOf('month'), moment().subtract('month', 1).endOf('month')]
        };

        label_locale = {
            applyLabel: 'Getir',
            fromLabel: 'Başlangıç',
            toLabel: 'Bitiş',
            customRangeLabel: 'Tarih Seç',
            daysOfWeek: ['Pa', 'Pzt', 'Sa', 'Ça', 'Pe', 'Cu', 'Cmt'],
            monthNames: ['Ocak', 'Şubat', 'Mart', 'Nisan', 'Mayıs', 'Haziran', 'Temmuz', 'Ağustos', 'Eylül', 'Ekim', 'Kasım', 'Aralık'],
            firstDay: 1
        };
    }
    $('#' + label + ' span').html(date);

    $('#' + label).daterangepicker({
            startDate: startDatej,
            endDate: endDatej,
            minDate: '01/01/2012',
            maxDate: '12/31/2020',
            dateLimit: {
                days: 360
            },
            showDropdowns: true,
            showWeekNumbers: false,
            timePicker: false,
            timePickerIncrement: 1,
            timePicker12Hour: true,
            ranges: label_ranges,
            buttonClasses: ['btn btn-sm'],
            applyClass: ' blue',
            cancelClass: 'default',
            format: 'MM/DD/YYYY',
            separator: ' - ',
            locale: label_locale
        },
        function (start, end, period) {
            window.start = start;
            window.end = end;
            if (label == "dashboard-report-range") {
                if (period != "hour" || period != "day" || period != "week" || period != "month") {
                    getChart(start, end, "day", 1);
                } else {
                    getChart(start, end, period, 6);
                }
            } else {
                $('#startDate').val(start.format('YYYY-MM-DD'));
                $('#endDate').val(end.format('YYYY-MM-DD'));
                $('#' + label + ' span').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
                $('#' + label).show();
            }
        });

}

function getChart(start, end, period, tick) {
    $('#dashboard-report-range span').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
    $('#topmerchantDate').html(start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'));
    $.ajax({
        type: 'GET',
        dataType: 'json',
        data: 'q=index&startDate=' + start.format('YYYY-MM-DD') + '&endDate=' + end.format('YYYY-MM-DD') + "&period=" + period,
        beforeSend: function () {
            showLoading();
        },
        success: function (data) {
            chartCrate(data, start.format('D MMMM YYYY') + ' - ' + end.format('D MMMM YYYY'), 'en', period, tick);
            getInfo(data);
            hideLoading();
        },
        error: function () {

        },
        url: '/ajax/index',
        cache: false
    });
}

function getInfo(data) {
    $("#avea_success_total").html(data.dataInfo.aveaSuccessFullTransaction);
    $("#avea_success_amount").html(data.dataInfo.aveaTotalAmount);
    $("#avea_avarage_amount").html("<b>" + data.dataInfo.aveaTotalAvarage + "</b>");

    $("#vodafone_success_total").html(data.dataInfo.vodafoneSuccessFullTransaction);
    $("#vodafone_success_amount").html(data.dataInfo.vodafoneTotalAmount);
    $("#vodafone_avarage_amount").html("<b>" + data.dataInfo.vodafoneTotalAvarage + "</b>");

    $("#turkcell_success_total").html(data.dataInfo.turkcellSuccessFullTransaction);
    $("#turkcell_success_amount").html(data.dataInfo.turkcellTotalAmount);
    $("#turkcell_avarage_amount").html("<b>" + data.dataInfo.turkcellTotalAvarage + "</b>");

    $("#total_success_total").html(data.dataInfo.successFullTransaction);
    $("#total_success_amount").html(data.dataInfo.totalAmount);
    $("#total_avarage_amount").html("<b>" + data.dataInfo.totalAvarage + "</b>");

    $("#topMerchant").html(data.topMerchant);
}

function chartCrate(data, date, lang, period, tick) {

    if (lang == "en") {
        label_daily = "Daily";
        label_hourly = "Hourly";
        label_weekly = "Weekly";
        label_monthly = "Monthly";
        label_op = " Transactions by operator";
        label_total = "Period Total";
    }
    else if (lang == "tr") {
        label_daily = "Günlük";
        label_hourly = "Saatlik";
        label_weekly = "Haftalık";
        label_monthly = "Aylık";
        label_op = " Operatör Kırılımlı İşlem Grafiği";
        label_total = "Toplam";
    }

    var period1 = "";
    if (period == "day") {
        period1 = label_daily;
    }
    else if (period == "hour") {
        period1 = label_hourly;
    }
    else if (period == "week") {
        period1 = label_weekly;
    }
    else if (period == "month") {
        period1 = label_monthly;
    }
    else {
        period1 = label_daily;
    }

    var plus = 0;
    $.each(data.data[99], function (index, value) {
        plus += value;
    });
    chart = new Highcharts.Chart({

        chart: {
            renderTo: 'site_activities',
            defaultSeriesType: 'line',
            marginRight: 0,
            marginBottom: 100,
            zoomType: 'x',
            shadow: true
        },
        credits: {
            enabled: false
        },
        title: {
            text: date + " ( " + label_total + " : " + currencyFormat(plus) + " )",
            x: 0
        },
        subtitle: {
            text: period1 + label_op,
            x: 0
        },

        xAxis: {
            minTickInterval: tick,
            categories: data.date[1]
        },
        yAxis: {
            title: {
                text: 'TL'
            },
            min: 0,
            gridLineDashStyle: 'dash',
            plotLines: [
                {
                    value: 0,
                    width: 1,
                    color: '#808080'
                }
            ]
        },
        tooltip: {
            formatter: function () {
                return '<span style="color:' + this.series.color + '">' + this.series.name + '</span><br/>' +
                    currencyFormat(this.y) + '<br/><b>' + ((period == "hour") ? dateHour(this.x) + ':00-' + dateHour(this.x) + ':59 arası' : 'Tarih: ' + this.x) + '</b>';
            }
        },
        legend: {
            layout: 'horizontal',
            align: 'right',
            verticalAlign: 'bottom',
            borderColor: "#909090",
            borderRadius: 5,
            borderWidth: 1
        },
        series: [
            {
                name: 'Avea',
                color: '#E94E56',
                data: data.data[4],
                marker: {
                    symbol: 'circle'
                }
            },
            {
                name: 'Turkcell',
                color: '#2F97E0',
                data: data.data[1],
                marker: {
                    symbol: 'circle'
                }
            },
            {
                name: 'Vodafone',
                color: '#8F3FAE',
                data: data.data[5],
                marker: {
                    symbol: 'circle'
                }
            },
            {
                name: 'Total',
                color: '#ff0000',
                data: data.data[99],
                marker: {
                    symbol: 'circle'
                }
            }
        ]
    });

}

function calenderCrate(data) {
    var h = {};

    if ($('#calendar').width() <= 400) {
        $('#calendar').addClass("mobile");
        h = {
            left: 'title, prev, next',
            center: '',
            right: 'today,month,agendaWeek,agendaDay'
        };
    } else {
        $('#calendar').removeClass("mobile");
        if (Metronic.isRTL()) {
            h = {
                right: 'title',
                center: '',
                left: 'prev,next,today,month,agendaWeek,agendaDay'
            };
        } else {
            h = {
                left: 'title',
                center: '',
                right: 'prev,next,today,month,agendaWeek,agendaDay'
            }
        }
    }
    $('#calendar').fullCalendar('destroy');
    $('#calendar').fullCalendar({
        disableDragging: false,
        header: h,
        editable: true,
        events: data,
        eventClick: function (event, jsEvent, view) {
            console.log(event);
            $('#modalTitle').html(event.title);
            $('#modalStartDate').html(moment(event.start._d).format('MM/DD/YYYY hh:mm'));
            $('#modalEndDate').html(moment(event.end._d).format('MM/DD/YYYY hh:mm'));
            $('#modalDate').html(moment(event.start._d).format('MM/DD/YYYY hh:mm') + ' başlangıç Tarihi ile  ' + moment(event.end._d).format('MM/DD/YYYY hh:mm') + ' Bitiş Tarihi Arasında Yapılacaktır.');
            $('#modalBody').html(event.content);
            $('#fullCalModal').modal();
        }


    });
}

function logout() {
    location.href = '/logout';
}

function showLoading() {
    $(".loadertext").show();
    $('body').removeClass('loaded');
}

function hideLoading() {
    $(".loadertext").hide();
    $('body').addClass('loaded');
}
function dateHour(date) {
    var parts = date.split(':');
    return parts[0];
}

function currencyFormat(Amount) {
    var DecimalSeparator = Number("1.2").toLocaleString().substr(1, 1);

    var AmountWithCommas = Amount.toLocaleString();
    var arParts = String(AmountWithCommas).split(DecimalSeparator);
    var intPart = arParts[0];
    var decPart = (arParts.length > 1 ? arParts[1] : '');
    decPart = (decPart + '00').substr(0, 2);

    return intPart + DecimalSeparator + decPart + " TL";
}