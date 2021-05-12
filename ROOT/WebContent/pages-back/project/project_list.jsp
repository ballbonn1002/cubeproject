<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.blockui.min.js"
	type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-sidebar.min.js"
	type="text/javascript"></script>
<script src="../assets/layouts/global/scripts/quick-nav.min.js"
	type="text/javascript"></script>
<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<!-- Alert Script-->
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />

<!-- End of Alert Script -->

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


<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="fa fa-book"></i>&nbsp;Project List
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
		<div class="actions right">
<!-- 		<a href = "#addProject">	<button type="button" class="btn red btn-outline sbold" id="addProject" -->
<!-- 				data-toggle="modal"> -->
<!-- 				<i class="fa fa-plus"></i>&nbsp;Add Project -->
<!-- 			</button></a> -->
			
			<a class="btn green-meadow sbold" onclick="addProject()"><i class="fa fa-plus"></i>&nbsp;Add Project</a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="table-responsive ">
			<table
				class="table table-striped table-hover table-header-fixed" 
				width="100%" id="table">
				<thead>
					<tr style="background-color:rgb(59, 63, 81);color:white;height: 41px">
						<th class="text-center">No.</th>
						<th class="text-center">Project name</th>
						<th class="text-center">User create</th>
						<th class="text-center">Time create</th>
						<th class="text-center">Edit</th>
						<th class="text-center">Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pj" items="${projectList}" varStatus="Count">
						<tr>
							<td class="text-center">${Count.count}</td>
							<td class="text-center">${pj.project_name}</td>
							<td class="text-center">${pj.user_create}</td>
							<td class="text-center"><fmt:formatDate
									value="${pj.time_create}" pattern="dd-MM-yyyy HH:mm" /></td>
							<td style="text-align: center;"><a
								class="btn btn-outline btn-circle btn-sm blue" title="Edit"
								onclick="EditProject(${pj.project_id})"><i
									class="fa fa-pencil"></i></a></td>

							<td style="text-align: center;"><a
								class="btn btn-outline btn-circle btn-sm red-intense" title="Delete"
								onclick="deleteProject(${pj.project_id})"><i
									class="fa fa-trash"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>
		</div>
	</div>

</div>
<form name= "projectForm" id = "projectForm" method = "POST">
<div class="modal fade" id="addProject" tabindex="-1" role="basic" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
				<h4 class="modal-title sbold">Add Project</h4>
			</div>
		<div class="modal-body">
			<div class="form-body">
				<div class="form-group">
					<label class="control-label">Project Name</label> <input type="text"
						name="project_name" class="form-control" placeholder="Enter Project Name">
				</div>
				<div class="form-group">
					<label class="control-label">Description</label> <input type="text"
						name="description" class="form-control" placeholder="Enter Project description">
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
			<button type="submit" class="btn green-jungle" onclick = "addProject()">Add</button>
		</div>
	</div>
</div>
</div>
</form>
<script>

	function deleteProject(id){
		swal({
		      title: "Are you sure!",
		      text: "You will be deleting this project!",
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
		 				    url : "deleteProject.action",
		 					data : "project_id="+ id,
		 					type : "POST",
		 					success : function(response) {
		 						window.location.reload(true);
		 					}
		 			 });
		          return false
		        }
		      });

	}
	
	function addProject() {

		location.href='addProjectPage';
	}
	
	function EditProject(id){
		//console.log("data = " + id);
		location.href='editProject?project_id=' + id;
// 		$.ajax({
// 			    url : "editFAQ.action",
// 				data : "faq_id="+ id,
// 				type : "POST",
// 				success : function(response) {
// 					location.href='editFAQ?faq_id=' + id;
// 				}
// 		 });
	}
	
</script>
