<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"
	var="date_now" />
<fmt:formatDate type="date" value="${now}" pattern="31-03-yyyy"
	var="lastday" />
<script src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/moment.min.js" type="text/javascript"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />
<style>
.end {
	text-align-last: right;
	font-size: 10px;
}
</style>
<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">
			<perm:permission object="training.view">
				<i class="fa fa-paperclip font-red"></i>
				<span id="title" class="caption-subject font-red sbold uppercase">Add
					My Training</span>
				<input type="hidden" name="actionpage" id="actionpage"
					value="${action}">
			</perm:permission>
			<perm:permission object="trainingAdmin.view">
				<i class="fa fa-paperclip font-red"></i>
				<span id="title" class="caption-subject font-red sbold uppercase">Add
					Training</span>
				<input type="hidden" name="actionpage" id="actionpage"
					value="${action}">
			</perm:permission>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form method="post" class="form-horizontal">
			<div class="form-body">

				<!-- Name -->
				<div class="form-group form-md-line-input">
					<label class="col-md-3 control-label" for="form_control_1">Applicant
						:</label>
					<div class="col-md-4 ">

						<perm:permission object="training.view">

							<select class="form-control" id="user" disabled>
								<option value="${onlineUser.id}" selected>${onlineUser.name}
									- ${onlineUser.roleId}</option>

							</select>
						</perm:permission>

						<%-- <select class="form-control"  >
						<c:forEach var="user" items="${userlist}">
						<option value="${user.id}" selected>${user.name} - ${user.roleId} </option>
						</c:forEach>
					</select> --%>

						<perm:permission object="trainingAdmin.view">
							<select class="bs-select form-control select2me  " id="user"
								name="name" id="userId1" onchange="s(this);">
								<optgroup label="Enable">
									<c:forEach var="user" items="${userseq}">

										<c:if test="${user.enable == 1 }">
											<c:if test="${userSelect == nulll }">
												<option value="${user.id}"
													<c:if test="${user.id eq onlineUser.id}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${userSelect != nulll }">
												<option value="${userSelect}"
													<c:if test="${user.id eq userSelect}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
								<optgroup label="Disable">
									<c:forEach var="user" items="${userseq}">

										<c:if test="${user.enable == 0 }">
											<c:if test="${userSelect == nulll }">
												<option value="${user.id}"
													<c:if test="${user.id eq onlineUser.id}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
											<c:if test="${userSelect != nulll }">
												<option value="${userSelect}"
													<c:if test="${user.id eq userSelect}"><c:out value="selected=selected"/></c:if>>${user.department_id}
													- ${user.name}</option>
											</c:if>
										</c:if>
									</c:forEach>
								</optgroup>
							</select>
						</perm:permission>


					</div>


				</div>


				<!-- End Name -->
				<!-- Lecturer: -->
				<div class="form-group">
					<label class="col-md-3 control-label"><label style="color:red; margin-right: 5px;">*</label>Lecturer :</label>
					<div class="col-md-6">
						<input id="lecturer" type="text" class="form-control length" data-id="1"
							placeholder=" " maxlength="255">
							<div class="end" id="count1" style="display: none;">
							    <span class="form-text text-muted" id="current_count_1" >0</span>
							    <span class="form-text text-muted" id="maximum_count_1">/ 255</span>
							</div>
					</div>
				</div>

				<!-- End Lecturer: -->
				<!-- Training Title -->
				<div class="form-group">
					<label class="col-md-3 control-label"><label style="color:red; margin-right: 5px;">*</label>Training Title :</label>
					<div class="col-md-6">
						<input id="t_title" type="text" class="form-control length" data-id="2"
							placeholder=" " maxlength="255">
							<div class="end" id="count2" style="display: none;">
							    <span class="form-text text-muted" id="current_count_2" >0</span>
							    <span class="form-text text-muted" id="maximum_count_2">/ 255</span>
							</div>
					</div>
				</div>
				<!-- End Training Title -->

			</div>
			<!-- Duration -->
			<div class="form-group">
				<label class="col-md-3 control-label"><label style="color:red; margin-right: 5px;">*</label>Duration :</label>
				<div class="col-md-6">
					<div class="input-group input-large date-picker input-daterange"
						data-date-format="dd-mm-yyyy">
						<input type="text" class="form-control" id="date_from" name="from"
							readonly required> <span class="input-group-addon" > to </span> <input
							type="text" class="form-control" id="date_to" name="to" readonly required>
					</div>


				</div>
			</div>
			<!-- End Duration -->

			<!-- Hour Training -->
			<div class="form-group">
				<label class="col-md-3 control-label"><label id="req_h" style="color:red; margin-right: 5px;">*</label>Hour :</label>
				<div class="col-md-2">
					<input type="number" class="form-control length" id="t_Hour" data-id="3" 
						oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
    					maxlength = "3" onkeypress="return event.charCode >= 48" min="1" >
    					<div class="end" id="count3" style="display: none;">
							<span class="form-text text-muted" id="current_count_3" >0</span>
							<span class="form-text text-muted" id="maximum_count_3">/ 3</span>
						</div>
				</div>
				<!-- End Hour Training -->
				<label class="col-md-1 control-label"><label id="req_m" style="color:red; margin-right: 5px;">*</label>Minute :</label>
				<div class="col-md-2">
					<select class="bs-select form-control length" id="t_Min">
						<option id="v1" value="0.00" selected>0</option>
						<option id="v2" value="0.25">15</option>
						<option id="v3" value="0.50">30</option>
						<option id="v4" value="0.75">45</option>
					</select>
				</div>
			</div>
			<!-- End Minute Training -->
			

			<!-- Location -->
			<div class="form-group">
				<label class="col-md-3 control-label">Location :</label>
				<div class="col-md-6">
					<input type="text" id="location" class="form-control length" data-id="4" name="defaultconfig"
						placeholder=" " maxlength="255">
						<div class="end" id="count4" style="display: none;">
						    <span class="form-text text-muted" id="current_count_4" >0</span>
						    <span class="form-text text-muted" id="maximum_count_4">/ 255</span>
						</div>
				</div>
			</div>
			<!-- End Location -->
			<!-- Description -->
			<div class="form-group">
				<label class="col-md-3 control-label">Description :</label>
				<div class="col-md-6">
					<textarea style="word-break: break-all; white-space: normal;"
						maxlength="1024" class="form-control length" rows="6" name="description" data-id="5"
						id="description"></textarea>
						<div class="end" id="count5" style="display: none;">
							<span class="form-text text-muted6" id="current_count_5" >0</span>
							<span class="form-text text-muted" id="maximum_count_5">/ 1024</span>
						</div>
					<div class="form-control-focus"></div>
				</div>
			</div>
			<!-- End Description -->
	</div>
	<div class="form-actions">
		<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<div class="btn btn-sm blue-soft" onclick="save()">
					<i class="fa fa-send-o"></i> Submit
				</div>


				<div class="btn btn-sm red-intense" onclick="cancle()">
					<i class="fa fa-close"></i> Cancel
				</div>

			</div>
		</div>
	</div>

	</form>
	<!-- END FORM-->
</div>


<script>
$(document).ready(function() {
	$('.end').hide();
	$('.select2me').select2();
	
	$("#t_Hour").keyup(function(){
		$('#req_m').hide();

	});
	$('#t_Min').change(function(){ $('#req_h').hide(); });

});
	
$('.length').keyup(function(){
	var id = $(this).data('id');
	var check = $(this).val().length;
		
	if(check > 0){
		document.getElementById('count'+id).style.display = "block";
	} else {
		document.getElementById('count'+id).style.display = "none";
	}
		document.getElementById('current_count_'+id).innerHTML = check ;
});

</script>
<!-- <script>
function check_char(elm){
	if(elm.value.match(/^[!@#$%^&*()_+\-=\[\]{};:\\|,.<>\/?]*$/) && (elm.value.length > 0)){
		swal({
					title : "ERROR",
					text : "ห้ามใส่อักขระพิเศษ"  + "\n (ex. / ^ [ ] ! @ # $ % & * ( ) _ + \ - = {  } ; : , < > . ?)",
					type : "error"
			},
			function() {
					
			});
		elm.value = "";
	}
}
</script> -->
<script>
function save() {	
	var name = document.getElementById('user').value;
	var lecturer = document.getElementById('lecturer').value;
	var t_title = document.getElementById('t_title').value;
	var t_hour = document.getElementById('t_Hour').value;
	var t_min = document.getElementById('t_Min').value;
	var start_date = document.getElementById('date_from').value;
	var end_date = document.getElementById('date_to').value;
	var location = document.getElementById('location').value;
	var description = document.getElementById('description').value;
	
	console.log(name);
	console.log(lecturer);
	console.log(t_title);
	console.log(t_hour);
	console.log(t_min);
	console.log(date_from);
	console.log(date_to);
	console.log(location);
	console.log(description);
	
	if(t_hour != "" && t_min != 0){
		t_hour = Number(parseFloat(t_hour).toFixed(2));
		t_min = Number(parseFloat(t_min).toFixed(2));
		t_hour = t_hour + t_min ;
		console.log(t_hour);
	}
	else if(t_hour != "" && t_min == 0){
		t_hour = Number(parseFloat(t_hour).toFixed(2));
		t_min = Number(parseFloat(t_min).toFixed(2));
		t_hour = t_hour + t_min ;
		console.log(t_hour);
	}
	else if((t_hour == "" || t_hour == 0) && t_min !=0){
		t_hour = t_hour + t_min;
		console.log(t_hour);
	}

	if ((name == "" || lecturer == "" || t_title == "" || start_date == "" || end_date == "") || (t_hour == "" && t_min == 0.00)){
		swal("Error!", "Required! fields must be filled in.", "error");
	}
	else {	
		$.ajax({
				url : "Training_Save",
				method : "POST",
				type : "JSON",
				data : {
					"name" : name,
					"lecturer" : lecturer,
					"title" : t_title,
					"hours" : t_hour,
					"mins" : t_min,
					"start_date" : start_date,
					"end_date" : end_date,
					"location" : location,
					"detail" : description,
					"user_update" : "${onlineUser.id}",
					"user_create":	"${onlineUser.id}",			
				},
				success : function(data) {
					swal(
							{
								title : "Pass",
								text : "Saved Succcess",
								type : "success"
							},
							function() {
								window.location=document.referrer;
							});
				}
		}); 
	}
}
	function s(sel) {
		// alert(sel.value) ;
		var userId = $('#userId1').val();

		$.ajax({
			type : 'POST',
			url : "${pageContext.request.contextPath}/search_select",
			data : {
				"userId" : userId
			},
		}).done(function(data) {
			//console.log(data);
			console.log($('.test').html(data));
		}).fail(function() {
			//alert("เกิดข้อผิดพลาด");
		});
	}
	
</script>
<script>
	function cancle() {
		location.href = "javascript:history.back()";
	};
	
</script>