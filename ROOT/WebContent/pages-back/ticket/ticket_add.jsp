<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- Summer Note CSS and JS -->

<link
	href="../assets/global/plugins/bootstrap-summernote/summernote.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>


<script
	src="../assets/global/plugins/bootstrap-summernote/summernote.min.js"
	defer></script>

<!-- End of Summer Note CSS -->
<!-- Bootbox Modals -->
<script src="../assets/global/plugins/bootbox/bootbox.min.js" defer></script>
<script src="../assets/pages/scripts/ui-bootbox.min.js" defer></script>
<!-- End of Bootbox Modals -->
<!-- Toastr -->
<link href="../assets/global/plugins/bootstrap-toastr/toastr.min.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/bootstrap-toastr/toastr.min.js"
	defer></script>
<script src="../assets/pages/scripts/ui-toastr.min.js" defer></script>
<!-- End of Toastr -->

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"> <i
				class="icon-wrench"></i>&nbsp;Add Ticket
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">

		<!-- Form Action -->
		<form name="formTicket" id="formTicket" method="POST" action="addTicketdb" enctype="multipart/form-data"
			class="horizontal-form">

			<div class="form-body">
				<div class="form-group">
					<label class="control-label">Name</label> <input type="text"
						name="ticket_name" class="form-control" placeholder="Enter Name">
				</div>


				<div class="row">

					<div class="col-md-4 col-xs-12">
						<div class="form-group">
							<label class="control-label">URL</label> <input type="text"
								name="ticket_url" class="form-control" placeholder="Enter URL">
						</div>
					</div>

					<div class="col-md-4 col-xs-12">
						<div class="form-group">
							<label class="control-label">User Create</label> <select
								class="form-control select2me" name="user_create">
								<optgroup label="Enable">

									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 1 }">
											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
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
													<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>

								</optgroup>
							</select>
						</div>
					</div>


					<c:set var="temp" value="0" />
					<div class="col-md-4 col-xs-12">
						<div class="form-group">
							<label class="control-label">Assign User</label> <select
								class="form-control select2me" name="user_assigned">
								<optgroup label="Enable">
									<c:if test="${temp == '0'}">
										<c:if test="${ticket.userAssigned == null} ">
											<c:set var="select" value="selected" />
											<option selected value="null">เลือก</option>
											<c:set var="temp" value="1" />
										</c:if>
										<c:if test="${ticket.userAssigned != null }">
											<c:set var="select" value="selected" />
										</c:if>
									</c:if>
									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 1 }">

											<c:if test="${ticket.userAssigned == null }">
												<c:set var="select" value=" " />
											</c:if>
											<c:if test="${ticket.userAssigned != null }">
												<c:set var="select" value="selected" />
											</c:if>

											<c:if test="${logonUser == nulll }">
												<option value="${user.name}" id="${user.name}"
													<c:if test="${fn:containsIgnoreCase(user.name,ticket.userAssigned)}"><c:out value="${select}"/>
													</c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>

								</optgroup>
								<optgroup label="Disable">
									<c:if test="${temp == '0'}">
										<c:if test="${ticket.userAssigned == null  }">
											<c:set var="select" value=" " />
											<option selected value="null">เลือก</option>
										</c:if>
										<c:if test="${ticket.userAssigned != null }">
											<c:set var="select" value="selected" />
										</c:if>
									</c:if>
									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 0 }">



											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,ticket.userAssigned)}"><c:out value="${select}"/>
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
				<!-- End of row -->


				<div class="row">
					<div class="col-md-6 col-xs-12">
						<div class="form-group">
							<label class="control-label">Expected Result</label> <input
								type="text" name="expected_result" class="form-control"
								placeholder="">
						</div>
					</div>

					<div class="col-md-6 col-xs-12">
						<div class="form-group">
							<label class="control-label">Actual Result</label> <input
								type="text" name="actual_result" class="form-control"
								placeholder="">
						</div>
					</div>
				</div>

				<div class="form-group form-md-line-input">
						<div class="control-label col-md-3">File Upload :</div>
						<div class="col-md-3 text-center">
							<div class="fileinput fileinput-new" data-provides="fileinput">
								<div class="fileinput-new thumbnail"
									style="width: 200px; height: 150px;">
									<img
										src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
										alt="cc">
								</div>
								<div class="fileinput-preview fileinput-exists thumbnail"
									style="max-width: 200px; max-height: 150px; line-height: 10px;"></div>
								<div>
									<span class="btn default btn-file"> <span
										class="fileinput-new"><i class="fa fa-picture-o"></i>
											Select File</span> <span class="fileinput-exists"> Change </span> <input
										type="hidden" name="fileName" id="fileName">
										<input type="file"name="fileUpload" id="myFile" onchange="checkFileSize(this)">
									</span> <a href="javascript:;" class="btn red fileinput-exists"
										data-dismiss="fileinput"> Remove </a>
								</div>
							</div>
						</div>
					</div>

				<div class="col-md-12 col-xs-12">
					<div class="form-group">
						<label class="control-label">Description</label> <input
							type="text" name="description" class="form-control"
							placeholder="">
					</div>
				</div>


			</div>
			<!-- End of form-body -->
			<div class="form-actions">
				<div class="row ">
					<div class="col-md-12 text-center">
						<button class="btn blue" onclick="add()">
							<i class="fa fa-send-o"></i> Add
						</button>
						<button type="reset" class="btn grey" onclick="resetForm()">
							<i class="fa fa-refresh"></i> Reset
						</button>
					</div>
				</div>
			</div>


		</form>

	</div>
	<!-- End of portlet-body -->



</div>
<!-- end of body class portlet -->

<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<!-- BEGIN CORE PLUGINS -->
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>

<script>
	$(document)
			.ready(
					function() {

						$('#summernote')
								.summernote(
										{
											placeholder : 'Your Information',
											tabsize : 10,
											height : 400,
											callbacks : {
												onImageUpload : function(files) {
													for (var i = files.length - 1; i >= 0; i--) {

														const name = files[i].name;

														sendFile(files[i], this);

													}

												},
												onMediaDelete : function(target) {

													for (var i = target.length - 1; i >= 0; i--) {

														deleteFile(target[i].src);
														var myJSON = JSON
																.stringify(target.context.dataset.filename);

													}
												}
											}
										});

					});

	function sendFile(file, el) {
		var form_data = new FormData();
		const name = file.name;
		const lastDot = name.lastIndexOf('.');
		const fileType = name.substring(lastDot + 1);

		form_data.append('ticketImage', file);
		form_data.append('fileName', file.name);
		form_data.append('fileType', fileType);
		"test=" +  

		$.ajax({
			data : form_data,
			type : "POST",
			url : 'addTicketdb.action',
			cache : false,
			contentType : false,
			processData : false,
			success : function(url) {
				$('#summernote').summernote('editor.insertImage', url);
				// 				console.log("Succesful uploaded " + url);
			},
			error : function(data) {
				//console.log("Error upload");
			}
		});
	}

	function deleteFile(src) {
		//console.log("src Delete: " + src);

		$.ajax({
			data : "srcDelete=" + src,
			type : "POST",
			url : "deleteTicketImg",
			cache : false,
			success : function(response) {
				// 				console.log("responseDelete: " + response);
			}
		});
	}
	
	function checkFileSize(inputFile) {
		var max = 10 * 1024 * 1024; // 10MB
		var file = inputFile.value;
		var extension = file.substr(file.lastIndexOf('.') + 1).toLowerCase();
		if (inputFile.files && inputFile.files[0].size > max) {
			alert("File too large."); // Do your thing to handle the error.
			inputFile.value = null; // Clear the field.
		}
		document.getElementById("fileName").value = inputFile.files[0].name;
		if (extension !== 'jpg' && extension !== 'jpeg' && extension !== 'png'
				&& extension !== 'bmp') {
			alert("Wrong file type."); // Do your thing to handle the error.
			inputFile.value = null; // Clear the field.
		}

	}

// 	function add() {
		
// 			console.log($("form[name='formTicket']").serialize());
// 			alert("wait");
// 		$.ajax({
// 			url : "addTicketdb.action",
// 			type : "POST",
// 			data : $("form[name='formTicket']").serialize(),
// 			success : function(data) {

// 				location.href = 'Ticket';
// 			}
// 		});
// 	}

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

	function resetForm() {
		//console.log("reset");
		$('#summernote').summernote('code', '');
	}
</script>
