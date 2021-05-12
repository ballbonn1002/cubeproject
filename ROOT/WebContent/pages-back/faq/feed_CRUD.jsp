<%@page import="org.apache.poi.util.SystemOutLogger"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<script type="text/javascript"  src="https://code.jquery.com/jquery-1.12.4.js"></script> 
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"  src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"  src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>

<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
	
<style>
		tr{    
		  opacity: 0;
		  animation-name: fadeIn;
		  animation-duration: 2s;
		  animation-iteration-count: 1;
		  animation-fill-mode: forwards;
		}
		@keyframes fadeIn {
		  from {
		    opacity: 0;
		  }
		  
		  to {
		    opacity: 1;
		  }
		}
		
.crop-image {
	object-fit: cover;
    object-position: center; 
}
.imageAdd {
	height: 150px;
    width: 200px; 
}
.imageTable {
	height: 50px;
    width: 100px;    
}
.btn.btn-outline.red.active, .btn.btn-outline.red:active,
.btn.btn-outline.red:active:focus, .btn.btn-outline.red:active:hover, 
.btn.btn-outline.red:hover {
	border-color: #e7505a !important;
	color: #fff !important;
	background-color: #e7505a !important;
}
.btn.btn-outline.red:focus{
	background: 0 0 ;
	color: #e7505a ;
}
		
		</style>
				<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
<html>

<body>

	<div class="portlet light bordered" style="background-color: white;">
	<!--------------------------- TitleBar --------------------------->
		<div class="portlet-title">

			<div class="caption">
				<i class="fa fa-edit font-red"></i> <span
					class="caption-subject font-red sbold "> Feed Manage </span>
			</div>
			<div class="actions">
				
			</div>

		</div>
		<!--------------------------- End TitleBar --------------------------->
		<!-- body page -->
	<div class = "portlet-body" id = "page_body" style="text-align: center;"> 
	<div style="align:center;">
				<form action="" id = "newimageform" method = "POST">
					<h4><center>New Feed Post Image Background</center></h4>
				               <div class="" >	
							        <input type="hidden" name="userUploadId" value = "${userid}" />
									<input type="hidden" name="fileUploadSize" value="" id="size"/>
									<input type="hidden" name="userUploadCreate" value = "${userid}"/> 
									<input type="hidden" id ="id_hid" name = "id_hid" value = "${userid}"/>
								<div style="text-align: center;"> 
								 <label class="file_upload"> 
								  	<input style="display:none;" type="file" name="fileUpload" id="filebackground"> 
								  	 <img style="" class="crop-image imageAdd" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id ="showgroupimg">	   
								 </label> 
								</div>
							   </div> 
							   <div style="text-align: center;">
							   		<button id="addnewimgbtn" type = "button"class="btn btn-circle green-meadow">
							   			Add New Post Back ground
							   		</button>
							   </div> 	
					</form>
				</div>
			</div>
		<div>
	
	<h3>Feed Post Background manage</h3>
			<table id="imageBackground" class="table table-striped table-condensed table-hover">
				<thead class="flip-content">
					<tr class="text-center" style="background-color:rgb(59, 63, 81); color:white">
						<th height="41"><center>Background Image</center></th>
						<th height="41"><center>Background Image name</center></th>
						<th height="41"><center>Background Image type</center></th>
						<th height="41"><center>User upload</center></th>
						<th height="41"><center>upload time</center></th>
						<th height="41"><center>Used Status</center></th>
						<th height="41"><center>Edit Option</center></th>
					</tr>
				</thead>
				<tbody id= "tablebody">
				
				<c:forEach var="allbg" items="${allbackground}" >
					<tr> 
						<td><center><a><img src = "${allbg.background_img_path}" id = "data-enlargeable" class="crop-image imageTable" alt ="img" /></a></center></td>
						<td style="vertical-align: middle;" ><center>${allbg.background_img_name}</center></td>
						<td style="vertical-align: middle;"><center>${allbg.background_img_file_type}</center></td>
						<td style="vertical-align: middle;"><center>${allbg.user_upload}</center></td>
						<td style="vertical-align: middle;"><center>${allbg.time}</center></td> 
						<td style="vertical-align: middle;"> 
							<center>
								
								<c:choose>
									<c:when test="${allbg.used_status.toString() == '1' || allbg.used_status.toString() == 1}">
										<b style="color: red"> used ${s}</b>
									</c:when>
									<c:otherwise>
										<b style="color: green"> not used ${s}</b>
									</c:otherwise>
								</c:choose>
							
						</td>
						<td style="vertical-align: middle;"><center>
								<c:choose>
									<c:when test="${allbg.used_status.toString() == '1' || allbg.used_status.toString() == 1}">
										<button type = "button" name ="delbtn" id = "${allbg.feed_post_background_id}" class="btn btn-circle btn-outline btn-sm red" disabled ><i class="fa fa-trash-o"></i></button>
										<!-- <button type = "button" name ="editbtn" id = "${allbg.feed_post_background_id}" class="btn btn-circle btn-outline btn-sm blue"><i class="fa fa-clipboard"></i></button>  -->
									</c:when>
									<c:otherwise>
										<button type = "button" name ="delbtn" id = "${allbg.feed_post_background_id}" class="btn btn-circle btn-outline btn-sm red"  ><i class="fa fa-trash-o"></i></button>
										<!--  <button type = "button" name ="editbtn" id = "${allbg.feed_post_background_id}" class="btn btn-circle btn-outline btn-sm blue"><i class="fa fa-clipboard"></i></button> -->
									</c:otherwise>
								</c:choose>
						</center>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>		
		</div>	
	</div>

<!-- end body page -->

<script type="text/javascript">

$(document).ready(function(){
	
	
	var table = $('#imageBackground').DataTable();
	 
	$('#next').on( 'click', function () {
	    table.page( 'next' ).draw( 'page' );
	}); 
	$('#previous').on( 'click', function () {
	    table.page( 'previous' ).draw( 'page' );
	});
	

	function checkdisableAddbtn(){
		var file = $('#filebackground').val();
		var lastpoint = $('#filebackground').val().lastIndexOf(".");
		  var filetype  = $('#filebackground').val().substr(lastpoint, $('#filebackground').val().length - 1);
		  console.log(filetype);
		  
		if(!(file == null || file == "") && (filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG")){
			$('#addnewimgbtn').prop('disabled',false);
		}else{
			$('#addnewimgbtn').prop('disabled',true);
		}
	}

	function Backgroundlist(data){
		console.log("do");
		var backgroundjson = JSON.parse(data);
		var html = "";
		backgroundjson.forEach((item) => {
			var usetext = "disabled";
			if(item.used_status == '1'){
				usetext = "disabled";
			}else{
				usetext = "";
			}
			html += '';
			html += '<tr>';
				html += '<td><center><a><img src = "'+item.background_img_path+'" id = "data-enlargeable" class="crop-image imageTable" alt ="img"  /></a></center></td>';
					html += '<td><center>'+item.background_img_name+'</center></td>';
						html += '<td><center>'+item.background_img_file_type+'</center></td>';
							html += '<td><center>'+item.user_upload+'</center></td>';
								html += '<td><center>'+item.time+'</center></td> ';
									html += '<td>';
									html += '<center>';
									console.log(item.used_status);
									if(item.used_status == '1'){
										
										html += '<b style="color: red"> used </b>';
									}else{
										html += '<b style="color: green"> not used </b>';
									}
					html += '</center>';
				html += '</td>';
					html += '<td><center>';
						html += '<button type = "button" name ="delbtn" id = "'+item.feed_post_background_id+'" class="btn btn-circle btn-outline btn-sm red" '+usetext+'>';
				html += '<i class="fa fa-trash-o"></i>';
					html += '</button>';
					//	html += '<button type = "button" name ="editbtn" id = "'+item.feed_post_background_id+'" class="btn btn-circle btn-outline btn-sm blue"><i class="fa fa-clipboard"></i></button>';
							html += '</center>';
								html += '</td>';
									html += '</tr>';
		});
		return html;
	}
	
	function getbackgroundlist(){
		
		$.ajax({
			url: "GetBackground",
			method: "POST",
			type: "JSON",
			data: {
				
			},success: function(data){
				var html = Backgroundlist(data);
				$('#tablebody').html('');
				$('#tablebody').append(html);
			}
		});
	}
	
	checkdisableAddbtn();
	
	$(document).on('click','button[name=delbtn]',function(e){
		var backgroundid = $(this).attr('id');
		swal({
		      title: "Are you sure!",
		      text: "You will deleting this Background!",
		      type: "warning",
		      showCancelButton: true,
		      confirmButtonClass: 'btn-danger',
		      confirmButtonText: 'OK'
		    }, function (inputValue) {
		        if (inputValue == false){
		        	
		        	
		        	}
		        if (inputValue == true) {
		        	$.ajax({
		    			url: 'deleteBackground',
		    			method: 'POST',
		    			type: 'JSON',
		    			data: {
		    				'backgroundid' : backgroundid
		    			},
		    			success: function(data){
		    				getbackgroundlist();
		    				checkdisableAddbtn();
		    			}
		    		});
		        	
		      		}
		        });
		
		
	});
	$(document).on('click','#editbtn',function(e){
		
	});
	$(document).on('change','#filebackground',function(e){
		console.log('sez');
		
		var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
		  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
		  var size_n = (Math.round(fSize*100)/100);
		  var size = size_n+' '+fSExt[i];
		  checkdisableAddbtn();
		  $('#showgroupimg').attr('src',window.URL.createObjectURL(this.files[0]));
		  $('#size').val(size);
	});
	$(document).on('submit','#newimageform',function(e){
		console.log('sbmit')
		var formData = new FormData(this);
		$.ajax({
		    type: "POST",
		    url: "AddnewImagepostbackground",
		    cache:false,
		    contentType: false,
		    processData: false,
		    enctype:"multipart/form-data",
		    data: formData,
		    success:function(data){
		    	getbackgroundlist();
		    }
		  });
		
		e.preventDefault();
	});
	$(document).on('click','#addnewimgbtn',function(e){
		console.log('as');
		$('#newimageform').submit();
		$('#filebackground').val(null);
		$('#showgroupimg').attr('src','http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image');
		checkdisableAddbtn();
	});
	$('img[id="data-enlargeable"]').addClass('img-enlargeable').click(function(){
	    var src = $(this).attr('src');
	    var modal;
	    function removeModal(){ modal.remove(); $('body').off('keyup.modal-close'); }
	    modal = $('<div>').css({
	        background: 'RGBA(0,0,0,.5) url('+src+') no-repeat center',
	        backgroundSize: 'contain',
	        width:'100%', height:'100%',
	        position:'fixed',
	        zIndex:'10000',
	        top:'0', left:'0',
	        cursor: 'zoom-out'
	    }).click(function(){
	        removeModal();
	    }).appendTo('body');
	    //handling ESC
	    $('body').on('keyup.modal-close', function(e){
	      if(e.key==='Escape'){ removeModal(); } 
	    });
	});

});



</script>



</body>
</html>