<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script src="../assets/apps/scripts/calendar.min.js"
	type="text/javascript"></script>
<c:set var="now" value="<%=new java.util.Date()%>" />

<head>
<meta charset="utf-8" />
<title>Metronic Admin Theme #4 | Admin Dashboard</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta
	content="Preview page of Metronic Admin Theme #4 for statistics, charts, recent events and reports"
	name="description" />
<meta content="" name="author" />


<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		
		var data = google.visualization.arrayToDataTable([
		[ 'Task', 'Hours per Day' ], [ 'Present', ${userWork} ], [ 'Leave', ${Leavesum} ],
		[ 'Absent', ${usersumday } ],['Late', ${userlatenum}] ]);
		

		var options = {
			title : 'PALM Chart',
			is3D : true,
			pieSliceTextStyle : {
				color : 'white',
			},
			colors : [ '#8e44ad', '#578ebe', '#525e64','#e7505a' ]
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('piechart_3d'));

		chart.draw(data, options);
	}
	
	
</script>



</head>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"><i
				class="fa fa-area-chart"></i> DashBoard</span>
		</div>

		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<div class="portlet-body">
		<div class="form-group form-lg-line-input">

			<div class="row">

				<div class="col-md-12 col-lg-12">
					<div class="col-md-4">

						<a class="dashboard-stat dashboard-stat-v2 yellow-gold">
							<div class="visual">
								<i class="icon-user"></i>
							</div>
							<div class="details">
								<div class="number">
									<span> ${user.name}</span>
								</div>
								<br>
								<div class="desc">
									<font size="5px">${user.id} </font>
								</div>

							</div>
						</a>

					</div>
					<div class="col-md-4">
						<a class="dashboard-stat dashboard-stat-v2 purple-studio">
							<div class="visual">
								<i class="fa fa-hand-stop-o"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup" data-value="12,5"> <fmt:formatNumber
											type="number" minFractionDigits="1" value="${userWork}" /> /
										<fmt:formatNumber type="number" minFractionDigits="1"
											value="${Tday }" />
									</span> Days
								</div>
								<br>
								<div class="desc">
									<font size="5px">${monthnow} / ${yearnow }</font>
								</div>
							</div>
						</a>
					</div>
					<div class="col-md-4">
						<a class="dashboard-stat dashboard-stat-v2 blue-madison">
							<div class="visual">
								<i class="fa fa-hand-pointer-o"></i>
							</div>
							<div class="details">


								<div class="number">
									<span data-counter="counterup"> <fmt:formatNumber
											type="number" minFractionDigits="1" value="${Leavesum}" />
									</span> Days
								</div>
								<br>
								<div class="desc">
									<font size="5px">Leave ${monthnow} / ${yearnow }</font>
								</div>
							</div>
						</a>
					</div>

				</div>
			</div>

			<br> <br>
			<div class="row">
				<div class="col-md-12 col-lg-12">

					<div class="col-md-4">
						<a class="dashboard-stat dashboard-stat-v2 grey-mint">
							<div class="visual">
								<i class="fa fa-calendar-times-o"></i>
							</div>
							<div class="details">
								<div class="number">
									<span data-counter="counterup"> <fmt:formatNumber
											type="number" pattern="#.#" value="${usersumday}" /></span> Days
								</div>
								<br>
								<div class="desc">
									<font size="5px">Absent</font>
								</div>
							</div>
						</a>
					</div>
					
					<div class="col-md-4">

						<a class="dashboard-stat dashboard-stat-v2 red">
							<div class="visual">
								<i class="fa fa-thumbs-o-down"></i>
							</div>
							<div class="details">

								<div class="number">
									<%-- 	<span data-counter="counterup"> <fmt:formatNumber
												type="number" pattern="#.#" value="${userlate }" />

										</span> Days
										
										--%>
									<span data-counter="counterup"> ${userlate } </span> Days
								</div>
								<br>
								<div class="desc">
									<font size="5px">Late</font>
								</div>

							</div>
						</a>

					</div>
					<div class="col-md-4">
						<a class="dashboard-stat dashboard-stat-v2 yellow-mint">
							<div class="visual">
								<i class="fa fa-calendar-check-o"></i>
							</div>
							<div class="details">

								<div class="number">
									<span data-counter="counterup">${HH}:${MM} / <fmt:formatNumber
											type="number" pattern="#" value="${Tday*8}" /> H
									</span>
								</div>
								<br>
								<div class="desc">
									<font size="5px">Working / Sum Working</font>
								</div>
							</div>
						</a>
					</div>

				</div>



			</div>

			<div class="row">
				<div class="col-md-12 ">
					<div class="col-md-6" style="max-width: 100%; margin-top: 3%">
						<form Action="timeline" method="post">
							<div class="portlet light portlet-fit bordered text-center">
								<div class="portlet-body flip-scroll text-center col-12-md">
									<div class="row">
										<label class="control-label col-md-2 col-xs-3">Year :
										</label> <select class="form-control col-md-1 col-xs-3"
											name="yearSearch" id=yearSearch style="width: 100px">
											<c:choose>
												<c:when test="${yearsearch != null}">
													<c:forEach begin="0" end="4" var="i">
														<option value="${yearnow - i}" id="${yearnow - i}"
															<c:if test="${yearsearch == (yearnow - i)}"><c:out value="selected=selected"/></c:if>>${yearnow - i}</option>
													</c:forEach>
												</c:when>
												<c:otherwise>
													<c:forEach begin="0" end="4" var="i">
														<option value="${yearnow - i}" id="${yearnow - i}">${yearnow - i}</option>
													</c:forEach>
												</c:otherwise>
											</c:choose>
										</select> <label class="control-label col-md-2 col-xs-3"
											for="form_control_1">Month : </label> <select
											class=" form-control col-md-1 col-xs-3" name="month"
											id="month" style="width: 100px">
											<option value='01' id='01'
												<c:if test="${months == 01 }"><c:out value="selected=selected"/> </c:if>>Janaury</option>
											<option value='02' id='02'
												<c:if test="${months == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
											<option value='03' id='03'
												<c:if test="${months == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
											<option value='04' id='04'
												<c:if test="${months == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
											<option value='05' id='05'
												<c:if test="${months == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
											<option value='06' id='06'
												<c:if test="${months == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
											<option value='07' id='07'
												<c:if test="${months == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
											<option value='08' id='08'
												<c:if test="${months == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
											<option value='09' id='09'
												<c:if test="${months == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
											<option value='10' id='10'
												<c:if test="${months == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
											<option value='11' id='11'
												<c:if test="${months == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
											<option value='12' id='12'
												<c:if test="${months == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
										</select>
										<button type="submit" class="btn sbold blue-steel text-center">
											<i class="fa fa-search"></i> Search
										</button>
									</div>

								</div>
								<div class="portlet-body">
									<div class="cd-horizontal-timeline mt-timeline-horizontal"
										data-spacing="100">
										<div class="timeline">
											<div class="events-wrapper">
												<div class="events">
													<ol>
														<!--     <li>
                                                            <a href="#0" data-date="16/01/2014" class="border-after-red bg-after-red selected">16 Jan</a>
                                                        </li>  
                                                        <c:forEach var="tilmeline" items="${tilmeline}">
                                                          <li>
                                                            <a href="#0" data-date="${tilmeline.date}" class="border-after-red bg-after-red ">${tilmeline.shortdate}</a>
                                                        </li>
                                                  </c:forEach> -->
														<c:forEach var="timeline" items="${timelinefirst}">
															<li><a href="#0" data-date="${timeline.fulldate} "
																class="border-after-red selected">${timeline.fulldate}
															</a></li>
														</c:forEach>
														<c:forEach var="timeline" items="${timeline}">


															<li><a href="#0" data-date="${timeline.fulldate}"
																class="border-after-red  ">${timeline.fulldate} </a></li>

														</c:forEach>

													</ol>
													<span class="filling-line bg-red" aria-hidden="true"></span>
												</div>
												<!-- .events -->
											</div>
											<!-- .events-wrapper -->
											<ul class="cd-timeline-navigation mt-ht-nav-icon">
												<li><a href="#0"
													class="prev inactive btn btn-outline red md-skip"> <i
														class="fa fa-chevron-left"></i>
												</a></li>
												<li><a href="#0"
													class="next btn btn-outline red md-skip"> <i
														class="fa fa-chevron-right"></i>
												</a></li>
											</ul>
											<!-- .cd-timeline-navigation -->
										</div>
										<div class="events-content"
											style="margin-left: 2%; margin-right: 2%">
											<ol>
												<c:forEach var="timeline" items="${timelinefirst}">

													<li data-date="${timeline.fulldate} ">

														<div class="col-md-12 col-xm-12  col-xs-12 col-sm-12 row " style="margin-left: 2%">
															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-left ">
																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>
																</c:forEach>

																<span style="font-size: 13px">
																	${timeline.user_create } </span>
														
																	<c:choose>
																		<c:when test="${timeline.checkin==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Checkout : ${timeline.checkin }</div>
																		</c:otherwise>
																	</c:choose>
															
															</div>

															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-right "
																style="margin-left: 3%; margin-bottom: 5%">



																<span style="font-size: 13px">
																	${timeline.user_create } </span>

																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>



																</c:forEach>
															
																	<c:choose>
																		<c:when test="${timeline.checkout==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Checkout : ${timeline.checkout }</div>
																		</c:otherwise>
																	</c:choose>
															

															</div>
														</div> 
												
													

													</li>

												</c:forEach>
												<c:forEach var="timeline" items="${timeline}">
													<li class="" data-date="${timeline.fulldate }">
														<div class="col-md-12 col-xm-12  col-xs-12 col-sm-12 row " style="margin-left: 2%">
															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-left ">
																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>
																</c:forEach>

																<span style="font-size: 13px">
																	${timeline.user_create } </span>
															
																	<c:choose>
																		<c:when test="${timeline.checkin==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Check-In : ${timeline.checkin }</div>
																		</c:otherwise>
																	</c:choose>
															
															</div>

															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-right "
																style="margin-left: 3%; margin-bottom: 5%">



																<span style="font-size: 13px">
																	${timeline.user_create } </span>

																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>



																</c:forEach>
															
																	<c:choose>
																		<c:when test="${timeline.checkout==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Check-Out : ${timeline.checkout }</div>
																		</c:otherwise>
																	</c:choose>
															

															</div>
														</div> 
													
													</li>
												</c:forEach>
												<c:forEach var="timeline" items="${timelinefirst}">
													<li class="selected" data-date="${timeline.fulldate }">


														<div class="col-md-12 col-xm-12  col-xs-12 col-sm-12 row " style="margin-left: 2%">
															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-left ">
																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>
																</c:forEach>

																<span style="font-size: 13px">
																	${timeline.user_create } </span>
															
																	<c:choose>
																		<c:when test="${timeline.checkin==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Check-In : ${timeline.checkin }</div>
																		</c:otherwise>
																	</c:choose>
															
															</div>

															<div class="col-md-6 col-xm-6  col-xs-6 col-sm-6 row text-right "
																style="margin-left: 3%; margin-bottom: 5%">



																<span style="font-size: 13px">
																	${timeline.user_create } </span>

																<c:forEach var="fpost" items="${userpath}"
																	varStatus="Count">
																	<c:choose>

																		<c:when test="${fpost.path==null}">
																			<img src="/upload/user/cat.png"
																				style="width: 50px; height: 50px">

																		</c:when>
																		<c:otherwise>

																			<img src="${fpost.path}" alt=""
																				style="width: 50px; height: 50px">

																		</c:otherwise>
																	</c:choose>



																</c:forEach>
															
																	<c:choose>
																		<c:when test="${timeline.checkout==null}">

																		</c:when>
																		<c:otherwise>
																			<div>Check-Out : ${timeline.checkout }</div>
																		</c:otherwise>
																	</c:choose>
															

															</div>
														</div> 
														
													</li>
												</c:forEach>
											</ol>
										</div>

									</div>
								</div>
							</div>

						</form>

					</div>
					<br> <br>
					<div class="col-md-6">

						<div class="portlet-body" style="text-align: center;">
							<table class="table table-striped table-header-fixed"
								id="table_id">
								<thead>
									<tr class=""
										style="background-color: rgb(59, 63, 81); color: white">
										<th class="text-center" width="20px"></th>
										<th class="text-center" width="200px">Date</th>
										<th class="text-center " width="200px"
											style="background-color: #3B3F51; color: white;">Project</th>

										<th class="text-center " width="250px"
											style="background-color: #3B3F51; color: white;">Team</th>

									</tr>
								</thead>
								<tbody>
									<c:forEach var="workP" items="${userWorkProject}"
										varStatus="Count">

										<fmt:formatDate var="test" value="${workP.time_check_in}"
											pattern="E" />
										<c:set var="val" value="5" />
										<c:choose>
											<c:when test="${test=='Sun'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle red easy-pie-chart-reload"
													style="width: 70px">Sun</a></td>
											</c:when>
											<c:when test="${test=='Mon'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle yellow-lemon easy-pie-chart-reload"
													style="width: 70px"> Mon</a></td>
											</c:when>
											<c:when test="${test=='Tue'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle red-pink easy-pie-chart-reload"
													style="width: 70px">Tue</a></td>
											</c:when>
											<c:when test="${test=='Wed'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle green-jungle easy-pie-chart-reload"
													style="width: 70px">Wed </a></td>
											</c:when>
											<c:when test="${test=='Thu'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle yellow-gold easy-pie-chart-reload"
													style="width: 70px">Thu</a></td>
											</c:when>
											<c:when test="${test=='Fri'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle green easy-pie-chart-reload"
													style="width: 70px">Fri</a></td>
											</c:when>
											<c:when test="${test=='Sat'}">
												<td class="text-center"><a href="javascript:;"
													class="btn btn-md btn-circle blue easy-pie-chart-reload"
													style="width: 70px">Sat</a></td>
											</c:when>
											<c:otherwise>
        						error.
							</c:otherwise>
										</c:choose>
										<%-- 
												<tr>
													<td><fmt:formatDate value="${workP.time_check_in}"
															pattern="EE" /></td>--%>
										<td><fmt:formatDate value="${workP.time_check_in}"
												pattern="dd-MM-yyyy" /></td>
										<td class="text-center">${workP.project_name}</td>

										<c:choose>
											<c:when test="${workP.team==null}">
												<td class="text-center">-</td>
											</c:when>
											<c:otherwise>
												<td class="text-center">${workP.team}</td>

											</c:otherwise>
										</c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>

						</div>
					</div>

				</div>
				<div class="col-md-12  col-xs-12" id="piechart_3d"
					style="max-width: 100%; height: 350px; padding-left: 20%"></div>
			</div>

		</div>

	</div>

</div>

<script>
	function edit() {
	var monthnew= document.getElementById("month").value;
	var yearnew= document.getElementById("yearSearch").value;
		$.ajax({
			 type: "method",
			url : "timeline",
			method : "GET",
			type : "JSON",
			data : {
				"month" : monthnew,
				"yearSearch":yearnew,

			},
			success : function(data) {
				location.reload(true);
			
				
			}
		});
	};	
</script>

<script>

function getmessage(id,details) {
  document.getElementById("demo").innerHTML = id;
  document.getElementById("message").innerHTML = details;

}


</script>

<script
	src="../assets/global/plugins/horizontal-timeline/horizontal-timeline.js"
	type="text/javascript"></script>
<script>

$(document).ready(function() {
	$('#table_id').DataTable({
		"aLengthMenu" : [ [ 25, 50, 75, -1 ], [ 25, 50, 75, "All" ] ],
		"iDisplayLength" : 6,
		"order" : [ [1, "desc" ] ]

	});
})

</script>
