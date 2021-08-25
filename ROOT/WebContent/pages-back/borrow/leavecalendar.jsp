<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<link href="../assets/global/plugins/fullcalendar/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->

<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>

<!--    <script src="../assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>  -->
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<!-- <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script> -->
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!--         <script src="../assets/apps/scripts/calendar.min.js" type="text/javascript"></script> -->
<!-- END PAGE LEVEL SCRIPTS -->

<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate pattern="01-01-yyyy" value="${now}" var="date_start" />
<fmt:formatDate pattern="dd-MM-yyyy" value="${now}" var="date_now" />


<style>
.fc-sat, .fc-sun {
	background-color: #E9EDEF;
}
.fully_colored_holiday, .fully_colored_holidaydiv,
	.fully_colored_holidayspan {
	background: #E9EDEF;
}
.fc-day-grid-event>.fc-content {
	white-space: normal;
}
</style>

<div class="portlet light bordered">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Leave
				Calendar</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<!-- <label class="col-md-9 control-label" for="form_control_1">Staff
		:</label>
	<div class="col-md-9">
		<select class="bs-select form-control" name="name">
			<option value="All">All</option>
		</select> -->
	<form action="searchLeaveCalendar" method="post">
		<input type="hidden" id="tempuser" value="${onlineUser.id}" />
		<div class="form-group form-md-line-input">
			<perm:permission object="leave.search">
				<div class="row">
					<div class="col-md-2"></div>
					<div class="col-md-8">
						<div class="col-md-2">
							<label class="control-label">Staff :</label>
						</div>

						<div class="col-md-8 col-xs-8">
							<div class="form-group">
								<select class="form-control select2me" name="name">
									<optgroup label="Enable">
										<c:forEach var="user" items="${userseq}">

											<c:if test="${user.enable == 1 }">
												<c:if test="${userSelect == nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,onlineUser.id)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
												<c:if test="${userSelect != nulll }">
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,userId)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
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
													<option value="${user.id}" id="${user.id}"
														<c:if test="${fn:containsIgnoreCase(user.id,userId)}"><c:out value="selected=selected"/></c:if>>${user.department_id}
														- ${user.name}</option>
												</c:if>
											</c:if>
										</c:forEach>
									</optgroup>
								</select> <input type="hidden" id="tempuser" />
								<script>
					 var x = $('select[name=name]').val();
					 document.getElementById("tempuser").value=x;
					</script>
							</div>
						</div>
						<div class="col-sm-2 col-xs-2" style="text-align: center">
							<button id="buttonSave" type="submit"
								class="btn sbold blue-steel">
								<i class="fa fa-search"></i> Search
							</button>
						</div>
					</div>
					<div class="col-md-2"></div>
				</div>
				<br>
			</perm:permission>
			<div class="row">
				<div class="col-md-4">
					<a class="dashboard-stat dashboard-stat-v2 red-sunglo"
						href="search_leave?name1=${userId}&type=3&startdate=${date_start}&enddate=${date_now}">
						<div class="visual">
							<i class="fa fa-ambulance"></i>
						</div>
						<div class="details">
							<div class="number">
								<c:if test="${leave_3  == null}">
									<span data-counter="counterup" data-value="">0</span>
									<div class="desc" style="font-size: 13px;">${type_3}</div>
								</c:if>
								<c:if test="${leave_3  != null}">
									<span data-count="${leave_3}" class="counter">0</span>
									<div class="desc" style="font-size: 13px;">${type_3}</div>
								</c:if>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-4">
					<a class="dashboard-stat dashboard-stat-v2 yellow-gold"
						href="search_leave?name1=${userId}&type=6&startdate=${date_start}&enddate=${date_now}">
						<div class="visual">
							<i class="fa fa-suitcase"></i>
						</div>
						<div class="details">
							<div class="number">
								<c:if test="${tnow >= tend}">
									<c:if test="${leave_6l < 0}">
										<span data-counter="counterup" data-value="">${leave_6l}</span>
									</c:if>
									<c:if test="${leave_6l >= 0}">
										<span data-counter="counterup" data-value="">0</span>
									</c:if>
									<div class="desc" style="font-size: 13px;">${type_6}</div>
								</c:if>
								<c:if test="${tnow < tend}">
									<span data-count="${leave_6l}" class="counter">0</span>
									<div class="desc" style="font-size: 13px;">${type_6}
										<u>คงเหลือ</u> ก่อนวันที่ 31 มีนาคม
									</div>
								</c:if>
							</div>
						</div>
					</a>
				</div>

				<div class="col-md-4">
					<a class="dashboard-stat dashboard-stat-v2 blue-steel"
						href="search_leave?name1=${userId}&type=1&startdate=${date_start}&enddate=${date_now}">
						<div class="visual">
							<i class="fa fa-photo"></i>
						</div>
						<div class="details">
							<div class="number">
								<c:if test="${leave_1  == null}">
									<span data-counter="counterup" data-value="">0</span>
									<div class="desc" style="font-size: 13px;">${type_1}</div>
								</c:if>
								<c:if test="${leave_1  != null}">
									<span data-count="${leave_1}" class="counter">0</span>
									<span>/</span>
									<span data-count="${quotaThisYear}" class="counter">0</span>
									<div class="desc" style="font-size: 13px;">${type_1}</div>
								</c:if>
							</div>
						</div>
					</a>
				</div>

			</div>
		</div>
	</form>
	<div class="portlet-body">
		<div class="row">
			<div class="col-md-12">
				<div class="portlet light portlet-fit bordered calendar">
					<div class="portlet-title">
						<div class="caption">
							<i class=" icon-layers font-green"></i> <span
								class="caption-subject font-green sbold uppercase">My
								Leave</span>
						</div>
					</div>
					<div class="portlet-body">
						<div class="row">

							<div class="col-md-12 col-sm-12">
								<div id="calendar" class="has-toolbar"></div>
							</div>
							<!-- Calendar-->

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- END PAGE BASE CONTENT -->
	</div>
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
        init: function() {
            this.initCalendar();
        },
        initCalendar: function() {
            if (!jQuery().fullCalendar) {
                return;
            }
            var date_time = '${flag12}';
            if(date_time != ""){           
            var noTime = $.fullCalendar.moment(date_time,"YYYY-MM-DD");
             }else{ var noTime = moment(); }        
            var start_date = [];
            var end_date = [];
            var name =[];
            var events1 =[];
           var aa =[];
            var des =[];
            var id_leave = [];
            var mycolor = ['red','grey','white','yellow','green','purple'];
            <c:forEach var="leave" items="${leave}">
            var text = '${leave.start_date}';
            text = text.substring(0,10);
            var text2 =  '${leave.end_date}';
            text2 = text2.substring(0,10);
            <c:if test="${leave.leave_type_id.toString() == 1 }">
            var text3 = 'ลากิจ/พักร้อน';
            </c:if>
            
            <c:if test="${leave.leave_type_id.toString() == 2 }">
            var text3 = 'ลาอื่นๆ';
            </c:if>
            
            <c:if test="${leave.leave_type_id.toString() == 3 }">
            var text3 = 'ลาป่วย';
            </c:if>
            <c:if test="${leave.leave_type_id.toString() == 4 }">
            var text3 = 'ขาดงาน';
            </c:if>
            <c:if test="${leave.leave_type_id.toString() == 5 }">
            var text3 = 'ลาโดยไม่รับค่าจ้าง';
            </c:if>
            <c:if test="${leave.leave_type_id.toString() == 6 }">
            var text3 = 'ลาพักร้อนที่เหลือจากปีก่อน';
            </c:if>
            <c:if test="${leave.leave_type_id.toString() == 9 }">
            var text3 = 'อื่นๆ';
            </c:if>
     
            var date1 = new Date(text);
            var date2 = new Date(text2);
            
            <c:set var = "string1" value = "${leave.description}"/>
            	<%pageContext.setAttribute("newline", "\r\n");%>
            <c:set var = "string2" value = "${fn:replace(string1,newline,'')}" />
            
            var text4 = '${string2}';
            var text5 = '${leave.leave_id}';
            var user = "${userId}";
            start_date.push(date1);
            end_date.push(date2);
            name.push(text3);
            des.push(text4);
            id_leave.push(text5);
            aa.push(user.toString());
            </c:forEach>
            var x;  
            var type_color ;
           
            
            for(x in start_date){
            	 switch(name[x]) {
            	 case "ลากิจ/พักร้อน": type_color ="#4B77BE"; break;
            	 case "ลาป่วย":  type_color ="#E26A6A"; break;
            	 case "ลาอื่นๆ": type_color ="#33CC66"; break;
            	 case "ลาพักร้อนที่เหลือจากปีก่อน": type_color = "#E87E04"; break;
            	 default: type_color ="#525E64";
            	 }
            	 
            	 
					  var now = new Date(end_date[x]);
			            var daysOfYear = [];
			            for (var d = new Date(start_date[x]); d <= now; d.setDate(d.getDate() + 1)) {
			                daysOfYear.push(new Date(d));
			                
			                if (d.getDay() != '0' && d.getDay() != '6')
			                {
			                console.log(d.getDay());
			                const month_s = start_date[x].toLocaleString('default', { month: 'long' });
			                const month_e = start_date[x].toLocaleString('default', { month: 'long' });
			                events1.push(	{
			                	
				            	id: id_leave[x],   
				            	title: name[x],				   
								start: new Date(d.getFullYear(),d.getMonth(),d.getDate(),0,0),
								end: new Date(d.getFullYear(),d.getMonth(),d.getDate() + 1,0,0 ),
								description: start_date[x].getDate()+" "+month_s+" "+start_date[x].getFullYear()
								+" - "+end_date[x].getDate()+" "+month_e+" "+end_date[x].getFullYear(),
							   backgroundColor: type_color,
				               allDay: true,
				               className: aa[x]
							   });     
			                }
			            }
                     
            }	
            
          
           
        
            //Add Holiday Event
            var start_date1 = [];
            var end_date1 = [];
            var name1 =[];
            var events2 = [];
            var des1 = [];
            var id1 =[];
            var mycolor1 =['red','grey','blue','yellow','green','purple'];
            <c:forEach var="holiday" items="${holidayList}">
            
            var text1 = '${holiday.start_date}';
            var text12 =  '${holiday.end_date}';
            var text13 = '${holiday.head}';
            <c:set var = "string11" value = "${holiday.description}"/>
            	<%pageContext.setAttribute("newline", "\r\n");%>
            <c:set var = "string12" value = "${fn:replace(string11,newline,'')}" />
            var text14 = '${string12}';
            var text15 =  '${holiday.id_date}';
            var date11 = new Date(text1);
            var date12 = new Date(text12);
            
            start_date1.push(date11);
            end_date1.push(date12);
            name1.push(text13);
            des1.push(text14);
            id1.push(text15);
            </c:forEach>
            var y;                    
            for(y in start_date1){
            	events2.push(	{
				   id:id1[y],
            	   title: name1[y],
				   start: new Date(start_date1[y].getFullYear(),start_date1[y].getMonth(),start_date1[y].getDate()),
				   end: new Date(end_date1[y].getFullYear(),end_date1[y].getMonth(),end_date1[y].getDate() + 1 ),
				   description: des1[y] ,
			   backgroundColor: '#E9EDEF',
			    allDay: true,
			    className: 'holiday',
			    editable : false
			   			    
			   });            
            }
           
      		
                   
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
                        left: 'agendaDay, agendaWeek, month, today'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        right: 'title',
                        center: '',
                        left: 'agendaDay, agendaWeek, month, today, prev,next'
                    };
                }
            } else {
                if ($('#calendar').parents(".portlet").width() <= 720) {
                    $('#calendar').addClass("mobile");
                    h = {
                        left: 'title, prev, next',
                        center: '',
                        right: 'today,month,agendaWeek,agendaDay'
                    };
                } else {
                    $('#calendar').removeClass("mobile");
                    h = {
                        left: 'title',
                        center: '',
                        right: 'prev,next,today,month,agendaWeek,agendaDay'
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
                initDrag(html); // DIE !!! ********************************************* !!
                
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
                defaultDate: moment(noTime),
                slotMinutes: 15,
                hiddenDay: [0,6],
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
                	
                    var start = moment(calEvent.start).get('date');
                    var end = moment(calEvent.end).get('date');
                 
                	if(calEvent.className == "holiday"){
                    var for_i = end-start;
                    
                    for(var i  = 0 ; i < for_i ; i++ ){
                	var dataToFind = moment(calEvent.start).format('YYYY-MM-DD');
                 var date_new = new Date(dataToFind);
                  date_new.setDate(start+i);
                 dataToFind = moment(date_new).format('YYYY-MM-DD');
                    $("td[data-date='"+dataToFind+"']").addClass('fully_colored_holiday');	
                    }
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
                        + "<p style=\"max-width:500px;word-wrap:break-word;margin-bottom:50px;\">&nbsp;"+ calEvent.description + " <br/>"
                        
                        + "</p>",   
                        trigger: 'hover'
                    });
                    if(calEvent.className != "holiday"){
                    element.find(".fc-title").prepend("<i class='fa fa-search searchon' style='margin:5px;' ></i>");                    
                    element.find("div.fc-content").append( "<span> <i class='fa fa-trash closeon' style='float:right;position:absolute;right:0;top:0position:absolute;right:0;top:0'></i> </span>" );
                        }else{ 
                        	element.find(".fc-title").css('color', 'black');
							}
                   element.find(".closeon").on('click',function() {                //Delete Function 
                	  if (confirm("Are you sure Delete ?")) {                 		
                		     document.location = "delete_leave_calecdar?leave_id="+ calEvent.id ;
                  	  }
                });
                element.find(".searchon").on('click',function() { //Search Function
                  
                     	  document.location = "LeaveEdit?flag=0&id=" + calEvent.id ;   
                     	// "holiday_edit_calendar?flag=0&id=" + calEvent.id
                	                  });
                  
                  },
      
                 dayClick: function(date, jsEvent, view, allDay) {
                	 var events = $('#calendar').fullCalendar('clientEvents');
                     for (var i = 0; i < events.length; i++) {
                         if (moment(date).isSame(moment(events[i].start))) {
                             alert("Dont Click");
                             break;
                         }
                         else if (i == events.length - 1) {
                        	 var useradd=document.getElementById("tempuser").value
                        	 document.location = "LeaveAdd?date="+date.format("DD-MM-YYYY"); 
                         }
                     }
                  },
               /*     eventDrop: function(event, delta, revertFunc) { // ลากเพื่อแก้ไข
                		var moment2 = moment(event.end);                		
                		 var day = moment(moment2).get('date') - 1;
                		 moment2 = moment().set('date',day);              		                       
                      if (confirm("Are you sure about this change?")) {                         
                         document.location ="UpdateMoving_calendar?id_date=" +event.id +"&Date-Start="+event.start.format("DD-MM-YYYY")+"&Date-End="+moment2.format("DD-MM-YYYY")  ;                        
                      }
                  },
 */                 /*   eventDragStop: function (event, jsEvent, ui, view) { // ลากเพื่อลบ
                	  if (confirm("Are you sure Delete ?")) {
                		  document.location = "DeleteHoliday?id=" + event.id +"&date=" + event.start.format("DD-MM-YYYY");
                	  }
                  },  */
                  eventResize: function(event, delta, revertFunc) {
                	  var moment2 = moment(event.end);
              		  var day = moment(moment2).get('date') - 1;
              		  var mon =  moment(moment2).get('month') ;
              		//  var yea = moment(moment2).get('year') ;
              
              		 moment2 = moment().set({'date':day,'month':mon}); 
              	//	 alert(moment2.format("DD-MM-YYYY"));
                          if (confirm("Are you sure Update ?")) {
                      	document.location = "leave_resize_calendar?id="+event.id +"&date_end="+moment2.format("DD-MM-YYYY");
                         }   
                     }, 
                 editable: false,
                eventLimit: true,
           
                events: events1
                
            });
            $('#calendar').fullCalendar( 'addEventSource',events2);
        }
    };
   
}();
jQuery(document).ready(function() {    
   AppCalendar.init();
   
   
   
   
  
   
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
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script>$(document).ready(function () {
	var value = "${flag_search}";
	if (value == "1") {
    var user = "${userId}";
  //  alert(user);
  	document.getElementById(user).selected = "true";
	}else{
    $('.select2me').select2();
	}
});</script>
<script>
$('.counter').each(function() {
	  var $this = $(this),
	      countTo = $this.attr('data-count');
	  
	  $({ countNum: $this.text()}).animate({
	    countNum: countTo
	  },
	  {
	    duration:1000,
	    easing:'linear',
	    step: function() {
	      $this.text(Math.floor(this.countNum));
	    },
	    complete: function() {
	      $this.text(this.countNum);
	      //alert('finished');
	    }
	  });  
	  
	  
	});
</script>