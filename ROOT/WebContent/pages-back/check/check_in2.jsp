<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="js/jquery.datetimepicker.css">
<link href='https://fonts.googleapis.com/css?family=Orbitron' rel='stylesheet' type='text/css'>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
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
p.a {
 	font-variant-numeric: 'oldstyle-nums', Arial, Helvetica, sans-serif;
 	font-size:60px;
 	 text-align:center;
 	  color: #ffffff;
}


@font-face {
    font-family: 'BebasNeueRegular';
    src: url('BebasNeue-webfont.eot');
    src: url('BebasNeue-webfont.eot?#iefix') format('embedded-opentype'),
         url('BebasNeue-webfont.woff') format('woff'),
         url('BebasNeue-webfont.ttf') format('truetype'),
         url('BebasNeue-webfont.svg#BebasNeueRegular') format('svg');
    font-weight: normal;
    font-style: normal;
}

.container {width: 100%; margin: 0 auto; overflow: hidden;}

.clock {width:100%;margin:0 auto;padding:0px;color:##ffffff; }

#Date { font-family:'oldstyle-nums', Arial, Helvetica, sans-serif; font-size:25px; text-align:center; color: #ffffff;)}


/* Simple <a href="https://www.jqueryscript.net/animation/">Animation</a> */
/* @-webkit-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px ;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px ; }	
}

@-moz-keyframes mymove 
{
0% {opacity:1.0; text-shadow:0 0 20px ;}
50% {opacity:0; text-shadow:none; }
100% {opacity:1.0; text-shadow:0 0 20px ; }	
} */
.btn-xlarge {
    padding: 18px 28px;
    font-size: 22px; //change this to your desired size
    line-height: normal;
    -webkit-border-radius: 8px;
       -moz-border-radius: 8px;
            border-radius: 8px;
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
				class="fa fa-mail-forward"></i> Check-In Check-OUT</span>
			<!-- <p id="asd">asddd</p> -->
		</div>

	</div>
	
		
				<div class="row">
					<div class="portlet-body" style="margin-bottom: 25%;">
						<div class="col-lg-6">
							<form action="save-check" class="form-horizontal" method="POST" name="myForm">
											
								
								<!--  jazz  -->
								
								<div class="form-group form-md-line-input text-right" >
												
									<div id ="BGC">
												<button class="btn white btn-circle" type="button" onclick="show()" style="font-size: 15px;" >
													<i class="fa fa-pencil"></i>
												</button>
										<p class = "a">${time}</p>
										<div id="clock"></div>
											<div id="Date"></div>
										<br>
										</div>
								</div>

								<div hidden class="app1-">
									<div class="form-group form-lg-line-input"
										>
								
										<div class="col-md-12">
										<div class="input-group">
											<input type="text" id="mydate" name="work_hours_date_work"
												value="${fulldate}" onchange="datechenge()"
												style="text-align: center;"
												class="form-control form-control-inline  date-picker test"
												size="9" type="text" data-date-format="dd-mm-yyyy"
												onkeypress='return false'><span
													class="input-group-btn">
													<button class="btn green" type="button"
														onclick="datechenge()">
														<i class="fa fa-calendar"></i>
													</button>
												</span>
										</div>
										</div>
									</div>

									<div class="form-group form-lg-line-input">

										<div class="col-md-12">
											<div class="input-group">


												<input type="text" name="work_hours_time_work" id="ourtime"
													class="form-control  timepicker timepicker-24 test"
													value="${time}" data-time-format="HH:mm"
													style="text-align: center;" onchange="timechenge()"
													onkeypress='return false'> <span
													class="input-group-btn">


													<button class="btn green" type="button"
														onclick="timechenge()">
														<i class="fa fa-clock-o"></i>
													</button>
												</span>
											</div>
										</div>
									</div>

							
								</div>
								
								

								


								<!-- 									<div class="form-group form-md-line-input text-center" >	
										<div class="md-radio-inline">										
											<div class="md-radio">
												<input type="radio" id="checkbox1_1" name="work_hours_type"
													value="1" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_1" style="color: #32c5d2;"> <span></span>
													<span class="check"></span> <span class="box"></span>
													Check-IN
												</label>
											</div>
										
										
											<div class="md-radio">
												<input type="radio" id="checkbox1_2" name="work_hours_type"
													value="2" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_2" style="color: red;"> <span></span>
													<span class="check" style="background: #ff2524;"></span> <span
													class="box"></span> Check-OUT
												</label>
											</div>
											
										</div> 
								</div> -->
								
								<div class="form-group form-md-line-input text-center">
														
										<button class="btn btn-primary blue btn-lg btn-block" style="font-size:24px"
										type="submit" id="checktime" name="savebtn">
										<i class="fa fa-save"></i> Accept
										
																			<div>
											<font color="white"><c:forEach var="lastcheckin"
													items="${lastcheckin}" varStatus="status">
													<div>
														<sub>( Last Check-In : </sub> <sub id="demo"></sub> <sub>)</sub>
													</div>
													<div>
											

												</c:forEach></font>
												
												<font color="white"><c:forEach var="lastcheckout"
													items="${lastcheckout}" varStatus="status">
													<div>
														<sub id="demo2"></sub> 
													</div>
													</c:forEach>
													</font>
											<script>
												var str = '${lastcheckin}';
												var str1 = /\d{4}-\d{2}-\d{2}/g;
												var str2 = /\d{2}:\d{2}/g;
												var date1 = /\d{2}/g
												var result = str.match(date1);
												var result1 = str.match(str1);
												var result2 = str.match(str2);
												var today = new Date();
												
												var check = result[3]+'/'+result[2]+'/' + +result[0]+result[1]+' ' + result2;
												if (today.getFullYear() == (result[0] + result[1]) && (today.getMonth() + 1) == result[2] && today.getDate() == result[3]) {
													check = 'TO DAY '+ result2;
												}
												document.getElementById("demo").innerHTML = check;
											</script>
									<!-- 		<script>
												var str = '${lastcheckout}';
												var str1 = /\d{4}-\d{2}-\d{2}/g;
												var str2 = /\d{2}:\d{2}/g;
												var date1 = /\d{2}/g
												var result = str.match(date1);
												var result1 = str.match(str1);
												var result2 = str.match(str2);
												var today = new Date();
												
												var check = result[3]+'/'+result[2]+'/' + +result[0]+result[1]+' ' + result2;
												if (today.getFullYear() == (result[0] + result[1]) && (today.getMonth() + 1) == result[2] && today.getDate() == result[3]) {
													check = 'You already checkout today'
												}
												document.getElementById("demo2").innerHTML = check;
											</script> -->
										</div>
									</button>
								</div>
								
								<div class="form-group form-md-line-input text-center">
											<div class="md-radio-inline">										
											<div class="md-radio">
												<input type="radio" id="checkbox1_1" name="work_hours_type"
													value="1" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_1" style="color: #32c5d2;"> <span></span>
													<span class="check"></span> <span class="box"></span>
													Check-IN
												</label>
											</div>
										
										
											<div class="md-radio">
												<input type="radio" id="checkbox1_2" name="work_hours_type"
													value="2" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_2" style="color: red;"> <span></span>
													<span class="check" style="background: #ff2524;"></span> <span
													class="box"></span> Check-OUT
												</label>
											</div>
											
										</div> 
									

								</div>
								
								
								<div hidden class="form-group form-lg-line-input">
										<input type="text" id="detail" name="description">
								</div>
								
								
								<div class="form-group form-lg-line-input"
									style="margin-left: -5%;">
									<label class="col-md-3 control-label" for="form_control_1"></label>
									
									
									<div class="col-md-9">
										
<!-- 										<div class="md-radio-inline">
											
											<div class="md-radio">
												<input type="radio" id="checkbox1_1" name="work_hours_type"
													value="1" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_1" style="color: #32c5d2;"> <span></span>
													<span class="check"></span> <span class="box"></span>
													Check-IN
												</label>
											</div>
										
										
											<div class="md-radio">
												<input type="radio" id="checkbox1_2" name="work_hours_type"
													value="2" class="md-radiobtn"
													onclick="show_text(this.value);"> <label
													for="checkbox1_2" style="color: red;"> <span></span>
													<span class="check" style="background: #ff2524;"></span> <span
													class="box"></span> Check-OUT
												</label>
											</div>
											
										</div>  -->
										
<%-- 										<div>
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
												
												var check = result[3]+'/'+result[2]+'/' + +result[0]+result[1]+' ' + result2;
												if (today.getFullYear() == (result[0] + result[1]) && (today.getMonth() + 1) == result[2] && today.getDate() == result[3]) {
													check = 'TO DAY '+ result2;
												}
												document.getElementById("demo").innerHTML = check;
											</script>
										</div> --%>
									</div>
								</div>
								
<!-- 								<div class="form-group form-lg-line-input"
									style="margin-left: -5%;">
									<label class="col-md-3 control-label" for="form_control_1"
										id="labeldetail">Detail :</label>
									<div class="col-md-9">
										<textarea class="form-control " name="description"
											maxlength="500" rows="3" placeholder="กรุณาระบุเหตุผล"
											id="detail"></textarea>
										<div class="form-control-focus"></div>

									</div>
								</div> -->


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
		
	</div>
</div>
<%-- <div class="portlet light bordered">
	<div class="test ">
		<jsp:include page="/pages-back/check/check_list.jsp" flush="true"></jsp:include>
	</div>
</div> --%>

<style>
.mt-widget-3 {
	border: 0px;
}
</style>



<script>
	function nextStep() {
		document.location = "check_list?userId=${onlineUser.id}";
	}
	function timechenge() {
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
/* 			$("#detail").show();
			$("#labeldetail").show(); */
		} else {
/* 			$("#detail").hide();
			$("#labeldetail").hide(); */
		}
	}
	function datechenge() {
		var fulldate = "${fulldate}".trim();//วันที่ปัจจุบัน
		var Userdate = $("#mydate").val();//วันที่เลือก
		if (fulldate != Userdate) {
/* 			$("#detail").show();
			$("#labeldetail").show(); */
		} else {
/* 			$("#detail").hide();
			$("#labeldetail").hide(); */
		}
	}

	function back() {
		document.location = "check_in2";
	}

	function travel() {
		document.location = "travelexp_form";
	}

	function leave() {
		document.location = "LeaveAdd";
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
						var mytime = $("#ourtime").val();//เวลาที่เลือก
						var mytimelength = $("#ourtime").val().length;//ความยาวเวลาที่เลือก
						var Userdate = $("#mydate").val();//วันที่เลือก
						var timelength = $("#ourtime").val().length;//เช็ค length เวลา
						/* var mydetail = null;//เช็ต ค่าใน detail  */
						var mydetail = document.getElementById("detail").innerText;
						console.log("mydetail(1) : " + mydetail);
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
						hourfull = ((hourmytime - hourtimeNow) * 60); //ลบชั่วโมง * 60  
						minfull = (minmytime - mintimeNow); // ลบนาที
						fulltimecheck = (hourfull + minfull); // ชั่วโมง+นาที  (คำนวณเวลาที่เลือกกับเวลาปัจจุบัน)
						fullchecktimenow = ((hourmytime * 60) + minmytime); //คำนวณเวลาที่เลือก

						////////////// คำนวณเวลาปัจจุบันกับเวลาcheck-in ล่าสุด////////////
						var hourtimelast = null;
						var mintimelast = null;
						var calcheckin = null; // คำนวณเวลาแcheck-in ล่าสุด
						var calcheckout = null; // คำนวณเวลา check-out 
						if (timecheckinlength == '4') { // เวลา Check-in ล่าสุด =4
							hourtimelast = timecheckin.substring(0, 1);
							mintimelast = timecheckin.substring(2, 4);
						} else if (timecheckinlength == '5') { //เวลา check-inล่าสุด  = 5
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
								} else if (calcheckout != fullchecktimenow) { ///////////////////////////// check-in Detail///////////
									swal({
										  title: "Detail!",
										  type: "input",
										  showCancelButton: true,
										  closeOnConfirm: false,
										  inputPlaceholder: "Write something"
										}, function (mydetail) {
										  if (mydetail === false) return false;
										  if (mydetail === "") {
												    swal.showInputError("You need to write something!");
												    return false
										  }else if(mydetail.trim().length < 10){
												    swal.showInputError("กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร");
												    return false
										  }else{
											  swal("Nice!", "You detailed: " + mydetail, "success");
											  console.log("mydetail : " + mydetail);
											 /*  mydetail = document.getElementById("detail").innerText; */
											 /*  document.getElementById("detail").setAttribute("text", mydetail); */
											 document.getElementById("detail").value = mydetail;
											  document.forms["myForm"].submit();
										  }									  
										});
									document.getElementById("checktime").type = "button"; // (กรณี check-in ย้อนหลังใส่เหตุผล)
								
								} else {
									document.getElementById("checktime").type = "submit";
								}  
						}
						///////////////////////////////////////// เช็คเวลา check-out ////////////////////////////////////
						if (radio2 > 0) {
							if (checkfulldate == 0) {// วันปัจจุบัน 
								
								if(calcheckout != fullchecktimenow){
									swal({
										  title: "Detail!",
										  type: "input",
										  showCancelButton: true,
										  closeOnConfirm: false,
										  inputPlaceholder: "Write something"
										}, function (mydetail) {
										  if (mydetail === false) return false;
										  if (mydetail === "") {
												    swal.showInputError("You need to write something!");
												    return false
										  }else if(mydetail.trim().length < 10){
												    swal.showInputError("กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร");
												    return false
										  }else{
											  swal("Nice!", "You detailed: " + mydetail, "success");
											  document.getElementById("detail").value = mydetail;
											  document.forms["myForm"].submit();
										  }
										  document.getElementById("checktime").type = "submit";
										});
									document.getElementById("checktime").type = "button";
								}else if (fulltimecheck > 0) {
									swal("Here's a message!",
									"Can't Check-In In Future.")// (กรณี check-out ล่วงหน้า) เช็คจากเวลาที่เลือกกับเวลาปัจจุบัน
									document.getElementById("checktime").type = "button";

								} else if ((calcheckout != fullchecktimenow && mydetail < 10)) {
									swal("Here's a message!",
											"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") //check-out ย้อนหลัง 
									document.getElementById("checktime").type = "button";
								} else {
									document.getElementById("checktime").type = "submit";
								}// เหลือ (กรณี Check-out ไม่มี Chec-in , Status = N/A )

							} else if (selectedDate > thisDateNow) { // วันที่เลือก มากกว่าวันที่ปัจจุบัน   
								swal("Here's a message!",
								"Can't Check-In In Future.") // (กรณี check-outล่วงหน้า) เช็คจากวันที่ ที่เลือก กับวันที่ ปัจจุบัน
								document.getElementById("checktime").type = "button";

							} else if (checkfulldate == 1) { // (กรณีCheck-out เลือกเวลาย้อนหลังเกิน24ชั่วโมงจากเวลาปัจจุบัน)
								if (fulltimecheck < 0) { //เวลาที่เลือกเทียบเวลาปัจจุบัน   (<0 คือเลือกเวลาย้อนหลังเกิน 24 ชั่วโมง)
									swal("Here's a message!",
											"Can't Check-Out Greater than 24 Hr.")
									document.getElementById("checktime").type = "button";
								} else if (fulltimecheck > 0 && mydetail < 10) { //เช็ค Detail (กรณีCheck-out เลือกเวลาย้อนหลังเกิน24ชั่วโมงจากเวลาปัจจุบัน)
									swal("Here's a message!",
											"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") // check-out ย้อนหลัง
									document.getElementById("checktime").type = "button";
								} else {
									document.getElementById("checktime").type = "submit";
								}

							} else if (checkfulldate > 1) { //(กรณี Check-out ย้อนหลังเกิน 1 วัน) 
								swal("Here's a message!",
										"Can't Check-out In Last.") //ย้อนหลังเกิน  1 วัน
								document.getElementById("checktime").type = "button";

							} else if (mydetail < 10) {
								swal("Here's a message!",
										"กรุณาระบุเหตุผลการลงเวลาย้อนหลังมากกว่า 10 ตัวอักษร") //
								document.getElementById("checktime").type = "button";
							} else {
								document.getElementById("checktime").type = "submit";
							}

						}
						
					});

	$('.test').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
	

</script>
<script type="text/javascript">
$(document).ready(function() {
// Create two variable with the names of the months and days in an array
var monthNames = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]; 
var dayNames= ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
		
	
						
// Create a newDate() object
var newDate = new Date();
// Extract the current date from Date object
newDate.setDate(newDate.getDate());
// Output the day, date, month and year   


	 
	 			if(newDate.getDay() == 1){
	 				 $('#Date').css("background-color", "#fff01a").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#fff01a");
	 			}else if(newDate.getDay() == 2){
	 				 $('#Date').css("background-color", "#FFCCFF").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#FFCCFF");
	 			}else if(newDate.getDay() == 3){
	 				 $('#Date').css("background-color", "#b2f0bd").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#b2f0bd");
	 			}else if(newDate.getDay() == 4){
	 				 $('#Date').css("background-color", "#ff8d14 ").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#ff8d14 ");
	 			}else if(newDate.getDay() == 5){
	 				 $('#Date').css("background-color", "#1cf0ff").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#1cf0ff");
	 			}else if(newDate.getDay() == 6){
	 				 $('#Date').css("background-color", "#ff52f3").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#ff52f3");
	 			}else if(newDate.getDay() == 0){
	 				 $('#Date').css("background-color", "#ff3333").html(dayNames[newDate.getDay()] + " " + newDate.getDate() + ' ' + monthNames[newDate.getMonth()] + ' ' + newDate.getFullYear());
	 				 $('#BGC').css("background-color", "#ff3333");
	 			}
	 			
	 		
});
</script>
								<script>
									function show() {
										$(".app1-").show();
										
									}
								</script>
<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
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
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>

<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>