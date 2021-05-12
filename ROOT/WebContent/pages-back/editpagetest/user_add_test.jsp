<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="js/app-ajax.js" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />
	<style>
	.alert {
   width: 20%;
   height:10px;
   padding:0px;
   display:inline-block;  
}
.form-inline{
	width: 5%;
	height:10px;
    display:inline;  
}
	</style>
<div class="portlet light bordered">

	<div class="portlet-title">
		<div class="caption">
			<i class="icon-user font-red"></i> <span
				class="caption-subject font-red sbold uppercase">USER Add</span>
		</div>
		<div class="actions">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body form">
		<div class="portlet-title">
			<div class="tools">
				<a href="javascript:;" class="collapse" data-original-title=""
					title=""> </a> <a href="#portlet-config" data-toggle="modal"
					class="config" data-original-title="" title=""> </a> <a
					href="javascript:;" class="reload" data-original-title="" title="">
				</a> <a href="javascript:;" class="remove" data-original-title=""
					title=""> </a>
			</div>
		</div>
		<div class="portlet-body" style="margin-right: 2%; margin-left: 2%;">
			<!-- BEGIN FORM-->
			<form action="user-perform-add-test" class="form-horizontal"
				autocomplete="off" method="post">

				<div class="form-group form-lg-line-input  ">
					<div class="caption caption col-md-2">
						Login :<br>
					</div>



					<div class="caption col-md-4" >
						<input type="text" name="user.id" id="userid" class="form-control"
							maxlength="32" required>

						<!-- <div class="form-control-focus"></div> -->
					</div>
					<div>

						<div  class="form-row form-lg-line-input" >
						<div class="caption col-md-4" >
						<input type="button" value="Check available!" class="btn blue"
								onclick="ajaxCall();">
						</div>
							
						</div>

					</div>
					</div>
				<div class="form-group form-lg-line-input  " >
					<div class="caption caption col-md-2" style="margin-top: 3px;">E-Mail :</div>
					<div class="caption col-md-4"style="margin-top: 3px;" >
						<input type="email" name="user.email" class="form-control"
							maxlength="50" placeholder="">
						<div class="form-control-focus"></div>
					</div>
					<!-- <div class="caption caption col-md-2" style="margin-top: 3px;">E-Mail Password :</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<input type="password" name="user.emailPassword" id="pass"
							maxlength="32" class="form-control">
						<div class="form-control-focus"></div>
					</div> -->
					<div class="caption caption col-md-2" style="margin-top: 3px;">Phone Number :</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<input type="text" name="user.phone_num" id="phone"
							maxlength="10" class="form-control">
						<div class="form-control-focus"></div>
					</div>
					
				</div>

					
				
				<div class="form-group form-lg-line-input  ">

					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Name :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;" >
						<input type="text" id="name" name="user.name" class="form-control"
							maxlength="190" required>
						<!-- <input type="text" id="name" name="user.name" class="form-control"
							value=""> -->
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Nick Name :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<input type="text" name="user.nickName" class="form-control"
							maxlength="32">
						<div class="form-control-focus"></div>
					</div>
					
				</div>
				<div class="form-group form-lg-line-input  ">
					
				<!-- 	<div class="caption caption col-md-2" style="margin-top: 3px;">
						E-Mail Host :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<input type="email" name="user.emailHost" class="form-control"
							maxlength="128">
				
					</div> -->
						<div class="caption caption col-md-2" style="margin-top: 3px;">
						Gender :<br>
					</div>
					<div class="caption col-md-1" style="margin-top: 3px;float:left">
						<label class="radio-inline"><input type="radio" name="user.gender" value="M"> Male </label>
					</div>
					<div class="caption col-md-3" style="margin-top: 3px;">
						<label class="radio-inline"><input type="radio" name="user.gender" value="F"> Female </label>
					</div>
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Address :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<textarea class="form-control" rows="2" maxlength="255"
							placeholder="Please add your address " name="user.address"></textarea>
						<div class="form-control-focus"></div>
					</div>
				</div>
				<div class="form-group form-lg-line-input form-md-floating-label ">

					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Role :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<select class="form-control" name="user.roleId">
							<c:forEach var="role" items="${roleList}" varStatus="status">
								<option value="${role.id}">${role.id}</option>
							</c:forEach>
						</select>
					</div>
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Department :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;" >
						<select class="bs-select form-control" name="user.departmentId">
							<c:forEach var="department" items="${departmentList}">
								<option value="${department.id}" <c:if test="true">  </c:if>>${department.id}</option>
							</c:forEach>
						</select>
					</div>
					
				</div>
				<div class="form-group form-lg-line-input ">
					
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Position :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<select class="bs-select form-control" name="user.positionId">
						
								 <option value="none">None</option>
		
							<c:forEach var="position" items="${positionList}">
								<option value="${position.position_id}"<c:if test="true"> </c:if>>${position.name}</option>
							</c:forEach>
						</select>
						<div class="form-control-focus"></div>
					</div>
					
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Start Working Date :<br>
					</div>
					<div class="caption col-md-4" style="margin-top: 3px;" >
						<input class="form-control form-control-inline  date-picker"
							type="text" data-date-format="dd-mm-yyyy" value=""
							name="startDate">

						<div class="form-control-focus"></div>
					</div>
				</div>
				
				
				<div class="form-group form-lg-line-input ">
					
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Birth Date :<br>
					</div>
					
				
					<div class="caption col-md-4"style="margin-top: 3px;">
						<input class="form-control form-control-inline  date-picker"
							type="text" data-date-format="dd-mm-yyyy" value=""
							name="startDate">
						<input type="hidden" name="user.leaveQuota4" class="form-control"
							value="0">

						<div class="form-control-focus"></div>
					</div>
				</div>
				<!--approve  -->

				<div class="portlet-title">
					<div class="note note-info">
						<div class="row ">
							<div class="col-md-8">

								<p class="block">Approver</p>
							</div>
							<div class="col-md-4" style="text-align: right;">
								<div class="btn-group btn-group-circle" data-toggle="buttons">
									<button type="button" class="btn btn-sm green-jungle"
										onclick="Add_rowApprove()">
										<i class="fa fa-plus"></i>Add Row
									</button>
									<button type="button" class="btn btn-sm red"
										onclick="deleteAll()">
										<i class="icon-trash"></i>Delete All
									</button>
								</div>
							</div>
						</div>
					</div>
					<div class="portlet-body">
						<div id="divTable" class="table-scrollable">
							<div class="table-responsive">
								<table id="tableTest"
									class="table table-striped table-bordered table-hover table-header-fixed">
									<tbody>
										<tr id="rr">
											<td id="colunm_0"></td>
											<%-- <select id="approver" name="approver"
											class="form-control select2 select2me" required>
											<option></option>
												<c:forEach var="userLists" items="${userLists}">
													<option value="${userLists.id}"
														<c:if test="true"> </c:if>>${userLists.name}</option>
												</c:forEach>
											</select> --%>

										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>

				<!-- end approve -->
				<!--  -->
					
				<div class="form-actions action right">
					<div class="row ">
						<div class="col-md-12" style="text-align: center;">
							<button type="submit" class="btn blue" id="submit">
								<i class="fa fa-save"></i>&nbsp;Save
							</button>
							<button type="reset" class="btn red" onclick="back()">
								<i class="fa fa-close"></i>&nbsp;Cancel
							</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		if ($('#name') != '') {
			$('#name').val(" ");
		}
		if ($('#pass') != '') {
			$('#pass').val("");
		}

	});
	$('#name').hover(function() {
		$('#name').val($.trim($('#name').val()));
	});
</script>
<script type="text/javascript">
	function ajaxCall() {
		var user = $('#userid').val();
		if(user != ""){
		$.ajax({
			url : "user_noti",
			method : "POST",
			type : "JSON",
			data : {
				"user.id" : user
			},
			success : function(data) {

				console.log(data);
				if (data.toString().indexOf("1") != -1) {
					swal('This id already exist,', 'Please change your id!',
							'error');
				} else {
					swal('Pass', 'You can use this id', 'success');
				}

			}
		})
		}else{swal('Please!', 'Input your username for create account',
		'error');
}
	};
</script>
<script type="text/javascript">
	function user_noti() {
		alert($('#test').val());

	}
</script>
<script>
$(document).ready(function() {
	var value = "${flag}";
	if (value == 1) {
		swal('Please!', 'Check Username Duplicate', 'warning');		
	}
});
function back(){
	document.location ="user-list";
	
}
</script>
<script type="text/javascript">
var num = 1;
var numcol=1;
var select=0;
var options;
var j1 =1;
var j2=1;
var j3 =1;
var j4 =1;   

			//add row
            function Add_rowApprove(){
            	  select++;
                  if(num<=3){
                	var opt = document.createElement('option');
                	var test ="<tr><td id='Row"+num+"'>"+
                	"<button type='button' onclick='deleteRow(this)' class='btn btn-circle btn-sm sbold red'><i class='icon-trash'></i></button>"+
                	"&nbsp;<button type='button' onclick='Add_Column(this,parentNode.id)' class='btn btn-circle btn-sm sbold blue'><i class='fa fa-plus'></i></button>"+
                		"<div class='alert'>"+
              
                			"<button type='button' class='close' data-dismiss='alert'></button>"+
                				"<select id= 'Row"+num+"-1"+"' name='approver"+num+"-1"+"' class='form-control select2me'>";
                				
 
    	             showData(test,select);
    	         
                	//document.getElementById("tableTest").innerHTML+="<tr><td id='colunm_"+num+"'><button onclick='deleteRow(this)' class='btn btn-circle btn-sm sbold red'><i class='icon-trash'></i></button>&nbsp;<button onclick='Add(this,parentNode.id)' class='btn btn-circle btn-sm sbold blue'><i class='fa fa-plus'></i></button><div class='alert'><button type='button' class='close' data-dismiss='alert'></button><select class='form-control'><option>Manager</option><option>2</option><option>3</option><option>4</option><option>5</option></select></div></td></tr>";
                    //document.getElementById("tableTest").innerHTML+="<tr><td id='space_"+num+"'> <button onclick='deleteRow(this)' class='btn btn-circle btn-sm sbold red'><i class='icon-trash'></i></button>&nbsp;<button onclick='Add(this,parentNode.id)' class='btn btn-circle btn-sm sbold blue'><i class='fa fa-plus'></i></button>&nbsp;<select><option>Manager</option><option>2</option><option>3</option><option>4</option><option>5</option></select></td></tr>";
                    numcol++;
                    console.log("num"+num)
                    num+=1;
                  
    	           
                  }
            }
       //add column
            function Add_Column(c,id){
                   var i = c.parentNode.parentNode.rowIndex;
                   var x = document.getElementById("tableTest").rows[i].cells.length;
                   console.log("i"+i)
                   console.log("x"+x)//ทำไมยังเป็น 1 อยู๋
                   if(x<=4){
                   
                   //ต้องเปลี่ยนคำสั่งตรงนี้
                
                   if(i == 1 ){
                	   j1++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j1+"' name='approver"+i+"-"+j1+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);		
                	   
                   }
                   
                   else if(i == 2 ){
                	   j2++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j2+"' name='approver"+i+"-"+j2+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);	
                   }
                   else if(i==3 ){
                	   j3++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j3+"' name='approver"+i+"-"+j3+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);	
                   }
                   else if(i == 4 ){
                	   j4++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j4+"' name='approver"+i+"-"+j4+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);	
                   } 
       
                   }
            }
			//deleteRow
            function deleteRow(r) {
                var i = r.parentNode.parentNode.rowIndex;
                document.getElementById("tableTest").deleteRow(i);
                num--; //ปัญหาคือ มันลบ แต่ค่าในid เดิม ไม่เปลี่ยน
                console.log("num"+num)
             
            }
			//deleteAll
            function deleteAll(){
                document.getElementById("tableTest").innerHTML = "";
                num=1;
            	/* $("#Row1").remove();
                console.log("vvvv");
                 */
            }
			//select
            function showData(test,select) {
            	var test2 = "</select></div></td></tr>";
            	var userLists = ${userLists};
            	var temp = "<option>Select Person</option>";
            	var test3;
            	var user;
            	var manager;
                user = "${selectUser.name}";
                manager = "${selectUser.managerId}";
                //$('form').attr('action','LeaveAdd_Do');
                user = user.toLowerCase();
                manager = manager.toLowerCase();
        		console.log("hhhhh")
            		for(let i=0; i<userLists.length; i++){
            			let id = userLists[i].id.toLowerCase();
                        let name = userLists[i].name;   
                        let status = userLists[i].enable;
                        if(status == '1'){
                        	 test3 = temp + '<option value="'+id+'">'+name+'</option>'; //temp
                             temp=test3;
                        	 console.log("ififi")
                            
                        }
                    }
            		
            	 var t  = test+test3+test2;
            	 $("#tableTest").append(t);  
            	console.log("select"+select);
            	
          //ถ้าไม่มี manager จะไม่ได้ฟิกว้
           	  
            	 
            	 
            }
            //select
            function showDataCol(test,id) {
            	
            	var test2 = "</select></div>";
            	var userLists = ${userLists};
            	var temp = "<option>Select Person</option>";
            	var test3;
            		for(let ii=0; ii<userLists.length; ii++){
            			let id = userLists[ii].id.toLowerCase();
                        let name = userLists[ii].name;   
                        let status = userLists[ii].enable;
                
                        if(status == '1'){
                        	test3 = temp + '<option value="'+id+'">'+name+'</option>'; //temp
                            temp=test3;
                            
                        }
                    }
            	var t  = test+test3+test2;     	
            	 $("#"+id).append(t);
            	 
            }
           
            
</script>