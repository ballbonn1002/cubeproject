<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<link href="../assets/global/css/dashboard.css" rel="stylesheet" type="text/css" />
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
<body>
	<%
		/*Date date = new Date() ;
		SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm") ;
		dateFormat.format(date);
		if(date.after(dateFormat.parse("12:07"))){
			request.setAttribute("chk", "Check in");
		}*/
	%>
	<div class="portlet light bordered rounded-10">
		<div class="portlet-body">
			<div class="form-group form-lg-line-input">
				<div class="row">
					<div class="col-md-4 area">
						<!--<img src="/images/logo2.png" style="width: 50%;"> <img
							src="/images/Team.png" style="width: 100%;">-->
						<div >
							<fmt:formatDate var="date" value="${now}" pattern="EEEE, d MMM y" />
							<div style="font-size:28px;text-align:center;padding-bottom:20px;">${date}</div>
							<div style="text-align:center;padding-bottom:20px">
								<iframe src="https://free.timeanddate.com/clock/i84bjfqu/n28/tlth39/fs42/th1" frameborder="0" width="166" height="51"></iframe>
							</div>

						</div>
						<div >
							<a class="weatherwidget-io" href="https://forecast7.com/en/13d76100d50/bangkok/" data-label_1="BANGKOK" data-label_2="WEATHER" data-theme="pure" >BANGKOK WEATHER</a>
							<script>
								!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src='https://weatherwidget.io/js/widget.min.js';fjs.parentNode.insertBefore(js,fjs);}}(document,'script','weatherwidget-io-js');
							</script>
						</div>
					</div>
					<div class="col-md-4 area">
						<div id="calendar" ></div>
					</div>
					<div class="col-md-4 area">
						<div style="position:relative;">
							<p><font color="red" style="font-weight:bold;font-size:42px;">Hi,  </font><font style="font-weight:normal;font-size:32px;">${user.id}</font></p>
							<p><font color="grey" style="font-weight:bold;font-size:18px;">Holiday</font></p>						
							<fmt:formatDate var="month" value="${now}" pattern="M" />
							<fmt:formatDate var="year" value="${now}" pattern="y"/>
							<c:forEach var="hm" items="${holidaymonth}" varStatus="status">
								<div <c:choose><c:when test="${hm.month != month}">hidden</c:when><c:when test="${hm.year != year}">hidden</c:when></c:choose>
								 name="${hm.month-1}-${hm.year}" class="row" style="margin-bottom: 15px;">
									<label style="position: absolute;left: 5px;">
									 	<font color="red" style="font-weight:bold;font-size:16px;">${hm.hday}</font>
									</label>
									<label style="position: relative;left: 90px;color: grey;">
										&bull;
									</label>
									<label style="position: relative;left: 100px;">
									 	<font style="font-weight:normal;font-size:16px;">${hm.head} </font><br>
									</label>
								</div>
							</c:forEach>
							<img src="/images/tree.png" style="width:25%;position:absolute;top:150px;right:-10px;">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="portlet light bordered rounded-10 area-func col-md-4" style="background-color: #AECDE8;">
		<div class="portlet-body">
			<div>
				<img src="/images/Check-in.png" style="width: 90%;display: block;margin-left: auto;margin-right: auto;">
				<c:forEach var="last" items="${lastchk}" varStatus="status">
					<font color="white" style="font-weight:bold;font-size:16px;display:block;margin-left: 30px;margin-top:30px;">						
					<c:set var = "st" value = "${last.status}"/>
					<c:set var="ct" value="<%=new java.util.Date()%>" />
					<fmt:formatDate var="chkTime" pattern = "H" value = "${ct}" />
					<c:choose>
						<c:when test="${fn:contains(st, '1')}">
							Check in
							<c:set var="chkBtn" value="Check out" />							
						</c:when>
						<c:when test="${fn:contains(st, '2')&&chkTime < 12}">
							Check out
							<c:set var="chkBtn" value="Check in" />
						</c:when>
						<c:when test="${fn:contains(st, '2')&&chkTime >= 12}">
							Check out
							<c:set var="chkBtn" value="Check out" />
						</c:when>
					</c:choose>
					<br><font style="font-weight:normal">${last.lastcheck}</font>
					</font>
				</c:forEach>
				<button onclick="location.href = 'http://localhost:8080/check_in?userId=';" type="button" id="chkBtn" 
				class="btnfunc rounded-4" style="background-color: #5C9BD1"><c:out value = "${chkBtn}"/></button>
			</div>
		</div>
	</div>
	<div class="portlet light bordered rounded-10 area-func col-md-4" style="background-color: #F7D6A7;">
		<div class="portlet-body">
			<div>
				<img src="/images/Leave.png" style="width: 60%;position: relative;">
				<div style="position: absolute;top: 25px;right: 40px;text-align: right;font-size:16px">
					<div><font style="font-size:18px;font-weight:bold;">${leave_3}</font><br>${type_3}</div><br>
					<div><font style="font-size:18px;font-weight:bold;">${leave_1}/${quotaThisYear}</font><br>${type_1}</div><br>
					<div><font style="font-size:18px;font-weight:bold;">${leave_6}/${quotaLastYear}</font><br>${type_7}</div>
				</div>
				
				<button onclick="location.href = 'http://localhost:8080/LeaveAdd';"
					type="button" class="btnfunc rounded-4"
					style="background-color: #F0AD4E;">Add Leave</button>
			</div>
		</div>
	</div>
	<div class="portlet light bordered rounded-10 area-lfunc col-md-4" style="background-color: #93E0C0;">
		<div class="portlet-body">
			<div>
				<img src="/images/Borrow.png" style="width: 65%;display: block;margin-left: auto;margin-right: auto;">
				<c:forEach var="br" items="${borrow}" varStatus="status">
					<font color="white" style="font-weight:bold;font-size:16px;display:block;margin-left: 30px;margin-top:5px;">						
					Borrowing
					<br><font style="font-weight:normal">${br.amount} items</font>
					</font>
				</c:forEach>
				<button onclick="location.href = 'http://localhost:8080/myBorrow';" type="button" class="btnfunc rounded-4" style="background-color: #26C281;">Borrow</button>
			</div>
		</div>
	</div>
</body>

<!--
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
                                                 		<!--
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
											<!-- 
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
											<!--
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
	-->

<script>
	/*function edit() {
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
	};*/	
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
<script>
	$(document).ready(function() {
		// page is now ready, initialize the calendar...
	$('#calendar').fullCalendar();	
	});
</script>
<script type="text/javascript">
var myevent = [];
var AppCalendar = function() {

    return {
        //main function to initiate the module
        init: function() {
            this.initCalendar();
        },

        initCalendar: function() {

            if (!jQuery().fullCalendar) {
                return;
            }
            /*var date_time = '${flag12}';
            if(date_time != ""){           
            var noTime = $.fullCalendar.moment(date_time,"YYYY-MM-DD");
             }else{ var noTime = moment(); }*/       
            var start_date = [];
            var end_date = [];
            var name =[];
            var events1 =[];
            var des = [];
            var id =[];
            var mycolor =['red','grey','blue','yellow','green','purple'];
            var mytype=[1,2,3,4,5,6];
            <c:forEach var="holiday" items="${allholiday}">
            
            var text = '${holiday.start_date}';
            var text2 =  '${holiday.end_date}';
            var text3 = '${holiday.head}';
            
            <c:set var = "string1" value = "${holiday.description}"/>
            	<% pageContext.setAttribute("newline", "\r\n"); %>
            <c:set var = "string2" value = "${fn:replace(string1,newline,'')}" />
            
            var text4 = '${string2}';
            
            var text5 =  '${holiday.id_date}';
            var date1 = new Date(text);
            var date2 = new Date(text2);
            
            start_date.push(date1);
            end_date.push(date2);
            name.push(text3);
            des.push(text4);
            id.push(text5);
            </c:forEach>
            var x;
           
          
            for(x in start_date){
            events1.push(	{
				   id:id[x],
            	   title: name[x],
				   start: new Date(start_date[x].getFullYear(),start_date[x].getMonth(),start_date[x].getDate()),
				   end: new Date(end_date[x].getFullYear(),end_date[x].getMonth(),end_date[x].getDate() + 1 ),
				   description: des[x] ,
			   backgroundColor: App.getBrandColor('red'/*mycolor[x%6]*/),
			   className: mytype[x%6],
               allDay: true,
			   });            
            }
            myevent = events1;
     	    
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            
        
            var h = {};

            if (App.isRTL()) {
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                       right: 'title, prev, next',
                        center: '',
                        //left: 'agendaDay, agendaWeek, month, today,day'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        right: 'title',
                        center: '',
                        //left: 'agendaDay, agendaWeek, month, today, prev,next'
                    };
                }
            } else {
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        //right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        //right: 'prev,next,today,month,agendaWeek,agendaDay'
                    };
                }
            }
            
            

            var initDrag = function(el) {
            	
                // create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
                // it doesn't need to have a start or end
                var eventObject = {
                    title: $.trim(el.text()) // use the element's text as the event title
                };
                // store the Event Object in the DOM element so we can get to it later
                el.data('eventObject', eventObject);
                // make the event draggable using jQuery UI
                
                el.draggable({
                    zIndex: 999,
                    revert: true, // will cause the event to go back to its
                    revertDuration: 0 //  original position after the drag
                });
            };
            
            var addEvent = function(title) {
            
                title = title.length === 0 ? "Untitled Event" : title;
                var html = $('<div class="external-event label label-default">' + title + '</div>');
                
                jQuery('#event_box').append(html);
                initDrag(html); 
                
            };

            $('#external-events div.external-event').each(function() {
                initDrag($(this));
            });

            $('#event_add').unbind('click').click(function() {
                var title = $('#event_title').val();
                addEvent(title);
            });

            //predefined events
            $('#event_box').html("");
            addEvent("My Event 1");
            addEvent("My Event 2");
            
            
 
            $('#calendar').fullCalendar('destroy'); // destroy the calendar
            $('#calendar').fullCalendar({ //re-initialize the calendar
            	header: h,
                defaultView: 'month', // change default view with available options from http://arshaw.com/fullcalendar/docs/views/Available_Views/ 
                //defaultDate: moment(noTime),
                slotMinutes: 15,
                editable: true,
                droppable: true, // this allows things to be dropped onto the calendar !!!
             
                drop: function(date, allDay) { // this function is called when something is dropped
                	

                    // retrieve the dropped element's stored Event Object
                    var originalEventObject = $(this).data('eventObject');
                    // we need to copy it, so that multiple events don't have a reference to the same object
                    var copiedEventObject = $.extend({}, originalEventObject);

                    // assign it the date that was reported
                    copiedEventObject.start = date;
                    copiedEventObject.allDay = allDay;
                    copiedEventObject.className = $(this).attr("data-class");

                    // render the event on the calendar
                    // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
                    $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

                    // is the "remove after drop" checkbox checked?
                    if ($('#drop-remove').is(':checked')) {
                        // if so, remove the element from the "Draggable Events" list
                        $(this).remove();
                    }
                },
                
             	selectable: true,
    			selectHelper: true,
                eventRender: function(calEvent, element){
                	//Set Background
                   	  var type_color = "";
                	  var start = moment(calEvent.start).get('date');
                      var end = moment(calEvent.end).get('date');                     
                   	 switch(calEvent.className) {
                	 case 1: type_color = 'red';  break;
                	 case 2:  type_color ='grey'; break;
                	 case 3: type_color ='blue'; break;
                	 case 4: type_color ='yellow'; break;
                	 case 5: type_color ='green'; break;
                	 case 6: type_color ='purple'; break;
                    
                	 }
                      var for_i = end-start;                      
                      for(var i  = 0 ; i < for_i ; i++ ){
                  	var dataToFind = moment(calEvent.start).format('YYYY-MM-DD');
                   var date_new = new Date(dataToFind);
                    date_new.setDate(start+i);
                   dataToFind = moment(date_new).format('YYYY-MM-DD');
                      $("td[data-date='"+dataToFind+"']").addClass(type_color);	
                      }	
                	var moment1 = moment(calEvent.start);
                	var moment2 = moment(calEvent.end);             	
                    element.popover({
                        animation:true,
                        placement: 'bottom',
                        container:"body",
                        html:true,
                        delay: 100,
                        title: '<b>'+calEvent.title +'</b>',
                        content:   '<b>' +$.fullCalendar.formatRange(moment1, moment2 -1 , 'D MMMM YYYY') + "</b><br/>"
                        + "<p style=\"max-width:500px;word-wrap:break-word;margin-bottom:50px;\"> &nbsp; "+ calEvent.description + " <br/>"
                        
                       + "</p>",                 
                        trigger: 'hover'
                    });
                  },
                 
                editable: false,
                eventLimit: true,
                events: events1,
             });
        }
    };
}();

jQuery(document).ready(function() {    
   AppCalendar.init();

   
   var count_month = '${num_month}';
   var count_year = '${num_year}';
   
   var month = parseInt(count_month);
   var count_next = month-1;
   var count_prev = month+1;
  
   var a = parseInt(count_year);
   var b = parseInt(count_month);
   //console.log(month);
   
   var events2 = [];
   $('.fc-next-button').click(function(){
	   b ++;
	   month++;
	   count_next++;
	   count_prev++;
	 	$('div[name="'+count_next+"-"+a+'"]').hide();
	   if(b > 11  ){	  
	   alert('next year :'+ (a+1) );  
	   //alert(myevent);
       	b = 0 ;
       	a = a + 1 ;
       	month = 0;
       	count_next = month-1;
       	count_prev = month+1;
	   }
	   $('div[name="'+month+"-"+a+'"]').show();
	});
   $('.fc-prev-button').click(function(){
	 	b--;
	 	month--;
	 	count_next--;
	 	count_prev--;
	 	$('div[name="'+count_prev+"-"+a+'"]').hide();
	 	if(b < 0 ) {	  
		    alert('next year :'+ (a-1) );
	       	b = 11;
	       	a = a - 1  ;
	       	month = 11;
	       	count_next = month-1;
	       	count_prev = month+1;
		}
	 	$('div[name="'+month+"-"+a+'"]').show();
	});
   $('.fc-today-button').click(function(){
	   $('div[name="'+b+"-"+a+'"]').hide();
	   a = parseInt(count_year);
	   b = parseInt(count_month);
	   month = parseInt(count_month);
	   count_next = month-1;
       count_prev = month+1;
       
       $('div[name="'+month+"-"+a+'"]').show();
       
   });

});
</script>
<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
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