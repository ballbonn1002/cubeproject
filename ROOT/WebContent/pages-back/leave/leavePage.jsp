<%@page import="org.apache.velocity.runtime.directive.Foreach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="now" value="<%=new java.util.Date()%>" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy" var="date_now" />
<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy" var="lastday"/>
<script
	src="../assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>

<script
	src="../assets/global/plugins/bootstrap/js/bootstrap.js"></script>

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
<!-- <script src="https://code.jquery.com/jquery-1.9.1.min.js"></script> -->
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
<link 
	href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" 
	rel="stylesheet" type="text/css"/>
<link
	href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
<script
	src="../assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"
	type="text/javascript"></script>
	
<div class="portlet light">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-paperclip font-red"></i>
			<span id="title" class="caption-subject font-red sbold uppercase">Leave application form ( ${action} )</span>
			<input type="hidden" name="actionpage" id="actionpage" value="${action}">
		</div>
		<div class="actions">
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body form">
		<!-- BEGIN FORM-->
		<form method="post" class="form-horizontal">
			<div class="form-body">
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-2">Name</label>
				</div>
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-6">
						<select id="user" name="user" class="form-control select2 select2me" required>
							<option></option>
							<optgroup id='u_enable' label="Enable"></optgroup>
							<optgroup id='u_disable' label="Disable"></optgroup>
                        </select>
	                    <input hidden name="user_hidden" id="user_hidden" type="text">
					</div>
				</div>

				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-2">Type of leave :</label>
				</div>
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-6">
						<div id="leaveTypes" class="md-radio-inline">
						<div id="leaveTypes_hidden" class="md-radio-inline">
						</div>
						</div>
					</div>
				</div>
				
				<!-- 				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-3"><label style="color:red;">*</label>Duration :</label>
					<div class="col-md-6">
						<div class="input-group input-large date-picker input-daterange"
							data-date-format="dd-mm-yyyy">
							<input type="text" class="form-control" id="date_from" name="from" required>
								<input  class="hide" name="from_hidden" id="date_from_hidden" type="text" hidden>
							<span class="input-group-addon"> to </span>
							<input type="text" class="form-control" id="date_to" name="to" required>
								<input class="hide" name="to_hidden" id="date_to_hidden" type="text" hidden>
						</div>
					</div>
					</div> -->
				
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-3">Start Date</label>
					<label class="col-md-3">Start Time</label>
				</div>
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-3">
						<div class="input-group date-picker input-daterange"
							data-date-format="dd-mm-yyyy">
							<input type="text" class="form-control" id="date_from" name="from" required>
								<input  class="hide" name="from_hidden" id="date_from_hidden" type="text" hidden>
						</div>
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control timepicker timepicker-24" id="time_from" name="time_from">
							<input class="hide" id="time_from_hidden" name="time_from_hidden" hidden>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-3">End Date</label>
					<label class="col-md-3">End Time</label>
				</div>
				<div class="form-group">
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<div class="input-group date-picker input-daterange"
							data-date-format="dd-mm-yyyy">
							<input type="text" class="form-control" id="date_to" name="to" required>
								<input class="hide" name="to_hidden" id="date_to_hidden" type="text" hidden>
						</div>
					</div>
					<div class="col-md-3">
						<input type="text" class="form-control timepicker timepicker-24" id="time_to" name="time_to">
							<input class="hide" id="time_to_hidden" name="time_to_hidden" hidden>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-2">Day</label>
					<label class="col-md-2">Hours</label>
				</div>
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-2">
						<input type="text" class="form-control" id="amount" name="amount" min="1" max="1000" maxlength="3" required>
						<input hidden class="hide" name="amount_hidden" id="amount_hidden" type="text">
					</div>
					<div class="col-md-2">
						<input type="text" class="form-control" id="amount_sub" name="amount_sub" value="0"
							min="1" max="1000" maxlength="3" onchange="check()" required>
						<input hidden class="hide" name="amount_sub_hidden" id="amount_sub_hidden" type="text">
					</div>
				</div>

				<div class="form-group">
				<div class="col-md-3 control-label"></div>
					<label class="col-md-3">Description :</label>
				</div>
				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-6">
						<textarea style="word-break: break-all; white-space: normal;" required
							maxlength="1024" class="form-control" rows="6" name="description" id="description" onkeyup='check_char(this)'></textarea>
							<input hidden class="hide" name="description_hidden" id="description_hidden" type="text">
						<div class="form-control-focus"></div>
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 control-label">Approvers :</label>
					<div class="col-md-6">
						<select id="approver" name="approver" class="form-control select2 select2me" required>
							<option></option>
                        </select>
                        <input hidden name="approver_hidden" id="approver_hidden" type="text">
					</div>
				</div>

				<div class="form-group">
					<label class="col-md-3 control-label">Status :</label>
					<div class="col-md-6">
						<select class="form-control" id='status' name='status' required>
							<option value=0>Wait for approve</option>
							<option value=1>Approved</option>
							<option value=2>Reject</option>
						</select>
						<input hidden name="status_hidden" id="status_hidden" type="text">
					</div>
				</div>

<!-- 				<div class="form-group">
					<label class="col-md-3 control-label">Reason :</label>
					<div class="col-md-6">
						<textarea class="form-control" name="reason" id="reason" rows="3" maxlength="1024" onkeyup='check_char(this)'></textarea>
							<input hidden class="hide" name="reason_hidden" id="reason_hidden" type="text">
						<div class="form-control-focus"></div>
					</div>
				</div> -->

<!--				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<label class="col-md-3">Attachment (image)</label>
				</div>
 				<div class="form-group">
					<div class="col-md-3 control-label"></div>
					<div class="col-md-3 fileinput fileinput-new" data-provides="fileinput">
						<span class="btn green btn-file" id="insert_file">
							<span class="fileinput-new"> Select file </span>
							<span class="fileinput-exists"> Change </span>
							<input type="file" name="fileUpload" onchange="checkFile(this)">
						</span>
						<span class="fileinput-filename" id="file"></span>
						<a href="javascript:;" class="close fileinput-exists" data-dismiss="fileinput"></a>
					</div>
				</div> -->
							
			</div>
			<div class="form-actions">
				<div class="row">
					<div class="col-xs-12" style="text-align: center;">
						<button type="submit" class="btn btn-sm blue-soft"  id="btn_submit"><i class="fa fa-send-o"></i> Submit</button>
						<button type="reset" class="btn btn-sm red-intense" id="btn_cancel"><i class="fa fa-close"></i> Cancel</button>
					</div>
				</div>
			</div>
		</form>
		<!-- END FORM-->
	</div>
</div>

<!-- <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script> -->
<script>
function check_char(elm){
	
	if(elm.value.match(/[''""]/) && elm.value.length>0){
		swal(
				{
					title : "ERROR",
					text : "ห้ามใส่อักขระพิเศษ",
					type : "error"
				},
				function() {
					
				});
	
	}
}
/* $(document).ready(function() {

} */

</script>
<script>
	var toISODate = (date) => {
		return date.substring(6,10)+"-"+date.substring(3,5)+"-"+date.substring(0,2);
	}
	var toTimestamp = (date) => {
		return Date.parse(toISODate(date));
	}
	var toDisplayDate = (date) => {
		return date.toLocaleDateString('en-GB').replace('/','-').replace("/",'-');
	}
</script>

<!-- Start leaveType Radio -->
<c:if test="${leaveType != null}">
	<script>
		$(function(){
			var leaveTypes;
			leaveTypes = JSON.parse('${leaveType}');
			for(let i=0; i<leaveTypes.length; i++){
				if(leaveTypes[i].id != '4' && leaveTypes[i].id != '9'){
					let radio =	'<label class="mt-radio col-md-6">'
							+'<input type="radio" name="leaveType" onclick="checkamount()" id="lt_'+leaveTypes[i].id+'" value="'+leaveTypes[i].id+'" required>'+leaveTypes[i].name
							+'<span></span></label>'
							+'<input hidden class="hide" name="leaveType_hidden" id="lt_hidden" type="text"';
					$('#leaveTypes').append(radio);
				}
			}

			 $('input:radio[name="leaveType"]').change(function(){
				if( $(this).val() == '6' ){
					let lastday = '${lastday}';
					let lastday_ts = toTimestamp(lastday);
					let selectedDateTo = $('#date_to').val();
					let selectedDateTo_ts = toTimestamp(selectedDateTo);
					$('#date_to').datepicker('setEndDate',lastday);
					if(selectedDateTo_ts > lastday_ts){
						$('#date_to').val(lastday);
					}
				
				else{
					$('#date_to').datepicker('setEndDate','');
				}
				}
			} );
		});
	</script>
</c:if>
<!-- End leaveType Radio -->

<c:if test="${leave == null}"><c:set var="leave" value="''"/></c:if>
<script>
    $(()=>{
        var userList = ${userList};
        var action = '${action}';
        var user;
        var manager;
        if(action == 'Edit'){
            var leave = ${leave};
            user = leave.userId;
            manager = leave.apprUserId;
            department = leave.leaveStatusId.toString();
            $('form').attr('action','LeaveEdit_Do');
            
        } else {
            user = "${onlineUser.id}";
            manager = "${onlineUser.managerId}";
            $('form').attr('action','LeaveAdd_Do');
        }
        user = user.toLowerCase();
        manager = manager.toLowerCase();

        /* Date from leave calendar */
        if('${date}' != null && action=='Add'){
            $('#date_from').val('${date}');
			$('#date_to').val('${date}');
            $('#amount').val(1);
            
            /* Set time format from Add Leave */
            if('${time}' != null){
    			$('.timepicker').timepicker({
    				showMeridian: false
    			});
    			$('.timepicker').timepicker('setTime', "");
            }
            
            
            /* Start amount of day from Add Leave */
            var holiday;
			var holidays = [];
			holiday = JSON.parse('${holiday}');

			for(let i=0;i<holiday.length;i++){
				let start = new Date(holiday[i].start);
				let end = new Date(holiday[i].end);
				for(let j=start; j<=end; j.setDate(j.getDate()+1)){
					holidays.push(toDisplayDate(j));
				}
			}

  			$('.input-daterange').change(function(){
				let amount = 0;
				let holiday_count = 0;
				let from = new Date( toISODate( $('#date_from').val() ) );
				let to = new Date( toISODate( $('#date_to').val() ) );
				if(from == to){
					amount = 1;
				}
				if(from < to){
					amount = ((to-from)/86400000)+1;
					for(let i=from; i<to; i.setDate(i.getDate()+1)){
						for(let j=0; j<holidays.length; j++){
							let holiday_ts = toTimestamp(holidays[j]);
							if(i.getTime() == holiday_ts){
								holiday_count++;
							}
						}
						if(i.getDay() == '0' || i.getDay() == '6'){
							holiday_count++;
						}
					}
					amount -= holiday_count;
				}
				else{
					amount = 1;
				}
				$('#amount').val(amount);
			}); 
  			/* End amount of day from Add Leave */
  			
        }

        /* Start Applicant/Approver List */
        for(let i=0; i<userList.length; i++){
            let id = userList[i].id.toLowerCase();
            let name = userList[i].name;
            let status = userList[i].enable;
            let option = '<option value="'+id+'">'+name+'</option>';

            if(status == '1'){
                $('#u_enable').append(option);
                $('#approver').append(option);
            }
            else{
                $('#u_disable').append(option);
            }
        }
        $('#user').val(user);
        $('#user').trigger('change');
        $('#approver').val(manager);
        $('#approver').trigger('change');
        $('#user').change(()=>{
            let val = $('#user').val();
            for(let i=0; i<userList.length; i++){
                let user = userList[i].id.toLowerCase();
                let mng = userList[i].manager;
                if( user == val ){
                    $('#approver').val(mng.toLowerCase());
                    $('#approver').trigger('change');
                }
            }
        })
        /* End Applicant/Approver List */

        /* Start Leave Edit init */
        if(leave != null){
			var noDay = leave.noDay.toString().split(".");
			var amount = noDay[0];
			var amount_sub = (leave.noDay%1)*8;
			if(isNaN(amount_sub)){ amount_sub = 0;}
			$('#date_from').val(toDisplayDate(new Date(leave.startDate)));
			$('#date_to').val(toDisplayDate(new Date(leave.endDate)));
			$('#time_from').val(leave.startTime);
			$('#time_to').val(leave.endTime);
			$('#amount').val(amount);
			$('#amount_sub').val(amount_sub);
			$('#description').html(leave.description);
			$('#status').val(leave.leaveStatusId);
		/* 	$('#reason').html(leave.reason); */
			$('#lt_'+leave.leaveTypeId).prop('checked','checked');
			if(leave.halfDay != 0) { $('#hd_'+leave.halfDay).prop('checked','checked'); }
        
        }
        /* End Leave Edit init */
    })
</script>



<!-- Start check authority -->
<c:if test="${!userAuthority.contains('leave.approve')}">
	<script>
        $(()=>{
        	if(department == '0'){
        		$('#status').attr('disabled',true);
        		$('#status_hidden').val($('#status').val());
        		$('#status').change(() => {
 				   $('#status_hidden').val($('#status').val());
 				 });
        	}
        	if(department == '1'){
        		$('#lt_').attr('disabled',true);
         		$('#lt_hidden').val($('#lt_').val());
         		$('#lt_').change(() => {
 				   $('#lt_hidden').val($('#lt_').val());
 				  $('#leaveTypes_hidden').append(radio);
 			    });
        		 
        		$('#date_from').attr('disabled',true);
        		$('#date_from_hidden').val($('#date_from').val());
        		$('#date_from').change(() => {
				    $('#date_from_hidden').val($('#date_from').val());
			    });
        		
        		$('#date_to').attr('disabled',true);
        		$('#date_to_hidden').val($('#date_to').val());
			    $('#date_to').change(() => {
				    $('#date_to_hidden').val($('#date_to').val());
			    });
        		
			    $('#time_from').attr('disabled',true);
			    $('#time_from_hidden').val($('#time_from_hidden').val());
			    
        		$('#amount').attr('disabled',true);
        		$('#amount_hidden').val($('#amount').val());
			    $('#amount').change(() => {
				    $('#amount_hidden').val($('#amount').val());
			    });
        		
        		$('#amount_sub').attr('disabled',true);
        		$('#amount_sub_hidden').val($('#amount_sub').val());
			    $('#amount_sub').change(() => {
				    $('#amount_sub_hidden').val($('#amount_sub').val());
			    });
			    
			    $('#hd_1').attr('disabled',true);
			    $('#hd_1_hidden').val($('#hd_1').val());
			    $('#hd_1').change(() => {
				    $('#hd_1_hidden').val($('#hd_1').val());
			    });
			    
			    $('#hd_2').attr('disabled',true);
			    $('#hd_2_hidden').val($('#hd_2').val());
			    $('#hd_2').change(() => {
				    $('#hd_2_hidden').val($('#hd_2').val());
			    });
        		
        		$('#description').attr('disabled',true);
        		$('#description_hidden').val($('#description').val());
			    $('#description').change(() => {
				    $('#description_hidden').val($('#description').val());
			    });
        		
	            $('#status').attr('disabled',true);
			    $('#status_hidden').val($('#status').val());
			    $('#status').change(() => {
				    $('#status_hidden').val($('#status').val());
			    });
			    
/* 			    $('#reason').attr('disabled',true);
			    $('#reason_hidden').val($('#reason').val());
			    $('#reason').change(() => {
				    $('#reason_hidden').val($('#reason').val());
			    }); */
			    
			    $('#btn_submit').attr('disabled',true);
			    $('#btn_cancel').attr('disabled',true);
        	}
        	if(department == '2'){
       		 
         		$('#lt_').attr('disabled',true);
         		$('#lt_hidden').val($('#lt_').val());
         		$('#lt_').change(() => {
 				   $('#lt_hidden').val($('#lt_').val());
 				  $('#leaveTypes_hidden').append(radio);
 			    });
         		
        		$('#date_from').attr('disabled',true);
        		$('#date_from_hidden').val($('#date_from').val());
        		$('#date_from').change(() => {
				    $('#date_from_hidden').val($('#date_from').val());
			    });
        		
        		$('#date_to').attr('disabled',true);
        		$('#date_to_hidden').val($('#date_to').val());
			    $('#date_to').change(() => {
				    $('#date_to_hidden').val($('#date_to').val());
			    });
        		
        		$('#amount').attr('disabled',true);
        		$('#amount_hidden').val($('#amount').val());
			    $('#amount').change(() => {
				    $('#amount_hidden').val($('#amount').val());
			    });
        		
        		$('#amount_sub').attr('disabled',true);
        		$('#amount_sub_hidden').val($('#amount_sub').val());
			    $('#amount_sub').change(() => {
				    $('#amount_sub_hidden').val($('#amount_sub').val());
			    });
        		
			    $('#hd_1').attr('disabled',true);
			    $('#hd_1_hidden').val($('#hd_1').val());
			    $('#hd_1').change(() => {
				    $('#hd_1_hidden').val($('#hd_1').val());
			    });
			    
			    $('#hd_2').attr('disabled',true);
			    $('#hd_2_hidden').val($('#hd_2').val());
			    $('#hd_2').change(() => {
				    $('#hd_2_hidden').val($('#hd_2').val());
			    });
			    
        		$('#description').attr('disabled',true);
        		$('#description_hidden').val($('#description').val());
			    $('#description').change(() => {
				    $('#description_hidden').val($('#description').val());
			    });
        		
	            $('#status').attr('disabled',true);
			    $('#status_hidden').val($('#status').val());
			    $('#status').change(() => {
				    $('#status_hidden').val($('#status').val());
			    });
			    
/* 			    $('#reason').attr('disabled',true);
			    $('#reason_hidden').val($('#reason').val());
			    $('#reason').change(() => {
				    $('#reason_hidden').val($('#reason').val());
			    }); */
			    
			    $('#btn_submit').attr('disabled',true);
			    $('#btn_cancel').attr('disabled',true);
        	}
        	

        })
	</script>
</c:if>
<c:if test="${!userAuthority.contains('leave.viewall')}">
	<script>
        $(()=>{
            $('#user').attr('disabled',true);
		    $('#user_hidden').val($('#user').val());
		    $('#user').change(() => { $('#user_hidden').val($('#user').val()); });

            $('#approver').attr('disabled',true);
		    $('#approver_hidden').val($('#approver').val());
		    $('#approver').change(() => { $('#approver_hidden').val($('#approver').val()); });
        })
	</script>
</c:if>
<!-- End check authority -->

<!-- Start datepicker -->

<c:if test="${holiday!=null}">
	<script>
		$(function(){
			var holiday;
			var holidays = [];
			holiday = JSON.parse('${holiday}');

			for(let i=0;i<holiday.length;i++){
				let start = new Date(holiday[i].start);
				let end = new Date(holiday[i].end);
				for(let j=start; j<=end; j.setDate(j.getDate()+1)){
					holidays.push(toDisplayDate(j));
				}
			}
		
			$('#date_from').datepicker({
				format: 'dd-mm-yyyy',
				daysOfWeekDisabled: [0,6],
				datesDisabled: holidays ,
				autoclose: true, 
			});
			$('#date_to').datepicker({
				format: 'dd-mm-yyyy',
				daysOfWeekDisabled: [0,6],
				datesDisabled: holidays ,
				autoclose: true, 
			});
			
			/* amount of day */
  			$('#date_from').change(function(){
				let amount = 0;
				let amount_sub = $('#amount_sub').val();
				let holiday_count = 0;
				let from = new Date( toISODate( $('#date_from').val() ) );
				let to = new Date( toISODate( $('#date_to').val() ) );

   				if(from == to){
					amount = 1;
				} 
				if(from < to){
					amount = ((to-from)/86400000)+1;
					for(let i=from; i<to; i.setDate(i.getDate()+1)){
						for(let j=0; j<holidays.length; j++){
							let holiday_ts = toTimestamp(holidays[j]);
							if(i.getTime() == holiday_ts){
								holiday_count++;
							}
						}
						if(i.getDay() == '0' || i.getDay() == '6'){
							holiday_count++;
						}
					}
					amount -= holiday_count;
				}
 				else{
 					 amount = 1; 
				} 
				$('#amount').val(amount);
			});  
  			
  			$('#date_to').change(function(){
				let amount = 0;
				let amount_sub = $('#amount_sub').val();
				let holiday_count = 0;
				let from = new Date( toISODate( $('#date_from').val() ) );
				let to = new Date( toISODate( $('#date_to').val() ) );

  				if(from == to){
					amount = 1;
				}  
				if(from < to){
					amount = ((to-from)/86400000)+1;
					for(let i=from; i<to; i.setDate(i.getDate()+1)){
						for(let j=0; j<holidays.length; j++){
							let holiday_ts = toTimestamp(holidays[j]);
							if(i.getTime() == holiday_ts){
								holiday_count++;
							}
						}
						if(i.getDay() == '0' || i.getDay() == '6'){
							holiday_count++;
						}
					}
					amount -= holiday_count;
				}
 				else{
 					 amount = 1; 
				} 
				$('#amount').val(amount);
			});
		});
	</script>
</c:if>
<!-- End datepicker -->

<!--  alert leave type -->
<script>
function checkamount() {
	console.log("check");
	if (document.getElementById('amount').value == "0"){
		alert("Amount of day going to change to 1 day \n'Please Check Amount of Day Again'");
	}
}
</script>
<script>
console.log("ee");
console.log("add page");
/* 	function checkFile(inputFile) {
		console.log(inputFile);
		var file = inputFile.value;
	} */
	
	function send() {	
		var name = document.getElementById('user').value;
		var typeleave =  $("input[name='leaveType']:checked").val(); 
		var from = document.getElementById('date_from').value;
		var to = document.getElementById('date_to').value;
		var time_from = document.getElementById('time_from').value;
		var time_to = document.getElementById('time_to').value;
		var des = document.getElementById('description').value;
		var amount = document.getElementById('amount').value;
		var amount_sub = document.getElementById('amount_sub').value;
		var actionpage = document.getElementById('actionpage').value;
		console.log(name);
		console.log(typeleave);
		console.log(from);
		console.log(to);
		console.log(time_from);
		console.log(time_to);
		console.log(des);
		console.log(amount);
		console.log(amount_sub);
		console.log(actionpage);
		debugger;
		var leave_1 = parseFloat(${leave_1}),
		amountFlo = parseFloat(amount),
		amount_subFlo = parseFloat(amount_sub/8), 
		all =amountFlo+(amount_subFlo), 
			y = ${quotaThisYear},
			type1 = "${type_1}";
		
		
		if( typeleave == "1" && all > y){
			
			
			swal({
				  title: 'ต้องการเพิ่มวันลากิจ/พักร้อนใช่ไหม?',
				  text: "วันลากิจ/ลาพักร้อนของคุณหมดแล้ว!!",
				  type: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#3085d6',
				  cancelButtonColor: '#d33',
				  confirmButtonText: 'Yes!'
				},function (inputValue) {
			        if (inputValue == false){
			        	//console.log("canceled");
			        	return false;
			        	}
			        if (inputValue == true) {
			        	$
						.ajax({
							url : "sendmailleave",
							method : "POST",
							type : "JSON",
							data : {
								"name" : name,
								"typeleave" : typeleave,
								"from" : from,
								"to" : to,
								"time_from" : time_from,
								"time_to" : time_to,
								"des" : des,
								"amount" : amount,
								"amount_sub" : amount_sub,
								"actionpage" : actionpage,
							},
							success : function(data) {
								
							}
						
						}) 
			          
			        }
			      }
				
			);
			
		
	}else
		
 		$
					.ajax({
						 url : "sendmailleave",
						method : "POST",
						type : "JSON",
						data : {
							"name" : name,
							"typeleave" : typeleave,
							"from" : from,
							"to" : to,
							"time_from" : time_from,
							"time_to" : time_to,
							"des" : des,
							"amount" : amount,
							"amount_sub" : amount_sub,
							"actionpage" : actionpage,
						},
						success : function(data) {
							
						}

					}) 
		}
</script>
<script>
document.getElementById("user").onchange = function(){
	var value = document.getElementById("user").value;
	console.log(value);
	$.ajax({
		url : "findValidTime.action",
		method : "POST",
		data : "user="+ value,
			success : function(data) {
			var obj = JSON.parse(data);
			console.log(obj);
			localStorage.setItem("stime", obj.stime[0]);
			localStorage.setItem("etime", obj.etime[0]);
		} 
	});
};
		
var x = 0;
$('#time_to').focus(function(){
	$(document).click((event) => { 
		if (!$(event.target).closest('#time_to').length) {                                             
			
			time_from = $('#time_from').val();
	 		time_to = $('#time_to').val();
			
			var timefrom = parseFloat(time_from.replace(":", "."));
			var timeto = parseFloat(time_to.replace(":", "."));
			var hourtime = timeto-timefrom;
			
			var from_arr = timefrom.toString().split(".");
			var hour_f = from_arr[0];
			var min_f = from_arr[1];
			
			var amount1 = $('#amount').val();
			var amountsub1 = $('#amount_sub').val();
			var all1 = parseFloat(amount1)+parseFloat(amountsub1);
		}
		if(hourtime >= 8){
			hourtime = 0;
			if(x = 0){
				$('#amount_sub').val(hourtime);
				x = 1;
			}
		}
		else if(hourtime < 8){
			hourtime -= 1;
			if(x == 0){
				$('#amount_sub').val(hourtime);
				x = 1;
			}
		}  
 });
});
function check(){
var amount_sub = $('#amount_sub').val();
if(amount_sub < 0 || amount_sub > 7){
	swal({
		title: "Warning!",
		text: "You can choose to enter ' Hour ' 0-7 only.",
		type: "warning",
		confirmButtonClass: 'btn-warning',
		confirmButtonText: 'OK'
	},  function (inputValue) {
		if (inputValue == true) {
			$('#amount_sub').val(0);
			return false;
		}
	});
		}
		
	}
	
	
	
	
</script>
<style>
#red{
	display:none;
	
	color:red;
}
</style>