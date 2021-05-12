<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/js.cookie.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/jquery-repeater/jquery.repeater.js"
	type="text/javascript" defer></script>
<script src="../assets/pages/scripts/form-repeater.min.js"
	type="text/javascript" defer></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="icon-wrench"></i>&nbsp;ADD JOBSITE
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">
		<!-- Form Action -->
		<div class="portlet-title">
			<input type="hidden" class="form-control" id="user" name="user"
				value="${onlineUser.id}">
			<div class="row">
				<div class="col-md-2 text-right">Name :</div>
				<div class="col-md-6">
					<input type="text" class="form-control" id="name" name="name">
				</div>
				<div class="col-md-2 text-right">
					<button class="btn blue-soft" style="width: 90px" onclick="save()">
						<i class="fa fa-save"></i> Save
					</button>
				</div>
				<div class="col-md-2">
					<button type="reset" class="btn red-intense" style="width: 90px"
						onclick="cancel()">
						<i class="fa fa-close"></i> Cancel
					</button>
				</div>
			</div>
			<br>
		</div>


	</div>
	<!-- End of portlet-body -->

	<br>
	<table class="table table-striped table-header-fixed" data-aos="fade"
		data-aos-duration="2000">
		<thead>
			<tr class="text-center"
				style="background-color: rgb(59, 63, 81); color: white; height: 41px">
				<td>id</td>
				<td>name</td>
				<td>user create</td>
				<td>user update</td>
				<td>time create</td>
				<td>time update</td>
				<td></td>
				<td></td>
			</tr>
		</thead>
		<c:forEach var="jslist" items="${jobsitelist}" varStatus="Count">
			<tr class="text-center">
				<td>${jslist.id_sitejob}</td>
				<td>${jslist.name_site}</td>
				<td>${jslist.user_create}</td>
				<td>${jslist.user_update}</td>
				<td><fmt:formatDate value="${jslist.time_create}" pattern="dd/MM/yyyy HH:mm" /></td>
				<td><fmt:formatDate value="${jslist.time_update}" pattern="dd/MM/yyyy HH:mm" /></td>
				<td><button type="button"
						class="btn circle btn-outline blue float-right" id=""
						onclick="getcommentold('${jslist.id_sitejob}','${jslist.name_site}')"
						data-toggle="modal" data-target="#lesson-plan-modal">
						<i class="fa fa-pencil-square-o"></i>
					</button></td>
				<td>
					<button type="button"
						class="btn circle btn-outline red-intense float-left" id=""
						onclick="deljobsite(${jslist.id_sitejob})">
						<i class="fa fa-trash"></i>
					</button>
				</td>

			</tr>
		</c:forEach>
	</table>
</div>
<div class="modal fade" id="lesson-plan-modal" role="dialog">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title">Edit JobSite</h4>
				<button type="button" class="close modal-close" data-dismiss="modal">
					<i class="fa fa-times-circle" aria-hidden="true"></i>
				</button>
			</div>
			<div class="modal-body">
				<form class="lesson-update-section" action="" method="post">
					<input type="hidden" class="form-control" id="idsj" name="idsj"><br>
					Name : <input type="text" class="form-control" id="namesj"
						name="namesj">
				</form>
			</div>
			<div class="modal-footer">
				<button type="submit" onclick="editjobsite()" data-dismiss="modal"
					id="update_lesson_plan" class="btn blue-soft"
					name="update_lesson_plan">
					<i class="fa fa-save"></i> Save
				</button>
				<button type="submit" data-dismiss="modal" id="update_lesson_plan"
					class="btn red-intense" name="update_lesson_plan">
					<i class="fa fa-close"></i> Cancel
				</button>
			</div>
		</div>
	</div>
</div>
<!-- end of body class portlet -->
<script>
function getcommentold(id,detal) {
$('#idsj').val(id);	
$('#namesj').val(detal);		
	}

</script>
<script>
		$(document).ready(function() {
			$('#myTable').DataTable();
			console.log("ssada");
		});
	</script>
<script>
	function job_site_list_save() {
		location.href = 'job_site_list_save';
	};
	
</script>
<script>
function editjobsite(id) {
	var idsite = document.getElementById('idsj').value;
	var namesite = document.getElementById('namesj').value;
	var usersite = document.getElementById('user').value;
	if (namesite == null || namesite == "") {
		swal("Error!", "Required! Name", "error");
	}
	else {
		$
				.ajax({
					url : "job_site_list_edit",
					method : "POST",
					type : "JSON",
					data : {
						"id" : idsite,
						"name" : namesite,
						"user" : usersite,
					},
					success : function(data) {
						swal(
								{
									title : "Pass",
									text : "Saved Succcess",
									type : "success"
								},
								function() {
									window.location.href = "job_site_list_add";
								});
					}

				})
	}
}
</script>
<script>
function deljobsite(id) {
	swal({
	      title: "Are you sure!",
	      text: "You will be deleting this id!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	//console.log("canceled");
	        	return false;
	        	}
	        if (inputValue == true) {
	        	 $.ajax({
	 				    url : "job_site_list_delete.action",
	 					data : "id="+ id,
	 					type : "POST",
	 					success : function(response) {
	 						window.location.reload(true);
	 					}
	 			 });
	          return false
	        }
	      });
}
</script>
<script>
	function save() {
		var namesite = document.getElementById('name').value;
		var usersite = document.getElementById('user').value;

		if (namesite == null || namesite == "") {
			swal("Error!", "Required! Name", "error");
		}
		else {
			$
					.ajax({
						url : "job_site_list_save",
						method : "POST",
						type : "JSON",
						data : {
							"name" : namesite,
							"user" : usersite,
							
						},
						success : function(data) {
							swal(
									{
										title : "Pass",
										text : "Saved Succcess",
										type : "success"
									},
									function() {
										window.location.href = "job_site_list_add";
									});
						}

					})
		}
	}
</script>