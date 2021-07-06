<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page import="java.io.PrintWriter"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
  AOS.init();
</script>
<style>
.text-overflow {
	overflow: hidden;
	text-overflow: ellipsis;	
}
@media only screen and (max-width: 1200px) {
	.paddingmd {
		padding-top: 15px !important;
	}
}

@media only screen and (max-width: 960px) {
	.hiddensm {
		visibility: hidden;
	}
}

@media only screen and (max-width: 1300px) {
	.paddinglg {
		margin-left: 50px !important;
	}
}

@media only screen and (max-width: 769px) {
	.centerxs {
		display: block;
		margin-left: auto;
		margin-right: auto;
		text-align: center !important;
	}
}

.item-head {
	width: width:100% !important;
}
</style>
<c:set var="now" value="<%=new java.util.Date()%>" />

<div class="portlet light bordered">

	<div class="portlet-title">
		<div class="caption">
			<i class="icon-layers font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Leave
				Approve</span>
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
		<div class="actions right">
			<button type="button" class="btn btn-sm green-meadow" id="addLeave"
				onclick="add()">
				<i class="fa fa-plus"></i>&nbsp;Add leave
			</button>
		</div>
	</div>
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>
		<!--  search bar in 1 line -->
		<form action="search_leave_approved" method="post">
			<div class="portlet-body">
				<div class="form-group form-lg-line-input">
					<div class="row">
						<div class="col-lg-10">
							<label class="col-xs-12 col-sm-1 col-md-1 col-lg-1 control-label"
								for="form_control_1" style="padding-right: 0px !important;">Staff
								:</label>
							<!-- staff label -->

							<!-- start staff select -->
							<div class="col-xs-12 col-sm-5 col-md-6  col-lg-3"
								style="padding-left: 0px !important;">
								<select class="form-control select2me" name="name1">
									<option value="All" id="All">All</option>
									<optgroup label="Enable">
										<c:forEach var="user" items="${userseq}">

											<c:if test="${user.enable == 1 }">
												<c:if test="${logonUser == nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
												<c:if test="${logonUser != nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</optgroup>
									<optgroup label="Disable">
										<c:forEach var="user" items="${userseq}">

											<c:if test="${user.enable == 0 }">
												<c:if test="${logonUser == nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
												<c:if test="${logonUser != nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,logonUser)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</optgroup>
								</select>
							</div>
							<!-- end staff select -->
							<!-- type label -->
							<label class="col-xs-2 col-sm-1 col-md-1 col-lg-1 control-label"
								for="form_control_1" style="padding-right: 0px !important">Type
								: </label>
							<!-- type select -->
							<div class="col-xs-12 col-sm-5 col-md-4 col-lg-2"
								style="padding-left: 0px !important">
								<select class="form-control select2me" name="appr">
									<option value="3" id="All1"
										<c:if test="${ appr == 3 }"><c:out value="selected=selected"/></c:if>>All</option>
									<option value="0"
										<c:if test="${ appr == 0 }"><c:out value="selected=selected"/></c:if>>
										Waiting for approve</option>
									<option value="1"
										<c:if test="${ appr == 1 }"><c:out value="selected=selected"/></c:if>>Approved</option>

								</select>
							</div>
							<!--end  type select -->
							<label
								class="centersx col-xs-12 col-sm-1 col-md-1 col-lg-1 control-label paddingmd"
								style="padding-right: 0px !important;">Date :</label>
							<!--<div
								class="centerxs col-sx-12 col-sm-6  col-md-7 col-lg-4 paddingmd"
								style="padding-left: 0px !important;">
								<div class="input-group input-large date-picker input-daterange"
									data-date-format="dd-mm-yyyy"
									style="padding-left: 0px !important">
									<c:if test="${startdate == null}">
										<input type="text" class="form-control cannot"
											name="startdate" id="startdate" size="13"
											data-date-format="dd-MM-yyyy" placeholder="Start date"
											value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"  />">
									</c:if>
									<c:if test="${startdate != null}">
										<input type="text" class="form-control cannot"
											name="startdate" id="startdate" data-date-format="dd-MM-yyyy"
											placeholder="Start date" size="13"
											value="<fmt:formatDate type="date" value="${startdate}" pattern="dd-MM-yyyy"  />">
									</c:if>
									<span class="input-group-addon"> To </span>
									<c:if test="${enddate == null}">
										<input type="text" class="form-control cannot" name="enddate"
											id="enddate" data-date-format="dd-MM-yyyy"
											placeholder="End date" size="13"
											value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"  />">
									</c:if>
									<c:if test="${enddate != null}">
										<input type="text" class="form-control cannot" name="enddate"
											id="enddate" data-date-format="dd-MM-yyyy"
											placeholder="End date" size="13"
											value="<fmt:formatDate type="date" value="${enddate}" pattern="dd-MM-yyyy"  />">
									</c:if>
								</div>
							</div>-->

							<div class="col-md-4">
								<div class="input-group input-large date-picker input-daterange"
									data-date-format="dd-mm-yyyy">
									<c:choose>
										<c:when test="${startdate == null}">
											<input type="text" class="form-control cannot"
												name="startdate" id="startdate"
												data-date-format="dd-mm-yyyy"
												value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"  />">
										</c:when>
										<c:when test="${startdate != null}">
											<input type="text" class="form-control cannot"
												name="startdate" id="startdate"
												data-date-format="dd-mm-yyyy"
												value="<fmt:formatDate type="date" value="${startdate}" pattern="dd-MM-yyyy"  />">
										</c:when>
									</c:choose>
									<span class="input-group-addon"> to </span>
									<c:choose>
										<c:when test="${enddate == null}">
											<input type="text" class="form-control cannot" name="enddate"
												id="enddate" data-date-format="dd-mm-yyyy"
												value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"  />">
										</c:when>
										<c:when test="${enddate != null}">
											<input type="text" class="form-control cannot" name="enddate"
												id="enddate" data-date-format="dd-mm-yyyy"
												value="<fmt:formatDate type="date" value="${enddate}" pattern="dd-MM-yyyy"  />">
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
						<div align="center"
							class="col-xs-12 col-sm-5 col-md-3 col-lg-2 paddingmd">
							<button id="" onclick="myFunction()" type="
								submit"
								class="btn btn-sm blue-steel">
								<i class="fa fa-search"></i> Search

							</button>
						</div>
					</div>

				</div>
				<!--${startdate}<br>${enddate}<br>-->
				<!--  Dashboard  -->
				<div id="dashboard">
					<div class="row">
						<div class="col-md-12 col-lg-12">
							<div class="col-md-3">
								<a class="dashboard-stat dashboard-stat-v2 yellow-gold">
									<div class="visual">
										<i class="fa fa-newspaper-o"></i>
									</div>
									<div class="details">

										<form action="myleave_list" method="POST">
											<div class="number">${userS }</div>

										</form>

									</div>

								</a>
							</div>
							<!-- personal leave -->
							<div class="col-md-3">
								<a class="dashboard-stat dashboard-stat-v2 blue-steel">
									<div class="visual">
										<i class="fa fa-photo"></i>
									</div>
									<div class="details">
										<form action="myleave_list" method="POST">
											<div class="number" >
												<c:choose>
										
													<c:when test="${LeavenumT1 != null}" >
															
														<span id="leaveType1" data-counter="counterup"
															data-value="" >	<fmt:formatNumber pattern="#.###" value="${LeavenumT1}">	</fmt:formatNumber> </span>
															
														<span>/ ${ThisYear}</span>
														<div class="desc">${type_1}</div>
																
													</c:when>
													<c:when test="${LeavenumT1 == null}">
														<span id="leaveType1" data-counter="counterup"
															data-value="">0 / ${ThisYear}</span>
														<div class="desc">${type_1}</div>
													</c:when>
												</c:choose>
											</div>
										</form>
									</div>

								</a>
							</div>
							<!-- sick leave -->
							<div class="col-md-3">
								<a class="dashboard-stat dashboard-stat-v2 red">
									<div class="visual">
										<i class="fa fa-ambulance"></i>
									</div>
									<div class="details">

										<form action="myleave_list" method="POST">
											<div class="number">
												<c:choose>
													<c:when test="${LeavenumT3 != null}">
														<span id="leaveType3" data-counter="counterup"
															data-value=""><fmt:formatNumber pattern="#.#" value="${LeavenumT3}">	</fmt:formatNumber></span>
														<div class="desc">${type_3}</div>
													</c:when>
													<c:when test="${LeavenumT3 == null}">
														<span id="leaveType3" data-counter="counterup"
															data-value="">0</span>
														<div class="desc">${type_3}</div>
													</c:when>
												</c:choose>
											</div>
										</form>

									</div>

								</a>
							</div>
							<!-- leave quota from last year -->
							<div class="col-md-3">
								<a class="dashboard-stat dashboard-stat-v2 purple">
									<div class="visual">
										<i class="fa fa-credit-card"></i>
									</div>
									<div class="details">
										<form action="myleave_list" method="POST">
											<div class="number">
												<c:choose>
													<c:when test="${LeavenumT6 != null}">
														<span id="leaveType6" data-counter="counterup"
															data-value="sad">	<fmt:formatNumber pattern="#.#" value="${LeavenumT6}">	</fmt:formatNumber> </span>
													<span>/ ${LastYear}</span>
														<div class="desc">${type_6}</div>
													</c:when>
													<c:when test="${leave_1 == null}">
														<span id="leaveType6" data-counter="counterup"
															data-value="">0 / ${LastYear}</span>
														<div class="desc">${type_6}</div>
													</c:when>
												</c:choose>
											</div>
										</form>
									</div>

								</a>
							</div>
						</div>
					</div>
				</div>
			</div>

			<br>
		</form>






		<!-- start content portlet -->

		<table
			class="table table-striped table-condensed table-hover" data-aos="fade"  data-aos-duration="2000">
			<thead>
				<tr style="background-color:rgb(59, 63, 81);color:white" class="flip-content">
					<th>
						<center>#</center>
					</th>
					<th height="41"><center>Status Button</center></th>
					<!-- <th><center>Status</center></th> -->
					<!--  <th height="41"><center>Leave application form</center></th>  -->
					<th height="41"><center>Status Button</center></th>
					<th height="41"><center>Detail</center></th>
					<th height="41" width="50"><center>Print</center></th>
					<th height="41"><center>Delete</center></th>
				</tr>
			</thead>


			<form action="myleave_list" method="POST">
				<c:forEach var="leave" items="${leaveList}" varStatus="status">
					<tr style="text-align: center;">
						<td style="vertical-align: middle;"><a class="text-right"
							href="LeaveEdit?id=${leave.leave_id}">${leave.leave_id} </a></td>
						<td><span class="btn blue-hoki btn-outline"
							style="width: 150px"> <i class="fa fa-user"></i> <a
								class="text-right" href="LeaveEdit?id=${leave.leave_id}">${leave.user_id}</a>
						</span> <span class="btn purple btn-outline text-overflow" style="width: 140px;"title="${leave.leave_type_name}">
								<i class="fa fa-sign-out"></i> ${leave.leave_type_name}
						</span> <span class="btn blue btn-outline"> <i
								class="fa fa-calendar"></i> <fmt:formatDate
									value="${leave.start_date}" pattern="dd-MMM-yyyy"></fmt:formatDate>
								~ <fmt:formatDate value="${leave.end_date}"
									pattern="dd-MMM-yyyy"></fmt:formatDate>
						</span> 
						<span class="btn default"> <i class="fa fa-bookmark"></i>
								<c:set var="amoutLeaveDay" value="${leave.no_day}" /> 
								<c:set var="aa" value="${fn:substringBefore(leave.no_day,'.')}" /> 
								<fmt:formatNumber type="number" pattern="#.#" value="${aa}" /> d 
								<fmt:formatNumber type="number" pattern="#.##" value="${(amoutLeaveDay % 1) * 8}" /> h									
						</span>
						<span class="btn green btn-outline" style="width: 120px">
								<i class="fa fa-calendar"></i> <fmt:formatDate
									value="${leave.time_create}" pattern="dd-MMM-yyyy"></fmt:formatDate>
						</span></td>
						<!--  <td><c:if test="${leave.leave_status_id.toString() == '0'}">
									<div class="wait-${leave.leave_id}">
										<div class="item-status btn-sm btn-warning">Waiting for
											Approved</div>
									</div>


									<div hidden class="app-${leave.leave_id}">
										<div class="item-status btn-sm btn-info">Approved</div>
									</div>

									<div hidden class="app0-${leave.leave_id}">
										<div class="item-status btn-sm btn-danger">Reject</div>
									</div>

									<div hidden class="app1-${leave.leave_id}">
										<div class="item-status btn-sm btn-warning">Waiting for
											Approved</div>
									</div>


								</c:if> <c:if test="${leave.leave_status_id.toString() == '1'}">
									<div class="wait-${leave.leave_id}">
										<div class="item-status btn-sm btn-info">Approved</div>
									</div>

									<div hidden class="app1-${leave.leave_id}">
										<div class="item-status btn-sm btn-warning">Waiting for
											Approved</div>
									</div>

									<div hidden class="app0-${leave.leave_id}">
										<div class="item-status btn-sm btn-danger">Reject</div>
									</div>

									<div hidden class="app-${leave.leave_id}">
										<div class="item-status btn-sm btn-info">Approved</div>
									</div>

								</c:if> <c:if test="${leave.leave_status_id.toString() == '2'}">
									<div class="wait-${leave.leave_id}">
										<div class="item-status btn-sm btn-danger">Reject</div>
									</div>

									<div hidden class="app1-${leave.leave_id}">
										<div class="item-status btn-sm btn-warning">Waiting for
											Approved</div>
									</div>

									<div hidden class="app-${leave.leave_id}">
										<div class="item-status btn-sm btn-info">Approved</div>
									</div>

									<div hidden class="app0-${leave.leave_id}">
										<div class="item-status btn-sm btn-danger">Reject</div>
									</div>

								</c:if></td> 
							<!--   <td><perm:permission object="leave.approve">
									<div class="btn-group">
										<button
											class="btn btn-circle green btn-outline btn-sm dropdown-toggle"
											type="button" data-toggle="dropdown" data-hover="dropdown">
											Actions <i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><a class="text-right "
												onclick="ajaxLoad(${leave.leave_id})">Approve </a></li>
											<li><a class="text-right"
												href="LeaveEdit?id=${leave.leave_id}">Detail </a></li>
											<li><a class="text-right"
												href="leaveReport?leaveId=${leave.leave_id}">Print </a></li>
											<li class="divider"></li>
											<li><a class="text-right"
												onclick="delete_leave_id?leave_id=${leave.leave_id}"><font
													color="red">Delete </font></a></li>
										</ul>
									</div>
								</perm:permission></td> -->

						<td><perm:permission object="leave.approve">
								<div class="btn-group">
									<!-- <button type="button" class="btn btn-info btn-lg" id="myBtn">
											Open Modalz</button>
										Modal
										<div class="modal fade" id="myModal" role="dialog">
											<div class="modal-dialog">

												Modal content
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal">&times;</button>
														<h4 class="modal-title">Modal Header</h4>
													</div>
													<div class="modal-body">
														<p>Some text in the modal.</p>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-default"
															data-dismiss="modal">Close</button>
													</div>
												</div>

											</div>
										</div>
										<script>
											$(document).ready(function() {
												$("#myBtn").click(function() {
													console.log("axxaaxax");
													$("#myModal").modal();
												});
											});
											/* 
											function CallPop(){
											var reason = prompt("Please enter your reason", "reason");
											
											
											}  */
										</script> -->

									<c:if test="${leave.leave_status_id.toString() == '0'}">

										<div class="wait-${leave.leave_id}">
											<button class="btn yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id})"> Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call01" class="btn btn-danger"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

										<div hidden class="app-${leave.leave_id}">
											<button class="btn blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call02" class="btn btn-danger"
															title="reject_leave_id"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>

											</ul>
										</div>

										<div hidden class="app0-${leave.leave_id}">
											<button class="btn red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn circle btn-info"
															onclick="ajaxLoad(${leave.leave_id});"> Approve </a>
													</h4></li>
											</ul>
										</div>

										<div hidden class="app1-${leave.leave_id}">
											<button class="btn yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<button class="btn btn-danger"
															onclick="ajaxLoad(${leave.leave_id});">Approve</button>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a id="reject_leave_call03" class="text-right"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>



									<c:if test="${leave.leave_status_id.toString() == '1'}">

										<div class="wait-${leave.leave_id}">
											<button class="btn blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call04"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
												<li class="divider"></li>
											</ul>
										</div>

										<div hidden class="app-${leave.leave_id}">
											<button class="btn blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call05"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
												<li class="divider"></li>
											</ul>
										</div>

										<div hidden class="app0-${leave.leave_id}">
											<button class="btn red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id});"> Approve </a>
													</h4></li>
											</ul>
										</div>

										<div hidden class="app1-${leave.leave_id}">
											<button class="btn yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id});"> Approve </a>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call06"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>



									<c:if test="${leave.leave_status_id.toString() == '2'}">

										<div class="wait-${leave.leave_id}">
											<button class="btn red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id});"> Approve </a>
													</h4></li>
											</ul>
										</div>

										<div hidden class="app-${leave.leave_id}">
											<button class="btn blue" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Approved<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" title="reject_leave_id"
															id="reject_leave_call07"
															onclick="call_reject_popup(${leave.leave_id});"
															data-target="#reject_leave"> Reject </a>
													</h4></li>
												<li class="divider"></li>
											</ul>
										</div>

										<div hidden class="app0-${leave.leave_id}">
											<button class="btn red-mint" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Reject<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id});"> Approve </a>
													</h4></li>
											</ul>
										</div>

										<div hidden class="app1-${leave.leave_id}">
											<button class="btn yellow-crusta" type="button"
												data-toggle="dropdown" data-hover="dropdown">
												Waiting for Approving<i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><h4 style="color: white; text-align: center;">
														<button class="btn btn-info"
															onclick="ajaxLoad(${leave.leave_id});">Approve</button>
													</h4></li>
												<li><h4 style="color: white; text-align: center;">
														<a class="btn btn-danger" id="reject_leave_call08"
															onclick="call_reject_popup(${leave.leave_id});">
															Reject </a>
													</h4></li>
											</ul>
										</div>

									</c:if>



								</div>

								<script>
									
										var rejectLeaveId;
										var reason;
						
										function call_reject_popup(id) {
											debugger;
											this.rejectLeaveId = id;
											console.log("callpopup-", rejectLeaveId);
											$("#reject_leave").modal();
											debugger;
										}
							
										function ajaxLoad2(boo, reason) {
											debugger;
											console.log("ajaxLoad2-", boo);
											var xhttp = new XMLHttpRequest();
											xhttp.onreadystatechange = function() {
												if (this.readyState == 4 && this.status == 200) {

												}
											}
												
											xhttp.open("GET", "Leave_inListLeaveStatusToReject?leave_id="
													+ boo +"&reason=" + reason, true);
											xhttp.send();

											$(".app0-" + boo).show();
											$(".wait-" + boo).hide();
											$(".app1-" + boo).hide();
											$(".app-" + boo).hide();
								
											debugger;
										}
										
										function beforeRejectAction(){
											debugger;
											this.reason = $("#reason").val();
											console.log("reason = ", this.reason);
											ajaxLoad2(rejectLeaveId, this.reason);
											debugger;
										}
									</script>


							</perm:permission></td>

						<td><perm:permission object="leave.approve">
								<div class="btn-group">
									<a class="btn circle btn-outline btn-sm blue"
										href="LeaveEdit?id=${leave.leave_id}"
										title="information of leave"> <i
										class="fa fa-clipboard"></i>
									</a>
								</div>
							</perm:permission></td>

						<td><perm:permission object="leave.approve">
								<div class="btn-group">
									<a class="btn circle btn-outline btn-sm purple-sharp"
										href="leaveReport?leaveId=${leave.leave_id}"
										title="leave information printing">
										<i class="fa fa-print"></i>
									</a>
								</div>

							</perm:permission></td>

						<td><perm:permission object="leave.approve">
								<div class="btn-group">
									<a id="delete_leave_link" class="btn circle btn-outline btn-sm red"
										data-toggle="modal"
										onclick="delTimesheet(${leave.leave_id});"
										title="leave deleting"> <i
										class="fa fa-trash-o"></i>
									</a>
									<%-- href="delete_leave_id?leave_id=${leave.leave_id}" --%>
								</div>

							</perm:permission> <!-- for delete leave alert pop up -->
						<script>
								
								function delTimesheet(id) {
									swal({
									      title: "Are you sure!",
									      text: "You will be deleting this id!",
									      type: "warning",
									      showCancelButton: true,
									      confirmButtonClass: 'btn-danger',
									      confirmButtonText: 'OK'
									    }, function (inputValue) {
									        if (inputValue == false){
									        	//console.log("canceled");
									        	return false;
									        	}
									        if (inputValue == true) {
									        	 $.ajax({
									 				    url : "delete_leave_id.action",
									 					data : "leave_id="+ id,
									 					type : "POST",
									 					success : function(response) {
									 						window.location.reload(true);
									 					}
									 			 });
									          return false
									        }
									      });
								}
								
								</script></td>
					</tr>

				</c:forEach>

				<!-- for reject leave alert pop up -->
				<div class="modal fade draggable-modal ui-draggable"
					id="reject_leave" tabindex="-1" role="dialog" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header ui-draggable-handle">
								<button type="button" class="close" data-dismiss="modal"></button>
								<h4 class="modal-title">Are your sure?!</h4>
							</div>
							<div class="modal-body">You will be rejecting this id</div>
							<div class="modal-footer">
								<label>Reasons</label>
								<textarea class="form-control" rows="3" id="reason"></textarea>
								<button type="button" class="btn dark btn-outline"
									data-dismiss="modal">Exit</button>
								<a class="btn btn-sm sbold red" data-dismiss="modal"
									onclick="beforeRejectAction();" title="leave rejecting"
									style="color: white;"> Confirm reject </a>

							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog  -->
				</div>
				<!-- /.modal  -->

			</form>
		</table>



		<%-- 	<div class="portlet light bordered">
			<div class="portlet-title">
				<div class="caption caption-md">
					<i class="icon-bar-chart theme-font hide"></i> <span
						class="caption-subject font-blue-madison bold uppercase">Leave
						Lists</span> <span class="caption-helper"></span>
				</div>
				
				<div class="inputs">
					<div class="portlet-input input-inline input-small ">
						<div class="input-icon right"></div>
					</div>
				</div>
			</div>
			
			<div class="portlet-body">
				<div data-always-visible="1" data-rail-visible1="0"
					data-handle-color="#D7DCE2">
					<div class="general-item-list">
						<c:forEach var="leave" items="${leave}" varStatus="status">
							<c:if test="${leave.leave_status_id.toString() == '0'}">
								<center>
									<div
										style="border: 1px solid lightblue; padding: 15px; margin: 10px; width: 90%;">
										<div class="row">
											<div align="center"
												class="col-xs-12 col-sm-3 col-md-3 col-lg-2">
												<div class="row centerxs">
													<div align="center"
														class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
														<c:choose>
															<c:when test="${leave.path == null}">
																<img style="padding: 2px;" width="60px" height="60px"
																	style="background-color: #555;">
															</c:when>
															<c:otherwise>
																<img width="60px" height="60px"
																	style="object-fit: cover; margin: 3px;"
																	src="${leave.path}">
															</c:otherwise>
														</c:choose>
														<div align="center"
															class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
															<a title="ID: ${leave.leave_id}"
																href="LeaveEdit?id=${leave.leave_id}"
																class="item-name primary-link"> <font
																color="#105AB0" size="4">${leave.user_id} </font></a>
														</div>
													</div>
												</div>
											</div>

											<div class="centerxs col-xs-12 col-sm-6 col-md-5 col-lg-6">
												<div style="text-align: left;"
													class="centerxs col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<font size="3" class="open-sans" color="#366FB1">
														<b>${leave.leave_type_name} &nbsp;&nbsp;&nbsp;&nbsp; <c:set
															var="amoutLeaveDay" value="${leave.no_day}" /> 
															<span hidden id="amountLeaveType-${leave.leave_id}"> ${leave.leave_type_id} </span>
															<span id="amountLeave-${leave.leave_id}" > <fmt:formatNumber
															type="number" pattern="#.##" value="${amoutLeaveDay}" /></span>
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;วัน</b>
													</font>
												</div>
												
												<div style="text-align: left;"
													class="centerxs col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<font size="3" class="open-sans" color="#366FB1"><fmt:formatDate
															value="${leave.start_date}" pattern="dd-MMM-yyyy"></fmt:formatDate>
														&nbsp; ~&nbsp; &nbsp; <fmt:formatDate
															value="${leave.end_date}" pattern="dd-MMM-yyyy"></fmt:formatDate></font>
												</div>
												<div style="text-align: left;"
												class="centerxs col-xs-12 col-sm-12 col-md-12 col-lg-12">
												<font size="3" class="open-sans" color="#366FB1">Submit date : <fmt:formatDate value="${leave.time_create}"
													pattern="dd-MM-yyyy HH:mm"></fmt:formatDate></font>
											</div>

												<div style="text-align: left;"
													class="centerxs col-xs-12 col-sm-12 col-md-12 col-lg-12">
													<p>
														<font size="3" class="open-sans" color="#366FB1">
															${leave.description}</font>
													</p>
												</div>
											</div>
											<div class="col-xs-12 col-sm-2 col-md-4 col-lg-4">
												<div class="row">
													<div class="col-xs-7 col-sm-7 col-md-7 col-lg-7">
														<c:if test="${leave.leave_status_id.toString() == '0'}">

															<div class="wait-${leave.leave_id}">
																<span class="item-status"> <span
																	class="badge badge-empty badge-warning"></span> <a
																	class="centerxs hiddensm"> Waiting for approve </a>
																</span>
															</div>


															<div hidden class="app-${leave.leave_id}">
																<span class="item-status"> <span
																	class="badge badge-empty badge-success"></span> <a
																	class="centerxs hiddensm"> Approved </a>
																</span>
															</div>
														</c:if>

														<c:if test="${leave.leave_status_id.toString() == '1'}">
															<span class="item-status"> <span
																class="badge badge-empty badge-success"></span> <a
																class="centerxs hiddensm"> Approved </a>
															</span>

														</c:if>
														<c:if test="${leave.leave_status_id.toString() == '2'}">
															<span class="item-status"> <span
																class="badge badge-empty badge-danger"></span> <a
																class="centerxs hiddensm"> Reject </a>
															</span>
														</c:if>
													</div>
													<div class=" centerxs col-xs-5 col-sm-5 col-md-5 col-lg-5">
														<perm:permission object="leave.approve">
															<div class="btn-group">
																<button
																	class="btn btn-circle green btn-outline btn-sm dropdown-toggle"
																	type="button" data-toggle="dropdown"
																	data-hover="dropdown">
																	Actions <i class="fa fa-angle-down"></i>
																</button>
																<ul class="dropdown-menu pull-right" role="menu">
																	<li><a class="text-right "
																		onclick="ajaxLoad(${leave.leave_id})">Approve </a></li>
																	<li><a class="text-right"
																		href="LeaveEdit?id=${leave.leave_id}">Detail </a></li>
																	<li><a class="text-right"
																		href="leaveReport?leaveId=${leave.leave_id}">Print
																	</a></li>
																	<li class="divider"></li>
																	<li><a class="text-right"
																		href="delete_leave_id?leave_id=${leave.leave_id}"><font
																			color="red">Delete </font></a></li>
																</ul>
															</div>
														</perm:permission>
													</div>
												</div>
											</div>

											<!-- this below tag /div is main row -->
										</div>
										<!-- this below tag /div is css box -->
									</div>
								</center>
							</c:if>
						</c:forEach>

						<!-- end of portlet content -->
					</div>
				</div>
			</div>
		</div>--%>
		<!-- end of main portlet body -->
	
	</div>

</div>

<script>
function myFunction(){
	
	
	<c:forEach var="leave" items="${userleave}" varStatus="status">

	document.getElementById("demo").innerHTML = "${leave.user_id}";
	</c:forEach>

	
	

}
</script>

<script>
	$(document).ready(function() {

		var value = "${flag_search}";
		if (value == "1") {
			var user = "${userId}";
			var type = "${type}";
			if (type == "All") {
				type = "All1";
			}
			document.getElementById(user).selected = "true";
			document.getElementById(type).selected = "true";
		} else {

			$('.select2me').select2();
		}
	});
</script>
<script>
	function add() {
		document.location = "LeaveAdd";
	}
</script>
<script>
	$('.cannot').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
</script>
<script>
	function approved() {
		document.location = "leave_check_approve";
	}

	$('.selectall').click(function() {
		if ($(this).is(':checked')) {
			$('div input').attr('checked', true);
		} else {
			$('div input').attr('checked', false);
		}
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#select_all').on('click', function() {
			if (this.checked) {
				$('.checkboxall').each(function() {
					this.checked = true;
				});
			} else {
				$('.checkboxall').each(function() {
					this.checked = false;
				});
			}
		});

		$('.checkbox').on('click', function() {
			if ($('.checkbox:checked').length == $('.checkbox').length) {
				$('#select_all').prop('checked', true);
			} else {
				$('#select_all').prop('checked', false);
			}
		});
	});
	
	
	

	function ajaxLoad(boo) {
		leaveId=boo;
	 $.ajax({
         url: '${pageContext.request.contextPath}/Leave_inList',
         type: 'POST',
         data : {
        	"leave_id" : leaveId
         }, 
	 }).done(function(data) {
		 $('.wait-'+boo).hide();
		 $('.app-'+boo).show();
		 swal("Success!","Leave ID "+boo+" was approved")
		 
		}).fail(function() {
			swal("Fail to approve ID : "+boo)
		});
	}
		
			    
		//not use	    $("#dashboard").load( " #dashboard", {name1: "value", type: "All"});
		
		// update dashboard function 
				var amount = parseFloat(document.getElementById("amountLeave-"+boo).innerHTML);
				var amountLeaveType = parseInt(document.getElementById("amountLeaveType-"+boo).innerHTML);
				var leaveType1 = parseFloat(document.getElementById("leaveType1").innerHTML);
				var leaveType3 = parseFloat(document.getElementById("leaveType3").innerHTML);
				var leaveType6 = parseFloat(document.getElementById("leaveType6").innerHTML);
				var total ;
				if (amountLeaveType == 1) { 
					total = amount + leaveType1;
					document.getElementById("leaveType1").innerHTML = total;
				} else if (amountLeaveType == 3) {
					total = amount + leaveType3;
					document.getElementById("leaveType3").innerHTML = total;
				} else {
					total = amount + leaveType6;
					document.getElementById("leaveType6").innerHTML = total;
				}				
	
</script>