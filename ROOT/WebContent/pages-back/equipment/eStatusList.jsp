<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
span.btn {
	width: 120px;
}

tr{    
  opacity: 0;
  animation-name: fadeIn;
  animation-duration: 2s;
  animation-iteration-count: 1;
  animation-fill-mode: forwards;
}
@keyframes fadeIn {
  from {
    opacity: 0;
  }
  
  to {
    opacity: 1;
  }
}

</style>
<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<div class="portlet light ">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-list font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Equipment
				Status List</span> <span class="caption-helper font-red"> </span>
		</div>
		<div class="actions">
			<a href="eStatusAdd" class="btn green-meadow"><i
				class="fa fa-plus"></i> Add new</a>
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<table class="table table-striped table-hover">
				<thead>
					<tr class="text-center"
						style="background-color: rgb(59, 63, 81); color: white">
						<th height="41">Status</th>
						<th height="41">Description</th>
						<th height="41">Color</th>
						<th height="41">User Create</th>
						<th height="41">Time Create</th>
						<th height="41">User Update</th>
						<th height="41">Time Update</th>
						<th height="41">Edit</th>
						<th height="41">Delete</th>
					</tr>
				</thead>
				<tbody id="tbody">
				</tbody>
			</table>
		</div>
	</div>
</div>

<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-toastr/toastr.min.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/bootstrap-toastr/toastr.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>

<script>
    var colors = ["default", "red", "red-mint", "blue", "blue-steel", "green", "green-jungle", "yellow", "yellow-lemon", "purple", "purple-seance", "grey-mint", "dark"];
    var sList = []
    sList = JSON.parse('${list}');
    var remove = (id) => {
        $.ajax({
            url: "checkEStatusRecord",
            data: {
                "status": id
            }
        }).done(function (response) {
            if (response.message == "ok") {
                swal({
                    title: "Are you sure!",
                    text: "Will you continue to delete Status : " + id,
                    type: "warning",
                    showCancelButton: true,
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText: 'OK'
                }, function (selected) {
                    if (selected) {
                        document.location = "eStatusDelete?id=" + id;
                    }
                });
            } else {
                swal({
                    title: "You can't delete this!",
                    text: response.count+" records will be affected!",
                    type: "error",
                    confirmButtonClass: 'btn-danger'
                });
            }
        });
    }
</script>
<script>
    $(() => {
        let tbody = $('#tbody');

        sList.forEach((i) => {
            let row = "";
            let colorList = "";

            colorList += '<select id="' + i.statusId + '_color"class="form-control">';
            if (i.color == undefined) {
                colorList += '<option selected> </option>';
            }
            colors.forEach((c) => {
                if (i.color == c) {
                    colorList += '<option selected>' + c + '</option>';
                }
                else {
                    colorList += '<option>' + c + '</option>';
                }
            });
            colorList += '</select>';

            row += "<tr id='" + i.statusId + "'>";
            row += "<td><center>" + i.statusId + "</center></td>";
            row += "<td>" + "<span id='btn_" + i.statusId + "' class='btn btn-sm " + i.color + "'>" + i.description + "</span>" + "</td>";
            row += "<td>" + colorList + "</td>";
            row += "<td>" + i.userCreate + "</td>";
            row += "<td>" + i.timeCreate + "</td>";
            row += "<td><center>" + i.userUpdate + "</center></td>";
            row += "<td><center>" + i.timeUpdate + "</center></td>";
            row += "<td><center>"
                + "<a href='eStatusEdit?id=" + i.statusId + "' class='btn btn-outline btn-circle btn-sm blue' title='Edit'><i class='fa fa-pencil'></i></a>"
                + "</center></td>";
            row += "<td><center>"
            	+ "<button name='" + i.statusId + "' onclick='remove(this.name)' class='btn btn-outline btn-circle btn-sm red-intense' title='Delete'><i class='fa fa-trash'></i></button>"
                + "</center></td>";
            row += "</tr>";

            tbody.append(row);

            $('#' + i.statusId + "_color").change(function () {
                let c = this.value;
                $.ajax({
                    url: "updateStatusColor",
                    data: {
                        "id": i.statusId,
                        "color": c
                    }
                }).done(function (response) {
                    if (response.includes("success")) {
                        $('#btn_' + i.statusId).removeClass();
                        $('#btn_' + i.statusId).addClass("btn btn-sm " + c);
                        toastr.success("Changed " + i.description + " color to " + c, "Sucessed");
                    }
                });
            });

        });
    })
</script>