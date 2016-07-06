<%@include file="WEB-INF/layouts/meta.jsp" %>
<%@include file="WEB-INF/layouts/header.jsp" %>


<div class="row">


    <div class="col-md-12">

        <div class="col-md-6">
            <div id="chart" style="width:100%; height:400px;"></div>
        </div>

        <div class="col-md-6">
            <div class="portlet light">
                <div class="portlet-title ">
                    <div class="caption">
                        <i class="icon-user-follow font-red-haze "></i>
                        <span class="caption-subject font-red-haze bold uppercase">TEST</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <table id="example" class="table table-striped table-bordered table-hover display responsive nowrap"
                           cellspacing="0" width="100%">

                        <thead>
                        <tr>
                            <th width="10%">ID</th>
                            <th width="10%">Username</th>
                            <th width="10%">Password</th>


                        </tr>
                        </thead>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="WEB-INF/layouts/footer.jsp" %>


<script type="text/javascript" charset="utf-8">
    $(document).ready(function () {


        $.ajax({
            type: 'GET',
            dataType: "json",
            "url": "sales",
            success: function (data) {
                console.log(data);
                $('#chart').highcharts({
                    title: {
                        text: 'Gunluk Satis Rakamlari',
                        x: -20 //center
                    },
                    subtitle: {
                        text: 'Satislar',
                        x: -20
                    },
                    xAxis: {
                        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                    },
                    yAxis: {
                        title: {
                            text: 'Satislar'
                        },
                        plotLines: [{
                            value: 0,
                            width: 1,
                            color: '#808080'
                        }]
                    },
                    tooltip: {
                        valueSuffix: 'TL'
                    },
                    legend: {
                        layout: 'vertical',
                        align: 'right',
                        verticalAlign: 'middle',
                        borderWidth: 0
                    },
                    series: [{
                        name: 'Pinnus Nigra',
                        data: data
                    }]
                });
            }
        });


        $("#example").dataTable({
            responsive: true,
            processing: true,
            serverSide: true,
            ajax: {
                type: 'POST',
                dataType: 'json',
                url: './sales',
                data: function (d) {

                }
            },
            columns: [
                {"data": "id"},
                {"data": "username"},
                {"data": "password"}

                /*  {"data": null}*/

            ],
            "lengthMenu": [[100, 250, 500, -1], [100, 250, 500, "Hepsi"]],
            pageLength: 100,
            order: [[1, "desc"]],
            dom: '<"top"ilf>rt<"bottom"p><"clear">',

        });
    });

</script>