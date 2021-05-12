<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="../assets/global/plugins/fullcalendar/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->



<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>

<!--    <script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>  -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!--         <script src="../assets/apps/scripts/calendar.min.js" type="text/javascript"></script> -->
<!-- END PAGE LEVEL SCRIPTS -->
<style>
.fc-sat, .fc-sun {
	background-color: #E9EDEF;
}

.fully_colored_holiday, .fully_colored_holidaydiv,
	.fully_colored_holidayspan {
	background: #E9EDEF;
	text-color: black;
}
</style>
<c:set var="now" value="<%=new java.util.Date()%>" />
<%-- ${logonUser} --%>
<%-- ${cubeUser} --%>
<%-- ${checkinhourtime} --%>
<%-- ${checktimecheckin} --%>
<%-- ${mintime} ${hourstime} --%>
<%-- ${hoursmin} --%>
<%-- ${datenow} --%>
<%-- ${startmonths} --%>
<%-- ${datenow} --%>
<%-- ${department} --%>
<%-- ${departments} --%>
<%-- ${workall} --%>
<%-- ${logonUser} --%>
<%-- ${departmentList} --%>
<%-- ${position} --%>

<%-- ${month} --%>
<%-- ${datenowcalendar} --%>

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-clock-o"></i> <span
				class="caption-subject font-red sbold uppercase">Check list
				calendar </span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>

	<form action="searchchecklistcalendar" method="post">
		<div class="form-group form-md-line-input">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<div class="col-md-2">
						<label class="control-label">Name :</label>
					</div>
					<div class="col-md-8 col-xs-8">
						<div class="form-group">
							<select class="form-control select2me" name="usercalendar">
								<option value="All" id="All">All</option>
								<optgroup label="Enable">
									<c:forEach var="user" items="${cubeUser}">

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
									<c:forEach var="user" items="${cubeUser}">

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
					</div>
					<div class="col-sm-2 col-xs-2" style="text-align: center">

						<button id="buttonSave" type="submit" class="btn sbold blue-steel">
							<i class="fa fa-search"></i> Search
						</button>
					</div>
				</div>
				<div class="col-md-2"></div>
			</div><br>
			<div class="row">
				<div class="col-md-12">

					<div class="portlet light portlet-fit bordered calendar">
						<div class="portlet-title">
							<div class="caption">
								<i class=" icon-layers font-green"></i> <span
									class="caption-subject font-green sbold uppercase">CHECK
									LIST </span>
							</div>
						</div>
						<div class="portlet-body">
							<div class="row">
								<!-- Calendar-->
								<div class="col-md-12 col-sm-12">
									<div id="calendar" class="has-toolbar"></div>
								</div>
								<div class="col-md-12 col-sm-12">
									<div id="calendar" class="has-toolbar"></div>
									<input type="hidden" name="monthcalendar" value="${month}">
								</div>
								<!-- Calendar-->

							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- END PAGE BASE CONTENT -->
		</div>

	</form>

</div>


<script>
	$(document).ready(function() {

		// page is now ready, initialize the calendar...

		$('#calendar').fullCalendar();

	});
</script>
<script type="text/javascript">
	var AppCalendar = function() {

		return {
			//main function to initiate the module
			init : function() {
				this.initCalendar();
			},

			initCalendar : function() {

				if (!jQuery().fullCalendar) {
					return;
				}
				var date_time = '${flag12}';
				if (date_time != "") {
					var noTime = $.fullCalendar.moment(date_time, "YYYY-MM-DD");
				} else {
					var noTime = moment();
				}
				var start_date = [];
				var end_date = [];
				var name = [];
				var workhour = [];
				var workmin = [];
				var events1 = [];

				var mycolor = [ 'red', 'grey', 'blue', 'yellow', 'green',
						'purple' ];

				<c:forEach var="work" items="${work}">
				var a = '${work.mycheckins}';
				var text = a.substring(0, 10);
				var b = '${work.mycheckins}';
				var text2 = b.substring(0, 10);
				var text3 = '${work.mycheckin}';
				var text4 = '${work.checkouttime}';
				var hour = '${work.hour}';
				var min = '${work.min}';

				var timecheck = text3.substring(0, 5);
				var timechecks = text4.substring(0, 5);
				var timefull = timecheck + " - " + timechecks;

				var date1 = new Date(text);
				var date2 = new Date(text2);
				start_date.push(date1);
				end_date.push(date2);
				name.push(timefull);
				workhour.push(hour);
				workmin.push(min);

				</c:forEach>
				var x;
				for (x in start_date) {
					events1.push({
						title : name[x],
						start : new Date(start_date[x]),
						end : new Date(end_date[x]),
						backgroundColor : App.getBrandColor('blue'),
						/* backgroundColor: App.getBrandColor(mycolor[x%6]), */
						allDay : true,
					});
				}
				for (y in start_date) {
					var z = parseInt(workhour[y]);

					if (z >= 8) {
						myary = "grey";
					} else {
						myary = "red";
					}
					events1
							.push({
								title : workhour[y] + ":" + workmin[y] + " "
										+ " hrs. ",
								start : new Date(start_date[y]),
								end : new Date(end_date[y]),
								backgroundColor : App.getBrandColor(myary),
								allDay : true,
							});
				}

				var start_date13 = [];
				var end_date13 = [];
				var name13 = [];
				var events33 = [];
				var des13 = [];
				var id13 = [];
				var mycolor13 = [ 'red', 'grey', 'blue', 'yellow', 'green',
						'purple' ];
				<c:forEach var="holiday" items="${holidayList}">

				var text13 = '${holiday.start_date}';
				var text123 = '${holiday.end_date}';
				var text133 = '${holiday.head}';
				var text143 = '${holiday.description}';
				var text153 = '${holiday.id_date}';
				var date113 = new Date(text13);
				var date123 = new Date(text123);

				start_date13.push(date113);
				end_date13.push(date123);
				name13.push(text133);
				des13.push(text143);
				id13.push(text153);
				</c:forEach>

				var a;
				for (a in start_date13) {
					events33.push({
						id : id13[a],
						title : name13[a],
						start : new Date(start_date13[a].getFullYear(),
								start_date13[a].getMonth(), start_date13[a]
										.getDate()),
						end : new Date(end_date13[a].getFullYear(),
								end_date13[a].getMonth(), end_date13[a]
										.getDate() + 1),
						backgroundColor : '#E9EDEF',
						allDay : true,
						className : 'holiday',
						editable : false

					});
				}

				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();
				var h = {};
				/* var test = "${logonUser}".trim(); */

				if (App.isRTL()) {
					if ($('#calendar').parents(".portlet").width() <= 720) {
						$('#calendar').addClass("mobile");
						h = {
							right : 'title, prev, next',
							center : '',
							left : 'agendaDay, agendaWeek, month, today'
						};
					} else {
						$('#calendar').removeClass("mobile");
						h = {
							right : 'title',
							center : '',
							left : 'agendaDay, agendaWeek, month, today, prev,next'
						};
					}
				} else {
					if ($('#calendar').parents(".portlet").width() <= 720) {
						$('#calendar').addClass("mobile");
						h = {
							left : 'title, prev, next',
							center : '',
							right : 'today,month,agendaWeek,agendaDay'
						};
					} else {
						$('#calendar').removeClass("mobile");
						h = {
							left : 'title',
							center : '',
							right : 'prev,next,today,month,agendaWeek,agendaDay'
						};
					}
				}

				var initDrag = function(el) {
					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim(el.text())
					// use the element's text as the event title
					};
					// store the Event Object in the DOM element so we can get to it later
					el.data('eventObject', eventObject);
					// make the event draggable using jQuery UI
					el.draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});
				};

				var addEvent = function(title) {
					title = title.length === 0 ? "Untitled Event" : title;
					var html = $('<div class="external-event label label-default">'
							+ title + '</div>');
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
				addEvent("My Event 3");
				addEvent("My Event 4");
				addEvent("My Event 5");
				addEvent("My Event 6");

				$('#calendar').fullCalendar('destroy'); // destroy the calendar
				$('#calendar')
						.fullCalendar(
								{ //re-initialize the calendar
									header : h,
									defaultView : 'month', // change default view with available options from http://arshaw.com/fullcalendar/docs/views/Available_Views/ 
									defaultDate : moment(noTime),
									slotMinutes : 15,
									editable : true,
									droppable : true, // this allows things to be dropped onto the calendar !!!

									drop : function(date, allDay) { // this function is called when something is dropped
										var check = '${checktimecalendar}'
												.trim();
										// retrieve the dropped element's stored Event Object
										var originalEventObject = $(this).data(
												'eventObject');
										// we need to copy it, so that multiple events don't have a reference to the same object
										var copiedEventObject = $.extend({},
												originalEventObject);

										// assign it the date that was reported
										copiedEventObject.start = date;
										copiedEventObject.allDay = allDay;
										copiedEventObject.className = $(this)
												.attr("data-class");

										// render the event on the calendar
										// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
										$('#calendar').fullCalendar(
												'renderEvent',
												copiedEventObject, true);

										// is the "remove after drop" checkbox checked?
										if ($('#drop-remove').is(':checked')) {
											// if so, remove the element from the "Draggable Events" list
											$(this).remove();
										}
									},
									selectable : true,
									selectHelper : true,
									eventRender : function(calEvent, element) {
										var start = moment(calEvent.start).get(
												'date');
										var end = moment(calEvent.end).get(
												'date');

										if (calEvent.className == "holiday") {
											var for_i = end - start;

											for (var i = 0; i < for_i; i++) {
												var dataToFind = moment(
														calEvent.start).format(
														'YYYY-MM-DD');
												var date_new = new Date(
														dataToFind);
												date_new.setDate(start + i);
												dataToFind = moment(date_new)
														.format('YYYY-MM-DD');
												$(
														"td[data-date='"
																+ dataToFind
																+ "']")
														.addClass(
																'fully_colored_holiday');
											}
										}

										if (calEvent.className != "holiday") {

											element
													.find(".fc-title")
													.prepend(
															"<i class='icon-clock'> </i>&nbsp;");
										} else {
											element
													.find(".fc-title")
													.prepend(
															"<i class='fa fa-photo'> </i>&nbsp;");
											element.find(".fc-title").css(
													'color', 'black');
										}

									},
									/* 	viewRender: function (view , element){
												var b = $('#calendar').fullCalendar('getDate');
												alert(b.format('L'));
												document.getElementById("test").value = b ;
												
											},   */
									eventLimit : true,
									events : events1

								});
				$('#calendar').fullCalendar('addEventSource', events33);
			}

		};

	}();
	//var test = $('#test').val();

	jQuery(document)
			.ready(
					function() {
						AppCalendar.init();
						$('.fc-next-button')
								.click(
										function() {
											var usercalendar = '${logonUser}'
													.trim();
											var test = '${datenowcalendar}'
													.trim();
											var monthcalendar = '${month}'
													.trim();
											var b = $('#calendar')
													.fullCalendar('getDate');
											//alert(b.format('L'));
											var x = b.format('L');
											//alert(x);
											document.location = 'searchnext_month?timecalendar='
													+ test
													+ "&datecalendar="
													+ x
													+ "&usercalendar="
													+ usercalendar;
										});

						var events2 = [];
						$('.fc-prev-button')
								.click(
										function() { // 	refresh หน้า
											var usercalendar = '${logonUser}'
													.trim();
											var test = '${datenowcalendar}'
													.trim();
											var monthcalendar = '${month}'
													.trim();
											var b = $('#calendar')
													.fullCalendar('getDate');
											//alert(b.format('L'));
											var x = b.format('L');
											//alert(x);
											document.location = 'searchnext_month?timecalendar='
													+ test
													+ "&datecalendar="
													+ x
													+ "&usercalendar="
													+ usercalendar;

											//alert(testss);
										});

					});
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




