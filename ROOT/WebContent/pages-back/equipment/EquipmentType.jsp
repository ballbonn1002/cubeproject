<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
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
				Type List</span> <span class="caption-helper font-red"></span>
		</div>
		<div class="actions">
			<a href="AddType" class="btn green-meadow"><i class="fa fa-plus"></i>
				Add new</a> <a
				class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-scrollable">
			<table class="table table-striped table-hover">
				<thead>
					<tr height="41" class="text-center"
						style="background-color: rgb(59, 63, 81); color: white">
						<th>
							<center>Type</center>
						</th>
						<th>
							<center>Description</center>
						</th>
						<th>
							<center>User Create</center>
						</th>
						<th>
							<center>Time Create</center>
						</th>
						<th>
							<center>User Update</center>
						</th>
						<th>
							<center>Time Update</center>
						</th>
						<th>
							<center>Edit</center>
						</th>
						<th>
							<center>Delete</center>
						</th>
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
    var types = []
   		types = JSON.parse('${tlist}');
    var remove= (id) => {
        $.ajax({
            url : "checkTypeRecord",
            data: {
                "Type": id
            }
        }).done(function (response) {
            console.log(response);
            if (response.message == "ok") {
                swal({
                    title: "Are you sure!",
                    text: "Will you continue to delete Status : " + id,
                    type: "warning",
                    showCancelButton  : true,
                    confirmButtonClass: 'btn-danger',
                    confirmButtonText : 'OK'
                }, function (selected) {
                    if (selected) {
                        document.location = "EtypeDelete?id=" + id;
                    }
                });
            } else {
                swal({
                    title: "You can't delete this!",
                    text : response.count+" records will be affected!",
                    type : "error",
                    confirmButtonClass: 'btn-danger'
                });
            }
        });
    }
</script>
<script>
    $(() => {
        let tbody = $('#tbody');
        types.forEach((i) => {
            let row = "";
            row += "<tr id='" + i.TypeID + "'>";
            row += "<td><center>" + i.TypeID + "</center></td>";
            row += "<td style='text-align:left;'>" + i.description+ "</td>";
            row += "<td><center>" + i.userCreate + "</center></td>";
            row += "<td><center>" + i.timeCreate + "</center></td>";
            row += "<td><center>" + i.userUpdate + "</center></td>";
            row += "<td><center>" + i.timeUpdate + "</center></td>";
            row += "<td><center>"
                + "<a href='EditType?id=" + i.TypeID + "' class='btn btn-outline btn-circle btn-sm blue' title='Edit'><i class='fa fa-pencil'></i></a>"
                + "</center></td>";
            row += "<td><center>"
            	+ "<button name='" + i.TypeID + "' onclick='remove(this.name)' title='Delete' class='btn btn-outline btn-circle btn-sm red-intense'><i class='fa fa-trash'></i></button>"
                + "</center></td>";
            row += "</tr>";
            tbody.append(row);
        });
    })
</script>s