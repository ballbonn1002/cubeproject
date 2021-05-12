<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
.text-l {
	text-align: left;
}
</style>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<!-- Summernote [css/js] -->
<link
	href="../assets/global/plugins/bootstrap-summernote/summernote.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-summernote/summernote.min.js"
	defer></script>
<!-- End of Summernote [css/js] -->
<!-- File Input [css/js] -->
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript" defer></script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<!-- <script src="../assets/global/plugins/jquery.blockui.min.js" -->
<!-- 	type="text/javascript"></script> -->
<!-- End of File Input [css/js] -->
<!-- Tags Input [css/js] -->
<link
	href="../assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.css"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css"
	rel="stylesheet" type="text/css" />
<link href="../assets/global/css/components.min.css" rel="stylesheet"
	id="style_components" type="text/css" />
<link href="../assets/global/css/plugins.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="../assets/global/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"
	type="text/javascript" defer></script>
<script src="../assets/global/plugins/typeahead/handlebars.min.js"
	type="text/javascript" defer></script>
<script src="../assets/global/plugins/typeahead/typeahead.bundle.min.js"
	type="text/javascript" defer></script>
<script
	src="../assets/pages/scripts/components-bootstrap-tagsinput.min.js"
	type="text/javascript" defer></script>

<!-- End of Tags Input [css/js] -->
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
				class="fa fa-edit"></i>&nbsp;New Article
			</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">
		<!-- BEGIN FORM-->
		<form name="article_form" action="article-add" class="horizontal-form"
			method="POST" autocomplete="off" enctype="multipart/form-data">

			<div class="form-body">
			
				<div class="row">
					<!-- [<]Left column -->
					<div class="col-md-9">
						<div class="form-group">
							<div class="row" style="padding-bottom: 5px;">
								<div class="col-md-12">
									<label class="col-md-2 control-label">Topic</label>
									<div class="col-md-10">
										<input name="topic" type="text" class="form-control"
											placeholder="e.g. Top 10 Trending Technologies" required>
									</div>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row" style="padding-bottom: 5px;">
								<div class="col-md-12">

									<label class="col-md-2 col-xs-12 control-label">Type</label>
									<div class="col-md-10 col-xs-12">
										<div class="input-group">
											<select id="select_articleType" class="form-control select2"
												name="type" required>
												<option>-</option>
												<c:forEach var="articleType" items="${articleType}"
													varStatus="status">
													<option class="option_articleType"
														value="${articleType.article_type_id}">${articleType.name}</option>
												</c:forEach>
											</select> <span class="input-group-btn">
												<button type="button" onclick="addArticleType()"
													class="btn green-meadow">
													<i class="fa fa-plus"></i>&nbsp;Other type
												</button>
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row" style="padding-bottom: 5px;">

								<div class="col-md-12">

									<label class="col-md-2 col-xs-12 control-label">Author</label>
									<div class="col-md-10 col-xs-12">

										<select class="form-control select2me" name="author">
											<optgroup label="Enable">
												<c:forEach var="user" items="${cubeUser}">
													<c:if test="${user.enable == 1 }">
														<c:if test="${logonUser == nulll }">
															<option value="${user.id}" id="${user.id}"
																<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}">
														<c:out value="selected=selected"/> </c:if>>${user.department_id} - ${user.name}</option>
														</c:if>
														<c:if test="${logonUser != nulll }">
															<option value="${user.id}" id="${user.id}"
																<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
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
																<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}">
																<c:out value="selected=selected"/>
													</c:if>>${user.department_id} - ${user.name}</option>
														</c:if>
													</c:if>
												</c:forEach>
											</optgroup>
										</select>
									</div>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-md-12">

									<label class="col-md-2 col-xs-12 control-label">Tags </label>
									<div class="col-md-10 col-xs-12">
										<div>
											<input name="tags" type="text"
												class="form-control input-large" data-role="tagsinput">
										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
					<!-- [>]Right column -->
					<div class="col-md-3 text-center">

						<div class="form-group last">
							<div class="row">
								<div class="fileinput fileinput-new" data-provides="fileinput">
									<div class="fileinput-new thumbnail"
										style="width: 240px; height: 190px;">
										<img
											src="http://www.placehold.it/240x190/EFEFEF/AAAAAA&amp;text=cover+image"
											alt="cc">
									</div>
									<div class="fileinput-preview fileinput-exists thumbnail"
										style="max-width: 240px; max-height: 190px;"></div>
									<div class="text-center">
										<span class="btn default btn-file"> <span
											class="fileinput-new"><i class="fa fa-picture-o"></i>
												Select image </span> <span class="fileinput-exists"> Change
										</span> <input type="file" name="fileUpload"
											onchange="checkFileSize(this)">
										</span> <a href="javascript:;" class="btn red fileinput-exists"
											data-dismiss="fileinput"> Remove </a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group">
					<textarea id="summernote" name="detail" rows="10" required></textarea>
				</div>
			</div>
	</div>
	<br>
	<div class="form-actions action right">
		<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<button type="submit" class="btn blue-soft">
					<i class="fa fa-send-o"></i> Submit
				</button>
				<button onclick="cancel()" class="btn red-intense">
					<i class="fa fa-close"></i> Cancel
				</button>
			</div>
		</div>
	</div>
	</form>
	<!-- END FORM-->


</div>
</div>

<script>
	$(document)
			.ready(
					function() {

						$('#summernote')
								.summernote(
										{
											placeholder : 'Fill your article details.',
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

		form_data.append('articleImageFile', file);
		form_data.append('fileName', file.name);
		form_data.append('fileType', fileType);

		$.ajax({
			data : form_data,
			type : "POST",
			url : 'article_addImg.action',
			cache : false,
			contentType : false,
			processData : false,
			success : function(url) {
				$('#summernote').summernote('editor.insertImage', url);
				//console.log("Succesful uploaded " + url);
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
			url : "article_deleteImg",
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
		if (extension !== 'jpg' && extension !== 'jpeg' && extension !== 'png'
				&& extension !== 'bmp') {
			alert("Wrong file type."); // Do your thing to handle the error.
			inputFile.value = null; // Clear the field.
		}

	}

	function addArticleType() {
		//console.log("add Article Type!");
		bootbox.prompt({
			title : "New Article Type",
			size : "small",
			callback : function(result) {
				if (result != null) {
					saveArticleType(result);
				}
			}
		});
	}

	function saveArticleType(result) {
		//console.log($("form[name='article_form']").serialize());
		//console.log(result);
		$.ajax({
			url : "article_addType.action",
			type : "POST",
			data : "name=" + result,
			success : function(data) {
				//console.log("DATA: " + data);

				if (data == "existed") {
					//console.log("Failed");
					showToastWarining();
				} else {
					refreshArticleType();
					showToastSuccess("add article type success!");
				}

			}
		});

	}

	function refreshArticleType() {
		//console.log("refresh");
		$
				.ajax({
					url : "article_refreshArticleType.action",
					type : "POST",
					success : function(data) { //recieve Json
						//console.log("data: " + data);
						var optionStr = "";

						categoryObj = JSON.parse(data);

						for (var i = 0; i < Object.keys(categoryObj).length; i++) {
							if (i == Object.keys(categoryObj).length - 1) {
								optionStr += "<option selected class = 'option_articleType' value="+ categoryObj[i].id +">"
										+ categoryObj[i].name + "</option>";
							} else {
								optionStr += "<option class = 'option_articleType' value="+ categoryObj[i].id +">"
										+ categoryObj[i].name + "</option>";
							}

						}

						$(".option_articleType").remove();
						$("#select_articleType").append(optionStr);

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
		toastr
				.warning(
						"Existed this article type <br> Please check article type again",
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

	function cancel() {
		location.href = 'article-feed';
	}
</script>
