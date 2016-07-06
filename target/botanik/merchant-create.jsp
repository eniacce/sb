<%@include file="WEB-INF/layouts/meta.jsp" %>
<%@include file="WEB-INF/layouts/header.jsp" %>

<div class="row">


    <div class="col-md-12">




            <div class="portlet light">
                <div class="portlet-title ">
                    <div class="caption">
                        <i class="icon-user-follow font-red-haze "></i>
                        <span class="caption-subject font-red-haze bold uppercase">Musteriler</span>
                    </div>
                </div>
                <div class="portlet-body">
                    <table id="examples" class="table table-striped table-bordered table-hover display responsive nowrap"
                           cellspacing="0" width="100%">

                        <thead>
                        <tr>
                            <th width="10%">ID</th>
                            <th width="10%">Name</th>
                            <th width="10%">City</th>
                            <th width="10%">Create Time</th>
                        </tr>
                        </thead>
                    </table>
                </div>

        </div>
    </div>
</div>

<%@include file="WEB-INF/layouts/footer.jsp" %>


<script type="text/javascript">


    $(document).ready(function(){
        console.log('test');
        $("#examples").dataTable({
            responsive: true,
            processing: true,
            serverSide: true,
            ajax: {
                type: 'POST',
                dataType: 'json',
                url: './create-merchant',
                data: function (d) {

                }
            },
            columns: [
                {"data": "id"},
                {"data":"name"},
                {"data":"city"},
                {"data":"create_time"}
                /*  {"data": null}*/

            ],
        });
    });


</script>