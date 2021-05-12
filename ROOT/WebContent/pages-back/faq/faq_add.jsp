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
				class="icon-wrench"></i>&nbsp;Add FAQ
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">

		<!-- Form Action -->
		<form name="formFAQ" id="formFAQ" method="POST"
			class="horizontal-form">

			<div class="form-body">
				<div class="form-group">
					<label class="control-label">Topic</label> <input type="text"
						name="topic" class="form-control" placeholder="Enter Topic">
				</div>


				<div class="row">
					<div class="col-md-3 col-xs-7">
						<div class="form-group">
							<label class="control-label">Category</label> <select
								id="category_list_select" name="faq_cat_name"
								class="form-control" data-placeholder="Choose a Category"
								tabindex="1">
								<c:forEach var="faq_cat" items="${faqCategoryList}">
									<option class="category_list_option"
										value="${faq_cat.faq_cat_name}">${faq_cat.faq_cat_name}</option>
								</c:forEach>

							</select>

						</div>
					</div>

					<div class="col-md-2 col-xs-5">
						<label class="control-label">&nbsp;</label> <a
							onclick="addCategory()" class="form-control btn green-jungle">
							<i class="fa fa-plus"></i> Other category
						</a>
					</div>

					<div class="col-md-7 col-xs-12">
						<div class="form-group">
							<label class="control-label">Author</label> <select
								class="form-control select2me" name="author">
								<optgroup label="Enable">
								
									<c:forEach var="user" items="${cubeUser}">
										<c:if test="${user.enable == 1 }">
											<c:if test="${logonUser == nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id} - ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id} - ${user.name}</option>
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
													</c:if>>${user.department_id} - ${user.name}</option>
											</c:if>
											<c:if test="${logonUser != nulll }">
												<option value="${user.id}" id="${user.id}"
													<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id} - ${user.name}</option>
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
					<div class="col-md-12 col-xs-12">
						<div class="form-group">
							<label class="control-label">Details</label>
							<textarea id="summernote" name="details" required></textarea>
						</div>
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

		form_data.append('faqImage', file);
		form_data.append('fileName', file.name);
		form_data.append('fileType', fileType);

		$.ajax({
			data : form_data,
			type : "POST",
			url : 'addFAQImg.action',
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
			url : "deleteFAQImg",
			cache : false,
			success : function(response) {
				// 				console.log("responseDelete: " + response);
			}
		});
	}

	function add() {

		//alert($("form[name='formFAQ']").serialize());
		$.ajax({
			url : "addFAQdb.action",
			type : "POST",
			data : $("form[name='formFAQ']").serialize(),
			success : function(data) {

				location.href = 'FAQ';
			}
		});
	}

	function addCategory() {
		//console.log("add Category!");
		bootbox.prompt({
			title : "New Category",
			size : "small",
			callback : function(result) {
				if (result != null) {
					saveCategory(result);
				}
			}
		});
	}

	function saveCategory(result) {

		$.ajax({
			url : "addFAQCategory.action",
			type : "POST",
			data : "faq_cat_name=" + result,
			success : function(data) {
				//console.log("DATA: " + data);

				if (data == "existed") {
					//console.log("Failed");
					showToastWarining();
				} else {
					refreshCategory();
					showToastSuccess("add category success!");
				}

			}
		});

	}

	function refreshCategory() {
		$
				.ajax({
					url : "refreshFAQCategory.action",
					type : "POST",
					success : function(data) { //recieve Json
						//console.log("data: " + data);
						var optionStr = "";

						categoryObj = JSON.parse(data);

						for (var i = 0; i < Object.keys(categoryObj).length; i++) {
							if (i == Object.keys(categoryObj).length - 1) {
								optionStr += "<option selected class = 'category_list_option' value="+ categoryObj[i].faq_cat_name +">"
								+ categoryObj[i].faq_cat_name + "</option>";
							}else{
								optionStr += "<option class = 'category_list_option' value="+ categoryObj[i].faq_cat_name +">"
								+ categoryObj[i].faq_cat_name + "</option>";
							}
							
						}

						$(".category_list_option").remove();
						$("#category_list_select").append(optionStr);

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

	function resetForm() {
		//console.log("reset");
		$('#summernote').summernote('code', '');
	}
</script>
