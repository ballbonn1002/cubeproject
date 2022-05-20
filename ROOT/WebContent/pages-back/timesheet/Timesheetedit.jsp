<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<link href="//cdn.jsdelivr.net/npm/@sweetalert2/theme-dark@4/dark.css" rel="stylesheet">
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10/dist/sweetalert2.min.js"></script>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/js.cookie.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/jquery-repeater/jquery.repeater.js"
	type="text/javascript" defer></script>
<script src="../assets/pages/scripts/form-repeater.min.js"
	type="text/javascript" defer></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<link href="../assets/global/css/timesheet.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>
<!-- Scripts For Editable Table -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="../assets/global/plugins/bootstable.js"
	type="text/javascript"></script>
	

<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="Dayinmonth" value="${0}"/>
<c:set var="holidays" value="${0}"/>
<c:set var="weekendSA" value="${0}"/>
<c:set var="weekendSU" value="${0}"/>
<c:set var="totaltimein" value="${0}"/>
<c:set var="totaltimeinm" value="${0}"/>
<c:set var="totalotin" value="${0}"/>
<c:set var="totalotinm" value="${0}"/>
<c:set var="lateTimeStart" value="${0}"/>
<c:set var="lateTimeEnd" value="${0}"/>
<c:set var="Holi2" value="${0}"/>


 <fmt:formatDate pattern = "yyyy"  value = "${now}" var="year_now" />

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

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-briefcase font-red"></i> <span
				class="caption-subject font-red sbold uppercase">&nbsp;
				TIMESHEET</span>
		</div>
		
		<div class="actions right ">
		<form action="upload_timesheet" class="form-horizontal" id="upload_form" method="post"
			enctype="multipart/form-data">
			<input type="hidden" name="userUploadId" value="${userId}">
			<input type="hidden" name="fileUploadSize" value="${size}" id="size">
			<input type="hidden" name="userUploadCreate" value="${user.id}" id="uploadCreate">
			<a class="btn btn-sm" 
				href="upload/template/Timesheet_Template2022.xlsx"
				style="width:80px;background-color:#8E44AD;color:white;">
				Template
			</a>
			
			<label class="btn btn-sm" for="myFile"
				style="width:80px;background-color:#E7505A;color:white;display:inline-block;cursor:pointer;">
				Import
				<input class="fileinput fileinput-new" data-provides="fileinput" type="file" accept="application/vnd.ms-excel, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" name="fileUpload" id="myFile" style="display:none;"/>
			</label>			
			
			<a class="btn btn-sm"
				href="TimeInReportExcelExport?year=${yearSearch}&month=${monthSearch}&user=${userId}"
				title="Print" style="width:80px;background-color:#26C281;color: white;">Export</a>
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</form>
		</div>
	</div>
	
		<form action="searchTimeEdit" method="post" name="form" id="searchTimeEdit_form">

		<div class="portlet-body">
			<div class="form-group form-lg-line-input">
            <!-- <label class="col-md-1 control-label">Name :</label> -->
					<div class="col-sm-6">
						<select class="form-control select2me" name="user.roletId" id="user.roletId" onchange="updateUploadUser()" disabled>
							<optgroup label="Enable">
								<c:forEach var="user" items="${cubeUser}">

									<c:if test="${user.enable == 1 }">
										<c:if test="${logonUser == nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
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
												<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
										<c:if test="${logonUser != nulll }">
											<option value="${user.id}" id="${user.id}"
												<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id} - ${user.name}</option>
										</c:if>
									</c:if>
								</c:forEach>
							</optgroup>
						</select>
						
					</div>
					<div>
						<input type="hidden" name="user.roletId" id="user.roletId2" value="${logonUser}">
					</div>	
				<div class="actions right ">
					<div class="col-md-3"
						style="float: right; margin-bottom: 19px; display: flex; justify-content: center;">
						<div class="input-group input-medium">
							<input class="form-control" id="searchmonth" name="searchmonth"
								style="text-align: center;"> <span
								class="input-group-btn">
								<button class="btn default" type="button" id="searchmonth_btn">
									<i class="fa fa-calendar-o"></i>
								</button>
							</span>
						</div>
					</div>
				</div>
				
				<%-- <label class="col-md-1 control-label">Month :</label>
					<div class="col-md-2">
					<select class="form-control select2me" name="monthSearch" id=monthSearch required="required">
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
				
				<label class="col-md-1 control-label">Year :</label>
				<div class="col-sm-2">
					<select
					class="form-control select2me" name="yearSearch" id=yearSearch required="required">
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
				</div>	 --%>
				
				<%-- <div class="col-md-2 text-center">
					<button type="submit" class="btn btn-sm blue-steel" id="searchbutton"
						onclick="search()">
						<i class="fa fa-search"></i>&nbsp;Search
					</button>
					<a class="btn btn-sm green-dark"
						href="TimeInReportExcelExport?year=${yearSearch}&month=${monthSearch}&user=${userId}"
						title="Print" style="color: white;"><i class="fa fa-print"></i>&nbsp;Excel</a>	
				</div> --%>
			
				<br> <br> <br>
				<div class="portlet-body" style="text-align: center;">
			<table class="table  table-bordered table-striped table-condensed table-hover" id="timesheet_table">
				<thead class="flip-content">
					<tr class = "text-center" style="background-color:rgb(59, 63, 81); color:white">
						<th height="41"><center>วันทำงาน</center></th>
						<th height="41" colspan="2"><center>ช่วงที่1</center></th>
						<th height="41" colspan="2"><center>ช่วงที่2(OT)</center></th>
						<th height="41" colspan="2"><center>รวมเวลา</center></th>
						<th height="41"><center>Project</center></th>
						<th height="41"><center>Description</center></th>
						<th height="41"><center>Time Spent</center></th>
						<th height="41" colspan="4"><center>Action</center></th>
					</tr>
					<tr style="background-color:#f2f2f2; color:black">
					<td>วันที่</td>
					<td>เข้า</td>
					<td>ออก</td>
					<td>เข้า</td>
					<td>ออก</td>
					<td>รวม</td>
					<td>OT</td>
					<td></td>
					<td></td>
					<td></td>
					<td colspan="4"></td>
					</tr>
				</thead>
				<tbody style="vertical-align: middle;" id="databody">
				<c:set var="oparators" value="${false}" />
				<c:forEach var ="allday" items="${daylist}">
				<c:set var="alldaynewformat" value="${allday.toString().replace('/', '')}" />
						<c:set var="Dayinmonth" value="${Dayinmonth + 1}" />
						
					<fmt:parseDate var="Weekend" value="${allday}" pattern="dd/MM/yyyy"/>
					<fmt:formatDate var="Weekendd" value="${Weekend}" pattern="E"/>
					
					<c:forEach var="TimeInlist" items="${TimeInlist}">
					
						<fmt:formatDate var="day_check_in" value="${TimeInlist.started_date}" pattern="dd/MM/yyyy" />
						<fmt:formatDate var="checkin" value="${TimeInlist.time_check_in}" pattern="HH:mm" />
						<fmt:formatDate var="checkout" value="${TimeInlist.time_check_out}" pattern="HH:mm" />
						<fmt:formatDate var="otin" value="${TimeInlist.OT_time_start}" pattern="HH:mm" />
						<fmt:formatDate var="otout" value="${TimeInlist.OT_time_end}" pattern="HH:mm" />
						<c:set var="WorkTimeStart" value="${TimeInlist.work_time_start.toString().replace(':', '')}" />
						<c:set var="WorkTimeEnd" value="${TimeInlist.work_time_end.toString().replace(':', '')}" />
						<fmt:parseNumber var="WorkTimeStartH" value="${WorkTimeStart}" />
						<fmt:parseNumber var="WorkTimeEndH" value="${WorkTimeEnd}" />
						<fmt:formatNumber var="WorkTimeStartHnewformat" value="${WorkTimeStartH}" pattern="0000" />
						<fmt:formatNumber var="WorkTimeEndHnewformat" value="${WorkTimeEndH}" pattern="0000" />
						
						<c:set var="checkinH" value="${checkin.toString().replace(':', '')}" />
						<c:set var="checkoutH" value="${checkout.toString().replace(':', '')}" />
						<fmt:formatNumber var="checkinnewformat" value="${checkinH}" pattern="0000" />
						<fmt:formatNumber var="checkoutnewformat" value="${checkoutH}" pattern="0000" />
						
							<c:choose>
								<c:when test="${day_check_in == allday}">
										<fmt:parseNumber var="Timeout" value="${checkout.toString().substring(0,2)}" />
										<fmt:parseNumber var="Timein" value="${checkin.toString().substring(0,2)}" />								
										<fmt:parseNumber var="otouts" value="${otout.toString().substring(0,2)}" />
										<fmt:parseNumber var="otins" value="${otin.toString().substring(0,2)}"/>
										<fmt:parseNumber var="Timeoutm" value="${checkout.toString().substring(3,5)}"  />
										<fmt:parseNumber var="Timeinm" value="${checkin.toString().substring(3,5)}" />
										<fmt:parseNumber var="otoutsm" value="${otout.toString().substring(3,5)}" />
										<fmt:parseNumber var="otinsm" value="${otin.toString().substring(3,5)}"/>
										
										<fmt:formatDate var="dayotin" value="${TimeInlist.OT_time_start}" pattern="dd" />
										<fmt:formatDate var="dayotout" value="${TimeInlist.OT_time_end}" pattern="dd" />
						
									<c:choose>
										<c:when test="${Timeinm <= Timeoutm}">
											<c:set var="TimeCompare" value="${(Timeout)-(Timein)}"/>
											<c:set var="TimeminCompare" value="${(Timeoutm)-(Timeinm)}"/>
										</c:when>
										<c:when test="${Timeinm > Timeoutm}">
											<c:set var="TimeCompare" value="${((Timeout-1)-(Timein))}"/>
											<c:set var="TimeminCompare" value="${(Timeoutm)-(Timeinm)+60}"/>
										</c:when>
									</c:choose>
										
								<c:choose>
										<c:when test="${dayotin != dayotout && otinsm <= otoutsm}">
											<c:set var="OtCompare" value="${((otouts)+((24-otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin != dayotout && otinsm > otoutsm}">
											<c:set var="OtCompare" value="${((otouts-1)+((24-otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)+(60-(otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin == dayotout && otinsm <= otoutsm}">
											<c:set var="OtCompare" value="${((otouts)-((otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin == dayotout && otinsm > otoutsm}">
											<c:set var="OtCompare" value="${((otouts)-((otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
								</c:choose>
								
								
										<fmt:formatNumber var="TimeCompareM" value="${TimeminCompare}" pattern="00" />	
										<fmt:formatNumber var="OtCompareM" value="${OtminCompare}" pattern="00" />	
										
										<c:set var="totaltimein" value="${totaltimein + TimeCompare}"/>
										<c:set var="totaltimeinm" value="${totaltimeinm + TimeCompareM}"/>
										<c:set var="totalotin" value="${totalotin + OtCompare}"/>
										<c:set var="totalotinm" value="${totalotinm + OtCompareM}"/>
																		
										<c:set var="WorkingDays" value="${WorkingDays+1}"/>
									<c:choose>
										<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat || checkoutnewformat < WorkTimeEndHnewformat}">
											<c:set var="LateDay" value="${LateDay+1}"/>
										</c:when>
									</c:choose>	
									<c:choose>
										<c:when test="${OtCompare > 0}">
											<c:set var="OTDay" value="${OTDay+1}"/>
										</c:when>
									</c:choose>	
									
									<c:choose>
										<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat }"> 
											<c:set var="lateTimeStart" value="${checkinnewformat - WorkTimeStartHnewformat}"/>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${WorkTimeEndHnewformat != 0000 && checkoutnewformat < WorkTimeEndHnewformat }"> 
											<c:set var="lateTimeEnd" value="${WorkTimeEndHnewformat - checkoutnewformat}"/>
										</c:when>
									</c:choose>
																
										<fmt:formatNumber var="dd" value="${checkin.toString().replace(':', '')}" />
									<tr>
										<td style="display:none;">${TimeInlist.timesheetId}</td>
										<td width="10%" style="vertical-align: middle;">
											<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;<fmt:formatDate value="${TimeInlist.started_date}" pattern="dd/MM/yyyy" />
										</td>
										<td width="3%" style="vertical-align: middle;"><span id="2edittimecheckin${TimeInlist.timesheetId}"><fmt:formatDate 
													value="${TimeInlist.time_check_in}" pattern="HH:mm" /></span><input type="hidden" value="${TimeInlist.time_check_in}" id="3edittimecheckin${TimeInlist.timesheetId}">
													<input type="hidden" value="${TimeInlist.started_date}" id="4edittimecheckin${TimeInlist.timesheetId}">						
													<input type="text" class="edtimesht  timepicker timepicker-24 form-control" style="display:none;width:60px" id="edittimecheckin${TimeInlist.timesheetId}">
													</td>
										<%-- <td style="vertical-align: middle;">
										<c:choose>
											<c:when test="${WorkTimeStartHnewformat == 0000 }"> 
												<i class="fa fa-genderless text-danger icon-xl"></i>
											</c:when>
											<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat }">
												<i class="fa fa-arrow-circle-right text-danger icon-xl"></i>
											</c:when>
										</c:choose></td> --%>
										<td width="3%" style="vertical-align: middle;"><span id="2edittimecheckout${TimeInlist.timesheetId}"><fmt:formatDate 
													value="${TimeInlist.time_check_out}" pattern="HH:mm" /></span><input type="hidden" value="${TimeInlist.time_check_out}" id="3edittimecheckout${TimeInlist.timesheetId}">
										<input type="text" class="edtimesht  timepicker timepicker-24 form-control" style="display:none;width:60px" id="edittimecheckout${TimeInlist.timesheetId}"></td>
										<%-- <td style="vertical-align: middle;">
										<c:choose>
										<c:when test="${WorkTimeEndHnewformat == 0000}">
												<i class="fa fa-genderless text-danger icon-xl"></i>
											</c:when>
											<c:when test="${WorkTimeEndHnewformat != 0000 && checkoutnewformat < WorkTimeEndHnewformat }">
												<i class="fa fa-arrow-circle-left text-danger icon-xl"></i>
											</c:when>
										</c:choose>
										</td> --%>
										<td width="3%" style="vertical-align: middle;"><span id="2edittimeotstart${TimeInlist.timesheetId}"><fmt:formatDate
													value="${TimeInlist.OT_time_start}" pattern="HH:mm" /></span><input type="hidden" value="${TimeInlist.OT_time_start}" id="3edittimeotstart${TimeInlist.timesheetId}"><input type="text" class="edtimesht  timepicker timepicker-24 form-control" style="display:none;width:60px" id="edittimeotstart${TimeInlist.timesheetId}"></td>
										<%-- <td style="vertical-align: middle;"><c:choose><c:when test="${OtCompare > 0 }"><i class="fa fa-clock-o text-muted icon-xl"></i></c:when></c:choose></td> --%>
										<td width="3%" style="vertical-align: middle;"><span id="2edittimeotend${TimeInlist.timesheetId}"><fmt:formatDate
													value="${TimeInlist.OT_time_end}" pattern="HH:mm" /></span><input type="hidden" value="${TimeInlist.OT_time_end}" id="3edittimeotend${TimeInlist.timesheetId}"><input type="text" class="edtimesht  timepicker timepicker-24 form-control" style="display:none;width:60px" id="edittimeotend${TimeInlist.timesheetId}"></td>	
										<%-- <td style="vertical-align: middle;"><c:choose><c:when test="${OtCompare > 0 }"><i class="fa fa-clock-o text-muted icon-xl"></i></c:when></c:choose> </td> --%>
										<td width="6%" style="vertical-align: middle;" id="totalTime${TimeInlist.timesheetId}">
										
										<!-- aa -->
											<c:choose>
												<c:when test="${TimeCompare >= 8}"> 
													<div  class="btn-sm btn-info" >
														<i class="fa fa-check"></i> 
															
													8:00  hrs.
													
													</div>
												</c:when>
												<c:when test="${TimeCompare < 8}">
													<div  class="btn-sm btn-danger" >
														<i class="fa fa-fire"></i>
													${TimeCompare}:${TimeCompareM}  hrs.
													</div>
												</c:when>
												
											</c:choose>
										
										</td>
										

									<td width="6%" style="vertical-align: middle;">
									
									<c:choose>
												<c:when test="${OtCompare > 0}">
													<div  class="btn-sm btn-warning" >
													<i class="fa fa-star"></i>

													${OtCompare}:${OtCompareM}  hrs.
													
												</div>
												</c:when>
												
											</c:choose>
																				
																			
									</td>
										<td width="20%" style="word-break:break-all;text-align: left"><span id="2editproject${TimeInlist.timesheetId}">${TimeInlist.project}</span><ul style="list-style-type:none;"><li><span id="2editsummary${TimeInlist.timesheetId}">${TimeInlist.summary}</span></li></ul>
										<input type="text" class="edtimesht form-control" style="display:none;" id="editproject${TimeInlist.timesheetId}" value="${TimeInlist.project}">
										<input type="text" class="edtimesht form-control" style="display:none;" id="editsummary${TimeInlist.timesheetId}" value="${TimeInlist.summary}">
										</td>
										<td width="20%" style="word-break:break-all;text-align: left"><span id="2editdescription${TimeInlist.timesheetId}">${TimeInlist.description}</span>
										<input type="text" class="edtimesht form-control" style="display:none;" id="editdescription${TimeInlist.timesheetId}" value="${TimeInlist.description}">
										</td>
										<td width="5%" style="word-break:break-all;text-align: left"><span id="2edittimespent${TimeInlist.timesheetId}">${TimeInlist.timespent}</span>
										<input type="text" class="edtimesht form-control" style="display:none;" id="edittimespent${TimeInlist.timesheetId}" value="${TimeInlist.timespent}">
										</td>
										
									<td width="10%" colspan="4">
									<a 
						class="btn circle btn-outline blue float-right"
						onclick="editts('${TimeInlist.timesheetId}')">
						<i class="fa fa-pencil-square-o"></i>
					</a>
						<!-- <a 
						class="btn circle btn-outline blue-soft float-left" id=""
						onclick="addform('${TimeInlist.timesheetId}')">
						<i class="fa fa-plus"></i>
					</a> -->
									</td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
								
							</c:choose>
							
							
					</c:forEach>
					<c:forEach var="Holidayls" items="${Holidayls}">
					<fmt:formatDate var="holidayy" value="${Holidayls.start_date}" pattern="dd/MM/yyyy" />
					<fmt:formatDate var="holidaye" value="${Holidayls.end_date}" pattern="dd/MM/yyyy" />
					<fmt:parseNumber var="startholidaym" value="${holidayy.toString().substring(3,5)}" />
					<fmt:parseNumber var="endholidaym" value="${holidaye.toString().substring(3,5)}" />
					<fmt:parseNumber var="startholiday" value="${holidayy.toString().substring(0,2)}" />
					<fmt:parseNumber var="endholiday" value="${holidaye.toString().substring(0,2)}" />
					<fmt:parseNumber var="Ystartholiday" value="${holidayy.toString().substring(6,10)}" />
					<fmt:parseNumber var="Yendholiday" value="${holidaye.toString().substring(6,10)}" />
					<fmt:formatNumber var="startholidaym" value="${startholidaym}" pattern="00" />
					<fmt:formatNumber var="endholidaym" value="${endholidaym}" pattern="00" />
					
					<c:forEach var="x" begin="${startholiday}" end="${endholiday}" step="1" >
					
						<c:set var="Holiday" value="${startholiday + x}" />
						<c:choose>
							<c:when test="${x == Dayinmonth}">
							
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
							
								
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all; text-align: left">${Holidayls.head}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;"></td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
								
							<c:choose>
							<c:when test="${startholidaym < endholidaym}">
							<c:forEach var="x" begin="${startholiday}" end="${Dayinmonth}" step="1" >
								<c:set var="Holiday" value="${startholiday + x}" />
								<c:set var="HOLIDAY" value="${x}${startholidaym}${Ystartholiday}" />
							<c:choose>
							<c:when test="${HOLIDAY == alldaynewformat}">
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
									
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
										 		<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all; text-align: left">${Holidayls.head}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;"></td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${endholidaym > startholidaym}">
							<c:forEach var="a" begin="${Dayinmonth}" end="${endholiday}" step="1" >
								<c:set var="Holiday" value="${Dayinmonth + a}" />
								<fmt:formatNumber var="x" value="${a}" pattern="00" />
								<c:set var="HOLIDAYY" value="${x}${endholidaym}${Yendholiday}" />
							<c:choose>
							<c:when test="${HOLIDAYY == alldaynewformat}">
							
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
											<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all; text-align: left">${Holidayls.head}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="2">edit</td>
										<td colspan="2">delete</td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
					</c:forEach>
					
					<c:forEach var="leavelistsddd" items="${leavelists}">
						<fmt:formatDate var="startdateformat" value="${leavelistsddd.start_date}" pattern="dd/MM/yyyy" />
						<fmt:formatDate var="enddateformat" value="${leavelistsddd.end_date}" pattern="dd/MM/yyyy" />
						<fmt:parseNumber var="startleaveformat" value="${startdateformat.toString().substring(0,2)}" />
						<fmt:parseNumber var="endleaveformat" value="${enddateformat.toString().substring(0,2)}" />
						<fmt:parseNumber var="Mstartleaveday" value="${startdateformat.toString().substring(3,5)}" />
						<fmt:parseNumber var="Mendleaveday" value="${enddateformat.toString().substring(3,5)}" />
						<fmt:parseNumber var="Ystartleaveday" value="${startdateformat.toString().substring(6,10)}" />
						<fmt:parseNumber var="Yendleaveday" value="${enddateformat.toString().substring(6,10)}" />
						<fmt:formatNumber var="MStartleaveday" value="${Mstartleaveday}" pattern="00" />
						<fmt:formatNumber var="MEndleaveday" value="${Mendleaveday}" pattern="00" />
						<fmt:parseNumber var="leavestatus" value="${leavelistsddd.leave_status_id}" pattern="00"/>
						<c:choose>
							<c:when test="${Mstartleaveday == Mendleaveday}">						
						<c:forEach var="i" begin="${startleaveformat}" end="${endleaveformat}" step="1" >
							<c:set var="leave" value="${startleaveformat + i}" />
							
						
						<c:choose>
							<c:when test="${leavestatus == '1' && i == Dayinmonth}">
									<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all; text-align: left">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;"></td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
						</c:forEach>
						</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${Mstartleaveday < Mendleaveday}">
							<c:forEach var="x" begin="${startleaveformat}" end="${Dayinmonth}" step="1" >
								<c:set var="leave" value="${startleaveformat + x}" />
								<fmt:formatNumber var="a" value="${x}" pattern="00" />
								<c:set var="LEAVE" value="${a}${MStartleaveday}${Ystartleaveday}" />
							<c:choose>
							<c:when test="${leavestatus == '1' && LEAVE == alldaynewformat}">
							
									<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all; text-align: left">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;"></td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							
							<c:choose>
							<c:when test="${Mendleaveday > Mstartleaveday}">
							
							<c:forEach var="a" begin="${Dayinmonth}" end="${endleaveformat}" step="1" >
								<c:set var="leavee" value="${Dayinmonth + a}" />
								<fmt:formatNumber var="x" value="${a}" pattern="00" />
								<c:set var="LEAVEE" value="${x}${MEndleaveday}${Yendleaveday}" />
							<c:choose>
							<c:when test="${leavestatus == '1' && LEAVEE == alldaynewformat}">
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<!-- <td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td> -->
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all; text-align: left">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;"></td>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							
					</c:forEach>
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<c:set var="weekendSA" value="${weekendSA+1}"/>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<c:set var="weekendSU" value="${weekendSU+1}"/>
												</c:when>
											</c:choose>	
						<c:set var="weekend" value="${weekendSA+weekendSU}"></c:set>
						<c:if test="${oparators == false}">
							<c:set var="counter" value="${counter + 1}" />
							<c:choose>
								<c:when test="${Weekendd == 'Sat' || Weekendd == 'Sun'}">
									<tr style="background-color:#E1E5EC">
										<td style="display:none;"></td>
										<td style="vertical-align: middle;" id="addform${counter}">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="word-break:break-all"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;">
											<a class="btn circle btn-outline blue-soft float-left" id=""
											   onclick="addform(${counter})">
											   <i class="fa fa-plus"></i>
											</a>
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="display:none;"></td>
										<td style="vertical-align: middle;" id="addform${counter}">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="word-break:break-all; text-align: left"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td colspan="4" style="vertical-align: middle;">
											<a class="btn circle btn-outline blue-soft float-left" id=""
											   onclick="addform(${counter})">
											   <i class="fa fa-plus"></i>
											</a>
										</td>
								</tr>
								</c:otherwise>
							</c:choose>			
						
						</c:if>
					<c:set var="oparators" value="${false}" />
				</c:forEach>
										
				</tbody>
				</table>
				</div>
				</div>
				</div>
					<div class="portlet-body" style="text-align: center;">
					<c:set var="absent" value="${Dayinmonth-(TimeCalList.work_day_count+TimeCalList.leave_day_count+weekend+Holi2)}"></c:set>	
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead class="flip-content">
					<tr class = "text-center">
						<th style="vertical-align: middle; background-color:#E9EDEF; color:black;" height="41">สรุปเวลา</th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ทำงานทั้งหมด</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>(สาย + ออกก่อน) หัก 60 นาที</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ขาดงาน</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ลางาน</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ล่วงเวลาทั้งหมด</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x1</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x1.5</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x3</center></th>
					</tr>
				</thead>
				<tbody style="vertical-align: middle;">
					<tr>
					<th style="background-color:#E9EDEF; color:black;">วัน</th>
					<td><center><c:out value="${TimeCalList.work_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.late_early_day_count}"/></center></td>
					<td><center><c:out value="${absent}"/></center></td>
					<td><center><c:out value="${TimeCalList.leave_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x1_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x15_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x3_day_count}"/></center></td>
					</tr>

					<tr>
					<th style="background-color:#E9EDEF; color:black;">ชั่วโมง(นาที/60*100)</th>
					<td><center><c:out value="${TimeCalList.work_day_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.late_early_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.absent_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.leave_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x1_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x15_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x3_hour}"/></center></td>
					</tr>				
				</tbody>
				</table>
				</div>
			</form>
</div>			
<script>	
	$("tr:not(:first)").each(function (index ) {
		$(this).css('animation-delay',index *0.01 +'s');
	});
</script>
<script>
	<perm:permission object="timesheet.edit">
		document.getElementById('user.roletId').disabled = false;
		document.getElementById('user.roletId2').disabled = true;
	</perm:permission>
</script>
<script>

$(document).ready(function() {

 	var selectmonth = null; 
	var select = null;
	var date = new Date();
	var monthnow = new Date(date.getFullYear(), date.getMonth());
	function formatDate(selectmonth){
		var d = new Date(selectmonth),
			month = '' + (d.getMonth() + 1),
			year = d.getFullYear();
		if (month.length < 2)
			month = '0' + month;
		return [year, month].join('-');
	}
	
	var optSimple = {
			autoclose: true,
			minViewMode: 1,
			format: 'MM yyyy',
			orientation: 'bottom right'
	}; 
	
 	$("#searchmonth").datepicker(optSimple);
 	$("#searchmonth_btn").datepicker(optSimple);

  	var x = sessionStorage.getItem("selectmonth");
	if (x != null) {
		var y = "${sl_month}";
		$("#searchmonth").val(y);
		$("#searchmonth").datepicker('setDate', y);
	}
	sessionStorage.removeItem("selectmonth");
	
	if (x == null) {
		$("#searchmonth").datepicker('setDate', monthnow);
		$("#searchmonth_btn").datepicker('setDate', monthnow); 
	}
	
 	$("#searchmonth_btn").on('changeDate', function(selected){
		dateselect = new Date(selected.date.valueOf());
		dateselect.setDate(dateselect.getDate(new Date(selected.date.valueOf())));
		$("#searchmonth").datepicker('setDate', dateselect);
	}); 
	
	$("#searchmonth").change(function() {
		var x = $(this).datepicker( 'getDate');
		select = $("#searchmonth").val();
		selectmonth = formatDate(select);
		sessionStorage.setItem("selectmonth", selectmonth);
		console.log("fortest - "+selectmonth);		
		
		$("#searchTimeEdit_form").submit();
	});
});
</script>
<script>
	function updateUploadUser() {
		  $('#user.roletId #uploadCreate').val(this.value);
		  $("#searchTimeEdit_form").submit();
		}
</script>	
<script>
	$('#myFile').bind('change', function() {
		var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
		fSize = this.files[0].size;
		i = 0;
		while (fSize > 900) {
			fSize /= 1024;
			i++;
		}
		var size_n = (Math.round(fSize * 100) / 100);
		var size = size_n + ' ' + fSExt[i];
		$('#size').val(size);
		/*  <c:set var="size"  value="size"/> */
		/*  alert(size);  */
		$("#upload_form").submit();
		
	});
</script>
<script>
function save(id) {
	var datets = document.getElementById('4edittimecheckin'+id).value;
	var project = document.getElementById('editproject'+id).value;
	var summary = document.getElementById('editsummary'+id).value;
	var description = document.getElementById('editdescription'+id).value;
	var timespent = document.getElementById('edittimespent'+id).value;
	var timecheckin = document.getElementById('edittimecheckin'+id).value;
	var timecheckout = document.getElementById('edittimecheckout'+id).value;
	var timeotstart = document.getElementById('edittimeotstart'+id).value;
	var timeotend = document.getElementById('edittimeotend'+id).value;
	var idts = id;
	
	var day = datets.substring(8, 10);
	var month = datets.substring(5, 7);
	var year = datets.substring(0, 4);
	
	var datets2 = day+"/"+month+"/"+year; 
	console.log(datets2);
	console.log(idts);
	console.log(project);
	console.log(summary);
	console.log(description);
	console.log(timespent);
	console.log(timecheckin);
	console.log(timecheckout);
	console.log(timeotstart);
	console.log(timeotend);
		$.ajax({
					url : "updateTimesheetReport",
					method : "POST",
					type : "JSON",
					data : {
						"id" : idts,
						"project" : project,
						"summary" : summary,
						"description" : description,
						"timespent" : timespent,
						"timeIn" : timecheckin,
						"timeOut" : timecheckout,
						"timeIn2" : timeotstart,
						"timeOut2" : timeotend,
						"date" : datets2
					},
					success : function(data) {
						swal(
								{
									title : "Pass",
									text : "Saved Succcess",
									type : "success"
								},
								function() {
									//location.reload();
									var obj = JSON.parse(data);
									console.log(obj);
									if(obj.checkin[0] != null){
										var H1 = obj.checkin[0].substring(11, 13);
										var m1 = obj.checkin[0].substring(14, 16);
										var checkin = H1 + ":" + m1;
									}
									
									if(obj.checkout[0] != null){
										var H2 = obj.checkout[0].substring(11, 13);
										var m2 = obj.checkout[0].substring(14, 16);
										var checkout = H2 + ":" + m2;
									}
									
									if(obj.otin[0] != null){
										var H3 = obj.otin[0].substring(11, 13);
										var m3 = obj.otin[0].substring(14, 16);
										var otin = H3 + ":" + m3;
									}
									
									if(obj.otout[0] != null){
										var H4 = obj.otout[0].substring(11, 13);
										var m4 = obj.otout[0].substring(14, 16);
										var otout = H4 + ":" + m4;
									}
									
									$("#2edittimecheckin"+id).empty();
									$("#2edittimecheckin"+id).append(checkin);
									$("#edittimecheckin"+id).val(checkin);
									$("#3edittimecheckin"+id).empty();
									$("#3edittimecheckin"+id).val(obj.checkin);
									
									$("#2edittimecheckout"+id).empty();
									$("#2edittimecheckout"+id).append(checkout);
									$("#edittimecheckout"+id).val(checkout);
									$("#3edittimecheckout"+id).empty();
									$("#3edittimecheckout"+id).val(obj.checkout);
									
									$("#2edittimeotstart"+id).empty();
									$("#2edittimeotstart"+id).append(otin);
									$("#edittimeotstart"+id).val(otin);
									$("#3edittimeotstart"+id).empty();
									$("#3edittimeotstart"+id).val(obj.otin);
									
									$("#2edittimeotend"+id).empty();
									$("#2edittimeotend"+id).append(otout);
									$("#edittimeotend"+id).val(otout);
									$("#3edittimeotend"+id).empty();
									$("#3edittimeotend"+id).val(obj.otout);
									
									$("#2editproject"+id).empty();
									$("#2editproject"+id).append(obj.project);
									$("#editproject"+id).append(obj.project);
									
									$("#2editsummary"+id).empty();
									$("#2editsummary"+id).append(obj.summary);
									$("#editsummary"+id).append(obj.summary);
									
									$('#2editdescription'+id).empty();
									$('#2editdescription'+id).append(obj.desc);
									$("#editdescription"+id).append(obj.desc);
									
									$('#totalTime'+id).empty();
									if(m1 <= m2){
										var totalTime = H2-H1;
										var totalTimemFormat = m2-m1;
									} else if(m1 > m2){
										var totalTime = (H2-1)-H1;
										var totalTimemFormat = (m2-m1)+60;
									}
									
									var totalTimem = ('0' + totalTimemFormat).slice(-2);
									
									if(totalTime >= 8){
										$('#totalTime'+id).append('<div  class="btn-sm btn-info" ><i class="fa fa-check"></i>8:00  hrs.</div>');
									} else if(totalTime < 8){
										$('#totalTime'+id).append('<div  class="btn-sm btn-danger" ><i class="fa fa-fire"></i>'+ totalTime +':'+ totalTimem +'  hrs.</div>');
									} else {
										$('#totalTime'+id).append('<div  class="btn-sm btn-info" ><i class="fa fa-check"></i>0:00  hrs.</div>');
									}
									
								});
					}

				})
};

var count = 0;
function editts(id){
console.log(id);
// $("#edts").css('display','block');
$("#editproject"+id).toggle();
$("#2editproject"+id).toggle();

$("#editsummary"+id).toggle();
$("#2editsummary"+id).toggle();

$("#editdescription"+id).toggle();
$("#2editdescription"+id).toggle();

/* $("#edittimespent"+id).toggle();
$("#2edittimespent"+id).toggle(); */

$("#edittimecheckin"+id).toggle();
$("#2edittimecheckin"+id).toggle();

$("#edittimecheckout"+id).toggle();
$("#2edittimecheckout"+id).toggle();

$("#edittimeotstart"+id).toggle();
$("#2edittimeotstart"+id).toggle();

$("#edittimeotend"+id).toggle();
$("#2edittimeotend"+id).toggle();

if(count==0){
count++;

var checkin =  $("#3edittimecheckin"+id).val();
var checkin2 = checkin.substring(11, 16);
$("#edittimecheckin"+id).val(checkin2);

var checkout =  $("#3edittimecheckout"+id).val();
var checkout2 = checkout.substring(11, 16);			   
$('#edittimecheckout'+id).val(checkout2);

var otstart =  $("#3edittimeotstart"+id).val();
var otstart2 = otstart.substring(11, 16);	
$('#edittimeotstart'+id).val(otstart2);

var otend =  $("#3edittimeotend"+id).val();
var otend2 = otend.substring(11, 16);	 
$('#edittimeotend'+id).val(otend2);
} else if(count==1){
count--;
save(id);
}
};
function editform(id){
	/*console.log(id);
	var idedit = id;
	$.ajax({
		url : "addTimesheetPage",
		method : "POST",
		type : "JSON",
		data : {
			"idedit" : idedit
		},
		success : function(data) {
			location.href='addTimesheetPage';
		}
	})*/
}

function addform(id){
	var d = $('#addform'+id).prop("innerText");
	var date = d.substring(2,12);
	location.href='addTimesheetPage?date='+ date;
}

function mergeCells() {
	var db = document.getElementById("databody");
	var dbRows = db.rows;
	var lastValue = "";
	var lastCounter = 1;
	var lastRow = 0;
	for (var i = 0; i < dbRows.length; i++) {
		 var thisValue = dbRows[i].cells[1].innerHTML;
		 if (thisValue == lastValue) {
		   lastCounter++;
		   dbRows[lastRow].cells[1].rowSpan = lastCounter;
		   dbRows[i].cells[1].style.display = "none";
		 } else {
		   dbRows[i].cells[1].style.display = "table-cell";
		   lastValue = thisValue;
		   lastCounter = 1;
		   lastRow = i;
		 }
	}  
}
window.onload = mergeCells;
</script>				