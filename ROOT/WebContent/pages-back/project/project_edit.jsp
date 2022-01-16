<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="icon-wrench"></i>&nbsp;EDIT PROJECT
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<!-- Form Action -->
		<form name="formProject" id="formProject" method="POST"
			class="horizontal-form">
			<div class="form-body">
				<input name="project_id" type="hidden" value="${project.project_id}">
				<div class="row">
					<div class="col-md-7">
						<div class="form-group">
							<label class="control-label">Project name</label> <input
								type="text" name="project_name" class="form-control"
								placeholder="Enter Project name" value="${project.project_name}">
						</div>
					</div>
					<div class="col-md-5">
						<div class="form-group">
							<label class="control-label">User create</label> <select
								class="form-control select2me" name="userCreate">
								<optgroup label="Enable">
									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 1 }">
											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,project.user_create)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,project.user_create)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
								<optgroup label="Disable">
									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 0 }">
											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,project.user_create)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,project.user_create)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
							</select>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label">Description</label> <input type="text"
						name="description" class="form-control"
						placeholder="Enter Description" value="${project.description}">
				</div>
				<div class="row">
					<div class="col-md-5">
						<label class="control-label">Status</label><select
							name="status" class="form-control"
							data-placeholder="Choose status" tabindex="1">
							<option value="1">ACTIVE</option>
							<option value="0">INACTIVE</option>
						</select>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<label class="caption-subject sbold">Function List</label>
		</div>
	</div>
	<div class="portlet-body">
		<form class="repeater">
			<div class="form-group mt-repeater">
				<div data-repeater-list="projectFunctionList">
					<div data-repeater-item class="mt-repeater-item">
						<div class="row mt-repeater-row">
							<div class="col-md-5 col-sm-5">
								<label class="control-label function-name">Function name</label>
									
								<input type="hidden" name="function_id" class="form-control"
									placeholder="Enter Function" value="">
									
								<input type="text" name="function_name" class="form-control"
									placeholder="Enter Function" value="">
							</div>
							<div class="col-md-3 col-sm-3">
								<label class="control-label">Status</label> <select
									name="status" class="form-control"
									data-placeholder="Choose status" tabindex="1">
									<option value="1">ACTIVE</option>
									<option value="0">INACTIVE</option>
								</select>
							</div>
							<div class="col-md-1">
								<a href="javascript:;" 
									<%-- onClick="return deleteFunction(${function_id});" --%>
									data-repeater-delete
									class="btn mt-repeater-delete red-intense"> <i
									class="fa fa-close"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
				<a href="javascript:;" data-repeater-create
					class="btn green-meadow mt-repeater-add"> <i class="fa fa-plus"></i>
					Add More
				</a>
	
			</div>
		</form>
	</div>
	<!-- End of portlet-body -->
	<div class="form-actions">
		<div class="row ">
			<div class="col-md-12 text-center">
				<button class="btn blue-soft" style="width: 90px" onclick="update()">
					<i class="fa fa-save"></i> Save
				</button>
				<button type="reset" class="btn red-intense"  style="width: 90px" onclick="cancel()">
					<i class="fa fa-close"></i> Cancel
				</button>
			</div>
		</div>
	</div>
</div>
<!-- end of body class portlet -->
<script>

//https://github.com/DubFriend/jquery.repeater << Tutorials !!
//get Array Data from $('.repeater').repeaterVal(); 
$(document).ready(function () {
	
	var f_list = [];
	
  f_list = JSON.parse('${projectFunctionList}');
	
  var $repeater = $(".repeater").repeater(
  	{
  		defaultValues: {
              'status': '1',
              'function_id' : 0
          },
          show : function() {
				$(this).slideDown();
			},
			/* hide : function(deleteElement) {
				data = $('.repeater')
						.repeaterVal();
					$(this).slideUp(deleteElement);
			} */
  	}
  );
  if (f_list != null) {
  	$repeater.setList(f_list);
  }
});

function deleteFunction(id) {
	console.log("id: " + id)
	$.ajax({
	    url : "deleteProjectFunction.action",
		data : "function_id="+ id,
		type : "POST",
		success : function(response) {
			window.location.reload(true);
		}
	}); 
}

function update() {
	var formData = new FormData($("#formProject")[0]);
	var func = new FormData($(".repeater")[0]);
	var funcs = [];
	
	for (var value of func.values()) {
		funcs.push(value)
	}
	//remove empty elements
	funcs = funcs.filter(function (el) {
		 return el != "";
	});
	formData.append("projectFunctionList", funcs);
	$.ajax({
		url : "updateProject.action",
		type : "POST",
		contentType : false,
		processData : false,
		data: formData,
		success : function(formData) {
			location.href = 'projectList';
		}
	});
}

	function showToastSuccess(text) {
		toastr.success(text, "Success");
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"positionClass" : "toast-top-right",
			"onclick" : null,
			"showDuration" : "1000",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		}
	}

	function showToastWarining() {
		toastr.warning(
				"Existed this category <br> Please check category name again",
				"Warning");
		toastr.options = {
			"closeButton" : true,
			"debug" : false,
			"positionClass" : "toast-top-right",
			"onclick" : null,
			"showDuration" : "1000",
			"hideDuration" : "1000",
			"timeOut" : "5000",
			"extendedTimeOut" : "1000",
			"showEasing" : "swing",
			"hideEasing" : "linear",
			"showMethod" : "fadeIn",
			"hideMethod" : "fadeOut"
		}
	}
</script>
