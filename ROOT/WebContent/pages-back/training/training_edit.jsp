<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"
	var="date_now" />
<fmt:formatDate type="date" value="${now}" pattern="31-03-yyyy"
	var="lastday" />
<script src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>


<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
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
				<i class="fa fa-paperclip font-red"></i> <span id="title"
					class="caption-subject font-red sbold uppercase">Edit My Training</span> <input type="hidden" name="actionpage" id="actionpage"
					value="${action}">
					</perm:permission>
					<perm:permission object="trainingAdmin.view">
				<i class="fa fa-paperclip font-red"></i> <span id="title"
					class="caption-subject font-red sbold uppercase">Edit Training Manager</span> <input type="hidden" name="actionpage" id="actionpage"
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
					<div class="form-group" >
						<label class="col-md-3 control-label">Name : </label>
						<div class="col-md-6">

						<input id="user" type="text" class="form-control"
								value="${Traininglist.user_id}" disabled>
						</div>
					</div>
					<!-- End Name -->
					<!-- Lecturer: -->
					<div class="form-group">
						<label class="col-md-3 control-label">Lecturer :</label>
						<div class="col-md-6">
							<input id="lecturer" type="text" class="form-control length" data-id="1" 
								maxlength="255" value="${Traininglist.lecturer}">
								<div class="end" id="count1" >
								    <span class="form-text text-muted" id="current_count_1" >0</span>
								    <span class="form-text text-muted" id="maximum_count_1">/ 255</span>
								</div>
						</div>
					</div>

					<!-- End Lecturer: -->
					<!-- Training Title -->
					<div class="form-group">
						<label class="col-md-3 control-label">Training Title :</label>
						<div class="col-md-6">
							<input id="t_title" type="text" class="form-control length" data-id="2" 
								maxlength="255" value="${Traininglist.title}">
									<div class="end" id="count2" >
								    <span class="form-text text-muted" id="current_count_2" >0</span>
								    <span class="form-text text-muted" id="maximum_count_2">/ 255</span>
								</div>
						</div>
					</div>
					<!-- End Training Title -->

				</div>
				<!-- Duration -->
				<div class="form-group">
					<label class="col-md-3 control-label">Duration :</label>
					<div class="col-md-6">
						<div class="input-group input-large date-picker input-daterange"
							data-date-format="dd-mm-yyyy">
							<input name="startDate" type="text" class="form-control cannot"
										id="date_from" placeholder="Start date" required
										value="<fmt:formatDate value="${Traininglist.start_date}" type="date" 
										pattern="dd-MM-yyyy"/>">
									<span class="input-group-addon">To</span> <input
										name="endDate" type="text" required id="date_to"
										value="<fmt:formatDate value="${Traininglist.end_date}" type="date" 
										pattern="dd-MM-yyyy"/>"
										placeholder="End date" class="form-control cannot">
						</div>


					</div>
				</div>
				<!-- End Duration -->

				<!-- Hour Training -->
				<div class="form-group">
					<label class="col-md-3 control-label">Hour Training :</label>
					<div class="col-md-3">
						<input type="number" class="form-control length" id="t_Hour" data-id="3"
						oninput="javascript: if (this.value.length > this.maxLength) this.value = this.value.slice(0, this.maxLength);"
    					maxlength = "3" value="${Traininglist.hours}">
    					<div class="end" id="count3" >
							<span class="form-text text-muted" id="current_count_3" >0</span>
							<span class="form-text text-muted" id="maximum_count_3">/ 3</span>
						</div>
					</div>
				</div>
				<!-- End Hour Training -->

				<!-- Location -->
				<div class="form-group">
					<label class="col-md-3 control-label">Location :</label>
					<div class="col-md-6">
						<input type="text" id="location" class="form-control length" data-id="4" 
							maxlength="255" value="${Traininglist.location}">
							<div class="end" id="count4" >
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
							id="description" onkeyup='check_char(this)'>${Traininglist.detail}</textarea>
							<div class="end" id="count5" >
							    <span class="form-text text-muted" id="current_count_5" >0</span>
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
			
				<div  class="btn btn-sm blue-soft" onclick="save()">
					<i class="fa fa-send-o"></i> Submit
				</div>
			
				<div  class="btn btn-sm red-intense" onclick="cancle()">
					<i class="fa fa-close"></i> Cancel
				</div>
				
			
			</div>
		</div>
		</div>

		</form>
		<!-- END FORM-->
	</div>
	


<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script>
$( document ).ready(function() {
	var a = $('#lecturer').val().length;
	for(var i=1; i<=10; i++){
		var x = document.getElementsByClassName('length');
		if(x.length > 0){
			document.getElementById('current_count_'+i).innerHTML =  x[i-1].value.length;
		}
	}
});
</script>
<script>

	
	function save() {	
		
		/* var name = document.getElementById('user').value; */
		
		var lecturer = document.getElementById('lecturer').value;
		
		var t_tile = document.getElementById('t_title').value;
		
		var t_hour = document.getElementById('t_Hour').value;
		
		var start_date = document.getElementById('date_from').value;
		
		var end_date = document.getElementById('date_to').value;
		
		var location = document.getElementById('location').value;
		
		var description = document.getElementById('description').value;
		
		console.log(name);
		console.log(lecturer);
		console.log(t_title);
		console.log(t_hour);
		console.log(date_from);
		console.log(date_to);
		console.log(location);
		console.log(description);
		
 		$
					.ajax({
						url : "Training_EditSave",
						method : "POST",
						type : "JSON",
						data : {
							"trainingid" : ${Traininglist.trainingid},
							/* "name" : name, */
							"lecturer" : lecturer,
							"title" : t_tile,
							"hours" : t_hour,
							"start_date" : start_date,
							"end_date" : end_date,
							"location" : location,
							"detail" : description,
							"user_update" : "${onlineUser.id}",
							
							
						},
						success : function(data) {
							
							swal(
									{
										title : "Pass",
										text : "Saved Succcess",
										type : "success"
									},
									function(){
										window.location=document.referrer;
										} );
						}

					}) 
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