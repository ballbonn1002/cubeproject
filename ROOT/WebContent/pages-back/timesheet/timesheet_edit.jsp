<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<%--  ${expTravelTypeList} --%>
<%-- ${expSearchList}  --%>
<%-- ${expenseList} --%>

<%--  ${expenseList}   --%>

<%--  ${user.id} --%>
<%--  ${expenseList}  --%>
<%-- ${expenseList.dtStar} --%>
<%-- ${user.id} --%>
<%-- ${expSearchList} --%>
<style>
p {
	margin: 20px 0 0;
}

b {
	color: blue;
}
</style>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-money font-red"></i> <span
				class="caption-subject font-red sbold uppercase">TimeSheet
				Edit</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">

		<form action="timesheet_edit" method="post">
			<input type="hidden" value="${user.id}" id="user" name="user_create"
				class="user"> <input type="hidden" value="${exist}"
				id="exist" name="exist" class="user"> <input name="id"
				type="hidden" id="id" value="${timesheet.id}">
			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">User
					:</label>
				<div class="col-md-8">
					<select class="bs-select form-control select2me" name="name">
						<optgroup label="Enable">

							<c:forEach var="user" items="${cubeUser}">
								<c:if test="${user.enable == 1 }">
									<c:if test="${logonUser == nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,timesheet.getUserCreate())}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${logonUser != nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,timesheet.getUserCreate())}"><c:out value="selected=selected"/>
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
											<c:if test="${fn:containsIgnoreCase(user.id,timesheet.getUserCreate())}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${logonUser != nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,timesheet.getUserCreate())}"><c:out value="selected=selected"/>
													</c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
					</select>

				</div>
			</div>

			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Project
					:</label>
				<div class="col-md-3">
					<input class="form-control" type="text" name="projectf"
						id="project_id" value="${projectf.project_name}">

				</div>

				<div class="col-md-2 form-group" style="text-align: left;">
					Team:</div>
				<div class="col-md-3">
					<input type="text" name="team" id="team" class="form-control"
						value="${timesheet.getTeam() }"
						style="text-align: left; padding-left: 10px">
					<div class="form-control-focus"></div>
				</div>
			</div>

			<%-- <div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Project
					:</label>
				<div class="col-md-8">
					<select class="bs-select form-control select2me" name="projectf"
						id="project_id"
						onchange="getProjectFunction(project_id, projectF_id)">
						<c:forEach items="${projectA}" var="projectf">
        					<option value="${projectf.project_id}"
								<c:if
									test="${fn:containsIgnoreCase(projectf.project_id,timesheet.getProject_id())}">
									<c:out value="selected=selected" />
								</c:if>>
								${projectf.project_name}</option>
    					</c:forEach>
					</select>

				</div>
			</div> --%>

			<%-- <div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Function
					:</label>
				<div class="col-md-8">
					<select class="bs-select form-control select2me" name="functionf"
						id="projectF_id">
						<c:forEach items="${functionList}" var="functionp">
        					<option value="${functionp.function_id}"
								<c:if
									test="${fn:containsIgnoreCase(functionp.function_id,timesheet.getFunction_id())}">
									<c:out value="selected=selected" />
							</c:if>>

								${functionp.function_name}</option>
    					</c:forEach>
					</select>

				</div>
			</div> --%>
			<br>

			<div class="row form-group form-md-line-input"
				style="margin-left: 1px;">
				<div class="col-md-2">Date :</div>
				<div class="col-md-2">
					<div class="date-picker input-daterange disableFuturedate"
						data-date-format="dd-mm-yyyy">
						<input name="date" class="form-control" maxlength="13" id="date"
							onchange="getTime()" required
							value="<fmt:formatDate type="both" value="${timesheetDate}" pattern="dd-MM-yyyy"/>"
							style="text-align: left;">
					</div>
				</div>
				<div class="col-md-1 form-group" style="text-align: left;">
					From:</div>
				<div class="col-md-2">
					<div class="input-icon">
						<input type="text" name="timeIn" id="startTime"
							class="form-control timepicker timepicker-24"
							value="${timeStart}">
					</div>
				</div>
				<div class="col-md-1 form-group" style="text-align: left;">
					To:</div>
				<div class="col-md-2">
					<div class="input-icon">
						<input type="text" name="timeOut" id="endTime"
							class="form-control timepicker timepicker-24" value="${timeEnd }">
					</div>
				</div>
			</div>
			<input type="hidden" id="demo1" name="description">

			<div class="row">
				<div class="col-md-12 form-group" style="margin-top: 20px">
					<label class="col-md-2 control-label" for="form_control_1">Description
						:</label>
					<div class="col-md-8">
						<textarea style="word-break: break-all; white-space: normal;"
							maxlength="255" id="textarea1" class="form-control" rows="3"
							required>${timesheet.getDescription()}</textarea>
						<div class="form-control-focus"></div>
					</div>
				</div>
			</div>

			<div class="form-group form-md-line-input">
				<br>
			</div>
			<!-- start form Ot -->
			<div class="row">
				<div class="col-xs-2"></div>
				<div class="col-xs-10 col-md-7">
					<div class="md-checkbox">
						<input type="checkbox" id="checkbox1" class="md-check"> <label
							for="checkbox1" data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne"> <span
							class="inc"></span> <span class="check"></span> <span class="box"></span>
							Check Overtime
						</label>
					</div>
				</div>
			</div>



			<div id="collapseOne" aria-expanded="false" class="collapse">
				<br> <br>
				<div class="row">
					<div class="col-xs-2">Start Overtime :</div>
					<div class="col-xs-10 col-md-7">
						<input type="text" name="startTimeot" id="startTimeot"
							class="form-control timepicker timepicker-24"
							value="${timeStartot}">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-2">End Overtime :</div>
					<div class="col-xs-10 col-md-7">
						<input type="text" name="endTimeot" id="endTimeot"
							class="form-control timepicker timepicker-24"
							value="${timeEndot}">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-2">Description Overtime :</div>
					<div class="col-xs-10 col-md-7">
						<textarea style="word-break: break-all; white-space: normal;"
							maxlength="255" id="textarea1ot" name="textarea1ot"
							class="form-control" rows="3" required>${timesheet.getOT_description()}</textarea>
					</div>
				</div>
			</div>

			<!-- end form Ot -->
	</div>
	<div style="margin-top: 2cm;">
		<div class="form-group form-md-line-input" align="center">
			<button type="button" id="demo" class="btn sbold blue-soft"
				onclick="check()">
				<i class="fa fa-save"></i>&nbsp;Save Timesheet
			</button>
			<button type="reset" class="btn red-intense">
				<i class="fa fa-times-circle"></i>&nbsp;Cancel
			</button>
		</div>
	</div>
	</form>
</div>
</div>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$('.select2me').select2();
	});
</script>
<script>
	function check() {
		var startot = document.getElementById('startTimeot').value + ':00';
		var endot = document.getElementById('endTimeot').value + ':00';
		var desot = document.getElementById('textarea1ot').value;

		var id = document.getElementById('id').value;
		var des = document.getElementById('textarea1').value;
		var start = document.getElementById('startTime').value + ':00';
		var end = document.getElementById('endTime').value + ':00';
		var w = document.getElementById('date').value;
		//var datenew = w.split("/").reverse().join("/");
		var datenew = w;
		datenew = datenew.replaceAll("/", "-");
		datenew = datenew.split("-").reverse().join("-");

		var timestart = datenew + " " + start;
		var endtime = datenew + " " + end;

		var user = '${user.id}';
		var useradd = '${user.id}';
		var project = document.getElementById('project_id').value;
		//var functionf = document.getElementById('projectF_id').value;
		var functionf = 0;
		var exist = document.getElementById('exist').value;
		var team = document.getElementById('team').value;

		var timestartot = datenew + " " + startot;
		var endtimeot = datenew + " " + endot;

		$.ajax({
			url : "timesheet_update",
			method : "POST",
			type : "JSON",
			data : {
				"id" : id,
				"name" : user,
				"useradd" : useradd,
				"description" : des,
				"timestart" : timestart,
				"endtime" : endtime,
				"projectf" : project,
				"functionf" : functionf,
				"team" : team,
				"timestartot" : timestartot,
				"endtimeot" : endtimeot,
				"descriptionot" : desot
			},
			success : function(data) {
				swal({
					title : "Pass",
					text : "Saved Succcess",
					type : "success"
				}, function() {
					window.location.href = "timesheet_list?userseq=" + user;
				});
			}

		})

	}
</script>
<script>
	$("input").change(function() {
		var $input = $(this);
		$("p").html($input.is(":checked") + "</b>");
	}).change();
</script>
<script>
	$(document).ready(function() {
		var flag = '${flag}';
		if (flag != "") {
			var date = '${date}';
			document.getElementById("date").value = date;
		}
	});
</script>
<script>
	function getProjectFunction(idProj, idFunc) {
		var amphureObject = $(idProj);
		var districtObject = $(idFunc);
		// on change amphure

		var amphureId = $(amphureObject).val();

		$.getJSON('time_list?id=' + amphureId, function(result) {
			districtObject.empty();
			$.each(result, function(index, item) {
				districtObject.append($('<option></option>').val(
						item.function_id).html(item.function_name));
			});
		});
	};

	function getTime() {
		var startTime = document.getElementById("startTime");
		var endTime = document.getElementById("endTime");

		var user = document.getElementById("user").value;
		var dateObj = $(date).val();
		dateObj = dateObj.replaceAll("/", "-")
		dateObj = dateObj.split("-").reverse().join("-");
		$.getJSON('timechekin?date=' + dateObj + '&user=' + user, null,
				function(result) {

					var start = result[0].work_hours_time_work.split(" ")[3];
					var end = result[1].work_hours_time_work.split(" ")[3];
					startTime.value = start;
					endTime.value = end;
				})
	}
</script>
<script>
	$('form').submit(function() {
		$('#demo').attr("disabled", true);
	});

	function format2(n) {

		return n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");

	}
</script>

<script>
	var from = $("#from").val();
	var to = $("#to").val();
	/* alert(from+"  "+to); */

	function validate(evt) {
		var theEvent = evt || window.event;
		var key = theEvent.keyCode || theEvent.which;
		key = String.fromCharCode(key);
		var regex = /[0-9]|\./;
		if (!regex.test(key)) {
			theEvent.returnValue = false;
			if (theEvent.preventDefault)
				theEvent.preventDefault();
		}
	}
</script>
<script>
	var from = $("#from").text();
	var to = $("#to").text();

	<c:set var="from"  value="from"/>
	<c:set var="to"  value="to"/>
</script>
<script>
	$(document).ready(function() {
		var currentDate = new Date();
		$('.disableFuturedate').datepicker({
			format : 'dd-mm-yyyy',
			autoclose : true,
			endDate : "currentDate",
			maxDate : currentDate
		}).on('changeDate', function(ev) {
			$(this).datepicker('hide');
		});
		$('.disableFuturedate').keyup(function() {
			if (this.value.match(/[^0-9]/g)) {
				this.value = this.value.replace(/[^0-9^-]/g, '');
			}
		});
	});
</script>

<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />

