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
				form</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<form action="timesheet_add" method="post" autocomplete="off">
			<input type="hidden" value="${user.id}" id="user" name="user_create"
				class="user">
			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">User
					:</label>
				<div class="col-md-8">
					<select class="bs-select form-control select2me" name="name" id="user.roletId" disabled>
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
				<div>
					<input type="hidden" name="name" id="user.roletId2" value="${logonUser}">
				</div>
			</div>
			
			<div class="form-group form-md-line-input"
				style="margin-left: 1px;">

				<div class="col-md-2">Date :</div>
				<div class="col-md-2">
					<div class=" date-picker input-daterange disableFuturedate"
						data-date-format="dd-mm-yyyy">
						<input name="date" class="form-control" maxlength="13" id="date"
							onchange="getTime()" required
							value="<fmt:formatDate type="both" value="${timesheetDate}" pattern="dd-MM-yyyy"/>"
							style="text-align: left;">
					</div>
				</div>
				<div class="col-md-1 form-group" style="text-align: left;">
					From:</div>
				<div class="col-md-2 form-group">
					<div class="input-icon">
						<input type="text" name="timeIn" id="startTime"
							class="form-control timepicker timepicker-24"
							value="${timeStart}" style="text-align: left; padding-left: 10px">
					</div>
				</div>
				<div class="col-md-1 form-group" style="text-align: left;">
					To:</div>
				<div class="col-md-2 form-group">
					<div class="input-icon">
						<input type="text" name="timeOut" id="endTime"
							class="form-control timepicker timepicker-24" value="${timeEnd }"
							style="text-align: left; padding-left: 10px">
					</div>
				</div>
			</div>
			
			<div class="row form-group form-md-line-input">
				<div class="col-md-2 form-group" style="text-align: left;">
					Team:</div>
				<div class="col-md-8">
					<input type="text" name="team" id="team" class="form-control"
						value="${lastTimesheet.getTeam() }"
						style="text-align: left; padding-left: 10px">
					<div class="form-control-focus"></div>
				</div>
			</div>
			
			<div class="form-group form-md-line-input">
				<div class="col-md-8 form-group" style="text-align: left;font-size:20px;font-weight:bold;color:#2fa4e7;"><div style="height:30px;width:5px;background-color:red;">
					&nbsp;&nbsp;&nbsp;&nbsp;Task</div></div>
			</div>
			
			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Project
					:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="projectf" id="project_id" data-value="${projectid }" value="${projectf.project_name }" list="pname" required>
					<datalist id="pname">
						<c:forEach var="project" items="${projectA}">
							<option data-value="${project.project_id }" value="${project.project_name }"/>
						</c:forEach>
					</datalist>
					<!--<input class="form-control" type="text" name="projectf"
						id="project_id">
					<select class="bs-select form-control select2me" name="projectf"
						id="project_id">
						<option value=" ">Select a Project</option>
					</select>-->
				</div>
			</div>

			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Function
					:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="functionf" id="projectF_id" data-value="${functionid }" value="${functionf.function_name }" list="fname" required>
					<datalist id="fname">
						<c:forEach var="func" items="${functionL}">
							<option data-value="${func.function_id }" value="${func.function_name }"/>
						</c:forEach>
					</datalist>
					<!--<select class="bs-select form-control select2me" name="functionf"
						id="projectF_id">
						<c:forEach items="${functionList}" var="functionp">
							<option value="${functionp.function_id}"
								<c:if
									test="${fn:containsIgnoreCase(functionp.function_id,timesheet.getFunction_id())}">
									<c:out value="selected=selected" />
							</c:if>>

								${functionp.function_name}</option>
						</c:forEach>
					</select>-->
				</div>
			</div>
			<br>

			
			<input type="hidden" id="demo1" name="description">

			<div class="row">
				<div class="col-md-12 form-group" style="margin-top: 20px">
					<label class="col-md-2 control-label" for="form_control_1">Task Description
						:</label>
					<div class="col-md-8">
						<textarea style="word-break: break-all; white-space: normal;"
							maxlength="255" id="textarea1" class="form-control" rows="3"
							required></textarea>
						<div class="form-control-focus"></div>
					</div>
				</div>
			</div>
			
			<div class="form-group form-md-line-input">
				<label class="col-md-2 control-label" for="form_control_1">Time spent hour
					:</label>
				<div class="col-md-2">
					<input class="form-control" type="text" name="tsh" id="tsh" placeholder="0h 00m" value="">
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
						<input type="checkbox" id="checkbox1" class="md-check" data-toggle="collapse" data-target="#collapseOne"
							aria-expanded="false" aria-controls="collapseOne"> <label
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
							class="form-control timepicker timepicker-24" value="${timeEnd}">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-2">End Overtime :</div>
					<div class="col-xs-10 col-md-7">
						<input type="text" name="endTimeot" id="endTimeot"
							class="form-control timepicker timepicker-24" value="${timeEnd}">
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-xs-2">Description Overtime :</div>
					<div class="col-xs-10 col-md-7">
						<textarea style="word-break: break-all; white-space: normal;"
							maxlength="255" id="textarea1ot" class="form-control" rows="3"
							required></textarea>
					</div>
				</div>
			</div>

			<!-- end form Ot -->
			
			<div style="margin-top: 2cm;">
				<div class="form-group form-md-line-input" align="center">
					<button type="button" id="demo" class="btn sbold blue-soft"
						onclick="check()">
						<i class="fa fa-save"></i>&nbsp;Save Timesheet
					</button>
					<button type="reset" class="btn red-intense"
						onclick="window.history.go(-1); return false;">
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
	<perm:permission object="timesheet.edit">
		document.getElementById('user.roletId').disabled = false;
		document.getElementById('user.roletId2').disabled = true;
	</perm:permission>
</script>
<script>
	function check() {
		var des = document.getElementById('textarea1').value;
		var start = document.getElementById('startTime').value + ':00';
		var end = document.getElementById('endTime').value + ':00';
		var w = document.getElementById('date').value;
		console.log(w);
		var datenew = w;
		datenew = datenew.replaceAll("/", "-");
		datenew = datenew.split("-").reverse().join("-");
		var timestart = datenew + " " + start;
		var endtime = datenew + " " + end;
		var user = '${user.id}';
		var useradd = '${useradd}';
		var projectf = document.getElementById('project_id').value;
		var valuepid = $('#project_id').val();
		var projectid = $('#pname [value="'+ valuepid + '"]').data('value');
		//var functionf = 0;
		var functionf = document.getElementById('projectF_id').value;
		var valuefid = $('#projectF_id').val();
		var functionid = $('#fname [value="'+ valuefid + '"]').data('value');
		
		var desot = document.getElementById('textarea1ot').value;
		var startot = document.getElementById('startTimeot').value + ':00';
		var endot = document.getElementById('endTimeot').value + ':00';
		
		var timestartot = datenew + " " + startot;
		var endtimeot = datenew + " " + endot;
		var team = document.getElementById('team').value;
		
		console.log(desot + "" + startot+ "" +endot);
	
		if (projectf == null || projectf == "") {
			swal("Error!", "Required! Please, Selected Project", "error");
		}
		else if (functionf == null || functionf == "") {
			swal("Error!", "Required! Please, Selected Function", "error");
		}
		else if (des == null || des == "") {
			swal("Error!", "Required! Description", "error");
		}
		else {
			$.ajax({
						url : "timesheet_add",
						method : "POST",
						type : "JSON",
						data : {
							"name" : user,
							"useradd" : useradd,
							"description" : des,
							"timestart" : timestart,
							"endtime" : endtime,
							"projectf" : projectf,
							"projectid" : projectid,
							"functionf" : functionf,
							"functionid" : functionid,
							"descriptionot" : desot,
							"timestartot" : timestartot,
							"endtimeot" : endtimeot,
							"team" : team,
							"d" : w
						},
						success : function(data) {
							swal(
									{
										title : "Pass",
										text : "Saved Succcess",
										type : "success"
									},
									function() {
										/*window.location.href = "timesheet_list?userseq="
												+ user;*/
										window.location.href = "openTimesheetEdit";
									});
						}

					})
		}
	}
</script>
<script>
	/*$("input").change(function() {
		var $input = $(this);
		//$("p").html($input.is(":checked") + "</b>");
	})*/
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

	/*$(document).ready(function() {
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
	});*/
</script>
<script>
	$(document).ready(function () {
		$('#project_id').on('change click', function() {
			var value = $('#project_id').val();
			var projectID = $('#pname [value="'+ value + '"]').data('value');
			//console.log(value);
			if(projectID==null){
				$('#fname').empty();
			}
			$.ajax({
				url: "timesheet_findpfunc",
				method : "POST",
				data : "project_id=" + projectID,
				dataType : "text",
				success : function(data) {				
					var obj = JSON.parse(data);
					var i=0;
					$('#fname').empty();
					for(i in obj.name){
						var option = document.createElement('option');
						//option.value = obj.name[i];
						option.setAttribute("value", "");
						option.setAttribute("value", obj.name[i]);
						option.setAttribute("data-value", obj.id[i]);
						$('#fname').append(option);
						
					}
				}
			})
		});
	});
</script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>

<c:set var="now" value="<%=new java.util.Date()%>" />