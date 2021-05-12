<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<link href="../assets/global/plugins/datatables/datatables.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css"
	rel="stylesheet" type="text/css" />
<style>
span.btn {
	width: 120px;
}
</style>


<div class="portlet light ">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-list font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Equipment
				List</span> <span class="caption-helper font-red"> </span>
		</div>
		<div class="actions">
			<a href="eAdd" class="btn btn-sm green-meadow"><i class="fa fa-plus"></i>
				Add new</a>
		</div>
	</div>
	<div class="portlet-body">
		<table
			class="table table-striped table-hover dt-responsive"
			width="100%" id="table">
			<thead>
				<tr>
					<th colspan="3">
						<div class="mt-checkbox-inline" id="type"></div>
					</th>
					<th colspan="4">
						<div class="mt-checkbox-inline" id="status"></div>
					</th>
				</tr>
				<tr style="background-color:rgb(59, 63, 81);color:white">
					<th height="41" class="all">ITEM NO</th>
					<th class="all">Type</th>
					<th class="all">Equipment</th>
					<th class="all">Detail</th>
					<th class="all">Status</th>
					<th class="all">Borrower</th>
					<th class="all">Action</th>
				</tr>
			</thead>
			<form action="tableE3" method="GET">
				<c:forEach var="equip" items="${equipmentall}">
					<tr>
						<td>${equip.itemNo}</td>

						<td><c:if test="${equip.type == 'c'}">
								Computer
							</c:if> <c:if test="${equip.type == 'o'}">
								Others
							</c:if></td>


						<td>${equip.name}</td>


						<td>${equip.detail}</td>


						<perm:permission object="admin"><td><%-- <c:if test="${equip.status == 'A'}">
								<span class="btn btn-sm green-jungle">Available</span>
							</c:if> <c:if test="${equip.status == 'B'}">
								<span class="btn btn-sm yellow-lemon">Borrowed</span>
							</c:if> <c:if test="${equip.status == 'C'}">
								<span class="btn btn-sm red-mint">Corrupted</span>
							</c:if> <c:if test="${equip.status == 'F'}">
								<span class="btn btn-sm blue">Fixed</span>

							</c:if> <c:if test="${equip.status == 'L'}">
								<span class="btn btn-sm dark">Lost</span>
							</c:if> <c:if test="${equip.status == 'W'}">
								<span class="btn btn-sm default">Wait for approve</span>
							</c:if> <c:if test="${equip.status == 'Z'}">
								<span class="btn btn-sm grey-mint">Disabled</span>
							</c:if> --%>

							<div class="btn-group">
								
								<c:if test="${equip.status.toString() == 'A'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'B'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'C'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'F'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'L'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'W'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>
								
								<c:if test="${equip.status.toString() == 'Z'}">

									<div class="wait-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus1-${equip.equipmentId}">
										<button class="btn btn green-jungle" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Available<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>

									<div hidden class="eStatus2-${equip.equipmentId}">
										<button class="btn btn yellow-lemon" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Borrowed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus3-${equip.equipmentId}">
										<button class="btn btn red-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Corrupted<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus4-${equip.equipmentId}">
										<button class="btn btn blue" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Fixed<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus5-${equip.equipmentId}">
										<button class="btn btn dark" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Lost<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus6-${equip.equipmentId}">
										<button class="btn btn default" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Wait for approve<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn rgrey-mint"
														onclick="set_eStatusZ();changeE_Status(${equip.equipmentId});">
														Disabled</a>
												</h4></li>
										</ul>
									</div>
									
									<div hidden class="eStatus7-${equip.equipmentId}">
										<button class="btn btn grey-mint" type="button"
											data-toggle="dropdown" data-hover="dropdown">
											Disabled<i class="fa fa-angle-down"></i>
										</button>
										<ul class="dropdown-menu pull-right" role="menu">
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn green-jungle"
														onclick="set_eStatusA();changeE_Status(${equip.equipmentId});">
														Available</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn yellow-lemon"
														onclick="set_eStatusB();changeE_Status(${equip.equipmentId});">
														Borrowed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn red-mint"
														onclick="set_eStatusC();changeE_Status(${equip.equipmentId});">
														Corrupted</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn blue"
														onclick="set_eStatusF();changeE_Status(${equip.equipmentId});">
														Fixed</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn dark"
														onclick="set_eStatusL();changeE_Status(${equip.equipmentId});">
														Lost</a>
												</h4></li>
											<li><h4 style="color: white; text-align: center;">
													<a class="btn btn default"
														onclick="set_eStatusW();changeE_Status(${equip.equipmentId});">
														Wait for approve</a>
												</h4></li>
										</ul>
									</div>

								</c:if>

								<script>
										var eStatus;
										
										function set_eStatusA(){
											this.eStatus = "A";
										}
										
										function set_eStatusB(){
											this.eStatus = "B";
										}
										
										function set_eStatusC(){
											this.eStatus = "C";
										}
										
										function set_eStatusF(){
											this.eStatus = "F";
										}
										
										function set_eStatusL(){
											this.eStatus = "L";
										}
										
										function set_eStatusW(){
											this.eStatus = "W";
										}
										
										function set_eStatusZ(){
											this.eStatus = "Z";
										}
							
										function changeE_Status(equipId) {
											debugger;
											var xhttp = new XMLHttpRequest();
											xhttp.onreadystatechange = function() {
												if (this.readyState == 4 && this.status == 200) {

												}
											}
												
											xhttp.open("GET", "equip-changeStatus?equip_id="
													+ equipId +"&equip_status=" + this.eStatus, true);
											xhttp.send();
											
											debugger;

											if(eStatus == "A"){
												$(".eStatus1-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "B"){
												$(".eStatus2-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "C"){
												$(".eStatus3-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "F"){
												$(".eStatus4-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "L"){
												$(".eStatus5-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "W"){
												$(".eStatus6-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus7-" + equipId).hide();
											}
											if(eStatus == "Z"){
												$(".eStatus7-" + equipId).show();
												$(".wait-" + equipId).hide();
												$(".eStatus1-" + equipId).hide();
												$(".eStatus2-" + equipId).hide();
												$(".eStatus3-" + equipId).hide();
												$(".eStatus4-" + equipId).hide();
												$(".eStatus5-" + equipId).hide();
												$(".eStatus6-" + equipId).hide();
											}
								
											debugger;
										}

									</script></td>
									</perm:permission>


						<td><c:if test="${equip.status == 'B'}">
								${equip.userCreate}
							</c:if></td>

						<td><c:if test="${equip.status == 'A'}">
								<a class="btn btn-xs green" id="${equip.equipmentId}"
									name="borrow" title="Borrow"> <i class="fa fa-share"> </i>
								</a>
							</c:if> <a class='btn btn-xs blue' href="eEdit?id=${equip.equipmentId}"
							title='Edit'><i class='fa fa-pencil'></i></a> <a
							class='btn btn-xs red' onclick="(${equip.equipmentId})"
							title='Delete'><i class='fa fa-trash'></i></a></td>

					</tr>
				</c:forEach>
			</form>
		</table>
		<br> <br>
	</div>
</div>

<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script src="../assets/global/scripts/datatable.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/datatables/datatables.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js"
	type="text/javascript"></script>
<script src="../assets/global/plugins/sweetalert/sweetalert.min.js"></script>

<script>
var  = (id) => {
    $.ajax({
        url: "eCheckAllBorrow",
        data: {
            "eId": id
        }
    }).done(function (r) {
        let b_check = r;

        if (b_check.length > 0) {
            let body = document.createElement("div");
            let head = document.createElement("p"); 
        
            if (b_check.length > 1) {
                let text = document.createTextNode("These records will be affected");
                head.appendChild(text);
            }
            else {
                let text = document.createTextNode("This record will be affected");
                head.appendChild(text);
            }

            body.appendChild(head);

            b_check.forEach((b) => {
                let item = document.createElement("a");
                item.setAttribute("href","eBorrowEdit?id="+b.borrowId);
                item.setAttribute("style","display:block");
                let borrow_id = " (#"+b.borrowId+")";
                let text = document.createTextNode(b.userBorrowid + borrow_id);
                item.appendChild(text);
                body.appendChild(item);
            });

            swal({
                title: "You can't delete this!",
                content: body,
                icon: "error"
            });
        } else {
            swal({
                title: "Are you sure!",
                text: "Will you continue to delete Equipment  : " + id,
                icon: "warning",
                buttons: true,
                dangerMode: true,
            }).then((selected)=>{
                if (selected) {
                    document.location = "deleteE?id=" + id;
                }
            });
        }


    });

}
</script>