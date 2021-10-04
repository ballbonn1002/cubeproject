<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css" />

<script src="../assets/global/plugins/moment.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/fullcalendar/fullcalendar.min.css" rel="stylesheet" type="text/css" />



<c:set var="now" value="<%=new java.util.Date()%>" />

<style>
@keyframes fadeIn {
	from {
		opacity: 0;
	}
		  
	to {
		opacity: 1;
	}
}
@media screen and (min-width: 1216px) {
  div.details {
    font-size: 24px;
  }
}

@media screen and (max-width: 1215px) {
  div.details {
    font-size: 20px;
  }
}

@media screen and (max-width: 1199px) {
  div.details {
    font-size: 30px;
  }
}
div.fc-event-container{
	margin-top: 18px;
}
a.fc-day-grid-event .fc-h-event{
	max-height: 33.6px;
	align-items: center;
}
#caption_text {
	height: 15px;
	margin-bottom: 10px;
}
.fc-past {
	background-color: #f9fafb;

}
.fc-sat, .fc-sun {
	background-color: #f0f2f4;
}
.dashboard-stat .details {
	text-align: center;
	position: absolute;
	right: 10px;
	padding-right: 20px;
}
/* .details {
  	font-size: 25px; 
	text-align: center;
	color: #ffffff;
	padding-top: 47px;
 	padding-left: 10px; 
 	padding-right: 50px; 
} */

.purple{
     background-color: #9b59b6;   
}
	
</style>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-users font-red"></i>
			<span class="caption-subject font-red sbold uppercase">Booking Meeting Room | ${today}</span>
		</div>
	</div> <!-- END portlet title -->
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title="" title=""></a> 
			<a href="#portlet-config" data-toggle="modal" class="config" data-original-title="" title=""></a> 
			<a href="javascript:;" class="reload" data-original-title="" title=""></a>
			<a href="javascript:;" class="remove" data-original-title="" title=""></a>
		</div>
		<div class="row " style="margin-left: 45px; margin-right: 5px;padding-bottom: 15px; padding-top: 15px; text-align: center;">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-4 portlet light bordered" id="todaybox" style="margin-right: 50px;">
				<div class="portlet light">
					<div class="portlet-title">
						<div class="caption">
							<span class="caption-subject bold uppercase">Today</span>
							<span class="caption-helper" style="margin-left: 7px;">meeting</span>
						</div>
					</div>
					<div class="portlet-body">
						<div class="dashboard-stat dashboard-stat-v2 red-intense">
							<div class="visual">
								<i class="fa fa-users"></i>
							</div>
							<div class="details" style="font-size:24px;color:#ffffff;padding-top:47px;margin-right:40px;">
								<span id="meeting_box" style="margin-left: 5px;"></span>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-7 portlet light bordered">
				<div class="portlet light">
					<div class="portlet-title">
						<div class="caption">
							<span class="caption-subject bold uppercase">Coming soon</span>
							<span class="caption-helper" style="margin-left: 7px;">meeting</span>
						</div>
					</div>
					<div class="portlet-body">
						<div class="col-md-4" style="margin-bottom: 39px;">
							<div class="dashboard-stat dashboard-stat-v2 yellow-casablanca">
								<div class="visual">
									<i class="fa fa-users"></i>
								</div>
								<div class="details" style="font-size:24px;color:#ffffff;padding-top:45px;padding-left:25px;">
									<span id="meeting_box1"></span>
								</div>
							</div>
						</div>
						<div class="col-md-4" style="margin-bottom: 39px;">
							<div class="dashboard-stat dashboard-stat-v2 yellow-saffron">
								<div class="visual">
									<i class="fa fa-users"></i>
								</div>
								<div class="details" style="font-size:24px;color:#ffffff;padding-top:45px;padding-left:25px;">
									<span id="meeting_box2" ></span>
								</div>
							</div>
						</div>
						<div class="col-md-4" style="margin-bottom: 39px;">
							<div class="dashboard-stat dashboard-stat-v2 green-haze">
								<div class="visual">
									<i class="fa fa-users"></i>
								</div>
								<div class="details" style="font-size:24px;color:#ffffff;padding-top:45px;padding-left:25px;">
									<span id="meeting_box3" ></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div> <!-- END row -->
		
		
		<div class="portlet-body">
			<div class="portlet-body">
				<div class="row">
					<div class="col-md-12">
						<div class="portlet light portlet-fit bordered calendar">
							<div class="portlet-title">
								<div class="caption">
									<i class=" icon-layers font-green"></i>
									<span class="caption-subject font-green sbold uppercase">Meeting Calendar</span>
								</div>
							</div>
							<!-- CALENDAR -->
							<div class="portlet-body">
								<div class="row">
									<div class="col-md-12 col-sm-12">
										<div class="calendar" id="calendar"> </div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- END portlet body -->
</div> <!-- END portlet bordered -->

<script>
$("tr:not(:first)").each(function (index ) {
	$(this).css('animation-delay',index *0.01 +'s');
}); 

								
</script>

<script type="text/javascript">
$(document).ready(function() {
	$('#calendar').fullCalendar();
	
		
});
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
        	var room_name = [];
        	var name = [];
        	var reserver = [];
        	var room_id = [];
        	var events1 = [];
        	var mycolor = ['red', 'purple'];
        	
        	<c:forEach var="meeting" items="${meetinglist}">
	        	var idmeeting = '${meeting.idmeeting}';
	        	var text = '${meeting.date}';
	        	var text1 = '${meeting.time_start}';
	        	var text2 = '${meeting.time_end}';
	        	var user_reserve = '${meeting.user_reserve}';
	        	var idroom = '${meeting.idroom}';
	        	var room = '${meeting.room_name}';
	        	
	        	var date1 = text.substring(0, 10);
	        	var start1 = text1.substring(0, 5);
	        	var end1 = text2.substring(0, 5);
	        	var timefull = start1 + " - " + end1;
	        	
	        	var date2 = new Date(date1);
	        	
	        	id.push(idroom);
	        	meeting_date.push(date2);
	        	time_start.push(start1);
	        	time_end.push(end1);
	        	name.push(timefull);
	        	reserver.push(user_reserve);
	        	room_name.push(room);
	        	    	
        	</c:forEach>

        	window.localStorage.setItem('meeting', JSON.stringify(meeting_date));
        	
        	var x;
        	for(x in meeting_date){
        		
        		events1.push({
        				id:id[x],
        				title: 'Room '+id[x] + ' : ' + room_name[x] ,
        				start: new Date(meeting_date[x].getFullYear(),
        						meeting_date[x].getMonth(),
        						meeting_date[x].getDate()),
        				end: new Date(meeting_date[x].getFullYear(),
        						meeting_date[x].getMonth(),
        						meeting_date[x].getDate() + 1 ),
        			backgroundColor: App.getBrandColor('purple'),
        			description: name[x] + '<br>' +'Reserver : ' + reserver[x],
         			className: 'meeting',
        			allDay: true,
        		});
        	}
        	myevent = events1;
            var date = new Date();
            var d = date.getDate();
            var m = date.getMonth();
            var y = date.getFullYear();
            var id = id[x];
            
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
                    var events = $('#calendar').fullCalendar('clientEvents');

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
                        content: '<b>' +$.fullCalendar.formatRange(moment1, moment2 -1 , 'D MMMM YYYY') + "</b><br/>"
                        	+ "<p style=\"max-width:500px;word-wrap:break-word;margin-bottom:50px;\">  "+ calEvent.description + " <br/>"
                        
                       		+ "</p>",                 
                        trigger: 'hover'

                	});
                	
					
                	element.find(".fc-title").css('font-weight', 'inherit');
                    element.find(".fc-title").prepend("<i class='fa fa-users' style='margin:5px;' ></i>");
                    
                    element.find(".fc-content").on('click',function() {
/*                     	document.location = "holiday_edit_calendar?flag=0&id=" + calEvent.id ;                     	  
 */						alert("Hello !");

                    });

                },
                dayClick: function(date, jsEvent, view){
                	var events = $('#calendar').fullCalendar('clientEvents');
                	for (var i = 0; i < events.length; i++) {
                		if (moment(date).isSame(moment(events[i].start))) { // cannot click if have event
                			document.location = "Select_Room?flag=0&date_cal=" + date.format("YYYY-MM-DD");
                			console.log("date_cal="+date.format("YYYY-MM-DD"));
                		
                			break;
                			
                        } else if (i == events.length - 1) { //can click is it no event
                        	document.location = "Select_Room?flag=0&date_cal=" + date.format("YYYY-MM-DD");
                        	console.log("date_cal="+date.format("YYYY-MM-DD"));

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
					var mycolor =['purple'];
					for(i in obj.id) {
						var meeting_date = new Date(obj.start[i]);
						events2.push({
							id: obj.id[i],
							title: obj.title[i],
							start: new Date(meeting_date.getFullYear(),meeting_date.getMonth(),meeting_date.getDate()),
							end: new Date(end_date.getFullYear(),end_date.getMonth(),end_date.getDate() + 1 ),							  					 
							allDay: true,
 							className: 'meeting', 
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
<script>
//function for box at meeting calendar
	//Date Now
	var today = '${today}';
	var meeting = JSON.parse(window.localStorage.getItem('meeting'));
	
	var daynow = meeting.filter(element => element.includes(today));
	var a = daynow.toString();
	var format = a.substring(0, 10);
	var now = moment(format).format('DD-MM-YYYY');
	
	if (now == "Invalid date"){
		document.getElementById("meeting_box").innerHTML = " ";
		//Find meeting event next from current date
		console.log(today);
		var meetingday = meeting.find(element => element > today);
		var format1 = meetingday.substring(0, 10);
		var meeting_next = moment(format1).format('DD-MM-YYYY');
		document.getElementById("meeting_box1").innerHTML = meeting_next;
		
		//Find meeting event next to ...
		meetingday1 = meeting.find(element => element > meetingday);
		var format2 = meetingday1.substring(0, 10);
		var meeting_next1 = moment(format2).format('DD-MM-YYYY');
		document.getElementById("meeting_box2").innerHTML = meeting_next1;
		
		meetingday2 = meeting.find(element => element > meetingday1);
		var format3 = meetingday2.substring(0, 10);
		var meeting_next2 = moment(format3).format('DD-MM-YYYY');
		document.getElementById("meeting_box3").innerHTML = meeting_next2;
		
	} else {
		document.getElementById("meeting_box").innerHTML = now;
		
		//Find meeting event next from current date
		console.log(today);
		var meetingday = meeting.find(element => element > daynow);
		var format1 = meetingday.substring(0, 10);
		var meeting_next = moment(format1).format('DD-MM-YYYY');
		document.getElementById("meeting_box1").innerHTML = meeting_next;
	
		//Find meeting event next to ...
		meetingday1 = meeting.find(element => element > meetingday);
		var format2 = meetingday1.substring(0, 10);
		var meeting_next1 = moment(format2).format('DD-MM-YYYY');
		document.getElementById("meeting_box2").innerHTML = meeting_next1;
		
		meetingday2 = meeting.find(element => element > meetingday1);
		var format3 = meetingday2.substring(0, 10);
		var meeting_next2 = moment(format3).format('DD-MM-YYYY');
		document.getElementById("meeting_box3").innerHTML = meeting_next2;
	}

</script>