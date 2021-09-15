<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link href="../assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />

<link href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />



<c:set var="now" value="<%=new java.util.Date()%>" />

<!-- <style>
@media only screen and (max-width: 1200px) {
    #search {
        margin-top: 15px;
    }
}
</style> -->
<style>
@keyframes fadeIn {
	from {
		opacity: 0;
	}
		  
	to {
		opacity: 1;
	}
}
#caption_text {
	height: 15px;
	margin-bottom: 10px;

}
.fc-future{
	background-color: #d1f2eb;
}
.fc-sat, .fc-sun{
	background-color: #e9edef;
}

.purple{
     background:#9b59b6 ;   
}
	
</style>

<script>
$("tr:not(:first)").each(function (index ) {
	$(this).css('animation-delay',index *0.01 +'s');
}); 

								
</script>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-users font-red"></i>
			<span class="caption-subject font-red sbold uppercase">Booking Meeting Room</span>
		</div>
	</div>
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title="" title=""></a> 
			<a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""></a> 
			<a href="javascript:;" class="reload" data-original-title="" title=""></a>
			<a href="javascript:;" class="remove" data-original-title="" title=""></a>
		</div>
				<div class="row" style="padding-bottom: 15px; padding-top: 15px; text-align: center;">
				<div class="col-md-2 col-lg-2"></div>
				
				<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
					<div class="row" id="caption_text"><span>Today</span></div>
					
						<a class="dashboard-stat dashboard-stat-v2 red-intense">
							<div class="visual">
								<!-- <i class="fa fa-suitcase"></i> -->
							</div>
							<div class="details">
<%-- 								<form action="myleave_list" method="POST">
									<div class="number">
										<c:if test="${tnow >= tend}">  <!-- if now over april -->
										${leave_6}/${quotaLastYear}
											<c:if test="${leave_6l < 0}">
												<span data-counter="counterup" data-value="">${leave_6l}</span>
											</c:if>
											<c:if test="${leave_6l >= 0}">
												<span data-counter="counterup" data-value="">0</span>
											</c:if>
											<div class="desc" style="font-size: 13px;">${type_6}</div>
										</c:if>
										<c:if test="${tnow < tend}">
											<span data-count="${quotaLastYear - leave_6}" class="counter">${quotaLastYear - leave_6}</span>
											<div class="desc" style="font-size: 13px;">${type_6} 
												คงเหลือ
											</div>
										</c:if>
									</div>
								</form> --%>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
					
						<div class="row" id="caption_text"></div>
						
						<a class="dashboard-stat dashboard-stat-v2 yellow-casablanca">
							<div class="visual">
								<!-- <i class="fa fa-ambulance"></i> -->
							</div>
							<div class="details">
<%-- 								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_3 != null}">
												<span data-counter="counterup" data-value="">${leave_3}</span>
												<div class="desc">${type_3}</div>
											</c:when>
											<c:when test="${leave_3 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_3}</div>
											</c:when>
										</c:choose>
									</div>
								</form> --%>
							</div>
						</a>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<div class="row" id="caption_text"><span>Coming Soon</span></div>
						<a class="dashboard-stat dashboard-stat-v2 yellow-saffron">
							<div class="visual">
								<!-- <i class="fa fa-newspaper-o"></i> -->
							</div>
							<div class="details">
								<%-- <form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_2 != null}">
												<span data-counter="counterup" data-value="">${leave_2}</span>
												<div class="desc">${type_2}</div>
											</c:when>
											<c:when test="${leave_2 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_2}</div>
											</c:when>
										</c:choose>
									</div>
								</form> --%>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
						<div class="row" id="caption_text"></div>
					
						<a class="dashboard-stat dashboard-stat-v2 green-haze">
							<div class="visual">
								<!-- <i class="fa fa-battery-quarter"></i> -->
							</div>
							<div class="details">
<%-- 								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_5 != null}">
												<span data-counter="counterup" data-value="">${leave_5}</span>
												<div class="desc">${type_5}</div>
											</c:when>
											<c:when test="${leave_5 == null}">
												<span data-counter="counterup" data-value="">0</span>
												<div class="desc">${type_5}</div>
											</c:when>
										</c:choose>
									</div>
								</form> --%>
							</div>
						</a>
					<div class="col-md-2"></div>
				</div>
			</div>
			<div>
				<button type="button" class="btn green-meadow" onclick="select()">Select</button>
			</div>
			<div class="portlet-body">
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-12">
							<div class="portlet light portlet-fit bordered calendar">
								<div class="portlet-title">
									<div class="caption">
                                        <i class=" icon-layers font-green"></i>
                                        <span class="caption-subject font-green sbold uppercase">Meeting </span>
                                    </div>
								</div>
								<!-- Calendar -->
								<div class="portlet-body">
                                    <div class="row">
                                        <div class="col-md-12 col-sm-12">
                                            <div class="calendar" id="calendar"> </div>
                                        </div>
                                        
                                    </div>
                                </div>
                                <!-- Calendar-->
							</div>
						</div>
					</div>
					<!-- END PAGE BASE CONTENT -->
				</div>
			</div>
			

			<%-- <div class="portlet-body flip-scroll" style="text-align: center;">
				<table class="table table-striped table-condensed flip-content table-hover">
					<thead>
						<tr style="background-color:rgb(59, 63, 81);color:white">
							<th height="41"><center>Leave ID</center></th>
							<th height="41"><center>Submit date</center></th>
							<th height="41"><center>The applicant</center></th>
							<th height="41"><center>Type of leave</center></th>
							<th height="41"><center>Start date (Since)</center></th>
							<th height="41"><center>End date (Until)</center></th>
							<th height="41"><center>Amount the day</center></th>
							<th height="41"><center>Status</center></th>
							<th height="41"><center>Leave application form</center></th>
						</tr>
					</thead>
					
						<form action="myleave_list" method="POST">
						<c:forEach var="leave" items="${leavelist}" varStatus="status">
							<tr>
								<td style="vertical-align: middle;">${leave.leave_id}</td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.time_create}"
										pattern="dd-MM-yyyy HH:mm"></fmt:formatDate></td>
								<td>${leave.user_id}</td>
								<c:choose>
									<c:when test="${leave.leave_type_id.toString() == '1'}">
										<td>${type_1}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '2'}">
										<td>${type_2}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '3'}">
										<td>${type_3}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '5'}">
										<td>${type_5}</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '6'}">
										<td>${type_6}</td>
									</c:when>

								</c:choose>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.start_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate></td>
								<td style="vertical-align: middle;"><fmt:formatDate value="${leave.end_date}"
										pattern="dd-MM-yyyy"></fmt:formatDate></td>
								<td style="vertical-align: middle;">${leave.no_day}</td>
								<td style="vertical-align: middle;"><c:if test="${leave.leave_status_id.toString() == '0'}">
										<span class="label label-warning">Waiting for
											approve</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '1'}">
										<span class="label label-success">Approved</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '2'}">
										<span class="label label-danger">Reject</span>
									</c:if></td>
								<td style="vertical-align: middle;"><a class="btn circle btn-outline btn-sm sbold blue"
									href="LeaveEdit?id=${leave.leave_id}"
									title="information of leave"><i
										class="fa fa-clipboard"></i></a></td>
							</tr>
						</c:forEach>
						</form>
				</table>
			</div> --%>
	</div>
</div>

<script type="text/javascript">
$(document).ready(function() {
		$('#calendar').fullCalendar();
	


});
function select() {
	document.location = "Select_Room";
	console.log("888");
}

</script>
<script>
var myevent = [];
var AppCalendar = function() {
	return {
		//main function to initiate the module
		init: function() {
            this.initCalendar();
        },
        initCalendar: function() {
        	console.log('0000000')
        	if (!jQuery().fullCalendar) {
                return;
            }
        	var date_time = '${flag12}';
        	if(date_time != ""){
        		var noTime = $.fullCalendar.moment(date_time,"YYYY-MM-DD");
        		
        	} else {
        		var noTime = moment();
        	}
        	var id = [];
        	var meeting_date = [];
        	var time_start = [];
        	var time_end = [];
        	var name = [];
        	var reserver = [];
        	var room_id = [];
        	var events1 = [];
        	var mycolor = ['purple'];
        	var mytype = [1,2,3,4,5,6];
        	
        	<c:forEach var="meeting" items="${meetinglist}">
	        	var idmeeting = '${meeting.idmeeting}';
	        	var text = '${meeting.date}';
	        	var text1 = '${meeting.time_start}';
	        	var text2 = '${meeting.time_end}';
	        	var user_reserve = '${meeting.user_reserve}';
	        	var idroom = '${meeting.idroom}';
	        	
	        	var date1 = text.substring(0, 10);
	        	var start1 = text1.substring(0, 5);
	        	var end1 = text2.substring(0, 5);
	        	var timefull = start1 + " - " + end1;
	        	
	        	var date2 = new Date(date1);
	        	
	        	id.push(idmeeting);
	        	meeting_date.push(date2);
	        	time_start.push(start1);
	        	time_end.push(end1);
	        	name.push(timefull);
	        	reserver.push(user_reserve);
	        	room_id.push(idroom);
        	</c:forEach>
        	
        	var x;
        	for(x in meeting_date){
        		events1.push({
        				id:id[x],
        				title: name[x],
        				start: new Date(meeting_date[x].getFullYear(),meeting_date[x].getMonth(),meeting_date[x].getDate()),
        				end: new Date(meeting_date[x].getFullYear(),meeting_date[x].getMonth(),meeting_date[x].getDate() + 1 ),
        			backgroundColor: App.getBrandColor('purple'),
/*         			className: mytype[x%6], */
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
                        left: 'agendaDay, agendaWeek, month, today,day'
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
                defaultDate: moment(noTime),
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
/*                     switch(calEvent.className) {
                    	case 1: type_color = 'red';  break;
                    	case 2:  type_color ='grey'; break;
                   	 	case 3: type_color ='blue'; break;
                   	 	case 4: type_color ='yellow'; break;
                   	 	case 5: type_color ='green'; break;
                   	 	case 6: type_color ='purple'; break;
                    } */
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
                	
                    element.find(".fc-title").prepend("<i class='fa fa-users' style='margin:5px;' ></i>");
                    
                    element.find(".users").on('click',function() {
/*                     	document.location = "holiday_edit_calendar?flag=0&id=" + calEvent.id ;                     	  
 */						alert("Hello !");
                    });

                },
                dayClick: function(date, jsEvent, view){
                	var events = $('#calendar').fullCalendar('clientEvents');
                	for (var i = 0; i < events.length; i++) {
                		if (moment(date).isSame(moment(events[i].start))) {
                            alert("Dont Click");
                            break;
                        } else if (i == events.length - 1) {
/*                        	 document.location = "holiday_add?flag=0&date_cal=" + date.format("DD-MM-YYYY") ;
 */
                        }
                	}
                },
             	// ลากเพื่อแก้ไข
                eventDrop: function(event, delta, revertFunc) {
                	var moment2 = moment(event.end);
           		 	var day = moment(moment2).get('date') - 1;
           		 	var mon =  moment(moment2).get('month') ;
           		 		moment2 = moment().set({'date':day,'month':mon});
           		 	
           		 	var moment3 = moment(event.start);  
           		 	var day = moment(moment3).get('date') - 1;
           		 	var mon =  moment(moment3).get('month');
           		 		moment3 = moment().set({'date':day,'month':mon});
           		 	if (confirm("Are you sure about this change?")) {
/*                         document.location ="UpdateMoving_calendar?id_date=" +event.id +"&Date-Start="+event.start.format("DD-MM-YYYY")+"&Date-End="+moment2.format("DD-MM-YYYY")  ;                        
 */
           		 	}
                },
                
                eventResize: function(event, delta, revertFunc) {
                	var moment2 = moment(event.end);
            		var day = moment(moment2).get('date') - 1;
            		var mon =  moment(moment2).get('month') ;
              		//  var yea = moment(moment2).get('year') ;
              		
              		moment2 = moment().set({'date':day,'month':mon}); 

              		if (confirm("Are you sure Update ?")) {
/*                        	document.location = "UpdateHoliday_calendar?id_date="+event.id +"&date_end="+moment2.format("DD-MM-YYYY");
 */
              		}
                },
                editable: true,
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
	
	var a = parseInt(count_year);
	var b = parseInt(count_month);
	
	var events2 = [];
	$('.fc-next-button').click(function(){
		b ++;
		console.log(b);
		if(b == 12  ){
			alert('next year : '+ (a+1) ); 
		}
		
	});
	$('.fc-prev-button').click(function(){
		b--;
		console.log(b);
		if(b == -1 ){
			alert('next year : '+ (a-1) );
			$.ajax({
				url : "meeting_findnextYear",
				method : "POST",
				type : "JSON",
				data : {
					"year_next" : a-1
				},
				success : function(data) {
					var obj = JSON.parse(data);
					var i = 0 ;
					var mycolor =['red','purple'];
/* 					var mytype=[1,2,3,4,5,6]; */
					for(i in obj.id) {
						var meeting_date = new Date(obj.start[i]);
						events2.push({
							id: obj.id[i],
							title: obj.title[i],
							start: new Date(meeting_date.getFullYear(),meeting_date.getMonth(),meeting_date.getDate()),
							end: new Date(end_date.getFullYear(),end_date.getMonth(),end_date.getDate() + 1 ),							  					 
							allDay: true,
/* 							className: mytype[i%6], */
							backgroundColor: App.getBrandColor('purple'),

						});
					}
					
					$('#calendar').fullCalendar( 'removeEventSource', myevent );
					$('#calendar').fullCalendar( 'addEventSource', events2 );
				}
			});
			b = 11;
			a = a - 1  ;
		}
	});
	
});
</script>