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
<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-paperclip font-red"></i> <span id="title"
				class="caption-subject font-red sbold uppercase">Add My
				Training</span> <input type="hidden" name="actionpage" id="actionpage"
				value="${action}">
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
					<label class="col-md-3 control-label" for="form_control_1">Applicant test
						:</label>
					<div class="col-md-4 ">

					<perm:permission object="training.view">
					
						<select class="form-control" id="user" disabled >
						<option value="${onlineUser.id}" selected>${onlineUser.name} - ${onlineUser.roleId} </option>
						
					</select>
					</perm:permission>
					
						<%-- <select class="form-control"  >
						<c:forEach var="user" items="${userlist}">
						<option value="${user.id}" selected>${user.name} - ${user.roleId} </option>
						</c:forEach>
					</select> --%>
					
					<perm:permission object="trainingAdmin.view">
					<select class="bs-select form-control select2me  " id="user" name="name"
							id="userId1" onchange="s(this);">
							<optgroup label="Enable">
								<c:forEach var="user" items="${userseq}">

									<c:if test="${user.enable == 1 }">
										<c:if test="${userSelect == nulll }">
											<option value="${user.id}"
												<c:if test="${user.id eq onlineUser.id}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
										<c:if test="${userSelect != nulll }">
											<option value="${userSelect}"
												<c:if test="${user.id eq userSelect}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
							<optgroup label="Disable">
								<c:forEach var="user" items="${userseq}">

									<c:if test="${user.enable == 0 }">
										<c:if test="${userSelect == nulll }">
											<option value="${user.id}"
												<c:if test="${user.id eq onlineUser.id}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
										<c:if test="${userSelect != nulll }">
											<option value="${userSelect}"
												<c:if test="${user.id eq userSelect}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
						</select>
					</perm:permission>
					
					
					</div>
					
					
				</div> 

				<div class="form-group">
					<label class="col-md-3 control-label">Name :</label>
					<div class="col-md-6">
						<input id="user" type="text" class="form-control" placeholder=" ">
					</div>
				</div>
				<!-- End Name -->
				<!-- Lecturer: -->
				<div class="form-group">
					<label class="col-md-3 control-label">Lecturer :</label>
					<div class="col-md-6">
						<input id="lecturer" type="text" class="form-control"
							placeholder=" ">
					</div>
				</div>

				<!-- End Lecturer: -->
				<!-- Training Title -->
				<div class="form-group">
					<label class="col-md-3 control-label">Training Title :</label>
					<div class="col-md-6">
						<input id="t_title" type="text" class="form-control"
							placeholder=" ">
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
						<input type="text" class="form-control" id="date_from" name="from"
							required> <span class="input-group-addon"> to </span> <input
							type="text" class="form-control" id="date_to" name="to" required>
					</div>


				</div>
			</div>
			<!-- End Duration -->

			<!-- Hour Training -->
			<div class="form-group">
				<label class="col-md-3 control-label">Hour Training :</label>
				<div class="col-md-3">
					<select class="bs-select form-control" name="amount_sub"
						id="t_Hour">
						<option value="1" selected>1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
					</select>
				</div>
			</div>
			<!-- End Hour Training -->

			<!-- Location -->
			<div class="form-group">
				<label class="col-md-3 control-label">Location :</label>
				<div class="col-md-6">
					<input type="text" id="location" class="form-control"
						placeholder=" ">
				</div>
			</div>
			<!-- End Location -->
			<!-- Description -->
			<div class="form-group">
				<label class="col-md-3 control-label">Description :</label>
				<div class="col-md-6">
					<textarea style="word-break: break-all; white-space: normal;"
						maxlength="1024" class="form-control" rows="6" name="description"
						id="description" onkeyup='check_char(this)'></textarea>
					<div class="form-control-focus"></div>
				</div>
			</div>
			<!-- End Description -->
	</div>
	<div class="form-actions">
		<div class="row">
			<div class="col-xs-12" style="text-align: center;">
				<perm:permission object="training.view">
				<div  class="btn btn-sm blue-soft" onclick="save()">
					<i class="fa fa-send-o"></i> Submit
				</div>
				</perm:permission>
				<perm:permission object="trainingAdmin.view">
				<div  class="btn btn-sm blue-soft" onclick="save_admin()">
					<i class="fa fa-send-o"></i> Submit
				</div>
				</perm:permission>
				<perm:permission object="training.view">
				<div  class="btn btn-sm red-intense" onclick="cancle()">
					<i class="fa fa-close"></i> Cancel
				</div>
				</perm:permission>
				<perm:permission object="trainingAdmin.view">
				<div class="btn btn-sm red-intense" onclick="cancle_admin()">
					<i class="fa fa-close"></i> Cancel
				</div>
				</perm:permission>
			</div>
		</div>
	</div>

	</form>
	<!-- END FORM-->
</div>


<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script>
function check_char(elm){
	
	if(elm.value.match(/['"]/) && elm.value.length>0){
		swal(
				{
					title : "ERROR",
					text : "ห้ามใส่อักขระพิเศษ",
					type : "error"
				},
				function() {
					
				});
	
	}
}
</script>
<script>
	var toISODate = (date) => {
		return date.substring(6,10)+"-"+date.substring(3,5)+"-"+date.substring(0,2);
	}
	var toTimestamp = (date) => {
		return Date.parse(toISODate(date));
	}
	var toDisplayDate = (date) => {
		return date.toLocaleDateString('en-GB').replace('/','-').replace("/",'-');
	}
</script>



<c:if test="${leave == null}">
	<c:set var="leave" value="''" />
</c:if>
<script>
    $(()=>{
        var userList = ${userList};
        var action = '${action}';
        var user;
        var manager;
        if(action == 'Edit'){
            var leave = ${leave};
            user = leave.userId;
            manager = leave.apprUserId;
            $('form').attr('action','LeaveEdit_Do');
        } else {
            user = "${onlineUser.id}";
            manager = "${onlineUser.managerId}";
            $('form').attr('action','LeaveAdd_Do');
        }
        user = user.toLowerCase();
        manager = manager.toLowerCase();

        /* Date from leave calendar */
        if('${date}' != '' && action=='Add'){
            $('#date_from').val('${date}');
			$('#date_to').val('${date}');
            $('#amount').val(1);
        }

        /* Start Applicant/Approver List */
        for(let i=0; i<userList.length; i++){
            let id = userList[i].id.toLowerCase();
            let name = userList[i].name;
            let status = userList[i].enable;
            let option = '<option value="'+id+'">'+name+'</option>';

            if(status == '1'){
                $('#u_enable').append(option);
                $('#approver').append(option);
            }
            else{
                $('#u_disable').append(option);
            }
        }
        $('#user').val(user);
        $('#user').trigger('change');
        $('#approver').val(manager);
        $('#approver').trigger('change');
        $('#user').change(()=>{
            let val = $('#user').val();
            for(let i=0; i<userList.length; i++){
                let user = userList[i].id.toLowerCase();
                let mng = userList[i].manager;
                if( user == val ){
                    $('#approver').val(mng.toLowerCase());
                    $('#approver').trigger('change');
                }
            }
        })
        /* End Applicant/Approver List */

        /* Start Leave Edit init */
        if(leave != null){
			var noDay = leave.noDay.toString().split(".");
			var amount = noDay[0];
			var amount_sub = '0.'+noDay[1];
			if(isNaN(amount_sub)){ amount_sub = 0;}
			$('#date_from').val(toDisplayDate(new Date(leave.startDate)));
			$('#date_to').val(toDisplayDate(new Date(leave.endDate)));
			$('#amount').val(amount);
			$('#amount_sub').val(amount_sub);
			$('#description').html(leave.description);
			$('#status').val(leave.leaveStatusId);
			$('#reason').html(leave.reason);
			$('#lt_'+leave.leaveTypeId).prop('checked','checked');
			if(leave.halfDay != 0) { $('#hd_'+leave.halfDay).prop('checked','checked'); }
        }
        /* End Leave Edit init */
    })
</script>

<!-- Start check authority -->
<c:if test="${!userAuthority.contains('leave.approve')}">
	<script>
        $(()=>{
            $('#status').attr('disabled',true);
		    $('#status_hidden').val($('#status').val());
		    $('#status').change(() => {
			    $('#status_hidden').val($('#status').val());
		    });
        })
	</script>
</c:if>
<c:if test="${!userAuthority.contains('leave.viewall')}">
	<script>
        $(()=>{
            $('#user').attr('disabled',true);
		    $('#user_hidden').val($('#user').val());
		    $('#user').change(() => { $('#user_hidden').val($('#user').val()); });

            $('#approver').attr('disabled',true);
		    $('#approver_hidden').val($('#approver').val());
		    $('#approver').change(() => { $('#approver_hidden').val($('#approver').val()); });
        })
	</script>
</c:if>
<!-- End check authority -->

<!-- Start datepicker -->
<c:if test="${holiday!=null}">
	<script>
		$(function(){
			var holiday;
			var holidays = [];
			holiday = JSON.parse('${holiday}');

			for(let i=0;i<holiday.length;i++){
				let start = new Date(holiday[i].start);
				let end = new Date(holiday[i].end);
				for(let j=start; j<=end; j.setDate(j.getDate()+1)){
					holidays.push(toDisplayDate(j));
				}
			}
		
			$('#date_from').datepicker({
				format: 'dd-mm-yyyy',
				daysOfWeekDisabled: [0,6],
				datesDisabled: holidays ,
				autoclose: true, 
			});
			$('#date_to').datepicker({
				format: 'dd-mm-yyyy',
				daysOfWeekDisabled: [0,6],
				datesDisabled: holidays ,
				autoclose: true, 
			});

			$('.input-daterange').change(function(){
				let amount = 0;
				let holiday_count = 0;
				let from = new Date( toISODate( $('#date_from').val() ) );
				let to = new Date( toISODate( $('#date_to').val() ) );
				if(from == to){
					amount = 1;
				}
				if(from < to){
					amount = ((to-from)/86400000)+1;
					for(let i=from; i<to; i.setDate(i.getDate()+1)){
						for(let j=0; j<holidays.length; j++){
							let holiday_ts = toTimestamp(holidays[j]);
							if(i.getTime() == holiday_ts){
								holiday_count++;
							}
						}
						if(i.getDay() == '0' || i.getDay() == '6'){
							holiday_count++;
						}
					}
					amount -= holiday_count;
				}
				else{
					amount = 1;
				}
				$('#amount').val(amount);
			});
		});
	</script>
</c:if>
<!-- End datepicker -->

<!--  alert leave type -->
<script>
function checkamount() {
	if (document.getElementById('amount').value == "0"){
		alert("Amount of day going to change to 1 day \n'Please Check Amount of Day Again'");
	}
}
</script>
<script>

function save() {	
	var name = document.getElementById('user').value;
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
	if (name == null || name == "" || start_date == null || start_date == "" || end_date == null || end_date == "") {
	swal("Error!", "Required! Duration", "error");
}
	else{	
		$
				.ajax({
					url : "Training_Save",
					method : "POST",
					type : "JSON",
					data : {
						"name" : name,
						"lecturer" : lecturer,
						"title" : t_tile,
						"hours" : t_hour,
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
									window.location.href = "Training_list?Id=${onlineUser.id}";
								});
					}

				}) 
	}
}
function save_admin() {	
	var name = document.getElementById('user').value;
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
	if (name == null || name == "" || start_date == null || start_date == "" || end_date == null || end_date == "") {
	swal("Error!", "Required! Duration", "error");
}
	else{	
		$
				.ajax({
					url : "Training_Save",
					method : "POST",
					type : "JSON",
					data : {
						"name" : name,
						"lecturer" : lecturer,
						"title" : t_tile,
						"hours" : t_hour,
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
									window.location.href = "Training_list_Admin";
								});
					}

				}) 
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
	$(document).ready(function() {

		$('.select2me').select2();

		/*     var date1 = new Date("06/22/2017");
		 var date2 = new Date("06/23/2017"); 
		 var timeDiff = Math.abs(date2.getTime() - date1.getTime());
		 var diffDays = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
		 alert(diffDays);  */

	});
</script>
<script>
	function cancle_admin() {
		location.href = 'Training_list_Admin';
	};
	
</script>
<script>
	function cancle() {
		location.href = 'Training_list?Id=${onlineUser.id}';
	};
	
</script>