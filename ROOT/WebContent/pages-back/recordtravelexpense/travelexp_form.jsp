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
			<i class="fa fa-money font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Record
				travel expense form</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<br /> <br />
	<div class="portlet-body">
		<form action="expense_add" method="post" class="form-horizontal">
			<input type="hidden" value="${user.id}" id="user" name="userCreate"
				class="user">
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 control-label" for="form_control_1">Record
					date :</label>
				<div class="col-md-6">
					<input type="text" class="form-control" placeholder=""
						value="<fmt:formatDate type="both" value="${now}" pattern="dd-MM-yyyy"  />"
						disabled>
					<div class="form-control-focus"></div>

				</div>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 control-label" for="form_control_1">Requester
					:</label>
				<div class="col-md-6">
					<select class="bs-select form-control select2me" name="name">
						<optgroup label="Enable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 1 }">
									<c:if test="${userSelect == nulll }">
										<option value="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != nulll }">
										<option value="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,userSelect)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
						<optgroup label="Disable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 0 }">
									<c:if test="${userSelect == nulll }">
										<option value="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != nulll }">
										<option value="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,userSelect)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
					</select>

				</div>
			</div>
			<div class="form-group form-lg-line-input">

				<label class="col-md-3 control-label" for="form_control_1">Day
					of departure :</label>
				<div class="col-md-6 control-label">
					<div class="input-group date-picker input-daterange"
						data-date-format="dd-mm-yyyy">
						<input name="dayOfDeparture" class="form-control" maxlength="13"
							id="date" required
							value="<fmt:formatDate type="both" value="${now}" pattern="dd-MM-yyyy"  />"
							style="text-align: left;">
					</div>
				</div>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3  col-sm-3 control-label" for="form_control_1">Go
					by :</label>
				<div class="col-md-3 col-sm-3">
					<select class="bs-select form-control" name="expense.DtBy">
						<c:forEach var="expTravelTypeList" items="${expTravelTypeList}"
							varStatus="theCount">
							<option value="${expTravelTypeList.expTravelTypeId}">
								${expTravelTypeList.name}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-row">
					<label class="control-label col-md-1">Other :</label>
					<div class="col-md-2">
						<div class="input-group">
							<input name="expense.Goby" id="goBy" type="text"
								class="form-control goBy" maxlength="200" style="width: auto"
								placeholder="">
							<!--  <div class="form-control-focus"></div>-->
							<span class="input-group-btn">
								<button type="submit" id="other" class="btn green-meadow"
									onclick="addOther();">
									<i class="fa fa-plus"></i>&nbsp;Add
								</button>
							</span>
						</div>
					</div>

				</div>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 col-sm-3  col-xs-4 control-label"
					for="form_control_1">Beginning :</label>
				<div class="col-md-3 col-sm-3">
					<input name="expense.fromLocation" type="text" class="form-control"
						maxlength="100" placeholder="" onkeyup='check_char(this)'>
					<div class="form-control-focus"></div>

				</div>
				<div class="form-row">
					<label class="control-label col-md-1">Time :</label>
					<div class="col-md-3">
						<div class="input-icon">
							<input type="text" name="startTime"
								class="form-control timepicker timepicker-24">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 col-sm-3 control-label" for="form_control_1">Destination
					:</label>
				<div class="col-md-3 col-sm-3">
					<input name="expense.toLocation" type="text" class="form-control"
						maxlength="100" placeholder="" onkeyup='check_char(this)'>
					<div class="form-control-focus"></div>

				</div>
				<div class="form-row">
					<label class="control-label col-md-1">Time :</label>
					<div class="col-md-3">
						<div class="input-icon">
							<input type="text" name="endTime"
								class="form-control timepicker timepicker-24">
						</div>
					</div>
				</div>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 control-label" for="form_control_1">Purpose
					of journey :</label>
				<div class="col-md-6">
					<textarea style="word-break: break-all; white-space: normal;"
						maxlength="255" id="textarea1" class="form-control" rows="3"
						name="expense.description" onkeyup='check_char(this)'></textarea>
					<div class="form-control-focus"></div>

				</div>
			</div>

			<div class="form-group form-lg-line-input">
				<label class="col-md-3 control-label" for="form_control_1">Total
					:</label>
				<div class="col-md-6">
					<input name="expense.amount" type="text" min="1"
						class="form-control"
						onkeypress="if(event.keyCode < 47 || event.keyCode > 58)event.returnValue = false"
						required>
					<div class="form-control-focus"></div>

				</div>
				<label style="margin-left: 0.5cm;">บาท (Baht)</label>
			</div>
			<div class="form-group form-lg-line-input">
				<label class="col-md-3 control-label" for="form_control_1">Status
					:</label>
				<div class="col-md-6">
					<label for="form_control_1"
						style="padding-top: 10px; padding-bottom: 10px;">Pending</label>
				</div>
			</div>
			<div style="margin-top: 1cm;">
				<div class="form-group form-md-line-input"
					style="text-align: center">
					<button type="submit" id="demo" class="btn blue-soft"
						onclick="save();"
						>
						<i class="fa fa-save"></i>&nbsp;Save Travel Expense
					</button>
					<button type="reset" class="btn red-intense">
						<i class="fa fa-close"></i>&nbsp;Cancel
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<%-- ${userList} --%>
<%-- ${userseq} --%>
<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
	<div class="portlet-body">
		<form action="exp-search" method="post">
			<div class="form-row form-lg-line-input">
				<perm:permission object="requesttravellist.searchstaff">
					<label class="col-md-1 control-label">Staff :</label>
					<div class="col-md-2">
						<select class="form-control select2me" name="name">
							<optgroup label="Enable">
								<c:forEach var="user" items="${userseq}">

									<c:if test="${user.enable == 1 }">
										<c:if test="${userSelect1 == nulll }">
											<option value="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
												- ${user.name}</option>
										</c:if>
										<c:if test="${userSelect1 != nulll }">
											<option value="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,userSelect1)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
												- ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
							<optgroup label="Disable">
								<c:forEach var="user" items="${userseq}">

									<c:if test="${user.enable == 0 }">
										<c:if test="${userSelect1 == nulll }">
											<option value="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
												- ${user.name}</option>
										</c:if>
										<c:if test="${userSelect1 != nulll }">
											<option value="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,userSelect1)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
												- ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
						</select>
					</div>
				</perm:permission>
				<label class="control-label col-md-1">From :</label>
				<div class="col-md-2">
					<div class="input-group input-medium date-picker input-daterange"
						data-date-format="dd-mm-yyyy">
						<input type="text" class="form-control" name="from" id="from"
							value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"  />"
							id="from"><span class="input-group-addon">To</span> <input
							type="text" class="form-control" name="to" id="to"
							value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"  />">
					</div>
				</div>

				<div class="hidden-xs">
					<label class="col-md-1"></label>
				</div>

				<label class="control-label col-md-1">Status :</label>
				<div class="col-md-2">
					<select class="form-control select2me" name="status_exp">
						<option value="All"
							<c:if test="${status_form == 'All' }"><c:out value="selected=selected"/></c:if>>All</option>
						<option value="P"
							<c:if test="${status_form == 'P' }"><c:out value="selected=selected"/></c:if>>Paid</option>
						<option value="A"
							<c:if test="${status_form == 'A' }"><c:out value="selected=selected"/></c:if>>Approve</option>
						<option value="W"
							<c:if test="${status_form == 'W' }"><c:out value="selected=selected"/></c:if>>Waiting
							for approve</option>
						<option value="R"
							<c:if test="${status_form == 'R' }"><c:out value="selected=selected"/></c:if>>Reject</option>
						<option value="0"
							<c:if test="${status_form == '0' }"><c:out value="selected=selected"/></c:if>>Select</option>
					</select>
				</div>
				<label></label>
				<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-sm blue-steel">
						<i class="fa fa-search"></i> Search
					</button>
				</div>
			</div>
			<input type="hidden" name="userId" value="${user.id}">
		</form>

		<!-- start table -->
		<form
			action="update-group?userId=${userId}&from=${from}&to=${to}&userOnline=${onlineUser.id}"
			method="post" style="text-align: center;">
			<div class="portlet-body">

				<div class="portlet-body flip-scroll" style="margin-top: 3%">
					<table
						class="table table-striped table-condensed flip-content table-hover">
						<tbody>
						<thead class="flip-content">
							<tr style="background-color:rgb(59, 63, 81);color:white">

								<th style="text-align: center;" width="5%">ID</th>
								<th style="text-align: center;" width="10%">Date</th>
								<th style="text-align: center;" width="10%">Time</th>
								<th style="width: 25%; text-align: center;">From - To</th>
								<th style="text-align: center; width: 10%">By</th>
								<th style="text-align: center;" width="10%">Amount</th>
								<th style="text-align: center;" width="10%">Status</th>
								<th style="text-align: center;" width="5%">Edit</th>
								<th style="text-align: center;" width="5%">Delete</th>
								<th style="text-align: center;" width="5%">Select</th>
								<th style="text-align: center;" width="10%">Date Create</th>

							</tr>
						</thead>
						<c:forEach var="expSearchList" items="${expSearchList}"
							varStatus="count">
							<tr>

								<td style="text-align: center;">${expSearchList.expense_id}</td>
								<td style="text-align: center;" title=""><fmt:setLocale
										value="en_us" /> <fmt:formatDate
										value="${expSearchList.dt_start}" pattern=" dd-MM-yyyy" /></td>
								<td style="text-align: center;"><fmt:formatDate
										value="${expSearchList.dt_start}" pattern="HH:mm" /> ~ <fmt:formatDate
										value="${expSearchList.dt_end}" pattern=" HH:mm" /></td>
								<td
									style="word-break: break-all; white-space: normal; text-align: start">${expSearchList.from_location}
									- ${expSearchList.to_location}</td>

								<td style="text-align: center;"><c:forEach
										var="expTravelTypeList" items="${expTravelTypeList}">
										<c:if
											test="${expTravelTypeList.expTravelTypeId eq expSearchList.dt_by}"> ${expTravelTypeList.name} </c:if>
									</c:forEach></td>


								<td style="text-align: end;"><fmt:formatNumber
										minFractionDigits="2" value="${expSearchList.amount}" /></td>
								<td><c:choose>
										<c:when test="${expSearchList.expense_group_id == 0}">
											<span class="label label-sm  label-default"> Draft </span>
										</c:when>
										<c:otherwise>
											<c:if test="${expSearchList.status_id.toString() == 'W'}">
												<span class="label label-sm label-warning">Waiting
													for approve</span>
											</c:if>
											<c:if test="${expSearchList.status_id.toString() == 'A'}">
												<span class="label label-sm label-success">Approved</span>
											</c:if>
											<c:if test="${expSearchList.status_id.toString() == 'P'}">
												<span class="label label-sm label-primary">Paid</span>
											</c:if>
											<c:if test="${expSearchList.status_id.toString() == 'R'}">
												<span class="label label-sm label-danger">Reject</span>
											</c:if>
										</c:otherwise>
									</c:choose></td>
									<!-- button edit -->
								<td>
									<c:if test="${expSearchList.status_id == 'W' || expSearchList.status_id == null}">
										<a class="btn btn-outline circle btn-sm sbold blue" title="Edit"
										href="travelexp_edit_record?expenseId=${expSearchList.expense_id}">
										<i class="fa fa-pencil"></i></a>
									</c:if>
								</td>
								<%-- DELETE --%>
								<td style="text-align: center;">
									<%-- <a
									href="exp-delete?expId=${expSearchList.expense_id}&userId=${expSearchList.user_id}&from=${from}&to=${to}"><i
										class="fa fa-close font-red"></i></a> --%> <c:choose>
										<c:when test="${expSearchList.expense_group_id == 0}">
										<a class="btn btn-outline circle btn-sm red-intense" title="Delete">
											<i class="fa fa-close sweet-${expSearchList.expense_id}"
												onclick="_gaq.push(['_trackEvent', 'example', 'try', 'Primary']);"></i></a>
										</c:when>
										<c:otherwise>
									-
								</c:otherwise>
									</c:choose>
								</td>
								<td><c:choose>
										<c:when test="${expSearchList.expense_group_id == 0}">
											<div class="md-checkbox-list">
												<div class="md-checkbox" style="margin-left: 40%;">
													<input type="checkbox" name="expGroupId"
														id="${expSearchList.expense_id}" class="md-check"
														value="${expSearchList.expense_id}"> <label
														for="${expSearchList.expense_id}"> <span></span> <span
														class="check"></span> <span class="box"></span>
													</label>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<a href="request_form?Id=${expSearchList.expense_group_id}">
												${expSearchList.expense_group_id} </a>
										</c:otherwise>
									</c:choose></td>
								<td style="text-align: center;"><fmt:setLocale
										value="en_us" /> <fmt:formatDate
										value="${expSearchList.time_create}" pattern=" dd-MM-yyyy" /></td>
							</tr>
							<script>
								document
										.querySelector('.sweet-${expSearchList.expense_id}').onclick = function() {
									swal(
											{
												title : "Are you sure!",
												text : "You will be deleting this id!",
												type : "info",
												showCancelButton : true,
												confirmButtonClass : 'btn-primary',
												confirmButtonText : 'OK'
											},
											function(inputValue) {
												if (inputValue === false)
													return false;
												if (inputValue === "") {
													return false
												}
												document.location = "exp-delete?expId=${expSearchList.expense_id}&userId=${expSearchList.user_id}&from=${from}&to=${to}";
											});
								};
							</script>
						</c:forEach>
						</tbody>
					</table>

				</div>
			</div>
			<div class="form-group form-md-line-input"
				style="text-align: center;">
				<button type="submit" class="btn sbold blue-soft" id="demo15">
					<i class="fa fa-send-o"></i>&nbsp;Send requisition
				</button>
			</div>

		</form>
	</div>
</div>

<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script>
	$(document).ready(function() {
		$('.select2me').select2();
	});
</script>
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
	function addOther() {
		var other = $("#goBy").val();
		var user = $("input.user").val();
		//alert("user= "+user+" text= "+othor);	
		if (other != "") {
			$
					.ajax({
						type : 'POST',
						url : "${pageContext.request.contextPath}/add-other",
						data : {
							"other" : other,
							"user" : user
						},
					})
					.done(
							function(data) {
								console.log(data);
								console.log($('#goBy').html(data));

								swal(
										{
											title : "SUCCESS",
											type : "success",
											showConfirmButton : true
										},
										function(isConfirm) {
											if (isConfirm) {
												document.location = "travelexp_form?userId=${onlineUser.id}";
											}
										})

							}).fail(
							function() {
								swal('Go by already exist,',
										'Please select or change your Go by!',
										'error');
							});

		} else {
			swal('Please!', 'Input your GO by', 'warning');
		}

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
	$("#demo15").click(function() {

		if ($("p:first").text() == "false") {
			swal("Please select request expense!")
			document.getElementById("demo15").type = "button";
		} else {
			document.getElementById("demo15").type = "submit";
		}

	});
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
	
</script>


<c:set var="now" value="<%=new java.util.Date()%>" />