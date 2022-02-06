<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css" rel="stylesheet" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> -->
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!-- <link rel="stylesheet" href="js/jquery.datetimepicker.css"> -->
<link href="../assets/global/plugins/bootstrap-toastr/toastr.min.css" rel="stylesheet" type="text/css">
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="../assets/global/plugins/bootstrap-toastr/toastr.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-toastr.min.js" type="text/javascript"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
	AOS.init();
</script>

<style>

/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	min-height: 300px;
}
/* Optional: Makes the sample page fill the window. */
html, body {
	min-height: 100%;
	margin: 0;
	padding: 0;
}

body {
	font-size: 17px;
}

.birthday-card {
	margin: 40px auto;
	padding: 16px;
	max-width: 400px;
	background-color: white;
	text-align: center;
	box-shadow: 0 24px 40px -8px #311B92;
}

.birthday-card img {
	width: 100%;
}

#ourtime {
	border: none;
}

.btn default {
	border: none;
	background-color: #ffffff;
}

#ourtime_label {
	color: #5C9BD1;
	font-weight: bold;
	font-size: 47px;
	border: none;
/*  	text-align: center;  */
	height: fit-content;
	width: 200px;
/*   	margin-left: 180px;  */ 
/*  	display:flex;
	justify-content:center; */
}

#mydate{
	color: #5C9BD1;
	font-weight: bold;
	font-size: 20px;
	border: none;
	text-align: center;
	width: fit-content;
	width:160px;
/*  	margin-left:130px;  */
/* 	display:flex;
	justify-content:center; */
}

.source-link {
	text-align: center;
	color: #311B92;
	text-decoration: underline;
}

.source-link a {
	color: #311B92;
	text-decoration: none;
}


.firework {
	position: absolute;
}
.explosion {
	position: absolute;
	left: -2px;
	bottom: 0;
	width: 4px;
	height: 80px;
	transform-origin: 50% 100%;
	/* background-color: rgba(0,0,0,.2); */
	overflow: hidden;
}
.explosion:nth-child(1) {
	transform: rotate(0deg) translateY(-15px);
}
.explosion:nth-child(2) {
	transform: rotate(30deg) translateY(-15px);
}
.explosion:nth-child(3) {
	transform: rotate(60deg) translateY(-15px);
}
.explosion:nth-child(4) {
	transform: rotate(90deg) translateY(-15px);
}
.explosion:nth-child(5) {
	transform: rotate(120deg) translateY(-15px);
}
.explosion:nth-child(6) {
	transform: rotate(150deg) translateY(-15px);
}
.explosion:nth-child(7) {
	transform: rotate(180deg) translateY(-15px);
}
.explosion:nth-child(8) {
	transform: rotate(210deg) translateY(-15px);
}
.explosion:nth-child(9) {
	transform: rotate(240deg) translateY(-15px);
}
.explosion:nth-child(10) {
	transform: rotate(270deg) translateY(-15px);
}
.explosion:nth-child(11) {
	transform: rotate(300deg) translateY(-15px);
}
.explosion:nth-child(12) {
	transform: rotate(330deg) translateY(-15px);
}

.explosion::before {
	content: '';
	position: absolute;
	left: 0;
	right: 0;
	top: 100%;
	height: 40px;
	background-color: #f5cf52;
}
@keyframes explosion {
	0% {
		top: 100%;
	}
	33%, 100% {
		top: -50%;
	}
}

#firework1 {
	left: 50%;
	top: 50%;
	transform: scale(1);
}
#firework1 .explosion::before {
	animation: explosion 2s ease-in-out infinite;
}

#firework2 {
	left: 40%;
	top: 45%;
	transform: scale(.7);
}
#firework2 .explosion::before {
	animation: explosion 2s .6s ease-in-out infinite;
}

#firework3 {
	left: 60%;
	top: 65%;
	transform: scale(.4);
}
#firework3 .explosion::before {
	animation: explosion 2s .4s ease-in-out infinite;
}

.youtube-link {
	position: fixed;
	left: 20px;
	bottom: 20px;
	color: #fff;
	text-decoration: none;
	font-size: 12px;
}
</style>
<%-- ${beforeType} --%>
<%-- ${time} --%>
<%-- ${fulldate} --%>
<%-- ${datecheckin} --%>
<%-- ${timecheckin} --%>
<%-- ${beforeType} --%>
<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase"><i
				class="fa fa-clock-o"></i> Check-In Check-OUT</span>
			<!-- <p id="asd">asddd</p> -->
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="row">
		<div class="col-lg-12 col-xs-12 col-sm-12">

				<div class="row">
					<div class="portlet-body" style="margin-bottom: 25%;">
						<div class="col-lg-6">

							<div class="alert alert-warning " data-aos="flip-up"
								id="messagebox">
								<div class="row">
									<div class="col-md-2">
										<strong> Alert : </strong>
									</div>
									<div class="col-md-10" id="messagealert"></div>
								</div>
							</div>
							<script>
								$(document)
										.ready(
												function() {
													var leave = ${leavecheck};
													var holiday = ${holidaycheck};
													var weekend = ${weekcheck};
													var noin = ${nocheckin};
													var noout = ${nocheckout};
													if ((leave == false)
															&& (holiday == false)
															&& (weekend == false)) {
														if ((noin == true)
																&& (noout == false)) {
															$("#messagealert")
																	.text(
																			"	ข้อมูล Check-in");
														}
														if (noin == false
																&& noout == true) {
															$("#messagealert")
																	.text(
																			"ไม่มีข้อมูล Check-out");
														}
														if (noin == true
																&& noout == true) {
															$("#messagebox")
																	.hide();
														}
														if (noin == false
																&& noout == false) {
															$("#messagealert")
																	.text(
																			"ไม่มีข้อมูล Check-in และ Check-out");
														}
													} else {
														$("#messagebox").hide();
													}

												});
							</script>

							<form action="save-check" class="form-horizontal" method="POST">
								<div class="form-group form-lg-line-input" style="text-align:center;">
									<div class="col-md-12" style="text-align:center;">
										<div class="input-group" style="display:flex;justify-content:center;">
											<input class="form-control timepicker timepicker-24 test" id="ourtime_label" name="work_hours_time_work" 
													value="${time}" onclick="timechange()" onkeypress='return false' style="text-align:center;">
											<span class="input-group-btn" style="text-align:center;">
												<button class="btn btn-default " type="button" id="ourtime" style="margin-left: -40px;color:#67809F;"
														data-time-format="HH:mm" onclick="timechange()" >
												<i class="fa fa-clock-o"></i></button>
											</span>
										</div>
									</div>
								</div> <!-- TIME -->
								
								<div class="form-group form-lg-line-input" style="text-align:center;">
									<div class="col-md-12" style="text-align:center;">
										<div class="input-group date date-picker test" data-date-format="dd-mm-yyyy" style="display:flex;justify-content:center;">
											<input class="form-control" id="mydate" name="work_hours_date_work" value="${fulldate}"
												onchange="datechange()" onkeypress='return false' >
											<button class="btn default test" type="button" 
													style="background-color:white;border:none;margin-left:-11px;">
											<i class="fa fa-calendar" style="color:#67809F;"></i></button>
										</div>
									</div>
								</div>	<!-- DATE -->

								<div style="text-align:center;">
									<font color="gray"><c:forEach var="lastcheckin"
											items="${lastcheckin}" varStatus="status">
										<div>
											<sub>( Last Check-In : </sub> <sub id="demo"></sub> <sub>)</sub>
										</div>
									</c:forEach></font>
									<script>
										var str = '${lastcheckin}';
										var str1 = /\d{4}-\d{2}-\d{2}/g;
										var str2 = /\d{2}:\d{2}/g;
										var date1 = /\d{2}/g
										var result = str.match(date1);
										var result1 = str.match(str1);
										var result2 = str.match(str2);
										var today = new Date();
										var check = result[3] + '/'
													+ result[2] + '/'
													+ +result[0]
													+ result[1] + ' '
													+ result2;
										if (today.getFullYear() == (result[0] + result[1])
												&& (today.getMonth() + 1) == result[2]
												&& today.getDate() == result[3]) {
											check = 'TO DAY ' + result2;
										}
										document.getElementById("demo").innerHTML = check;
									</script>
								</div> <!-- LAST CHECK-IN -->
								<div class="form-group form-lg-line-input" style="text-align:center;margin-top:20px;">
									<div class="col-md-12">
										<div class="md-radio-inline">
											<div class="md-radio">
											<input type="radio" id="checkbox1_1" name="work_hours_type"
													value="1" class="md-radiobtn"
													onclick="show_text(this.value);"><label
													for="checkbox1_1" style="color: #32c5d2;"> <span></span>
													<span class="check"></span> <span class="box"></span>
													Check-IN
											</label>
											</div>
											<div class="md-radio">
											<input type="radio" id="checkbox1_2" name="work_hours_type"
													value="2" class="md-radiobtn"
													onclick="show_text(this.value);"><label
													for="checkbox1_2" style="color: red-intense;"> <span></span>
													<span class="check" style="background: #ff2524;"></span> <span
													class="box"></span> Check-OUT
											</label>
											</div>
										</div>
									</div>
								</div>	<!-- CHECK-IN & CHECK-OUT -->
								


								<div class="form-group form-lg-line-input"
									style="margin-left: -5%;">
									<label class="col-md-3 control-label" for="form_control_1"
										id="labeldetail">Detail :</label>
									<div class="col-md-9">
										<textarea class="form-control " name="description"
											maxlength="500" rows="3" placeholder="กรุณาระบุเหตุผล"
											id="detail"></textarea>
										<div class="form-control-focus"></div>

									</div>
								</div>

								<div class="form-group form-md-line-input text-center">

									<button class="btn btn-primary blue-soft"
										style="font-size: 24px" type="submit" id="checktime"
										name="savebtn" ><!-- onclick="checkINcheck" -->
										<i class="fa fa-save"></i> Accept
									</button>

									<button type="reset" class="btn btn-primary red-intense"
										style="font-size: 24px" onclick="back()">
										<i class="fa fa-close"></i> Cancel
									</button>

								</div>
						</div>
						<!--  startgooglemap-->
						<div class="col-lg-6">
							<div id="map">

								<script>
									// Note: This example requires that you consent to location sharing when
									// prompted by your browser. If you see the error "The Geolocation service
									// failed.", it means you probably did not give permission for the browser to
									// locate you.

									var map, infoWindow, marker;
									function initMap() {
										map = new google.maps.Map(document
												.getElementById('map'), {
											center : {
												lat : -34.397,
												lng : 150.644
											},
											zoom : 16
										});
										var latEl = document
												.querySelector('.latitude');
										var longEl = document
												.querySelector('.longitude');
										infoWindow = new google.maps.InfoWindow;
										marker = new google.maps.Marker;
										// Try HTML5 geolocation.
										if (navigator.geolocation) {
											navigator.geolocation
													.getCurrentPosition(
															function(position) {
																var pos = {
																	lat : position.coords.latitude,
																	lng : position.coords.longitude
																};
																x = pos.lat;
																y = pos.lng;

																		marker
																				.setPosition(pos),
																		marker
																				.setMap(map),
																		marker
																				.setDraggable(true);

																infoWindow
																		.setContent('Current Position');
																infoWindow
																		.open(
																				map,
																				marker);
																map
																		.setCenter(pos);
																adddata();
																google.maps.event
																		.addListener(
																				marker,
																				"dragend",
																				function(
																						event) {
																					var lati, lngti, address;
																					console
																							.log('i am dragged');
																					lati = marker
																							.getPosition()
																							.lat();
																					lngti = marker
																							.getPosition()
																							.lng();
																					var geocoder = new google.maps.Geocoder();
																					geocoder
																							.geocode(
																									{
																										latLng : marker
																												.getPosition()
																									},
																									function(
																											result,
																											status) {
																										if ('OK' === status) { // This line can also be written like if ( status == google.maps.GeocoderStatus.OK ) {
																											address = result[0].formatted_address;
																											resultArray = result[0].address_components;

																											// Get the city and set the city input value to the one selected
																											/*for( var i = 0; i < resultArray.length; i++ ) {
																												if ( resultArray[ i ].types[0]  ) {
																													citi = resultArray[ i ].long_name;
																													console.log( citi );
																													city.value = citi;
																												}
																											}*/

																											latEl.value = lati;
																											longEl.value = lngti;

																										} else {
																											console
																													.log('Geocode was not successful for the following reason: '
																															+ status);
																										}
																										if (infoWindow) {
																											infoWindow
																													.close();
																										}

																										/**
																										 * Creates the info Window at the top of the marker
																										 */
																										infoWindow = new google.maps.InfoWindow(
																												{
																													content : address
																												});

																										infoWindow
																												.open(
																														map,
																														marker);
																									});
																				});
															},
															function() {
																handleLocationError(
																		true,
																		infoWindow,
																		map
																				.getCenter());
															});
										} else {
											// Browser doesn't support Geolocation
											handleLocationError(false,
													infoWindow, map.getCenter());
										}

									}
									function adddata() {
										$(document)
												.ready(
														function() {
															document
																	.getElementById("x").value = x;
															//console.log(x); 

														});

										$(document)
												.ready(
														function() {
															document
																	.getElementById("y").value = y;
															//console.log(y); 

														});
									}
									function handleLocationError(
											browserHasGeolocation, infoWindow,
											pos) {
										infoWindow.setPosition(pos);
										infoWindow
												.setContent(browserHasGeolocation ? 'Error: The Geolocation service failed.'
														: 'Error: Your browser doesn\'t support geolocation.');
										infoWindow.open(map);
									}
								</script>
								<script async defer
									src="https://maps.googleapis.com/maps/api/js?key=${GOOGLE_API_KEY}&callback=initMap">
									
								</script>
							</div>
							<input type="hidden" id="x" class="latitude" name="latitude">
							<input type="hidden" id="y" class="longitude" name="longitude">
							<!--  stopgooglemap-->
						</div>
					</div>



					</form>
				</div>


		</div>

	</div>
</div>
<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<span class="caption-subject font-red sbold uppercase">
				<i class="fa fa-clock-o"></i> Check List
			</span>
		</div>
	</div>
	<div class="row">
		<div class="portlet-body">
			<form action="searchmonth-list" method="post" id="searchmonth_form">
				<div class="col-md-3" style="float:right;margin-bottom:19px;display:flex;justify-content:center;">
				<div class="input-group input-medium">
					<input class="form-control" id="searchmonth" name="searchmonth" 
						style="text-align:center;">
					<span class="input-group-btn">
						<button class="btn default" type="button" id="searchmonth_btn">
							<i class="fa fa-calendar-o"></i></button>
						<!-- <button type="submit" class="btn btn-sm blue-steel " id="search" onclick="search()" style="margin-left:5px;">
							<i class="fa fa-search"></i>&nbsp;Search
						</button> --> 
					</span>
				</div>
				</div>
			</form>

			<div class="portlet-body flip-scroll">
				<table class="table table-striped table-condensed table-hover order-column compact" >
					<thead>
						<tr style="background-color:#E9EDEF;color:#67809F">
							<th height="41">Date</th>
							<th height="41">Check-in</th>
							<th height="41">Check-out</th>
							<th height="41">Actual</th>
							<th height="41">Status</th>
							<!-- <th height="41">Test</th> -->
						</tr>
					</thead>
					<tbody>
						<c:forEach var="lts" items="${listtimes}" varStatus="Status">
							<tr>
								<c:set var="workinghours" value="${lts.workinghours}"/>
								<c:set var="text1" value="${workinghours/60}"/>
								<c:set var="hour" value="${fn:substringBefore(text1, '.')}"/>
								<c:set var="min" value="${workinghours%60}"/>
								
								<c:set var="text2" value="${lts.time_check_in.toString().substring(11, 16)}"/>
								<c:set var="hour_checkin" value="${fn:substringBefore(text2, ':')}"/>
								<fmt:parseNumber var="h_checkin" integerOnly = "true" type = "number" value="${hour_checkin}"/>
								<c:set var="min_checkin" value="${fn:substringAfter(text2, ':')}"/>
								<fmt:parseNumber var="m_checkin" integerOnly = "true" type = "number" value="${min_checkin}"/>
								<c:set var="hour_checkout" value="${fn:substringBefore(lts.time_check_out, ':')}"/>
								
								<td id="check_date" style="vertical-align: middle;"><fmt:formatDate value="${lts.time_check_in}" pattern="EE, dd MMM yyyy" /></td>
								<!-- END DATE -->
								
								<td id="check_timein">
									<c:set var="text3" value="${stime.toString().substring(0, 4)}"/>
									<c:set var="stime_h" value="${fn:substringBefore(text3, ':')}"/>
									<c:set var="stime_m" value="${fn:substringAfter(text3, ':')}"/>
									<c:set var="lts_datein" value="${lts.time_check_in.toString().substring(0, 10)}"/>
									<c:set var="lts_dateout" value="${lts.time_check_out.toString().substring(0, 10)}"/>
									
									<c:choose>
									<c:when test="${stime == null}">
										<fmt:formatDate value="${lts.time_check_in}" pattern="HH:mm"/>
									</c:when>
									<c:when test="${stime != null}">
										<c:choose>
											<c:when test="${h_checkin < stime_h}">
												<span>${lts.time_check_in.toString().substring(11, 16)}</span>
											</c:when>
											<c:when test="${h_checkin > stime_h}">
												<span class="text-danger">${lts.time_check_in.toString().substring(11, 16)}</span>
											</c:when>
											<c:when test="${h_checkin == stime_h}">
												<c:if test="${m_checkin == stime_m}">${lts.time_check_in.toString().substring(11, 16)}</c:if>
												<c:if test="${m_checkin > stime_m}"><span class="text-danger">${lts.time_check_in.toString().substring(11, 16)}</span></c:if>
											</c:when>
										</c:choose>
									</c:when>
									</c:choose>
 									<c:forEach var="des" items="${descheckin}" varStatus="Status">
 										<c:if test="${des.description.length() > 0}">
										<c:choose>
											<c:when test="${lts_datein == des.work_hours_time_work.toString().substring(0, 10) && des.work_hours_type.toString() == '1'}">
												<div class="text-muted"><i class="fa fa-commenting-o"></i><small> ${des.description}</small></div>
											</c:when>
										</c:choose>
										</c:if>
									</c:forEach> 
								</td>
								<!-- END CHECK-IN -->
								<td id="check_timeout"><fmt:formatDate value="${lts.time_check_out}" pattern="HH:mm"/>
									<c:forEach var="des" items="${descheckin}" varStatus="Status">
										<c:if test="${des.description.length() > 0}">
										<c:choose>
											<c:when test="${lts_dateout == des.work_hours_time_work.toString().substring(0, 10) && des.work_hours_type.toString() == '2'}">
												<div class="text-muted"><i class="fa fa-commenting-o"></i><small> ${des.description}</small></div>
											</c:when>
										</c:choose>
										</c:if>
									</c:forEach>									
								</td>
								
								<!-- END CHECK-OUT -->
								<td id="actual" style="vertical-align: middle;">
								<c:choose>
									<c:when test="${(hour == '0' || hour == '00') && (min == '0' || min == '00')}">N\A</c:when>
									<c:when test="${hour < '9' && min > '0'}">
										<c:if test="${hour == '0'}">
											<c:if test="${fn:length(min.toString()) == 1}"><span class="text-danger">${hour}:${min}0 h</span></c:if>
											<c:if test="${fn:length(min.toString()) > 1}"><span class="text-danger">${hour}:${min} h</span></c:if>
										</c:if>
										<c:if test="${hour != '0'}">
											<c:if test="${hour >= '4'}">
												<c:if test="${fn:length(min.toString()) == 1}">${hour-1}:${min}0 h</c:if>
												<c:if test="${fn:length(min.toString()) > 1}">${hour-1}:${min} h</c:if>
											</c:if>
											<c:if test="${hour < '4'}">
												<c:if test="${fn:length(min.toString()) == 1}">${hour}:${min}0 h</c:if>
												<c:if test="${fn:length(min.toString()) > 1}">${hour}:${min} h</c:if>
											</c:if>
										</c:if>
									</c:when>
									<c:when test="${hour >= '9' && min <= '59'}">
										<c:if test="${fn:length(min.toString()) == 1}">${hour-1}:${min}0 h</c:if>
										<c:if test="${fn:length(min.toString()) > 1}">${hour-1}:${min} h</c:if>
									</c:when>
								</c:choose>
								</td>
								<!-- END ACTUAL -->
								<td id="status" style="vertical-align: middle;">
									<c:forEach var="des" items="${descheckin}" varStatus="Status">
									</c:forEach>
									<c:choose>
									<c:when test="${stime == null}">N\A</c:when>
									<c:when test="${stime != null}">
										<c:choose>
										<c:when test="${h_checkin < stime.toString().substring(0, 1)}">
											<c:if test="${hour >= 9 && min >= 0}"><span class="text-success sbold">On Time</span>
												<c:if test="${des.description != null}">
													<span class="text-warning sbold">Wait For</span></c:if>
											</c:if> 
											<c:if test="${hour < 9 && min <= 59}"><span class="text-danger sbold">Unfinished Work</span></c:if>
										</c:when>
										<c:when test="${h_checkin == stime.toString().substring(0, 1)}">
											<c:choose>
											<c:when test="${m_checkin <= stime.toString().substring(2, 4)}">
												<c:if test="${hour >= 9 && min >= 0}"><span class="text-success sbold">On Time</span></c:if>
											</c:when>
											<c:otherwise>
												<c:if test="${hour >= 9 && min >= 0}"><span class="text-danger sbold">Late</span></c:if>
												<c:if test="${(hour < 9 && min <= 59) && workinghours != null}"><span class="text-danger sbold">Unfinished Work</span></c:if>
											</c:otherwise>
											</c:choose>
										</c:when>
										<c:when test="${h_checkin > stime.toString().substring(0, 1)}">
											<c:choose>
											<c:when test="${hour >= 9 && min >= 0}">	
												<span class="text-danger sbold">Late</span>
											</c:when>
											<c:when test="${(hour < 9 && min <= 59) && workinghours != null}">
												<span class="text-danger sbold">Unfinished Work</span>
											</c:when>
											</c:choose>
										</c:when>
										</c:choose>
									</c:when>
									</c:choose>
									
								</td>
								<!-- END STATUS -->
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<%-- <div class="portlet light bordered">
	<div class="test ">
		<jsp:include page="/pages-back/check/check_list.jsp" flush="true"></jsp:include>
	</div>
</div> --%>
<c:forEach var="hbd" items="${hbd}" varStatus="Count">
<c:set var = "idhbd" value = "${fn:toLowerCase(hbd.id)}" />
<c:set var = "iduser" value = "${fn:toLowerCase(useron)}" />
<c:set var = "iduser2" value = "${fn:substring(idhbd, 5, 15)}" />
<c:set var = "iduser2" value = "${fn:substring(iduser, 5, 15)}" />
	 <c:choose>
		<c:when test="${idhbd==iduser}"> 
			<div id="myModal" class="modal fade">
				<div class="birthday-card">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<img
						src="https://image.freepik.com/free-vector/surprise-theme-happy-birthday-card-illustration_1344-199.jpg"
						alt="Birthday image">
					<h1>Happy Birthday</h1>
					<h3>${hbd.name}</h3>
					<h3>
						<fmt:formatDate value="${hbd.birth_date}" pattern="dd MMMM" />
					</h3>
<div class="firework" id="firework1">
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
</div>
<div class="firework" id="firework2">
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
</div>
<div class="firework" id="firework3">
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
	<div class="explosion"></div>
</div>
				</div>
			</div>
	 	</c:when>
	</c:choose> 
</c:forEach>
<script>

$(document).ready(function() {

	$("#myModal").modal('show');

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
		$("#searchmonth_form").submit();

	});
});

/* function search() {
	var selectmonth = $("#searchmonth").val();
	sessionStorage.setItem("selectmonth", selectmonth);
} */

</script>
<style>
.mt-widget-3 {
	border: 0px;
}
</style>

<script>
	function nextStep() {
		document.location = "check_list?userId=${onlineUser.id}";
	}
	function timechange() {
		
		var mytime = $("#ourtime").val();//เวลาที่เลือก
		var timeNow = "${time}".trim();//เวลาปัจจุบัน
		var timeNowlength = "${time}".trim().length;//ความยาวเวลาปัจจุบัน
		var mytimelength = $("#ourtime").val().length;//ความยาวเวลาที่เลือก
		var hourtimeNow = null; //ชั่วโมงปัจจุบัน
		var mintimeNow = null; //นาทีปัจจุบัน
		var hourmytime = null; //ชั่วโมงที่เลือก
		var minmytime = null; //นาทีที่เลือก
		var fullmytime = null; //คำนวณชั่วโมงที่เลือก
		var fulltimenow = null; //คำนวณชั่วโมงปัจจุบัน
		
		document.getElementById("ourtime_label").innerHTML = mytime;
		
		if (mytimelength == '4') { //เวลาที่เลือกก่อนเที่ยง = 4 
			hourmytime = mytime.substring(0, 1);
			minmytime = mytime.substring(2, 4);
		} else if (mytimelength == '5') {//เวลาที่เลือกหลังเที่ยง = 5
			hourmytime = mytime.substring(0, 2);
			minmytime = mytime.substring(3, 5);
		}
		if (timeNowlength == '4') { // เวลาปัจจุบันก่อนเที่ยง =4
			hourtimeNow = timeNow.substring(0, 1);
			mintimeNow = timeNow.substring(2, 4);
		} else if (timeNowlength == '5') { //เวลาปัจจุบันหลังเที่ยง  =5
			hourtimeNow = timeNow.substring(0, 2);
			mintimeNow = timeNow.substring(3, 5);
		}
		fullmytime = ((hourmytime * 60) + minmytime);
		fulltimenow = ((hourtimeNow * 60) + mintimeNow);
		if (fullmytime != fulltimenow) { // ถ้าเวลาที่เลือกไม่เท่ากับเวลาปัจจุบันให้ Show detail
			$("#detail").show();
			$("#labeldetail").show();
		} else {
			$("#detail").hide();
			$("#labeldetail").hide();
		}
	}
	function datechange() {
		var fulldate = "${fulldate}".trim();//วันที่ปัจจุบัน
		var Userdate = $("#mydate").val();//วันที่เลือก
		if (fulldate != Userdate) {
			$("#detail").show();
			$("#labeldetail").show();
		} else {
			$("#detail").hide();
			$("#labeldetail").hide();
		}
	}

	function pageload() {
		var day = new Date();
		var mytime = day.getHours();
		if (mytime < 12) {
			checkbox1_1.checked = true;
			$("#detail").hide();
			$("#labeldetail").hide();

		} else {
			checkbox1_2.checked = true;
			$("#detail").hide();
			$("#labeldetail").hide();
		}
	}

	window.onload = pageload;
	$("#checktime")
			.click(
					function() {
					
					
						var timecheckin = "${timecheckin}".trim();//เวลาเช็คอินล่าสุด
						var timecheckinlength = "${timecheckin}".trim().length;//ความยาวเวลาเช็คอินล่าสุด
						var datecheckin = "${datecheckin}".trim();//วันที่เช็คอินล่าสุด
						var fulldate = "${fulldate}".trim();//วันที่ปัจจุบัน
						var timeNow = "${time}".trim();//เวลาปัจจุบัน
						var timeNowlength = "${time}".trim().length;//ความยาวเวลาปัจจุบัน
						var mytime = $("#ourtime_label").val();//เวลาที่เลือก
						var mytimelength = $("#ourtime_label").val().length;//ความยาวเวลาที่เลือก
						var Userdate = $("#mydate").val();//วันที่เลือก
						var timelength = $("#ourtime_label").val().length;//เช็ค length เวลา
						var mydetail = $("#detail").val().length;
						;//เช็ต ค่าใน detail 
						
						var checkourtime = $("#ourtime").val();//เช็ต ค่าใน detail 
						
						var radio1 = $('input[id=checkbox1_1]:checked').val();
						var radio2 = $('input[id=checkbox1_2]:checked').val();
						//////////////////////// คำนวนเวลา ///////////////////
						var test = null;
						var hourtimeNow = null; //ชั่วโมงปัจจุบัน
						var mintimeNow = null; //นาทีปัจจุบัน
						var hourmytime = null; //ชั่วโมงที่เลือก
						var minmytime = null; //นาทีที่เลือก
						var hourfull = null; //ชั่วโมงที่เลือก-ชั่วโมงปัจจุบัน
						var minfull = null; //นาทีที่เลือก-นาทีปัจจุบัน
						var fulltimecheck = null; //ชั่วโมง + นาที
						var fullchecktimenow = null;
						if (mytimelength == 4) { //เวลาที่เลือกก่อนเที่ยง = 4 
							hourmytime = mytime.substring(0, 1);
							minmytime = mytime.substring(2, 4);
						} else if (mytimelength == 5) {//เวลาที่เลือกหลังเที่ยง = 5
							hourmytime = mytime.substring(0, 2);
							minmytime = mytime.substring(3, 5);
						}
						if (timeNowlength == 4) { // เวลาปัจจุบันก่อนเที่ยง =4
							hourtimeNow = timeNow.substring(0, 1);
							mintimeNow = timeNow.substring(2, 4);
						} else if (timeNowlength == 5) { //เวลาปัจจุบันหลังเที่ยง  =5
							hourtimeNow = timeNow.substring(0, 2);
							mintimeNow = timeNow.substring(3, 5);
						}
						hourfull = ((hourmytime - hourtimeNow) * 60); //ลบชั่วโมง * 60  
						minfull = (minmytime - mintimeNow); // ลบนาที
						fulltimecheck = (hourfull + minfull); // ชั่วโมง+นาที  (คำนวณเวลาที่เลือกกับเวลาปัจจุบัน)
						fullchecktimenow = ((hourmytime * 60) + minmytime); //คำนวณเวลาที่เลือก

						////////////// คำนวณเวลาปัจจุบันกับเวลาcheck-in ล่าสุด////////////
						var hourtimelast = null;
						var mintimelast = null;
						var calcheckin = null; // คำนวณเวลาแcheck-in ล่าสุด
						var calcheckout = null; // คำนวณเวลา check-out 
						if (timecheckinlength == 4) { // เวลา Check-in ล่าสุด =4
							hourtimelast = timecheckin.substring(0, 1);
							mintimelast = timecheckin.substring(2, 4);
						} else if (timecheckinlength == 5) { //เวลา check-inล่าสุด  = 5
							hourtimelast = timecheckin.substring(0, 2);
							mintimelast = timecheckin.substring(3, 5);
						}
						calcheckin = ((hourtimelast * 60) + mintimelast); // คำนวณเวลา check-in ล่าสุด
						calcheckout = ((hourtimeNow * 60) + mintimeNow); // คำนวณเวลาปัจจุบัน

						//////////////////////// คำนวน วันที่ ///////////////////
						var checkfulldate = null; // คำนวณวันที่เลือกกับวันที่ปัจจุบัน
						var checkindatelast = null; // คำนวณวันที่ปัจจุบันกับวันที่Check-in
						var d = new Date();
						var thisDateNow = d.getDate()
								+ ((d.getMonth() + 1) * 30)
								+ (d.getFullYear() * 360);
						var res = Userdate.split("-");
						var selectedDate = parseInt(res[0])
								+ parseInt(res[1] * 30)
								+ parseInt(res[2] * 360);
						var res1 = datecheckin.split("-");
						var Datecheckinlast = parseInt(res1[0])
								+ parseInt(res1[1] * 30)
								+ parseInt(res1[2] * 360);
						checkfulldate = (thisDateNow - selectedDate); //ไว้เช็คเวลาcheck-outห้ามเกิน 24 ชั่วโมง
						checkindatelast = (Datecheckinlast - thisDateNow); //คำนวณวันที่ปัจจุบันกับวันที่Check-in

						/////////////////////////////////////////// เช็คเวลา Check-in //////////////////////////////////

						if (radio1 > 0) {

						
							if (fulltimecheck > 0 || Userdate > fulldate) { // เวลาที่เลือก > เวลาปัจจุบัน หรือ วันที่เลือก > วันปัจจุบัน 
								swal("Here's a message!",
										"Can't Check-In In Future.") // (กรณี check-in ล่วงหน้า)
								document.getElementById("checktime").type = "button";

							} else if (Userdate < fulldate) { //วันที่ที่เลือกน้อยกว่าวันที่ปัจจุบัน 
								swal("Here's a message!",
										"Can't Check-In In Last.") // (กรณี check-in ย้อนหลัง)
								document.getElementById("checktime").type = "button";
							} else if (calcheckout != fullchecktimenow
									&& mydetail < 10) { ///////////////////////////// check-in Detail///////////
//								swal("Here's a message!",
//										"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") // (กรณี check-in ย้อนหลังใส่เหตุผล)
//								document.getElementById("checktime").type = "button";
								document.getElementById("checktime").type = "submit";
								toast_checkin();
							} else {
								document.getElementById("checktime").type = "submit";
								toast_checkin();
							}
						}

						///////////////////////////////////////// เช็คเวลา check-out ////////////////////////////////////
						if (radio2 > 0) {
							if (checkfulldate == 0) {// วันปัจจุบัน 
								if (fulltimecheck > 0) {
									swal("Here's a message!",
											"Can't Check-out In Future.") // (กรณี check-out ล่วงหน้า) เช็คจากเวลาที่เลือกกับเวลาปัจจุบัน
									document.getElementById("checktime").type = "button";

								} else if ((calcheckout != fullchecktimenow && mydetail < 10)) {
									swal("Here's a message!",
											"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") //check-out ย้อนหลัง 
									document.getElementById("checktime").type = "button";
									$("#detail").show();
									$("#labeldetail").show();
									 
								} else {
									document.getElementById("checktime").type = "submit";
								}// เหลือ (กรณี Check-out ไม่มี Chec-in , Status = N/A )

							} else if (selectedDate > thisDateNow) { // วันที่เลือก มากกว่าวันที่ปัจจุบัน   
								swal("Here's a message!",
										"Can't Check-out In Future.") // (กรณี check-outล่วงหน้า) เช็คจากวันที่ ที่เลือก กับวันที่ ปัจจุบัน
								document.getElementById("checktime").type = "button";

							} else if (checkfulldate == 1) { // (กรณีCheck-out เลือกเวลาย้อนหลังเกิน24ชั่วโมงจากเวลาปัจจุบัน)
								if (fulltimecheck < 0) { //เวลาที่เลือกเทียบเวลาปัจจุบัน   (<0 คือเลือกเวลาย้อนหลังเกิน 24 ชั่วโมง)
									swal("Here's a message!",
											"Can't Check-Out more than 24 Hr.")
									toast_checkout();
									document.getElementById("checktime").type = "button";
								} 
//								else if (fulltimecheck > 0 && mydetail < 10) { //เช็ค Detail (กรณีCheck-out เลือกเวลาย้อนหลังเกิน24ชั่วโมงจากเวลาปัจจุบัน)
//									swal("Here's a message!",
//											"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") // check-out ย้อนหลัง
//									document.getElementById("checktime").type = "button";
//								} else {
//									document.getElementById("checktime").type = "submit";
//								}

							} else if (checkfulldate > 1) { //(กรณี Check-out ย้อนหลังเกิน 1 วัน) 
								swal("Here's a message!",
										"Can't late check-out more than 24hrs.") //ย้อนหลังเกิน  1 วัน
								toast_checkout();
								document.getElementById("checktime").type = "button";
							} 
//							else if (mydetail < 10) {
//								swal("Here's a message!",
//										"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") //
//								document.getElementById("checktime").type = "button";
//							} else {
//								document.getElementById("checktime").type = "submit";
//							}
						}

					});
	$('.test').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
	
	function toast_checkin(){
		var checkin_time = $("#ourtime_label").val();
		Command: toastr["success"]("Check in " + checkin_time , "Success")
		toastr.option = {
				"closeButton": false,
				"debug": false,
				"newestOnTop": false,
				"progressBar": true,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "3000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
		}
	}
	
	function toast_checkout(){
		Command: toastr["error"]("Can't check-out more than 24 hours later.", "Error")
		toastr.option = {
				"closeButton": false,
				"debug": false,
				"newestOnTop": false,
				"progressBar": true,
				"positionClass": "toast-top-right",
				"preventDuplicates": false,
				"onclick": null,
				"showDuration": "300",
				"hideDuration": "1000",
				"timeOut": "3000",
				"extendedTimeOut": "1000",
				"showEasing": "swing",
				"hideEasing": "linear",
				"showMethod": "fadeIn",
				"hideMethod": "fadeOut"
		}
	}
	
</script>

<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<!-- <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->
<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />

