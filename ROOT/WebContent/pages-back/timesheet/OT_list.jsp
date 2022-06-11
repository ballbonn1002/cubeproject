<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="favicon.ico" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

	
<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>

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

<fmt:formatDate pattern="yyyy" value="${dateTimeNow}" var="year_now" />
<fmt:formatDate pattern="MM" value="${dateTimeNow}" var="month_now" />
<fmt:formatDate pattern="dd" value="${dateTimeNow}" var="day_now" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${dateTimeNow}"
	var="dateNow" />
<fmt:formatDate pattern="HH:mm" value="${dateTimeNow}" var="timeNow" />

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-edit font-red"></i> <span
				class="caption-subject font-red sbold "> OT </span>
		</div>
		<div class="actions">

			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
	<div class="portlet-body" style="text-align: center;">

		<form class="form-inline margin-bottom-40" action="searchOt"
			method="POST">
			<!-- --------------------------------------------------------------Start search------------------------------------------------------ -->
			<input type="hidden" id="tempuser" name="tempuser"
				class="form-control" />


			<perm:permission object="timesheet.edit">
				<div class="form-group form-md-line-input ">
					<label class="control-label" for="form_control_1">Staff : </label>
					<select class="form-control select2me" name="name" id="name"	>
						<optgroup label="Enable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 1 }">
									<c:if test="${userSelect == null }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != null }">
										<option value="${userSelect}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
						<optgroup label="Disable">
							<c:forEach var="user" items="${userseq}">

								<c:if test="${user.enable == 0 }">
									<c:if test="${userSelect == nulll }">
										<option value="${user.id}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
									<c:if test="${userSelect != nulll }">
										<option value="${userSelect}" id="${user.id}"
											<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
											- ${user.name}</option>
									</c:if>
								</c:if>
							</c:forEach>
						</optgroup>
					</select>
				</div>
			</perm:permission>
			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Month : </label> <select
					class="form-control select2me" name="monthSearch" id=monthSearch>
					<!-- qwerqwerqw -->
					<c:choose>
						<c:when test="${monthSearch != null}">
							<option value='01' id='01'
								<c:if test="${monthSearch == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${monthSearch == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${monthSearch == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${monthSearch == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${monthSearch == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${monthSearch == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${monthSearch == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${monthSearch == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${monthSearch == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${monthSearch == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${monthSearch == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${monthSearch == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:when>

						<c:otherwise>
							<option value='01' id='01'
								<c:if test="${month_now == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${month_now == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${month_now == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${month_now == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${month_now == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${month_now == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${month_now == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${month_now == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${month_now == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${month_now == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${month_now == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${month_now == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:otherwise>
					</c:choose>

				</select>
			</div>

			<div class="form-group form-md-line-input ">
				<label class="control-label" for="form_control_1">Year : </label> <select
					class="form-control select2me" name="yearSearch" id=yearSearch>
					<c:choose>
						<c:when test="${yearSearch != null}">
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}"
									<c:if test="${yearSearch == (year_now - i)}"><c:out value="selected=selected"/></c:if>>${year_now - i}</option>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}">${year_now - i}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
			</div>
			<button type="submit" class="btn btn-sm sbold blue-steel" onclick="ddd()">
				<i class="fa fa-search"></i> Search
			</button>
			<script>
				function ddd() {
					var x = $('select[name=name]').val();
					var y = "${onlineUser.id}";
					if (x == y && x != null) {
						document.getElementById("tempuser").value = y;
					} else if (x == "" || x == null) {
						document.getElementById("tempuser").value = y;
					} else {
						document.getElementById("tempuser").value = x;
					}
				}
			</script>

		</form>
		<!-- --------------------------------------------------------------End search------------------------------------------------------ -->

		<!-- -----------------------------------------start add-------------------------------------------- -->
<br>
		<div class="portlet-body" style="text-align: center;">
			<table class="table table-striped table-header-fixed" id="table_id">
				<thead>
					<tr style="background-color:rgb(59, 63, 81);color:white;height: 41px">
						<th class="text-center" width="50px"></th>
						<th class="text-center" width="200px">Date</th>
						<th class="text-center " width="550px"
							style="background-color: #3B3F51; color: white;">Detail</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Period of
							Time</th>
						<th class="text-center " width="250px"
							style="background-color: #3B3F51; color: white;">Approve</th>
						<th class="text-center " width="100px"
							style="background-color: #3B3F51; color: white;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="lts" items="${listot}" varStatus="Count">
						<tr>
							<fmt:formatDate var="test" value="${lts.OT_time_start}"
								pattern="E" />
							<c:set var="val" value="5" />
							<c:choose>
								<c:when test="${test=='Sun'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle red easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Mon'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle yellow-lemon easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Tue'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle red-pink easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Wed'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle green-jungle easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Thu'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle yellow-gold easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Fri'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle green easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:when test="${test=='Sat'}">
									<td class="text-center"><a href="javascript:;"
										class="btn btn-md btn-circle blue easy-pie-chart-reload"><i
											class="fa fa-calendar"></i></a></td>
								</c:when>
								<c:otherwise>
        						error.
							</c:otherwise>
							</c:choose>
							<td class="text-center">&emsp;<fmt:formatDate
									value="${lts.OT_time_start}" pattern="EE dd-MM-yyyy" /></td>
							<td class="text-left">${lts.OT_description}</td>
							<td class="text-center"><i class="fa fa-moon-o"
								style="color:blue;"></i>&nbsp;<fmt:formatDate
									value="${lts.OT_time_start}" pattern="HH:mm" /> - <fmt:formatDate
									value="${lts.OT_time_end}" pattern="HH:mm" /></td>
							<td>
							<perm:permission object="timesheet.edit">
							<div class="btn-group">
								<c:if test="${lts.status.toString() == 'W'}">
     									<div class="wait-${lts.id} btn-group dropup">
											<button class="btn yellow-crusta">Waiting for Approving</button>
											<button class="btn yellow-crusta dropdown-toggle" type="button" 
												data-delay="999" data-toggle="dropdown" data-close-others="true">
												<i class="fa fa-angle-up"></i></button>
											<ul class="dropdown-menu" role="menu" style="z-index:1000">
												<li class="list-group-item" style="background-color:#FAFAFA">
													<h5 class="title">You want to Approval?</h5></li>
												<li><h4 style="color: white; text-align: center;">
													<a class="btn green-jungle"
														onclick="ltsStatus(${lts.id})">
														<i class="glyphicon glyphicon-ok"></i> Approve </a></h4>
													<h4 style="color: white; text-align: center;">
													<a id="reject_leave_call01" class="btn btn-danger"
														onclick="ltsStatus(${lts.id});">
														<i class="glyphicon glyphicon-remove"></i> Reject </a></h4>
												</li>
											</ul>
										</div> 
									</c:if>
									<c:if test="${lts.status.toString() == 'A'}">
										<div class="wait-${lts.id}">
											<button class="btn green-meadow" type="button"
												data-toggle="dropdown" data-hover="dropdown" onclick="ltsStatus(${lts.id})">
												Approved
											</button>											
										</div>
									</c:if>

									<c:if test="${lts.status.toString() == 'R'}">
										<div class="wait-${lts.id}">
											<button class="btn red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown" onclick="ltsStatus(${lts.id})">
												Reject
											</button>
										</div>
									</c:if>
									
								</div>
								</perm:permission>
							</td>
							<td></td>
						</tr>
					</c:forEach>
				</tbody>

			</table>

		</div>
		<div class="modal fade" id="change_status" role="dialog" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header ui-draggable-handle" style="text-align:left;">
									<button type="button" class="close" data-dismiss="modal"></button>
									<h4 class="modal-title sbold">OT Timesheet</h4>
								</div>
								<div class="modal-body" style="text-align:left;">
									<div class="row" style="margin-bottom:10px;">
										<div class="col-lg-4"><small>Name</small><br>
											<small class="sbold txt" id="userid"></small>
										</div>
										<div class="col-lg-4"><small>Request Date</small><br>
											<small class="sbold txt" id="timecreate"></small>
										</div>
										<div class="col-lg-4"><small class="txt" id="tsid"></small><br>
											<small class="txt" id="tsstatus"></small>
										</div>
									</div>
									<div class="row" style="margin-bottom:10px;">
										<div class="col-lg-4"><small>Date</small><br>
											<small class="sbold txt" id="otdate"></small>
										</div>
										<div class="col-lg-4"><small>Time Start</small><br>
											<small class="sbold txt" id="stime"></small>
										</div>
										<div class="col-lg-4"><small>Time End</small><br>
											<small class="sbold txt" id="etime"></small>
										</div>
									</div>
									<div class="row" style="margin-bottom:10px;">
										<div class="col-lg-4">
											<small>Description</small><br>
											<small class="sbold txt" id="desc"></small>
										</div>
									</div>
								</div>
								<div class="modal-footer" style="text-align:left;">
									<i class="font-red-sunglo fa fa-ellipsis-v" style="margin-right:8px;"></i><span 
										class="font-blue sbold" style="margin-bottom:15px;">Approver</span>
									<div id="reason_panel" class="col-lg-13" style="margin-top:10px;">
										<select class="form-control" style="margin-top:10px;" name="apprType" id="apprType">
											<option value="1">ล่วงเวลา 1.5 เท่า</option>
										    <option value="2">ล่วงเวลา 2 เท่า</option>
										    <option value="3">ล่วงเวลา 3 เท่า</option>
										</select>
										<small>Reason</small>
										<small id="req" class="font-red-sunglo"> * require reason for reject</small>
										<textarea class="form-control" rows="3" id="reason"
											style="margin-bottom:10px;"></textarea>
									</div>
									<div id="status_detail" class="row" style="margin-bottom:10px;">
										<div class="col-lg-4">
											<small>Approver</small><br>
											<small class="sbold txt" id="approver"></small>
										</div>
										<div class="col-lg-4">
											<small>Approve Date</small><br>
											<small class="sbold txt" id="timeupdate"></small>
										</div>
										<div class="col-lg-4">
											<small>Reason</small><br>
											<small class="sbold txt" id="reason_s"></small>
										</div>
									</div>
									<div id="status_detail2" class="row" style="margin-bottom:10px;">
										<div class="col-lg-4">
											<small>OT Type</small><br>
											<small class="sbold txt" id="type_s"></small>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn dark btn-outline" 
										data-dismiss="modal" onclick="leaveCancle()">Close</button>
									<a class="btn red-sunglo" data-dismiss="modal" title="leave rejecting" 
										style="color:white;" id="btn_reject" onclick="call_reject()">Reject</a>
									<a class="btn green-meadow" data-dismiss="modal" title="leave approved" 
										id="btn_approve" onclick="call_approve()">Approve</a>
								</div>
							</div>
						</div>
				</div>

		<!-- -----------------------------------------End add-------------------------------------------- -->
	</div>
</div>
<script type="text/javascript">

jQuery(document).ready( function ($) {
	$.extend( true, $.fn.dataTable.defaults, {
	    "searching": true,
	    "ordering": false
	} );
  var table =  $('#table_id').DataTable({ 
      "order": false,
      "info": false,
      "paging": false, // รวมไว้หน้าเดียว
    	 dom: 'Bfrtip',
    	 buttons: [
    		 'copyHtml5',
             'excelHtml5',
             'csvHtml5',
             'pdfHtml5'
    	    ]  ,
    	    pageLength: 25,
    }); 
});

</script>
<script>
	$(document).ready(function() {
		var value = "${flag}";
		if (value == "1") {
			var name = "${name}";
			var monthSearch = "${monthSearch}";
			var yearSearch = "${yearSearch}";
			document.getElementById(name).selected = "true";
			document.getElementById(monthSearch).selected = "true";
			document.getElementById(yearSearch).selected = "true";
		} else {
			$('.select2me').select2();
		}

	});
</script>
<script>
	function ltsStatus(id) {
			$("#change_status").modal(); 
			document.getElementById("req").style.display = "none";
		console.log(id);
			$.ajax({
	 		url : "modalOTStatus.action",
	 		method : "POST",
	 		data : "ltsId="+ id,
	 		success : function(data) {
	 				console.log(data);
					var obj = JSON.parse(data);
					sessionStorage.clear();
					localStorage.removeItem("data");
					localStorage.setItem("data", data);
					//console.log(obj[0]);
					
					$('#tsid').append(obj[0].id).addClass("font-blue");
					$('#userid').append(obj[0].user_create);
					$('#timecreate').append(obj[0].time_create);
					$('#desc').append(obj[0].OT_description);
	/* ----------------------- set start date / end date ----------------------- */
					var sdate = (obj[0].OT_time_start).split(",");
					$('#otdate').append(sdate[0]);
					$('#stime').append(sdate[1]);
					var edate = (obj[0].OT_time_end).split(",");
					$('#etime').append(edate[1]);
					
	/* ----------------------- set status ----------------------- */
					if(obj[0].status == 'W'){
						$('#tsstatus').append("Wait for Approving").addClass("sbold font-yellow-crusta");
						document.getElementById("status_detail").style.display = "none";
						document.getElementById("status_detail2").style.display = "none";
						var day = obj[0].OT_time_start.substring(0, 3);
						console.log(day);
						if(day === 'Mon' || day === 'Tue' || day === 'Wed' || day === 'Thu' || day === 'Fri'){
							$('#apprType').val('1');
						}
						if(day === 'Sat' || day === 'Sun'){
							$('#apprType').val('2');
						}
					
					}else if(obj[0].status == 'A'){
						$('#tsstatus').append("Approved").addClass("sbold font-blue");
						document.getElementById("reason_panel").style.display = "none";
						document.getElementById("status_detail").style.display = "block";
						document.getElementById("status_detail2").style.display = "block";
						var timeAppr = obj[0].time_appr.substring(3, 22);
						console.log(timeAppr);
						$('#approver').append(obj[0].appr_user_id);
						$('#timeupdate').append(timeAppr);
						$('#reason_s').append(obj[0].reason);
						if(obj[0].OT_type == '1'){
							$('#type_s').append('ล่วงเวลา 1.5 เท่า');
						}
						if(obj[0].OT_type == '2'){
							$('#type_s').append('ล่วงเวลา 2 เท่า');
						}
						if(obj[0].OT_type == '3'){
							$('#type_s').append('ล่วงเวลา 3 เท่า');
						}
						$('#btn_reject').hide();
						$('#btn_approve').hide(); 
					
					}else if(obj[0].status == 'R'){
						$('#tsstatus').append("Reject").addClass("sbold font-red-mint");
						console.log("status 2");
						document.getElementById("reason_panel").style.display = "none";
						document.getElementById("status_detail").style.display = "block";
						document.getElementById("status_detail2").style.display = "block";
						var timeAppr = obj[0].time_appr.substring(3, 22);
						console.log(timeAppr);
						$('#approver').append(obj[0].appr_user_id);
						$('#timeupdate').append(timeAppr);
						$('#reason_s').append(obj[0].reason);
						if(obj[0].OT_type == '1'){
							$('#type_s').append('ล่วงเวลา 1.5 เท่า');
						}
						if(obj[0].OT_type == '2'){
							$('#type_s').append('ล่วงเวลา 2 เท่า');
						}
						if(obj[0].OT_type == '3'){
							$('#type_s').append('ล่วงเวลา 3 เท่า');
						}
						$('#btn_reject').hide();
						$('#btn_approve').hide(); 
					}
					
	 			}
			});
	}
	
/* ----------------------- close and cancle popover ----------------------- */
	
	$("#change_status .close").click(function() {
		$(".txt").empty().append();
	});
	
	function leaveCancle(){
		sessionStorage.clear();
		console.log("clear");
		window.location.reload(true);
	}
	
/* ----------------------- approve popover ----------------------- */
	
	function call_approve() {
		var data = localStorage.getItem("data");
		var obj = JSON.parse(data);
		var ltsId = obj[0].id;
		/* localStorage.setItem("leaveId", leaveId); */
		var reason = $('#reason').val();
		var type = $('#apprType').val();
		if(reason == "" || reason == null){
			reason = "";
			console.log(reason);
		}
 		 $.ajax({
	         url: 'timesheetStatusToApprove.action',
	         method: 'POST',
			 type : 'JSON',
			 data : {
					"id" : ltsId,
					"reason" : reason,
					"type" : type
			 } 
		 })
		 	.done(function() {
		 		location.reload();
		 		localStorage.removeItem("data");
		 	});
	}	
	
/* ----------------------- reject popover ----------------------- */
	
	function call_reject() {
		var data = localStorage.getItem("data");
		var obj = JSON.parse(data);
		console.log(obj[0]);
		var ltsId = obj[0].id;
		console.log(ltsId);
		//localStorage.setItem("ltsId", ltsId);
		var reason = $('#reason').val();
		console.log(reason);
		var type = $('#apprType').val();
		console.log(type);
		
		if(reason == "" || reason == null){
			document.getElementById("req").style.display = "block";
			document.getElementById("btn_reject").disabled = true;
		}
		else if(reason != "" || reason != null){
			document.getElementById("req").style.display = "none";
			document.getElementById("btn_reject").type = "submit";
	 		$.ajax({
				url: 'timesheetStatusToReject.action',
				method: 'POST',
				type : 'JSON',
				data : {
					"id" : ltsId,
					"reason" : reason,
					"type" : type
				} 
			})
			.done(function() {
				location.reload();
		 		localStorage.removeItem("data");
			});
	}
}
</script>






<script src="../assets/global/plugins/counterup/jquery.waypoints.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/counterup/jquery.counterup.min.js"
	type="text/javascript"></script>
