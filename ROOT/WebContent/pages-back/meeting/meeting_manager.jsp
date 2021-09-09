<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"
	var="date_now" />
<fmt:formatDate type="date" value="${now}" pattern="31-03-yyyy"
	var="lastday" />
<script src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>

<script src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/moment.min.js"
	type="text/javascript"></script>


<script src="sweetalert2.all.min.js"></script>
<!-- Optional: include a polyfill for ES6 Promises for IE11 -->
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
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
<div class="portlet light bordered">


	<div>
		<div class="caption">
			<i class="fa fa-calendar-check-o font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Meeting
				Manager</span>
		</div>

		<div class="portlet light">
			<main class="col py-5">
				<div class="row">
					<div class="col">
						<ul class="nav nav-tabs small" role="tablist">
							<li class="nav-item"><a
								class="nav-link text-uppercase active" data-toggle="tab"
								href="#tab1" role="tab">Home</a></li>
							<li class="nav-item ml-auto"><a
								class="nav-link text-uppercase" data-toggle="tab" href="#tab2"
								role="tab">List</a></li>
							<li class="nav-item"><a class="nav-link text-uppercase"
								data-toggle="tab" href="#tab3" role="tab">Table</a></li>
						</ul>
						<div class="tab-content py-3">
							<div class="tab-pane active" id="tab1" role="tabpanel">
								<div class="portlet-body">
									<div class="row">
										<div class="col-md-12">
											<div class="portlet light portlet-fit bordered calendar">
												<div class="portlet-title">
													<div class="caption">
														<i class=" icon-layers font-green"></i> <span
															class="caption-subject font-green sbold uppercase">Meeting
															List</span>
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
							<div class="tab-pane" id="tab2" role="tabpanel">
								<h1>2</h1>

							</div>
							<div class="tab-pane" id="tab3" role="tabpanel">
								<h1>3</h1>
							</div>
						</div>
					</div>
				</div>
			</main>



		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		// page is now ready, initialize the calendar...
		$('#calendar').fullCalendar();

	});
</script>
<script>
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
            var text14 = '${holiday.description}';
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
           
      		// Add Expense 
      		
            //Add Holiday Event
           
            var start_date = [];
            var end_date = [];
            var name =[];
            var to = [];
            var events = [];
            var des = [];
            var id=[];
            var timeinit=[];
            var exittime=[];
            var id_exp = [];
            var money =[];
            var mytype = [];
            var des_n = [];
            var status = [];
            var mymoney =[];
            var myclass = [];
            var mycolor =['red','grey','blue','yellow','green','purple'];
            
         <c:forEach  var="type" items="${expSearchList}">
  	       var text5 =  '${type.id}';
  	  
  	       id.push(text5);
  	      
  		     switch('${type.status}'){//กำหนดสีของประเภท
  		     case 'P': mytype.push('#2A65A8'); status.push('Paid'); myclass.push('P'); break;
  		     case 'R': mytype.push('#E65362'); status.push('Reject'); myclass.push('R'); break;
  		     case 'A': mytype.push('#66CCCC');status.push('Approve'); myclass.push('A'); break;  
  		     default :  mytype.push('#CC9900'); status.push('Waitting for approve'); myclass.push('W');
  		     }
  		 </c:forEach>
  		<c:forEach var="expSearchList" items="${expSearchList}">
  			var text4='${expSearchList.description}';
  			var text = '${expSearchList.time_check_in}';
            var text2 = '${expSearchList.time_check_out}';
            var text51 = '${expSearchList.id}';
            
            <c:set var = "string1" value = "${expSearchList.description}"/>
            	<%pageContext.setAttribute("newline", "\r\n");%>
            <c:set var = "string2" value = "${fn:replace(string1,newline,'')}" />
           	var text7 = "${string2}";
           	
           	var text11 = text.substring(11,19);
           	var text12 = text2.substring(11,19);
            text =  text.substring(0,10);
            text2 = text2.substring(0,10);
            var date1 = new Date(text);
            var date2 = new Date(text2)
            timeinit.push(text11);
            exittime.push(text12);
            des_n.push(text7);
            start_date.push(date1);
            end_date.push(date2);
            //to.push(text2);
            var message;
			if(text4.length >11 ){
				 message = text4.substring(0,10);
				 message = message+"...";
            }else{
            	message =text4;
            }
            des.push(message);
            id_exp.push(text51);

            //var a = parseInt(text6);
            //money.push(text6);
            //mymoney.push(format2(a));
  			
  		</c:forEach>
            var x;                    
            for(x in start_date){
            	if(myclass[x] == 'W'){
                	events.push(	{
     				   id:id_exp[x],
                 	   title: des[x],
     				   start: new Date(start_date[x].getFullYear(),start_date[x].getMonth(),start_date[x].getDate()),
     				   end:new Date(end_date[x].getFullYear(),end_date[x].getMonth(),end_date[x].getDate()+1),
     				   description:"<strong>รายละเอียด :</strong> "+ des_n[x]+ "<br>&nbsp;&nbsp;<strong>from : </strong>"+ timeinit[x]+" น.<br>&nbsp;&nbsp;<strong>to : </strong>"+exittime[x]+" น.<br>&nbsp;&nbsp;<strong>Status :  </strong><u>"+ status[x]+"<u/>",
     			   backgroundColor: mytype[x],
     			   className: myclass[x],
     			    allDay: true,
     			    
     			    editable : true			   			    
     			   });
            	}

            	else{
                	events.push(	{
     				   id:id[x],
                 	   title: des[x],
     				   start: new Date(start_date[x].getFullYear(),start_date[x].getMonth(),start_date[x].getDate()),
     				   end:new Date(end_date[x].getFullYear(),end_date[x].getMonth(),end_date[x].getDate()+1),
     				  description:"<strong>รายละเอียด :</strong> "+ des_n[x]+ "<br>&nbsp;&nbsp;<strong>from :</strong> "+ timeinit[x]+" น.<br>&nbsp;&nbsp;<strong>to : </strong>"+exittime[x]+" น.<br>&nbsp;&nbsp;<strong>Status :  </strong><u>"+ status[x]+"<u/>",
     			   backgroundColor: mytype[x],
     			   className: myclass[x],
     			    allDay: true,
     			    
     			    editable : true			   			    
     			   });
            	}
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
                eventDurationEditable: false,//disable resize
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
                        + "<p style=\"max-width:500px;word-wrap:break-word;margin-bottom:50px;\"> &nbsp; "+ calEvent.description + " <br/>"
                        
                        + "</p>",   
                        trigger: 'hover'
                    });
                    if(calEvent.className == "holiday"){
                          	element.find(".fc-title").css('color', 'black');
                       }
                    
                 	if(calEvent.className == "W"){                 		
                        element.find("div.fc-content").append( "<span> <i class='fa fa-trash closeon' style='float:right;position:absolute;right:0;top:0'></i> </span>" );
                 	}  
                 	if(calEvent.className != "W" && calEvent.className != "holiday" ){
                 	   element.find(".fc-title").prepend("<i class='fa fa-search searchon' style='margin:5px;' ></i>"); 
                 	}
                 
                    element.find(".closeon").on('click',function() {                //Delete Function
                  	  if (confirm("Are you sure Delete ?")) {    
                  		  //var userid = '${userid}';
                  	    	//document.location = "timesheet_calendar_del?user_Id=" + calEvent.id+"&userId="+userid;
                  	  		document.location = "timesheet_calendar_del?id="+ calEvent.id ;
                    	}

                  });
                    element.find(".searchon").on('click',function() { //Search Function
                    	var user = "${userId}";
                    	
                        document.location	="request_form?flag=1&Id="+calEvent.id +"&user="+user ;                     	  
                    	                  });
                  
                  },
                  
                  dayClick: function(date, jsEvent, view) {
             		 var events = $('#calendar').fullCalendar('clientEvents');
                      for (var i = 0; i < events.length; i++) {
                          if (moment(date).isSame(moment(events[i].start))) {//holiday
                        	  var userid = '${userid}';
                        	  //var useradd = $('select[name=name]').val();
                        	  var useradd=document.getElementById("tempuser").value
                         	  document.location = "timesheet_form?flag=1&userId=" + userid +"&date="+date.format("DD-MM-YYYY")+"&useradd="+useradd ;
                          }
                          else if (i == events.length - 1) {
                        	  var userid = '${userid}';
                        	  //var useradd = $('select[name=name]').val();
                        	  var useradd=document.getElementById("tempuser").value
                         	  document.location = "timesheet_form?flag=1&userId=" + userid +"&date="+date.format("DD-MM-YYYY")+"&useradd="+useradd ;
                          }
                      }

             	 
                      
               },
               eventDrop: function(event, delta, revertFunc) { // ลากเพื่อเปลี่ยนวัน
             	   var datenow = event.start.format("DD-MM-YYYY");//event.id;
               	   var flipdate = datenow.split("-").reverse().join("-");
				   var timestart = flipdate;
				   var timeend = flipdate;
				   var idtimesheet = event.id;
				   var useradd=document.getElementById("tempuser").value;
				   $.ajax({
					   	url:"timesheet_update",
					   	method : "POST",
						type : "JSON",
						data :{
							"userupdate" : useradd,
							"timestartnew":timestart,
							"timeendnew" : timeend,
							"id" : idtimesheet
						},success : function(data) {
							 swal({ 
								  title: "Success",
								   text: "Saved Succcess",
								    type: "success" 
								  }
							 );
						}
				   })

             },
			 /*eventResize:function(event, delta, revertFunc) {
				 revertFunc();
				 swal({ 
					  title: "Wrong",
					   text: "Can not do this",
					    type: "error" 
					  },
					  function(){
						  revertFunc();
						  
					}
				 );
             },*/     
            /*       eventClick: function(calEvent, jsEvent, view) {
                	  if(calEvent.className != "holiday"){
                 document.location	="request_form?Id="+calEvent.id  ; 
                	  }
                  }, */

            


                 editable: true,
                eventLimit: true,
           
                events: events2
                


            });
            $('#calendar').fullCalendar( 'addEventSource',events);

               }

    };
</script>

<!-- <style>
.fc-unthemed .fc-past{
    background: red;
}
</style> -->