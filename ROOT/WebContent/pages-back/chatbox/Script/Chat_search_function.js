$(document).ready(function(){
	
	var theme = $('#start_theme').val();
	var chatloadlimit = $('#loadlimit').val();
	var topload = false ;
	var message_input = "";
	var message_input_text = "";
	var objDiv = document.getElementById("message_body");
	check_new_Online_user();
	objDiv.scrollTop = objDiv.scrollHeight;
	$('.action-header').hide();
	$('#message_body').hide();
	$('.msb-reply').hide();
	$('#reciever_avatar').hide();
	$('#groupsetting').hide();
	$('#groupusersetting').hide();
	var linkfeed = $('#linkfeed').val();
	check_new_Online_user();
	var Openchat = false;
	var myVars = "";
	var myVars2 =setInterval(check_new_Online_user, 1100);
	var length = 0;
	var current_length = 0;
	var String_theme_userlist_item = "";
	var String_theme_userlist_item_heading = "";
	var String_theme_chat_right = "";
	var String_theme_chat_left = "";
	var String_btn_icon_only = "";
	var String_listS = "";
	var String_labelbtn = "";
	var emoji_length = [];
	var selectedsUser = [];
	var selectedsUserPath = [];
	var selectedsUserName = [];
	var selectedsUserDepart = [];
	var selectedsmember = [];
	var selectedsmemberPath = [];
	var selectedsmemberDepart = [];
	var selectedsmemberName = [];
	var groupname = $('input[name=groupname]').val();
	var groupdescription = $('input[name=groupdescription]').val();
	$('#Editgroup').prop('disabled',true);
	$('#creategroupsubmitbtn').prop('disabled', true);
	
$(document).ready(function(){
  $("#nextchatbutton").click(function(){
   var ChatType = $('#Chattype').val().toLowerCase();
	var textsearch = $('#textsearchchat').val();
	var Owner_id = $('#Owner_chat_id').val();
	clearInterval(myVars); 
	var Reciever_id = $('#reciever_id_hid').val();
	if(textsearch != ""){
			$.ajax({
				url:'SearchNextChat',
				method:'POST',
				type:'JSON',
				data:{
					'Reciver' : Reciever_id,
					'Sender'  : Owner_id,
					'Text'    : textsearch
				},success:function(data){
					var html ="";
					html = showmessagefromsearch(data);
					$('#message_body').html('');
					$('#message_body').append(html);
					
			}
			});		
}
else{myVars = setInterval(check_new_message, 1000);}
});
});

$(document).ready(function(){
  $("#previouschatbutton").click(function(){
   var ChatType = $('#Chattype').val().toLowerCase();
	var textsearch = $('#textsearchchat').val();
	var Owner_id = $('#Owner_chat_id').val();
	clearInterval(myVars); 
	var Reciever_id = $('#reciever_id_hid').val();
	if(textsearch != ""){
			$.ajax({
				url:'SearchPreviousChat',
				method:'POST',
				type:'JSON',
				data:{
					'Reciver' : Reciever_id,
					'Sender'  : Owner_id,
					'Text'    : textsearch
				},success:function(data){
					var html ="";
					html = showmessagefromsearchnew(data);
					$('#message_body').html('');
					$('#message_body').append(html);
					
			}
			});		
}
else{myVars = setInterval(check_new_message, 1000);}
});
});

function showmessagefromsearchnew(data){
			var reciever_avartar =$('#reciever_avatar').attr('src');
			var textsearch = $('#textsearchchat').val();
		 	var jsondata = JSON.parse(data);
			var text = "";
			html ="";
			var Owner_id = $('#Owner_chat_id').val().toLowerCase();
			var pro_img = $('#pro_img').val();
			length = jsondata.length;
			jsondata.forEach((item) => {	
				i+=1;
				if(item.Sender_id.toLowerCase() == Owner_id){
					html+='<div class="message-feed right" >';  
					html+='     <div class="pull-right">';
					if(pro_img != null){
						html+='        <img src="'+pro_img+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}					
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_text.match("(.*)"+textsearch+"(.*)")){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px"></a>';	
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}						
					}
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank" download>'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					} 
					html+='       </div>';
					html+='       <div style="">';   
					if(item.like_status == '1'){
							html+='<i style="right:50px" name = "'+item.Message_id+'"class="like-btn like-active"></i>'; 
					}	
					html+='     <small style="float:right; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+''; 
					if(item.Reciever_read_status == '1'){
						html+='        <i style="color: #E1E5EC;" class="fa fa-check"></i>';
					}
					html+='</small>';
					html+='     </div>'; 
					html+='     </div>';
					html+='    </div>';  

				}else{
					html+='<div class="message-feed media">';  
					html+='     <div class="pull-left">';
					if(reciever_avartar != null){
						html+='        <img src="'+reciever_avartar+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}				
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_text.match("(.*)"+textsearch+"(.*)")){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px" class="crop-image"></a>';
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}		
					} 
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank" download>'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					}
					html+='       </div>';  
					html+='       <div style="margin-top:0px">';   
					html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
					if(item.like_status == '1'){
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn like-active"></i>';
					}else{
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn"></i>';
					}
					html+='       </div>';
					html+='     </div>'; 
					html+='    </div>'; 
				}	
					
				if (i == length-1){
					if(messid != item.Message_id){
						toBottom();
					}
					if(messid == ""){
						toBottom();
					}
					messid = item.Message_id;
				}
				if(item.Message_text == ""){}	
				else if(item.Message_text.match("(.*)"+textsearch+"(.*)"))
				{
				var elmnt2 = document.getElementById(item.NewID);
				elmnt2.scrollIntoView();
				
				}
				else{}
				var elmnt = document.getElementById("borred chat");
				elmnt.scrollIntoView();	
			});		
			$('#message_body').html('');
			$('#message_body').append(html);
						
			return html;
        }

$(document).ready(function() {
	$('#searchchatdata').hide();
	  $('#searchinchat').click(function() {
	    $("#searchchatdata").fadeToggle('fast');
		$('#AllResult').val(0);
		$('#AllResult').html(0);
		$('#CurrentResult').val(0);
		$('#CurrentResult').html(0);
		$('#findmessageinchat').val('');
		allresult = 0;
		allresultArray = [];
		var ChatType = $('#Chattype').val().toLowerCase();
		checkRefresh(ChatType);
	    $('#textsearchchat').val('');
	  });
	});
	
$(document).on('keyup','#textsearchchat',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	var searchchatext = $(this).val().toLowerCase();
	var Owner_id = $('#Owner_chat_id').val();
	clearInterval(myVars); 
	var Reciever_id = $('#reciever_id_hid').val();
	if(searchchatext != ""){
			$.ajax({
				url:'SearchChat',
				method:'POST',
				type:'JSON',
				data:{
					'Reciver' : Reciever_id,
					'Sender'  : Owner_id,
					'Text'    : searchchatext
				},success:function(data){
					var html ="";
					html = showmessagefromsearch(data);
					$('#message_body').html('');
					$('#message_body').append(html);
					
			}
			});
			
}
else{myVars = setInterval(check_new_message, 1000);}
});	

function showmessagefromsearch(data){
			var reciever_avartar =$('#reciever_avatar').attr('src');
			var textsearch = $('#textsearchchat').val();
		 	var jsondata = JSON.parse(data);
			var text = "";
			html ="";
			var Owner_id = $('#Owner_chat_id').val().toLowerCase();
			var pro_img = $('#pro_img').val();
			length = jsondata.length;
			jsondata.forEach((item) => {	
				i+=1;
				if(item.Sender_id.toLowerCase() == Owner_id){
					html+='<div class="message-feed right" >';  
					html+='     <div class="pull-right">';
					if(pro_img != null){
						html+='        <img src="'+pro_img+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}					
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_text.match("(.*)"+textsearch+"(.*)")){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px"></a>';	
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}						
					}
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank" download>'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					} 
					html+='       </div>';
					html+='       <div style="">';   
					if(item.like_status == '1'){
							html+='<i style="right:50px" name = "'+item.Message_id+'"class="like-btn like-active"></i>'; 
					}	
					html+='     <small style="float:right; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+''; 
					if(item.Reciever_read_status == '1'){
						html+='        <i style="color: #E1E5EC;" class="fa fa-check"></i>';
					}
					html+='</small>';
					html+='     </div>'; 
					html+='     </div>';
					html+='    </div>';  

				}else{
					html+='<div class="message-feed media">';  
					html+='     <div class="pull-left">';
					if(reciever_avartar != null){
						html+='        <img src="'+reciever_avartar+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}				
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_text.match("(.*)"+textsearch+"(.*)")){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px" class="crop-image"></a>';
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}		
					} 
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank" download>'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					}
					html+='       </div>';  
					html+='       <div style="margin-top:0px">';   
					html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
					if(item.like_status == '1'){
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn like-active"></i>';
					}else{
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn"></i>';
					}
					html+='       </div>';
					html+='     </div>'; 
					html+='    </div>'; 
				}	
					
				if (i == length-1){
					if(messid != item.Message_id){
						toBottom();
					}
					if(messid == ""){
						toBottom();
					}
					messid = item.Message_id;
				}
				if(item.Message_text == ""){}	
				else if(item.Message_text.match("(.*)"+textsearch+"(.*)"))
				{

				
				}
				else{}

			});		
			$('#message_body').html('');
			$('#message_body').append(html);
						
			return html;
        }
        
        		
function toBottom(){
	var objDiv = document.getElementById("message_body");
	objDiv.scrollTop = objDiv.scrollHeight;
}

function set_read(Reciever_id){
		$.ajax({
			url:'SetRead',
			method:'POST',
			type:'json',
			data:{
				'Reciever' : Reciever_id
			}
		});
}
function set_read_group(group_message_id){
	$.ajax({
		url:'SetReadGroup',
		method:'POST',
		type:'json',
		data:{
			'messageid' : group_message_id
		}
	});		
}
function setTheme(theme,userid){
	var chattheme = theme;
	var uid = userid;
	$.ajax({
		url:'SetChatTheme',
		method:'POST',
		type:'JSON',
		data:{
			"theme" : chattheme,
			"userid" : uid
		},
		success:function(data){
	
			
		}
	});
}
function showuserlistUser(data){
	var jsondata = JSON.parse(data);
	var htmltext = "";
	var textdata = $('#searchchat').val();
	var Owner_id = $('#Owner_chat_id').val();
	jsondata.forEach((item) => {
	if(item.id!=""){
		if(item.id.toLowerCase() != Owner_id.toLowerCase()){
			var chatlength = item.Message_text.length;
			var Messagedata = item.Message_text.substring(0, 18);
			var Chattext = "";
			
			if(chatlength>18)
				{Chattext = Messagedata+" ... ";}
			else{Chattext = item.Message_text;}
 		htmltext += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.id+'" name = "userlist">';
 		htmltext += '<input type="hidden" value="'+item.path+'" id="'+item.id+'" name="img"> <div class="lv-avatar pull-left"> '
		if(item.path != ""){
 			htmltext += ' <img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
 		}else{
 			htmltext += ' <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">'; 
 		}    		 		
 		htmltext += ' </div>';
 		htmltext += ' <div class="media-body">';
 		if(item.onlinedata != false){
 			htmltext += ' <div class="list-group-item-heading" '+String_theme_userlist_item_heading+'><i style="color: #35b152" class="fa fa-circle"></i>'+" "+''+item.id+'</div>';
 		}else{
 			htmltext += ' <div class="list-group-item-heading" '+String_theme_userlist_item_heading+'><i style="color: red" class="fa fa-circle"></i>'+" "+''+item.id+'</div>';
 		}
 		if(item.Message_text != ""){
 			htmltext += '  <small class="list-group-item-text c-gray">'+" "+''+Chattext+'</small>';
 		}
 		if(item.unread_count > 0){
 			htmltext += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_count+'</span>';
 		}
 		htmltext += ' </div>';
 		htmltext += '</a>';
		}else{
			
		}
		}else{}
 	});
	return htmltext;
}

function showuserlistonGroup(data){
	var jsondata = JSON.parse(data);
	var htmltext = "";
	var Owner_id = $('#Owner_chat_id').val();
	jsondata.forEach((item) => {
	if(!(item.id == Owner_id)){
			if(!(selectedsUser.includes(item.id))){
			htmltext += '<div class="list-group-item media listS"'+String_listS+' id = "UserTest1" name = "userlist"> ';
				htmltext += '<div class="lv-avatar pull-left">';
				if(item.path == null || item.path == ""){
					htmltext += '<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
				}else{
					htmltext += '<img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
				}	
		    htmltext += '</div>';
		    htmltext += '<div class="media-body" '; 
		    htmltext += '<span class="list-group-item-heading">'+item.name+'</span>';
		    htmltext += '<small class="list-group-item-text c-gray"> : '+item.department_id+'</small> ';
		    htmltext += '<span style="float: right;" class="float-right">'; 
		    if(item.path == null || item.path == ""){
		    	htmltext +=	'<input type ="checkbox" data-name-depart="'+item.name+':'+item.department_id+'"value ="'+item.id+'"name ="checkboxuser" id = "dd'+item.id+'"/>' ;
		    }else{
		    	htmltext +=	'<input type ="checkbox" data-name-depart="'+item.name+':'+item.department_id+'"value ="'+item.id+'"name ="checkboxuser" id = "'+item.path+'"/>' ;
		    }
		    
		    htmltext +=	'</span>';
		    htmltext += '</div>';
		    htmltext += '</div>';   
	}else{
			htmltext += '<div class="list-group-item media listS"'+String_listS+' id = "UserTest1" name = "userlist"> ';
			htmltext += '<div class="lv-avatar pull-left">';
			if(item.path == null || item.path == ""){
				htmltext += '<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar">';
			}else{
				htmltext += '<img src="'+item.path+'" alt="" class="circle img-avatar">';
			}	
			htmltext += '</div>';
			htmltext += '<div class="media-body" ';
			htmltext += '<span class="list-group-item-heading">'+item.name+'</span>';
			htmltext += '<small class="list-group-item-text c-gray"> : '+item.department_id+'</small> ';
			htmltext += '<span style="float: right;" class="float-right">'; 
			if(item.path == null || item.path == ""){
				htmltext +=	'<input type ="checkbox" data-name-depart="'+item.name+':'+item.department_id+'"value ="'+item.id+'"name ="checkboxuser" id = "dd'+item.id+'" checked/>' ;
			}else{
				htmltext +=	'<input type ="checkbox" data-name-depart="'+item.name+':'+item.department_id+'"value ="'+item.id+'"name ="checkboxuser" id = "'+item.path+'" checked/>' ;
			}
			
			htmltext +=	'</span>';
			htmltext += '</div>';
			htmltext += '</div>';   
	}
	
	}    
});
	
	
	return htmltext;
}
function searchuserlist(){
	var searchtxt = $('#searchtext').val().replace("%", "#$@????????????????????").replace("_", "#$##???????????????????").trim();
	var depart = $('#sortuserdepart').val();
	if(depart == "all" && searchtxt == ""){
		//"do select all"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'All',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = showuserlistonGroup(data);
				$('#useridlist').html('');
				$('#useridlist').append(htmltext);
			}
		});
	}else if(depart == "all" && searchtxt != ""){
		//"do select by name"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'name',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = showuserlistonGroup(data);
				$('#useridlist').html('');
				$('#useridlist').append(htmltext);
			}
		});
	}else if(depart != "all" && searchtxt != ""){
		//"do select by name and department"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'both',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = showuserlistonGroup(data);
				$('#useridlist').html('');
				$('#useridlist').append(htmltext);
			}
		});
	}else if(depart != "all" && searchtxt == ""){
		//"do select by department"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'depart',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = showuserlistonGroup(data);
				$('#useridlist').html('');
				$('#useridlist').append(htmltext);
			}
		});
	}
}
function selectedlistreload(){
	var htmluserlist = "";
	selectedsUser.forEach((item) => { 
		htmluserlist += '<div class="list-group-item media listS" '+String_listS+' id="UserTest1" name="userlist">';
		htmluserlist += '<div class="lv-avatar pull-left">';
        if(selectedsUserPath[selectedsUser.indexOf(item)] == null || selectedsUserPath[selectedsUser.indexOf(item)] == "" || selectedsUserPath[selectedsUser.indexOf(item)] == "dd"+item){
        	htmluserlist += '<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
        }else{
        	htmluserlist += '<img src="'+selectedsUserPath[selectedsUser.indexOf(item)]+'" alt="" class="circle img-avatar crop-image">';
        }
        htmluserlist += '</div>'; 
        htmluserlist += '<div class="media-body">  ';
        htmluserlist += '<span class="list-group-item-heading">'+selectedsUserName[selectedsUser.indexOf(item)]+'</span> ';
        htmluserlist += '<small class="list-group-item-text c-gray"> : '+selectedsUserDepart[selectedsUser.indexOf(item)]+'</small> ';
        if(selectedsUserPath[selectedsUser.indexOf(item)] == null || selectedsUserPath[selectedsUser.indexOf(item)] == "" || selectedsUserPath[selectedsUser.indexOf(item)] == "dd"+item){
        htmluserlist += '<span style="float: right;" class="float-right"><input type="checkbox" checked name="selectuser" value ="'+item+'" data-name-depart="'+selectedsUserName[selectedsUser.indexOf(item)]+':'+selectedsUserDepart[selectedsUser.indexOf(item)]+'" id = "dd'+item+'"/></span>';
        }else{
        	htmluserlist += '<span style="float: right;" class="float-right"><input type="checkbox" checked name="selectuser" value ="'+item+'" data-name-depart="'+selectedsUserName[selectedsUser.indexOf(item)]+':'+selectedsUserDepart[selectedsUser.indexOf(item)]+'" id = "'+selectedsUserPath[selectedsUser.indexOf(item)]+'"/></span>';
        }
        htmluserlist += ' </div>';
        htmluserlist += '	</div>';
	});
	$('#selectedlist').html('');
	$('#selectedlist').append(htmluserlist);
	
}
function checkcreategroup(){
	var name = $('input[name=groupname]').val();
	var description = $('input[name=groupdescription]').val();
	var length  = selectedsUser.length;
	var image_input = $('#myfilegroup').val();
	var lastpoint = $('#myfilegroup').val().lastIndexOf(".");
	  var filetype  = $('#myfilegroup').val().substr(lastpoint, $('#myfilegroup').val().length - 1);
	  
	if(name.trim() != "" && description.trim() != "" && length > 0 && (filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG" || image_input == null || image_input == "")){
		$('#creategroupsubmitbtn').prop('disabled', false);
	}else{
		$('#creategroupsubmitbtn').prop('disabled', true);
	}
}
var i = 0;
var messid = "";

function getMessagedata(reciever_id){
	var ChatType = $('#Chattype').val().toLowerCase();
	var limit = chatloadlimit;
	if(ChatType == "p"){
		$.ajax({
		url:'GetChatMessage',
		method:'POST',
		type : "JSON",
		data:{
			'Reciever' : reciever_id,
			'limit' : limit
		},
		success:function(data)
        {
			$('#message_body').load();
			var reciever_avartar =$('#reciever_avatar').attr('src');
		 	var jsondata = JSON.parse(data);
			var text = "";
			html ="";
			var Owner_id = $('#Owner_chat_id').val();
			var pro_img = $('#pro_img').val();
			length = jsondata.length;
			
			jsondata.forEach((item) => {		
				i+=1;
				if(item.Sender_id.toLowerCase() == Owner_id.toLowerCase()){
					html+='<div class="message-feed right" >';  
					html+='     <div class="pull-right">';
					if(pro_img != null){
						html+='        <img src="'+pro_img+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}					
					html+='    </div>';
					html+='    <div class="media-body">';
					html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>';
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px"></a>';	
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}						
					}
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					} else{
						if(!(item.Message_text == "") || !(item.Message_text == null)){
							html+=	linkify(item.Message_text.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"));
						}
						
					}
					html+='       </div>';
					html+='       <div style="">';   
					if(item.like_status == '1'){
							html+='<i style="right:50px" name = "'+item.Message_id+'"class="like-btn like-active"></i>'; 
					}	
					html+='     <small style="float:right; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+''; 
					if(item.Reciever_read_status == '1'){
						html+='        <i style="color: #E1E5EC;" class="fa fa-check"></i>';
					}
					html+='</small>';
					html+='     </div>'; 
					html+='     </div>';
					html+='    </div>';  

				}else{
					html+='<div class="message-feed media">';  
					html+='     <div class="pull-left">';
					if(reciever_avartar != null){
						html+='        <img src="'+reciever_avartar+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}				
					html+='    </div>';
					html+='    <div class="media-body">';
					html+='         <div id="'+item.Message_id+'" class="circle chat-left" '+String_theme_chat_left+'>';
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px" class="crop-image"></a>';
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}		
					} 
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					}else{
						if(!(item.Message_text == "") || !(item.Message_text == null)){
							html+=	linkify(item.Message_text.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"));
						}
					}
					html+='       </div>';  
					html+='       <div style="margin-top:0px">';   
					html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
					if(item.like_status == '1'){
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn like-active"></i>';
					}else{
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn"></i>';
					}
					html+='       </div>';
					html+='     </div>'; 
					html+='    </div>'; 
				}			
				if (i == length-1){
					if(messid != item.Message_id){
						toBottom();
					}
					if(messid == ""){
						toBottom();
					}
					messid = item.Message_id;
				}
			});		
			i = 0;
			$('#message_body').html('');
			$('#message_body').append(html);		
			if(current_length != length){
				if(topload == true){
					topload = false;
					$("#message_body").scrollTop( 300 );
				}else if(topload == false) {
					toBottom();
				}else {
					toBottom();
				}
				
				current_length = length;
			}
			
			
			
        }
		
	});
	}else if(ChatType == "g"){
		var Owner_id = $('#Owner_chat_id').val();
		$.ajax({
			url:'GetGroupChatMessage',
			method:'POST',
			type : "JSON",
			data:{
				'GroupReciever' : reciever_id,
				'Owner_chat_id' : Owner_id,
				'limit' : limit
			},
			success:function(data)
	        {
				$('#message_body').load();
				var reciever_avartar =$('#reciever_avatar').attr('src');
			 	var jsondata = JSON.parse(data);
				var text = "";
				html ="";
				var Owner_id = $('#Owner_chat_id').val();
				var pro_img = $('#pro_img').val();
				length = jsondata.length;
				jsondata.forEach((item) => {	
					i+=1;
					if(item.Sender_id.toLowerCase() == Owner_id.toLowerCase()){
						html+='<div class="message-feed right" >';  
						if(!item.information_message_status){
						html+='     <div class="pull-right">';
						if(pro_img != null){
							html+='        <img src="'+pro_img+'" alt="" class="circle img-avatar crop-image">';
						}else{
							html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
						}					
						html+='    </div>';
						html+='    <div class="media-body">';
						html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>';
						if(item.image_message_status == '1'){
							if(item.image_path){
								var split = (item.image_path).substr(item.image_path.lastIndexOf("."),(item.image_path).length);
							if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
								html+= '<a><img id="data-enlargeable" src="'+item.image_path+'" alt=""  style="width:250px"></a>';	
							}else{
								html+="<B>Incorrect Image file type!</B>"
							}		
							}else{
								html+="<B>Fail To Upload file Or Load Form Server</B>"
							}
											
						}
						if(item.file_message_status == '1'){
							var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
							if(video.toUpperCase() === ".MP4")
							{
								html+=' <i class="fa fa-file"></i>&ensp;';
								html+= '<a '+String_file+' href="#" name = "openvid" id="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
								//$('#watchvid').attr('src', item.file_path);
							}
							else
							{
								html+=' <i class="fa fa-file"></i>&ensp;';	
								html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
							}
						}if(item.sticker_message_status =='1'){
							html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
						}else{
							if(item.Group_chat_message) {
								html+=	replaceShowMessage(linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>")));
							}
							
						}
						html+='       </div>';
						html+='       <div style="">';   
						if(parseInt(item.likecount) > 0){
								html+='<i style="right:50px" name = "'+item.Group_chat_message_id+'"class="like-btn like-active"></i>'; 
								html+='<span style="position:relative; right:35px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';  
						}	
						html+='     <small style="float:right; padding-top: 5px; position:relative; right:5px" class="mf-date"><i class="fa fa-clock-o"> '+item.Chat_time+'</i> '; 
						if(item.read_status == '1'){
							html+='        <i style="color: #E1E5EC; left:5px" class="fa fa-check">'+item.readcount+'</i>';
						}
						html+='</small>';
						html+='     </div>';
						html+='     </div>';
						}
						if(item.information_message_status == '1'){
							$('#reciever_id').html(item.Group_chat_Name);
							$('#reivever_id').val(item.Group_chat_id);
							$('#reciever_avatar').attr("src",item.Group_img_path);
							$('#reciever_id_hid').val(item.Group_chat_id);
							$('#reciever_id_hid2').val(item.Group_chat_id);
							$('#reciever_id_hid3').val(item.Group_chat_id);
							$('#reciever_id_hid4').val(item.Group_chat_id);
							
							html+='     <small style="text-align: center; padding-top: 5px" class="mf-date">'+item.information_message+'</small>';
						}
						
						html+='    </div>';  
						
					}else{
						html+='<div class="message-feed media">';   
						if(!item.information_message_status){
						html+='     <div class="pull-left">';
						if(item.path != null || item.path == ""){
							html+='<img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
						}else{
							html+='<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
						}				
						html+='    </div>';
						html+='    <small class="media-body" style="color: #B3B3B3; margin-top:0px; top:10px;">';   
						html+= item.Sender_id;
						html+='    </small>';
						html+='         <div id="'+item.Message_id+'" class="circle chat-left" '+String_theme_chat_left+'>';
						if(item.image_message_status == '1'){
							var split = item.image_path.substr(item.image_path.lastIndexOf("."),(item.image_path).length);
							if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
								html+= '<a><img id="data-enlargeable" src="'+item.image_path+'" alt=""  style="width:250px"></a>';
							}else{
								html+="<B>Incorrect Image file type!</B>"
							}		
						} 
						if(item.file_message_status == '1'){
							var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
							if(video.toUpperCase() === ".MP4")
							{
								html+=' <i class="fa fa-file"></i>&ensp;';
								html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
								//$('#watchvid').attr('src', item.file_path);
							}
							else
							{
								html+=' <i class="fa fa-file"></i>&ensp;';	
								html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
							}
						}if(item.sticker_message_status =='1'){
							html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
						}else{
							if(item.Group_chat_message) {
								html+=	replaceShowMessage(linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>")));
							}
						}
						html+='       </div>';  
						html+='       <div style="margin-top:0px; margin-left:45px">';    
						html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
						if(item.like_status == "1"){
							html+='     <i id="like_btn" name = "'+item.Group_chat_message_id+'"class="like-btn like-active"></i>';
							html+='     <span style="position:relative; right:15px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';    
						}else{
							html+='     <i id="like_btn" name = "'+item.Group_chat_message_id+'"class="like-btn"></i>';
							html+='     <span style="position:relative; right:15px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';  
						}
						html+='       </div>'; 
						html+='     </div>'; 
						}
						if(item.information_message_status == "1"){
							$('#reciever_id').html(item.Group_chat_Name);
							$('#reivever_id').val(item.Group_chat_id);
							$('#reciever_avatar').attr("src",item.Group_img_path);
							$('#reciever_id_hid').val(item.Group_chat_id);
							$('#reciever_id_hid2').val(item.Group_chat_id);
							$('#reciever_id_hid3').val(item.Group_chat_id);
							$('#reciever_id_hid4').val(item.Group_chat_id);
							html+='     <small style="text-align: center; padding-top: 5px" class="mf-date">'+item.information_message+'</small>';
							
						}
						
						html+='    </div>'; 
					}	
					if (i == length-1){
						if(messid != item.Message_id){
							toBottom();
						}
						if(messid == ""){
							toBottom();
						}
						messid = item.Message_id;
					}
				});		
				i=0;
				$('#message_body').html('');
				$('#message_body').append(html);		
				if(current_length != length){
					if(topload == true){
						topload = false;
						$("#message_body").scrollTop( 300 );
					}else if(topload == false) {
						toBottom();
					}else {
						toBottom();
					}
					
					current_length = length;
				}
				
				
	        }
			
		});
	}
	
}
function getCurrentmemberlist(data){
	var htmlx = "";
	var Owner_id = $('#Owner_chat_id').val();
	var json = JSON.parse(data);
	selectedsmember = [];
	json.forEach((item) => {
         htmlx += '<div class="list-group-item media listS" '+String_listS+' id="UserTest1" name="memberlist" > '; 
         htmlx += '<div class="lv-avatar pull-left">';
         if(item.path == null || item.path == ''){
        	 htmlx += ' <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
         }else{
        	 htmlx += ' <img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
         }
        htmlx += '</div>';
        htmlx += '<div class="media-body" style="padding-top:0px">'; 
        htmlx += '<span class="list-group-item-heading">'+item.name+'</span>';
        htmlx += '<small class="list-group-item-text c-gray"> : '+item.department_id+'</small>';
        htmlx += '<span style="float: right; padding-right:5px" class="float-right">';
        selectedsmember.push(item.id.toLowerCase());
        if(item.id.toLowerCase() != Owner_id.toLowerCase()){   	
        	htmlx += '<a role="button" name="removemember" id = "'+item.id.toLowerCase()+'" data-gid = "'+item.Group_chat_id+'" data-val = "'+item.Group_chat_member_id+'"><i class="fa fa-minus-circle font-red"></i></a>'; 
        }
        htmlx += '</span>';		
        htmlx += '</div>';
        htmlx += '</div>';	
	});
	return htmlx;
}

function getUserComparetoMember (data){
	var Owner_id = $('#Owner_chat_id').val();
	var json = JSON.parse(data);
	var htmls = "";
	const Lowercased = selectedsmember.map(selectedsmember => selectedsmember.toLowerCase());
	json.forEach((item) => {
		if(!(Lowercased.includes(item.id.toLowerCase()))){
			htmls += '<div class="list-group-item media listS"'+String_listS+' id="UserTest1" name="memberlist"> '; 
	        htmls += '<div class="lv-avatar pull-left">';
	        if(item.path == null || item.path == ''){
	        	htmls += '<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
	        }else{
	        	htmls += '<img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
	        }  
	        htmls += '</div>';
	        htmls += '<div class="media-body" style="padding-top:0px">';
	        htmls += '<span class="list-group-item-heading">'+item.name+'</span>';
	        htmls += '<small class="list-group-item-text c-gray"> : '+item.department_id+'</small>'; 
	        htmls += '<span style="float: right; padding-right:5px" class="float-right">';
			htmls += '<a role="button" name="addmember" id = "'+item.id.toLowerCase()+'" data-gid = "'+item.Group_chat_id+'" data-val = "'+item.Group_chat_member_id+'"><i class="fa fa-plus-circle font-green-jungle"></i></a>';
			htmls += '</span>';
			htmls += '</div>';
			htmls += '</div>'; 
		}                               
	});
	return htmls;
}
function show_file(data){
	var ChatType = $('#Chattype').val().toLowerCase();
	var htmlsqw = "";
	var json = JSON.parse(data);
	json.forEach((item) => {
		if(item.file_message_status == "1"){
			var file_type_index = item.file_path.lastIndexOf(".");
			var split = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
			if(!(split.toUpperCase() === ".MP4")) {
				htmlsqw += '<div><a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a></div>';
			}			
		}
	});
	$('#file-file').html('');
	$('#file-file').append(htmlsqw);
}
function show_image(data){
	var ChatType = $('#Chattype').val().toLowerCase();
	var htmlse = "";
	var json = JSON.parse(data);
	json.forEach((item) => {
		if(ChatType == "p"){
			if(item.img_message_status == "1"){
				var file_type_index = item.img_path.lastIndexOf(".");
				var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
				if((split.toUpperCase() === ".JPG") || (split.toUpperCase() === ".PNG") || (split.toUpperCase() === ".GIF")|| (split.toUpperCase() === ".JPEG")|| (split.toUpperCase() === ".TIFF")) {
					htmlse += '<div><a><img id="data-enlargeable" src="'+item.img_path+'" target="_blank"/></a></div>';
				}
				
			}			
		}else if(ChatType == "g"){
			if(item.image_message_status == "1"){
				var file_type_index = item.image_path.lastIndexOf(".");
				var split = item.image_path.substr(item.image_path.lastIndexOf("."),(item.image_path).length);
				if((split.toUpperCase() === ".JPG") || (split.toUpperCase() === ".PNG") || (split.toUpperCase() === ".GIF")|| (split.toUpperCase() === ".JPEG")|| (split.toUpperCase() === ".TIFF")) {
					htmlse += '<div><a><img id="data-enlargeable" src="'+item.image_path+'" target="_blank"/></a></div>';
				}			
			}			
		}		
	});
	$('#img-file').html('');
	$('#img-file').append(htmlse);
}
function show_video(data){
	var ChatType = $('#Chattype').val().toLowerCase();
	var htmlss = "";
	var json = JSON.parse(data);
	json.forEach((item) => { 
		if(item.file_message_status == "1"){
			var file_type_index = item.file_path.lastIndexOf(".");
			var split = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
			if(split.toUpperCase() === ".MP4") {
				htmlss += '<div><a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid"><video src="'+item.file_path+'"></video></a></div>';
			}
			
		}
	});
	$('#vid-file').html('');
	$('#vid-file').append(htmlss);
}
function searchmemberlist(){
	var searchtxt = $('#searchmembertext').val().replace("%", "#$@????????????????????").replace("_", "#$##???????????????????").trim();
	var depart = $('#sortmemberdepart').val();
	if(depart == "all" && searchtxt == ""){
		//"do select all"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'All',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = getUserComparetoMember(data);
				$('#memberidlist').html('');
				$('#memberidlist').append(htmltext);
			}
		});
	}else if(depart == "all" && searchtxt != ""){
		//"do select by name"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'name',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = getUserComparetoMember(data);
				$('#memberidlist').html('');
				$('#memberidlist').append(htmltext);
			}
		});
	}else if(depart != "all" && searchtxt != ""){
		//"do select by name and department"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'both',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = getUserComparetoMember(data);
				$('#memberidlist').html('');
				$('#memberidlist').append(htmltext);
			}
		});
	}else if(depart != "all" && searchtxt == ""){
		//"do select by department"
		$.ajax({
			url:'GetEnablelist',
			method:'POST',
			type:'JSON',
			data:{
				'searchtype' : 'depart',
				'searchtxt' : searchtxt,
				'depart' : depart
			},success:function(data){
				var htmltext ="";
				htmltext = getUserComparetoMember(data);
				$('#memberidlist').html('');
				$('#memberidlist').append(htmltext);
			}
		});
	}
}
function linkify(inputText) {
    var replacedText, replacePattern1, replacePattern2, replacePattern3;
    //URLs starting with http://, https://, or ftp://
    replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
    replacedText = inputText.replace(replacePattern1, '<a '+String_lify +' id="lify" class="colorB" href="$1" target="_blank">$1</a>');
    //URLs starting with "www." (without // before it, or it'd re-link the ones done above).
    replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
    replacedText = replacedText.replace(replacePattern2, '$1<a '+String_lify +' id="lify" class="colorB" href="http://$2" target="_blank">$2</a>');
    //Change email addresses to mailto:: links.
    replacePattern3 = /(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim;
    replacedText = replacedText.replace(replacePattern3, '<a '+String_lify +' id="lify" class="colorB" href="mailto:$1">$1</a>');
    return replacedText; 
}
function check_new_message(){
	var Reciever_id = $('#reciever_id_hid').val();
	getMessagedata(Reciever_id);

}

function check_new_group_message(){
	var Reciever_id = $('#reciever_id_hid').val();
	getMessagedata(Reciever_id);
	refresh_group_image(Reciever_id);
}

function check_new_Group_list(){
	$.ajax({
		url:'GetGrouplist',
		method:'POST',
		type:'json',
		data:{
			'Group_stat' : 0
		},success:function(data){
			var Owner_id = $('#Owner_chat_id').val();
			var favarray = [];
			html = "";
			html +='';
			html +='<a class="list-group-item media" '+String_theme_userlist_item+' id="newchatgroupopen" data-toggle="modal" data-target="#exampleModal">';
			html +='<input type="hidden" value="/pages-back/img/profile2.png" id="1" name="img">  ';
			html +='<div id="add" class="lv-avatar pull-left"><button id = "opencreate" type="button" '+String_btn_icon_only+' class="btn btn-icon-only" ><i class="fa fa-user-plus fa-1x"></i></button></div>'; 
			html +='<div class="media-body"> ';
			html +='<div '+String_theme_userlist_item_heading+' class="list-group-item-heading textaddgroup">Create New Group</div></div></a> '; 
		//	html +='<small class="list-group-item-text c-gray">Create New Group</small> </div></a>';
			var jsondata =  JSON.parse(data);
			jsondata.forEach((item) => { favarray.push(item.favorite_mark)});
			var favindex = favarray.indexOf("1");
			
			if(favindex != -1){
				html += '<div class="separator">Favorite group</div>';
			}			
			jsondata.forEach((item) => {
			
					if(item.favorite_mark == "1"){
    		 		
    		 		html += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.Group_chat_id+'" name = "Grouplist">';
    		 		if(item.Group_img_path == null || item.Group_img_path == ""){
    		 			html += '<input type="hidden" value = "http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		else{
    		 			html += '<input type="hidden" value = "'+item.Group_img_path+'" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		html += '<input type = "hidden" id = "namegroupname" value = "'+item.Group_chat_Name+'"/>';
    		 		html += '<input type = "hidden" id = "groupdescriptions" value = "'+item.Group_Description+'"/>';
    		 		html += '<input type ="hidden" value = "'+item.Group_chat_user_create+'" id = "usercreate"  />';
    		 		html += '    <div class="lv-avatar pull-left">';
    		 		if(item.Group_img_path == null || item.Group_img_path  == ""){
    		 			html += ' <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" class="circle img-avatar crop-image">';
    		 		}else{
    		 			html += ' <img src="'+item.Group_img_path+'" alt="" class="circle img-avatar crop-image">';		
    		 		}   		 		
    		 		html += ' </div>';
    		 		html += ' <div class="media-body">';  
    		 		
    		 		html += '  <div class="list-group-item-heading" '+String_theme_userlist_item_heading+' id = "groupnames" value = "'+item.Group_chat_Name+'">'+item.Group_chat_Name+'</div>';
    		 		if(item.Group_Description != null || item.Group_Description == ""){
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">'+item.Group_Description+'</small>';
    		 		}else{
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">Chat Group Description</small>';
    		 		}
    		 		
    		 		if(item.Group_img_path == "1"){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.Group_chat_Name+'</span>';
    		 		}
    		 		if(item.unread_count > 0){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_count+'</span>';
    		 		}
    		 		
    		 		html += ' </div>';
    		 		html += '</a>';		   
				} 		 	
			});
		


    		html += '<div class="separator">My group</div>';
			jsondata.forEach((item) => {
					if(item.favorite_mark != "1"){
    		 		
    		 		html += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.Group_chat_id+'" name = "Grouplist">';
    		 		if(item.Group_img_path == null || item.Group_img_path == ""){
    		 			html += '<input type="hidden" value = "http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		else{
    		 			html += '<input type="hidden" value = "'+item.Group_img_path+'" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		html += '<input type = "hidden" id = "namegroupname" value = "'+item.Group_chat_Name+'"/>';
    		 		html += '<input type = "hidden" id = "groupdescriptions" value = "'+item.Group_Description+'"/>';
    		 		html += '<input type ="hidden" value = "'+item.Group_chat_user_create+'" id = "usercreate"  />';
    		 		html += '    <div class="lv-avatar pull-left">';
    		 		if(item.Group_img_path == null || item.Group_img_path  == ""){
    		 			html += ' <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" class="circle img-avatar crop-image">';
    		 		}else{
    		 			html += ' <img src="'+item.Group_img_path+'" alt="" class="circle img-avatar crop-image">';		
    		 		}   	 		
    		 		html += ' </div>';
    		 		html += ' <div class="media-body">';  
    		 		
    		 		html += '  <div class="list-group-item-heading" '+String_theme_userlist_item_heading+' id = "groupnames" value = "'+item.Group_chat_Name+'">'+item.Group_chat_Name+'</div>';
    		 		if(item.Group_Description != null || item.Group_Description == ""){
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">'+item.Group_Description+'</small>';
    		 		}else{
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">Chat Group Description</small>';
    		 		}
    		 		
    		 		if(item.Group_img_path == "1"){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.Group_chat_Name+'</span>';
    		 		}
    		 		if(item.unread_count > 0){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_count+'</span>';
    		 		}
    		 		
    		 		html += ' </div>';
    		 		html += '</a>';		   
				} 		 	
			});


			
			$('#Onlinelist_body').load();
			
			$('#Onlinelist_body').html('');
		 	$('#Onlinelist_body').append(html);
		}
	});
}
var checkdata ='';
function check_new_Online_user(){
$("#searchchat").val('');
$.ajax({
	url:'GetOnlinelist',
	method:'POST',
	type:'json',
	data:{
		'Online_stat' : 0
	},success:function(data){
		html ="";
		var Owner_id = $('#Owner_chat_id').val();
		$('#Onlinelist_body').load();
	 	var jsondata = JSON.parse(data);
	 	jsondata.forEach((item) => {
	 		if(item.uid.toLowerCase() != Owner_id.toLowerCase()){
	 		html += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.uid+'" name = "userlist">';
	 		if(item.img != null){
	 			html += '<input type="hidden" value = "'+item.img+'" id = "'+item.uid+'" name = "img" />';
	 		}
	 		else{
	 			html += '<input type="hidden" value = "/pages-back/img/profile2.png" id = "'+item.uid+'" name = "img" />';
	 		}
	 		html += '    <div class="lv-avatar pull-left">';
	 		if(item.img != null){
	 			html += ' <img src="'+item.img+'" alt="" class="circle img-avatar crop-image">';
	 		}else{
	 			//https://www.flaticon.com/svg/vstatic/svg/847/847969.svg?token=exp=1611221899~hmac=3b2356ce8d20708e75ee63e1a3fa125c
	 			//html += ' <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="circle img-avatar">';
	 				html += ' <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar">';
	 		}   		 		
	 		html += ' </div>';
	 		html += ' <div class="media-body">';
	 		html += '  <div class="list-group-item-heading" '+String_theme_userlist_item_heading+'>'+item.uid+'</div>';
	 		if(item.online == 1){
	 			html += '  <small class="list-group-item-text c-gray"><i style="color: #35b152" class="fa fa-circle"></i> Online</small>';
	 		}else if (item.online == 0){
	 			html += '  <small class="list-group-item-text c-gray"><i style="color: red" class="fa fa-circle"></i> Offline</small>';
	 		}
	 		
	 		if(item.unread_count > 0){
	 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_count+'</span>';
	 		}
	 		html += ' </div>';
	 		html += '</a>';
	 		}else{
	 			 
	 		}
	 	});
	 	$('#Onlinelist_body').html('');
	 	$('#Onlinelist_body').append(html);
	}
})	

}





if(theme == '1'){
			String_theme_chat_right = 'Style="background-color:#53585f;color:#d3dbde"';
			String_theme_chat_left = 'Style="background-color:#5f656d;color:#d3dbde"';
			String_theme_userlist_item = 'Style="background-color:#3b3e44;color:white"';
			String_theme_userlist_item_heading = 'Style="color:white"';
			String_btn_icon_only = 'Style="background-color:#3b3e44"';
			String_listS = 'Style="background-color:#3b3e44;color:#d3dbde"';
			String_labelbtn = 'Style="background:radial-gradient(circle, rgba(72,77,88,1) 0%, rgba(47,49,54,1) 100%);color:white"';
			String_lify = 'Style="color:#9cc2e3"';
			String_file = 'Style="color:#9cc2e3"';
			$('#btnrotate').removeClass('gradient-animation-bt');
			$('.icon-b').removeClass('gradient-animation-bt');
			$('.p-16').removeClass('gradient-animation');
			$('.ms-body').removeClass('bgrgb');
			$('.ms-menu').removeClass('bguser');
			$('.action-header').removeClass('bgrgb');
			$('.bs-container').removeClass('bgrgb');
			$('#ultheme').removeClass('bgrgb');
			$('.modal-body').removeClass('bgrgb');
			$('.btnmodal').removeClass('gradient-animation-bt');
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').css('background-color' , '#53585f');
			$('.chat-left').css('background-color' , '#5f656d'); 
			$('.chat-right').css('color' , '#d3dbde');
			$('.chat-left').css('color' , '#d3dbde');
			$('.ms-user').css('background-color' , '#2f3136');
			$('.ms-user').css('color' , 'white');
			$('.p-15').css('border-color' , '#36393f');
			$('.action-header').css('color' , 'white');              
			$('.action-header').css('border-color' , '#2f3136');
			$('.action-header').css('background-color' , '#36393f');
			$('.ms-menu').css('border-color' , '#2f3136');
			$('.ms-menu').css('background-color' , '#2f3136');
			$('.ms-body').css('background-color' , '#36393f');
			$('.bs-container').css('background-color' , '#36393f');
			$('#messages-main').css('background-color' , '#36393f');
			$('#Message_text').css('color' , 'white');
			$('#Message_text').addClass('white');
			$('.list-group-item').css('background-color' , '#3b3e44');
			$('.list-group-item').css('color' , 'white');
			$('.list-group-item-heading').css('color' , 'white'); 
			$('#Message_text').css('background-color' , '#424549');
			$('.icon-b').css('color' , 'white')	;
			$('.icon-b').css('background-color' , '#424549');
			$('.fa-comments').css('color' , '#E1E5EC');
			$('.fa-smile-o').css('color' , 'white');
			$('#btnrotate').css('background-color' , '#424549');
			$('#ultheme').css('background-color' , '#424549');
			$('.fa-cog').css('color' , 'white');
			$('.fa-search').css('color' , 'white');
			$('.fa-user-plus').css('color' , 'white');
			$('.fa-pencil').css('color' , 'white');
			$('.fa-bars').css('color' , 'white');
			$('.btn-block').addClass('btnblack');
			$('#Emoji').addClass('emoDBB');
			$('#sticker').addClass('emoDBB');
			$('.btn-icon-only').css('background-color' , '#3b3e44');
			$('.scbox').css('background-color' , '#3b3e44');
			$('.listS').css('background-color' , '#3b3e44');
			$('.listS').css('color' , '#d3dbde');
			$('.modal-body').css('background-color' , '#2f3136');
			$('.modal-body').css('color' , '#d3dbde');
			$('.sel').css('color' , 'black');
			$('.btnmodal').addClass('btnblack');
			$('summary').css('color' , 'white');
			$('.labell').addClass('btnblack');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black');
			$('#Editgroup').addClass('btnblack');
			$('.tabbtn').css('color' , 'white');
			$('.tabbtn').css('border-color' , 'white');
			$('#lify').addClass('colorW');
		}else if(theme == '0'){
			String_theme_chat_right = 'Style="background-color:#daf2ff;color:#474b52"';
			String_theme_chat_left = 'Style="background-color:#eef1f5;color:#474b52"';
			String_theme_userlist_item = 'Style="background-color:white;color:#333"';
			String_theme_userlist_item_heading = 'Style="color:#333"';
			String_btn_icon_only = 'Style="background-color:white"';
			String_listS = 'Style="background-color:white;color:#333"';
			String_labelbtn = 'Style="background:radial-gradient(circle, rgba(142,158,228,1) 0%, rgba(148,200,233,1) 100%);color:white"';
			String_lify = 'Style="color:#337AB7"';
			String_file = 'Style="color:#337AB7"';
			$('#btnrotate').removeClass('gradient-animation-bt');
			$('.icon-b').removeClass('gradient-animation-bt');
			$('.p-16').removeClass('gradient-animation');
			$('.ms-body').removeClass('bgrgb');
			$('.ms-menu').removeClass('bguser');
			$('.action-header').removeClass('bgrgb');
			$('.bs-container').removeClass('bgrgb');
			$('#ultheme').removeClass('bgrgb');
			$('.modal-body').removeClass('bgrgb');
			$('.btnmodal').removeClass('gradient-animation-bt');
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('#Message_text').removeClass('white');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').css('background-color' , '#daf2ff'); 
			$('.chat-left').css('background-color' , '#eef1f5');   
			$('.chat-right').css('color' , '#474b52'); 
			$('.chat-left').css('color' , '#474b52'); 
			$('.ms-menu').css('background-color' , '#f5f8fd');
			$('.ms-user').css('background-color' , '#f5f8fd');
			$('.ms-user').css('color' , 'black'); 
			$('.ms-menu').css('border-color' , ' #E1E5EC');
			$('.ms-body').css('background-color' , '#fff');
			$('.p-15').css('border-color' , '#E1E5EC'); 
			$('.action-header').css('color' , '#333');
			$('.action-header').css('border-color' , '#E1E5EC');
			$('.action-header').css('background-color' , '#fff'); 
			$('.bs-container').css('background-color' , '#fff');
			$('#messages-main').css('background-color' , '#fff');
			$('#Message_text').css('color' , 'black');  
			$('.icon-b').css('color' , 'black');
			$('.icon-b').css('background-color' , '#E1E5EC');
			$('.fa-comments').css('color' , '#E1E5EC');
			$('.fa-smile-o').css('color' , 'black');
			$('#btnrotate').css('background-color' , '#E1E5EC');
			$('#ultheme').css('background-color' , 'white');
			$('#ulmes').css('background-color' , 'white');
			$('.fa-cog').css('color' , 'black');
			$('.fa-search').css('color' , 'black');
			$('.fa-user-plus').css('color' , 'black');
			$('.fa-pencil').css('color' , 'black');
			$('.fa-bars').css('color' , 'black');
			$('#Message_text').css('background-color' , '#E1E5EC');
			$('.list-group-item').css('background-color' , 'white');
			$('.list-group-item').css('color' , '#333');
			$('.list-group-item-heading').css('color' , '#333');
			$('.btn-block').addClass('btnwhite');
			$('#Emoji').addClass('emoDBW');
			$('#sticker').addClass('emoDBW');
			$('.btn-icon-only').css('background-color' , 'white');
			$('.scbox').css('background-color' , 'white');
			$('.listS').css('background-color' , 'white');
			$('.listS').css('color' , '#333');
			$('.modal-body').css('background-color' , '#f5f8fd');
			$('.modal-body').css('color' , '#333'); 
			$('.sel').css('color' , 'black');
			$('.btnmodal').addClass('btnwhite');
			$('summary').css('color' , 'black');
			$('.labell').addClass('btnwhite');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black');
			$('#Editgroup').addClass('btnwhite');
			$('.tabbtn').css('color' , 'black');
			$('.tabbtn').css('border-color' , 'black');
			$('#lify').addClass('colorB');
		} else if(theme == '2'){
			String_theme_chat_right = 'Style="background: linear-gradient(48deg, rgba(255,61,119,1) 0%, rgba(51,138,255,1) 100%);color:#d3dbde"';  
			String_theme_chat_left = 'Style="background-color:#474d6b;color:#d3dbde"';
			String_theme_userlist_item = 'Style="background-color:#33374d;color:white"';
			String_theme_userlist_item_heading = 'Style="color:white"';
			String_btn_icon_only = 'Style="background-color:#33374d"';
			String_listS = 'Style="background-color:#292c3d;color:white"';
			String_labelbtn = 'Style="background: linear-gradient(-45deg, #FFA63D, #FF3D77, #338AFF, #3CF0C5);background-size: 300% 300% ;-webkit-animation: AnimationName .5s linear infinite;-moz-animation: AnimationName .5s linear infinite;animation: AnimationName .5s linear infinite; color:white"';
			String_lify = 'Style="color:#9cc2e3"';
			String_file = 'Style="color:#9cc2e3"';
			$('.btn-block').removeClass('btnwhite');
			$('.btn-block').removeClass('btnblack');
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('#Message_text').removeClass('white');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').addClass('gradient-animation-bt');
			$('.chat-left').css('background-color' , '#474d6b');  
			$('.chat-right').css('color' , '#d3dbde');
			$('.chat-left').css('color' , '#d3dbde');
			$('.ms-menu').addClass('bguser');
			$('.ms-user').css('background-color' , '#323549');
			$('.ms-user').css('color' , 'white'); 
			$('.ms-menu').css('border-color' , '#373b52');
			$('.ms-body').addClass('bgrgb');
			$('.p-16').addClass('gradient-animation');
			$('.action-header').css('color' , 'white');
			$('.action-header').css('border-color' , '#292c3d');
			$('.action-header').addClass('bgrgb');
			$('.bs-container').addClass('bgrgb');
			$('#messages-main').css('background-color' , '#fff');
			$('textarea').css('font-color' , 'red');
			$('.icon-b').addClass('gradient-animation-bt');
			$('.icon-b').css('color' , 'white'); 
			$('.fa-comments').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"});  
			$('.fa-smile-o').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"}); 
			$('.fa-send').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"}); 
			$('#btnrotate').addClass('gradient-animation-bt');
			$('#ultheme').addClass('bgrgb');
			$('#ulmes').css('background-color' , 'white');
			$('.fa-cog').css('color' , 'white');
			$('.fa-search').css('color' , 'white');
			$('.fa-user-plus').css('color' , 'white');
			$('.fa-pencil').css('color' , 'white');
			$('.fa-bars').css('color' , 'white');
			$('#Message_text').css('background-color' , 'white');
			$('#Message_text').css('color' , 'black');  
			$('.list-group-item').css('background-color' , '#33374d'); 
			$('.list-group-item').css('color' , 'white');
			$('.list-group-item-heading').css('color' , 'white');
			$('.btn-block').addClass('gradient-animation-bt');
			$('#Emoji').addClass('emoDB');
			$('#sticker').addClass('emoDB');
			$('.btn-icon-only').css('background-color' ,'#33374d'); 
			$('.scbox').css('background-color' , '#292c3d');
			$('.listS').css('background-color' , '#292c3d');
			$('.listS').css('color' , 'white');
			$('.modal-body').addClass('bgrgb');
			$('.modal-body').css('color' , 'white'); 
			$('.sel').css('color' , 'black');
			$('.btnmodal').addClass('gradient-animation-bt');
			$('summary').css('color' , 'white');
			$('.labell').addClass('gradient-animation-bt');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black');
			$('#Editgroup').addClass('gradient-animation-bt');
			$('.tabbtn').css('color' , 'white');
			$('.tabbtn').css('border-color' , 'white');
			$('#lify').addClass('colorW');
		}else if(theme == null || theme == ""){
			String_theme_userlist_item = "";
			String_theme_userlist_item_heading = "";
		} 


$("#theme[Class = 't']").on('click',function(){
	$('#searchchatdata').hide();
	$('#AllResult').val(0);
	$('#AllResult').html(0);
	$('#CurrentResult').val(0);
	$('#CurrentResult').html(0);
	$('#findmessageinchat').val('');
	allresult = 0;
	allresultArray = [];
	var ChatType = $('#Chattype').val().toLowerCase();
	checkRefresh(ChatType);
	
	var theme = $(this).children('input').val();
	var Reciever_id = $('#reciever_id_hid').val();
		if(theme == "dark"){
			String_theme_chat_right = 'Style="background-color:#53585f;color:#d3dbde"';
			String_theme_chat_left = 'Style="background-color:#5f656d;color:#d3dbde"';  
			String_theme_userlist_item = 'Style="background-color:#3b3e44;color:white"';
			String_theme_userlist_item_heading = 'Style="color:white"';
			String_btn_icon_only = 'Style="background-color:#3b3e44"';
			String_listS = 'Style="background-color:#3b3e44;color:#d3dbde"';
			String_labelbtn = 'Style="background:radial-gradient(circle, rgba(72,77,88,1) 0%, rgba(47,49,54,1) 100%);color:white"';
			String_lify = 'Style="color:#9cc2e3"';
			String_file = 'Style="color:#9cc2e3"';
			$('#btnrotate').removeClass('gradient-animation-bt');
			$('.icon-b').removeClass('gradient-animation-bt');
			$('.p-16').removeClass('gradient-animation');
			$('.ms-body').removeClass('bgrgb')
			$('.ms-menu').removeClass('bguser');
			$('.action-header').removeClass('bgrgb');
			$('.bs-container').removeClass('bgrgb');
			$('#ultheme').removeClass('bgrgb');
			$('.modal-body').removeClass('bgrgb');
			$('.btnmodal').removeClass('gradient-animation-bt');
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').css('background-color' , '#53585f');
			$('.chat-left').css('background-color' , '#5f656d'); 
			$('.chat-right').css('color' , '#d3dbde');
			$('.chat-left').css('color' , '#d3dbde');
			$('.ms-user').css('background-color' , '#2f3136');
			$('.ms-user').css('color' , 'white');
			$('.p-15').css('border-color' , '#36393f');
			$('.action-header').css('color' , 'white');
			$('.action-header').css('border-color' , '#2f3136');
			$('.action-header').css('background-color' , '#36393f');
			$('.ms-menu').css('border-color' , '#2f3136');
			$('.ms-menu').css('background-color' , '#2f3136');
			$('.ms-body').css('background-color' , '#36393f');
			$('.bs-container').css('background-color' , '#36393f');
			$('#messages-main').css('background-color' , '#36393f');
			$('#Message_text').css('color' , 'white');
			$('#Message_text').addClass('white');
			$('.list-group-item').css('background-color' , '#3b3e44');
			$('.list-group-item').css('color' , 'white');
			$('.list-group-item-heading').css('color' , 'white'); 
			$('#Message_text').css('background-color' , '#424549');
			$('.icon-b').css('color' , 'white');
			$('.icon-b').css('background-color' , '#424549');
			$('.fa-comments').css('color' , '#E1E5EC');
			$('.fa-smile-o').css('color' , 'white');
			$('#btnrotate').css('background-color' , '#424549');
			$('#ultheme').css('background-color' , '#424549');
			$('.fa-cog').css('color' , 'white');
			$('.fa-search').css('color' , 'white');
			$('.fa-user-plus').css('color' , 'white');
			$('.fa-pencil').css('color' , 'white');
			$('.fa-bars').css('color' , 'white');
			$('.btn-block').addClass('btnblack');
			$('#Emoji').addClass('emoDBB');
			$('#sticker').addClass('emoDBB');
			$('.btn-icon-only').css('background-color' , '#3b3e44');
			$('.scbox').css('background-color' , '#3b3e44');
			$('.listS').css('background-color' , '#3b3e44');
			$('.listS').css('color' , '#d3dbde');
			$('.modal-body').css('background-color' , '#2f3136');
			$('.modal-body').css('color' , '#d3dbde');
			$('.sel').css('color' , 'black'); 
			$('.btnmodal').addClass('btnblack');
			$('summary').css('color' , 'white');
			$('.labell').addClass('btnblack');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black');
			$('#Editgroup').addClass('btnblack');
			$('#Editgroup').addClass('btnblack');
			$('.tabbtn').css('color' , 'white');
			$('.tabbtn').css('border-color' , 'white');
			$('#lify').addClass('colorW');
			var userid = $('#Owner_chat_id').val(); 
			setTheme("1",userid);
			$('#start_theme').val("1");
		}else if(theme == "white") {
			String_theme_chat_right = 'Style="background-color:#daf2ff;color:#474b52"';
			String_theme_chat_left = 'Style="background-color:#eef1f5;color:#474b52"';
			String_theme_userlist_item = 'Style="background-color:white;color:#333"';
			String_theme_userlist_item_heading = 'Style="color:#333"';
			String_btn_icon_only = 'Style="background-color:white"';
			String_listS = 'Style="background-color:white;color:#333"';
			String_labelbtn = 'Style="background:radial-gradient(circle, rgba(142,158,228,1) 0%, rgba(148,200,233,1) 100%);color:white"';
			String_lify = 'Style="color:#337AB7"';
			String_file = 'Style="color:#337AB7"';
			$('#btnrotate').removeClass('gradient-animation-bt');
			$('.icon-b').removeClass('gradient-animation-bt');
			$('.p-16').removeClass('gradient-animation');
			$('.ms-body').removeClass('bgrgb');
			$('.ms-menu').removeClass('bguser');
			$('.action-header').removeClass('bgrgb');
			$('.bs-container').removeClass('bgrgb');
			$('#ultheme').removeClass('bgrgb');
			$('.modal-body').removeClass('bgrgb');
			$('.btnmodal').removeClass('gradient-animation-bt');
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('#Message_text').removeClass('white');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').css('background-color' , '#daf2ff'); 
			$('.chat-left').css('background-color' , '#eef1f5');
			$('.chat-right').css('color' , '#474b52');
			$('.chat-left').css('color' , '#474b52');
			$('.ms-menu').css('background-color' , '#f5f8fd');
			$('.ms-user').css('background-color' , '#f5f8fd');
			$('.ms-user').css('color' , 'black');
			$('.ms-menu').css('border-color' , ' #E1E5EC'); 
			$('.ms-body').css('background-color' , '#fff');
			$('.p-15').css('border-color' , '#E1E5EC'); 
			$('.action-header').css('color' , '#333');
			$('.action-header').css('border-color' , '#E1E5EC');
			$('.action-header').css('background-color' , '#fff'); 
			$('.bs-container').css('background-color' , '#fff');
			$('#messages-main').css('background-color' , '#fff');
			$('#Message_text').css('color' , 'black');  
			$('.icon-b').css('color' , 'black');
			$('.icon-b').css('background-color' , '#E1E5EC');
			$('.fa-comments').css('color' , '#E1E5EC');
			$('.fa-smile-o').css('color' , 'black');
			$('#btnrotate').css('background-color' , '#E1E5EC');
			$('#ultheme').css('background-color' , 'white');
			$('#ulmes').css('background-color' , 'white');
			$('.fa-cog').css('color' , 'black');
			$('.fa-search').css('color' , 'black');
			$('.fa-user-plus').css('color' , 'black');
			$('.fa-pencil').css('color' , 'black');
			$('.fa-bars').css('color' , 'black');
			$('#Message_text').css('background-color' , '#E1E5EC');
			$('.list-group-item').css('background-color' , 'white');
			$('.list-group-item').css('color' , '#333');
			$('.list-group-item-heading').css('color' , '#333'); 
			$('.btn-block').addClass('btnwhite');
			$('#Emoji').addClass('emoDBW');
			$('#sticker').addClass('emoDBW');
			$('.btn-icon-only').css('background-color' , 'white');
			$('.scbox').css('background-color' , 'white');
			$('.listS').css('background-color' , 'white');
			$('.listS').css('color' , '#333');
			$('.modal-body').css('background-color' , '#f5f8fd');
			$('.modal-body').css('color' , '#333'); 
			$('.sel').css('color' , 'black');
			$('.btnmodal').addClass('btnwhite');
			$('summary').css('color' , 'black');
			$('.labell').addClass('btnwhite');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black');
			$('#Editgroup').addClass('btnwhite');
			$('.tabbtn').css('color' , 'black');
			$('.tabbtn').css('border-color' , 'black');
			$('#lify').addClass('colorB');
			var userid = $('#Owner_chat_id').val();
			setTheme("0",userid);
			$('#start_theme').val("0");	
		}else if(theme == "candy") { 
			String_theme_chat_right = 'Style="background: linear-gradient(48deg, rgba(255,61,119,1) 0%, rgba(51,138,255,1) 100%);color:#d3dbde"';  
			String_theme_chat_left = 'Style="background-color:#474d6b;color:#d3dbde"';
			String_theme_userlist_item = 'Style="background-color:#33374d;color:white"';
			String_theme_userlist_item_heading = 'Style="color:white"';
			String_btn_icon_only = 'Style="background-color:#33374d"';
			String_listS = 'Style="background-color:#292c3d;color:white"';
			String_labelbtn = 'Style="background: linear-gradient(-45deg, #FFA63D, #FF3D77, #338AFF, #3CF0C5);background-size: 300% 300% ;-webkit-animation: AnimationName .5s linear infinite;-moz-animation: AnimationName .5s linear infinite;animation: AnimationName .5s linear infinite; color:white"';
			String_lify = 'Style="color:#9cc2e3"';
			String_file = 'Style="color:#9cc2e3"';
			$('.btn-block').removeClass('btnwhite');
			$('.btn-block').removeClass('btnblack'); 
			$('.btnmodal').removeClass('btnwhite');
			$('.btnmodal').removeClass('btnblack');
			$('#Message_text').removeClass('white');
			$('.btn-block').removeClass('btnwhite');
			$('.fa-comments').removeClass('colorCM');
			$('.labell').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnwhite');
			$('#Editgroup').removeClass('btnblack');
			$('#Editgroup').removeClass('gradient-animation-bt');
			$('#Emoji').removeClass('emoDB');
			$('#Emoji').removeClass('emoDBB');
			$('#Emoji').removeClass('emoDBW');
			$('#lify').removeClass('colorB');
			$('#lify').removeClass('colorW');
			$('#sticker').removeClass('emoDB');
			$('#sticker').removeClass('emoDBB');
			$('#sticker').removeClass('emoDBW');
			$('.chat-right').css({color: "linear-gradient(48deg, rgba(255,61,119,1) 0%, rgba(51,138,255,1) 100%)"}); 
			$('.chat-left').css('background-color' , '#474d6b');  
			$('.chat-right').css('color' , '#d3dbde');
			$('.chat-left').css('color' , '#d3dbde');
			$('.ms-menu').addClass('bguser');
			$('.ms-user').css('background-color' , '#323549'); 
			$('.ms-user').css('color' , 'white'); 
			$('.ms-menu').css('border-color' , '#373b52');
			$('.ms-body').addClass('bgrgb');
			$('.p-16').addClass('gradient-animation');
			$('.action-header').css('color' , 'white');
			$('.action-header').css('border-color' , '#292c3d');
			$('.action-header').addClass('bgrgb');
			$('.bs-container').addClass('bgrgb');
			$('#messages-main').css('background-color' , '#fff');
			$('textarea').css('font-color' , 'white');
			$('.icon-b').addClass('gradient-animation-bt');
			$('.icon-b').css('color' , 'white'); 
			$('.fa-comments').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"});  
			$('.fa-smile-o').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"}); 
			$('.fa-send').css({color: "linear-gradient(58deg, rgba(51,138,255,1) 0%, rgba(255,61,119,1) 1%, rgba(255,166,61,1) 2%)"}); 
			$('#btnrotate').addClass('gradient-animation-bt');
			$('#ultheme').addClass('bgrgb');
			$('#ulmes').css('background-color' , 'white');
			$('.fa-cog').css('color' , 'white');
			$('.fa-search').css('color' , 'white');
			$('.fa-user-plus').css('color' , 'white');
			$('.fa-pencil').css('color' , 'white');
			$('.fa-bars').css('color' , 'white');
			$('#Message_text').css('background-color' , 'white');
			$('#Message_text').css('color' , 'black');  
			$('.list-group-item').css('background-color' , '#33374d'); 
			$('.list-group-item').css('color' , 'white');
			$('.list-group-item-heading').css('color' , 'white');
			$('.btn-block').addClass('gradient-animation-bt');
			$('#Emoji').addClass('emoDB');
			$('#sticker').addClass('emoDB');
			$('.btn-icon-only').css('background-color' ,'#33374d');
			$('.scbox').css('background-color' , '#292c3d');
			$('.listS').css('background-color' , '#292c3d');
			$('.listS').css('color' , 'white');
			$('.modal-body').addClass('bgrgb');
			$('.modal-body').css('color' , 'white'); 
			$('.sel').css('color' , 'black');
			$('.btnmodal').addClass('gradient-animation-bt');
			$('summary').css('color' , 'white');
			$('.labell').addClass('gradient-animation-bt');
			$('#loadchat').css('color' , 'black');
			$('#loadchatt').css('color' , 'black'); 
			$('#Editgroup').addClass('gradient-animation-bt');
			$('.tabbtn').css('color' , 'white');
			$('.tabbtn').css('border-color' , 'white');
			$('#lify').addClass('colorW');
			var userid = $('#Owner_chat_id').val(); 
			setTheme("2",userid);
			$('#start_theme').val("2");
		}
		var ChatType = $('#Chattype').val().toLowerCase();
		if(ChatType == "p"){
			getMessagedata(Reciever_id);
			toBottom();
		}else if(ChatType == "g"){
			getMessagedata(Reciever_id);
			toBottom();
		}
	});

$(document).on('click','#li2' , function(){
	check_new_Group_list();
		clearInterval(myVars2);
		myVars2 = setInterval(check_new_Group_list,1100);
		$('#Searchtype').val('g');
		$('#searchchat').val('');
});
$(document).on('click','#li1',function(){
	check_new_Online_user();
		clearInterval(myVars2);
		myVars2 = setInterval(check_new_Online_user, 1100);
		$('#Searchtype').val('p');
		$('#searchchat').val('');
});
$(document).on('submit','#fileform',function(e){
	var ChatType = $('#Chattype').val().toLowerCase();
	 var formData = new FormData(this);
	
	 
	 if(ChatType == "p"){
	 
	 	// console.log($('#size').val());
	 	var size_ne = $('#size').val().replace(" ","").replace("Bytes","").replace("KB","").replace("MB","").replace("GB","");
	 	if(size_ne > 25 && (size_ne.includes("MB") || size_ne.includes("GB"))){
	 		  var chat_text = "Failed to upload file! File Size Over 25 MB ";
			var Owner_id = $('#Owner_chat_id').val();
			var Reciever_id = $('#reciever_id_hid').val();
			set_read(Reciever_id);
			$.ajax({
				url:'SendChatMessage',
				method:'POST',
				type:'json',
				data:{
					'Sender' : Owner_id,
					'Reciever' : Reciever_id,
					'chat_text' : chat_text
				},success:function(data){
					getMessagedata(Reciever_id);
					$('#Message_text').val('');
					toBottom();
				}
			});
	 	}else{
	 	//console.log("das");
	 	 $.ajax({
	      type: "POST",
	      url: "Sendfile",
	      cache:false,
         contentType: false,
         processData: false,
	      enctype:"multipart/form-data",
	      data: formData,
	      success:function(data){
			$('#myfilefile').val('');
	      }
	    });
	    
	 	}
		
	  e.preventDefault();
	 }else if(ChatType == "g"){
	 // console.log($('#size').val());
	 	var size_ne = $('#size').val().replace(" ","").replace("Bytes","").replace("KB","").replace("MB","").replace("GB","");
	 //console.log("do");
	 if(size_ne > 25 && (size_ne.includes("MB") || size_ne.includes("GB"))){
	 		  var chat_text = "Failed to upload file! File Size Over 25 MB ";
			var Owner_id = $('#Owner_chat_id').val();
			var Reciever_id = $('#reciever_id_hid').val();
			set_read(Reciever_id);
			$.ajax({
    		url:'SendGroupChatMessage',
    		method:'POST',
    		type:'json',
    		data:{
			'Sender' : Owner_id,
			'GroupReciever_id' : Reciever_id,
			'chat_text' : chat_text
    		},success:function(data){
    		//console.log("dodo");
    			getMessagedata(Reciever_id);
    			$('#Message_text').val('');
    			message_input = "";
    			toBottom();
    		}
    	});
	 	}else{
	 	//console.log("das");
		 $.ajax({
		      type: "POST",
		      url: "SendGroupfile",
		      cache:false,
	         contentType: false,
	         processData: false,
		      enctype:"multipart/form-data",
		      data: formData,
		      success:function(data){
		    	  $('#myfilefile').val('');
		      }
		    });
		    
		    
	 
	 }
	
		    
		    
		  e.preventDefault();
	 }
	  
});
$(document).on('change','#myfilefile',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
//	console.log(ChatType);
	 var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
	  var size_n = (Math.round(fSize*100)/100);
	  var size = size_n+' '+fSExt[i];
	  $('#size').val(size);
	  if (size_n > 25 && (fSExt[i] == 'MB' || fSExt[i] == 'GB'))
	  {
	  if(ChatType == "p"){
	//  console.log("dp");
	  var chat_text = "Failed to upload file! File Size Over 25 MB ";
			var Owner_id = $('#Owner_chat_id').val();
			var Reciever_id = $('#reciever_id_hid').val();
			set_read(Reciever_id);
			$.ajax({
				url:'SendChatMessage',
				method:'POST',
				type:'json',
				data:{
					'Sender' : Owner_id,
					'Reciever' : Reciever_id,
					'chat_text' : chat_text
				},success:function(data){
					getMessagedata(Reciever_id);
					$('#Message_text').val('');
					toBottom();
				}
			});
	  }else if(ChatType == "g"){
	//  console.log("dos");
	    var chat_text = "Failed to upload file! File Size Over 25 MB ";
			var Owner_id = $('#Owner_chat_id').val();
			var Reciever_id = $('#reciever_id_hid').val();
			set_read(Reciever_id);
			$.ajax({
    		url:'SendGroupChatMessage',
    		method:'POST',
    		type:'json',
    		data:{
			'Sender' : Owner_id,
			'GroupReciever_id' : Reciever_id,
			'chat_text' : chat_text
    		},success:function(data){
    		//console.log("dodo");
    			getMessagedata(Reciever_id);
    			$('#Message_text').val('');
    			message_input = "";
    			toBottom();
    		}
    	});
	  
	  }
		  
	  }else
	  {
		  $('#fileform').submit();
	  }
});


function checkRefresh(Chattype){
		var search_text = $('#findmessageinchat').val().replace("%", "").replace("_", "").trim();
		if(Chattype == 'p'){
			if(!(search_text == null || search_text == "")){
				clearInterval(myVars);
			}else{
				clearInterval(myVars);
				myVars = setInterval(check_new_message, 1000);
			}
		}else if(Chattype == 'g'){
			if(!(search_text == null || search_text == "")){
				clearInterval(myVars);
			}else{
				clearInterval(myVars);
				myVars = setInterval(check_new_group_message, 1000);
			}
		}
	}
	
	function showfoundresult(data){
		var jsondata = JSON.parse(data);
		var Owner_id = $('#Owner_chat_id').val().toLowerCase();
		var reciever_avartar =$('#reciever_avatar').attr('src');
		var textsearch = $('#findmessageinchat').val().replace("%", "").replace("_", "").trim();
		var html = "";
		var ChatType = $('#Chattype').val().toLowerCase();
		if(ChatType == "p"){
			jsondata.forEach((item)=>{
			if(item.Sender_id.toLowerCase() == Owner_id){
					html+='<div class="message-feed right" >';  
					html+='     <div class="pull-right">';
					if(item.path != null){
						html+='        <img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}					
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_id == allresultArray[parseInt($('#CurrentResult').val())]){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" name = "markfound" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>'+item.Message_text+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px"></a>';	
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}						
					}
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a href="#" '+String_file+' name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					} 
					html+='       </div>';
					html+='       <div style="">';   
					if(item.like_status == '1'){
							html+='<i style="right:50px" name = "'+item.Message_id+'"class="like-btn like-active"></i>'; 
					}	
					html+='     <small style="float:right; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+''; 
					if(item.Reciever_read_status == '1'){
						html+='        <i style="color: #E1E5EC;" class="fa fa-check"></i>';
					}
					html+='</small>';
					html+='     </div>'; 
					html+='     </div>';
					html+='    </div>';  

				}else{
					html+='<div class="message-feed media">';  
					html+='     <div class="pull-left">';
					if(reciever_avartar != null){
						html+='        <img src="'+reciever_avartar+'" alt="" class="circle img-avatar crop-image">';
					}else{
						html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
					}				
					html+='    </div>';
					html+='    <div class="media-body">';
					if(item.Message_id == allresultArray[parseInt($('#CurrentResult').val())]){
					html+='         <div style="background:#ffff00"id="'+item.Message_id+'" name = "markfound" class="circle chat-left" '+String_theme_chat_left+'>'+linkify(item.Message_text.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';
					}
					else{html+='         <div id="'+item.Message_id+'" class="circle chat-left" '+String_theme_chat_left+'>'+linkify(item.Message_text.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';}
					if(item.img_message_status == '1'){
						var split = item.img_path.substr(item.img_path.lastIndexOf("."),(item.img_path).length);
						if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
							html+= '<a><img id="data-enlargeable" src="'+item.img_path+'" alt=""  style="width:250px" class="crop-image"></a>';
						}else{
							html+="<B>Incorrect Image file type!</B>"
						}		
					} 
					if(item.file_message_status == '1'){
						var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
						if(video.toUpperCase() === ".MP4")
						{
							html+=' <i class="fa fa-file"></i>&ensp;';
							html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
							//$('#watchvid').attr('src', item.file_path);
						}
						else
						{
							html+=' <i class="fa fa-file"></i>&ensp;';	
							html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
						}
					}if(item.sticker_status =='1'){
						html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
					}
					html+='       </div>';  
					html+='       <div style="margin-top:0px">';   
					html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
					if(item.like_status == '1'){
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn like-active"></i>';
					}else{
						html+='     <i id="like_btn" name = "'+item.Message_id+'"class="like-btn"></i>';
					}
					html+='       </div>';
					html+='     </div>'; 
					html+='    </div>'; 
				}	
					/*
				if (i == length-1){
					if(messid != item.Message_id){
						toBottom();
					}
					if(messid == ""){
						toBottom();
					}
					messid = item.Message_id;
				}*/
				if(item.Message_text == ""){}	
				else if(item.Message_text.match("(.*)"+textsearch+"(.*)"))
				{

				
				}
				else{}

			
			
			
			
		});
		}else if(ChatType == "g"){
			var reciever_avartar =$('#reciever_avatar').attr('src');
			 	var jsondata = JSON.parse(data);
				var text = "";
				html ="";
				var Owner_id = $('#Owner_chat_id').val();
				var pro_img = $('#pro_img').val();
			jsondata.forEach((item) => {
				if(item.Sender_id.toLowerCase() == Owner_id.toLowerCase()){
						html+='<div class="message-feed right" >';  
						if(!item.information_message_status){
						html+='     <div class="pull-right">';
						if(pro_img != null){
							html+='        <img src="'+pro_img+'" alt="" class="circle img-avatar crop-image">';
						}else{
							html+='        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
						}					
						html+='    </div>';
						html+='    <div class="media-body">';
						if(item.Group_chat_message_id == allresultArray[parseInt($('#CurrentResult').val())]){
							html+='         <div style="background:#ffff00"id="'+item.Group_chat_message_id+'" name = "markfound" class="circle chat-left" '+String_theme_chat_right+'>';/*+linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';*/
							}
						else{html+='         <div id="'+item.Group_chat_message_id+'" class="circle chat-left" '+String_theme_chat_right+'>';/*+linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';*/}
					
						//html+='         <div id="'+item.Message_id+'" class="circle chat-right" '+String_theme_chat_right+'>';
						if(item.image_message_status == '1'){
							if(item.image_path){
								var split = (item.image_path).substr(item.image_path.lastIndexOf("."),(item.image_path).length);
							if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
								html+= '<a><img id="data-enlargeable" src="'+item.image_path+'" alt=""  style="width:250px"></a>';	
							}else{
								html+="<B>Incorrect Image file type!</B>"
							}		
							}else{
								html+="<B>Fail To Upload file Or Load Form Server</B>"
							}
											
						}
						if(item.file_message_status == '1'){
							var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
							if(video.toUpperCase() === ".MP4")
							{
								html+=' <i class="fa fa-file"></i>&ensp;';
								html+= '<a '+String_file+' href="#" name = "openvid" id="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
								//$('#watchvid').attr('src', item.file_path);
							}
							else
							{
								html+=' <i class="fa fa-file"></i>&ensp;';	
								html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
							}
						}if(item.sticker_message_status =='1'){
							html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
						}else{
							if(item.Group_chat_message) {
								html+=	replaceShowMessage(linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>")));
							}
							
						}
						html+='       </div>';
						html+='       <div style="">';   
						if(parseInt(item.likecount) > 0){
								html+='<i style="right:50px" name = "'+item.Group_chat_message_id+'"class="like-btn like-active"></i>'; 
								html+='<span style="position:relative; right:35px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';  
						}	
						html+='     <small style="float:right; padding-top: 5px; position:relative; right:5px" class="mf-date"><i class="fa fa-clock-o"> '+item.Chat_time+'</i> '; 
						if(item.read_status == '1'){
							html+='        <i style="color: #E1E5EC; left:5px" class="fa fa-check">'+item.readcount+'</i>';
						}
						html+='</small>';
						html+='     </div>';
						html+='     </div>';
						}
						if(item.information_message_status == '1'){
							$('#reciever_id').html(item.Group_chat_Name);
							$('#reivever_id').val(item.Group_chat_id);
							$('#reciever_avatar').attr("src",item.Group_img_path);
							$('#reciever_id_hid').val(item.Group_chat_id);
							$('#reciever_id_hid2').val(item.Group_chat_id);
							$('#reciever_id_hid3').val(item.Group_chat_id);
							$('#reciever_id_hid4').val(item.Group_chat_id);
							
							html+='     <small style="text-align: center; padding-top: 5px" class="mf-date">'+item.information_message+'</small>';
						}
						
						html+='    </div>';  
						
					}else{
						html+='<div class="message-feed media">';   
						if(!item.information_message_status){
						html+='     <div class="pull-left">';
						if(item.path != null || item.path == ""){
							html+='<img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
						}else{
							html+='<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
						}				
						html+='    </div>';
						html+='    <small class="media-body" style="color: #B3B3B3; margin-top:0px; top:10px;">';   
						html+= item.Sender_id;
						html+='    </small>';
						if(item.Group_chat_message_id == allresultArray[parseInt($('#CurrentResult').val())]){
							html+='         <div style="background:#ffff00"id="'+item.Group_chat_message_id+'" name = "markfound" class="circle chat-left" '+String_theme_chat_left+'>';/*+linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';*/
							}
						else{html+='         <div id="'+item.Group_chat_message_id+'" class="circle chat-left" '+String_theme_chat_left+'>';/*+linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>"))+'';*/}
					
					//	html+='         <div id="'+item.Message_id+'" class="circle chat-left" '+String_theme_chat_left+'>';
						if(item.image_message_status == '1'){
							var split = item.image_path.substr(item.image_path.lastIndexOf("."),(item.image_path).length);
							if(split.toUpperCase() === ".JPG" || split.toUpperCase() === ".PNG" || split.toUpperCase() === ".GIF" || split.toUpperCase() === ".TIFF" || split.toUpperCase() === ".JPEG"){
								html+= '<a><img id="data-enlargeable" src="'+item.image_path+'" alt=""  style="width:250px"></a>';
							}else{
								html+="<B>Incorrect Image file type!</B>"
							}		
						} 
						if(item.file_message_status == '1'){
							var video = item.file_path.substr(item.file_path.lastIndexOf("."),(item.file_path).length);
							if(video.toUpperCase() === ".MP4")
							{
								html+=' <i class="fa fa-file"></i>&ensp;';
								html+= '<a '+String_file+' href="#" name = "openvid" id ="'+item.file_path+'"data-toggle="modal" data-target="#exampleModalvid">'+item.file_name+'</a>';
								//$('#watchvid').attr('src', item.file_path);
							}
							else
							{
								html+=' <i class="fa fa-file"></i>&ensp;';	
								html+= '<a '+String_file+' href="'+item.file_path+'" target="_blank">'+item.file_name+'</a>';
							}
						}if(item.sticker_message_status =='1'){
							html+= '<img src="'+item.sticker_path+'" alt=""  style="width:80px">'
						}else{
							if(item.Group_chat_message) {
								html+=	replaceShowMessage(linkify(item.Group_chat_message.replace(/</g, "&lt;").replace(/>/g, "&gt;").replaceAll("\n", "<br>")));
							}
						}
						html+='       </div>';  
						html+='       <div style="margin-top:0px; margin-left:45px">';    
						html+='       <small style="float:left; padding-top: 5px" class="mf-date"><i class="fa fa-clock-o"></i> '+item.Chat_time+'</small>';
						if(item.like_status == "1"){
							html+='     <i id="like_btn" name = "'+item.Group_chat_message_id+'"class="like-btn like-active"></i>';
							html+='     <span style="position:relative; right:15px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';    
						}else{
							html+='     <i id="like_btn" name = "'+item.Group_chat_message_id+'"class="like-btn"></i>';
							html+='     <span style="position:relative; right:15px; bottom:8px; color:#B3B3B3">'+item.likecount+'</span>';  
						}
						html+='       </div>'; 
						html+='     </div>'; 
						}
						if(item.information_message_status == "1"){
							$('#reciever_id').html(item.Group_chat_Name);
							$('#reivever_id').val(item.Group_chat_id);
							$('#reciever_avatar').attr("src",item.Group_img_path);
							$('#reciever_id_hid').val(item.Group_chat_id);
							$('#reciever_id_hid2').val(item.Group_chat_id);
							$('#reciever_id_hid3').val(item.Group_chat_id);
							$('#reciever_id_hid4').val(item.Group_chat_id);
							html+='     <small style="text-align: center; padding-top: 5px" class="mf-date">'+item.information_message+'</small>';
							
						}
						
						html+='    </div>'; 
					}	
					if (i == length-1){
						if(messid != item.Message_id){
							toBottom();
						}
						if(messid == ""){
							toBottom();
						}
						messid = item.Message_id;
					}
			});
			
		}
		
		
			$('#message_body').html('');
			$('#message_body').append(html);
					toBottom();
		toBottom();
	}
	
	var allresultArray = [];
	var allresult = 0
	$(document).on('keyup','#findmessageinchat',function(e){
		
		var ChatLoadLimit = $('#loadlimit').val();
		var Chattype = $('#Chattype').val().toLowerCase();
		var search_text = $(this).val().replace("%", " ").replace("_", " ").trim();
		var CurrentArrayResult =  $('#CurrentResult').val();
		var reciever_id = $('#reciever_id_hid').val();
		var Owner_id = $('#Owner_chat_id').val();
		if(search_text == ""){
			$('#AllResult').val(0);
				$('#AllResult').html(0);
				$('#CurrentResult').val(0);
				$('#CurrentResult').html(0);
				if(Chattype == "p"){
					check_new_message();
					clearInterval(myVars);
					myVars = setInterval(check_new_message, 1000);
				}else if(Chattype == "g"){
					check_new_group_message();
					clearInterval(myVars);
					myVars = setInterval(check_new_group_message, 1000);
				}
				
				toBottom();
		}else{
			if(Chattype == 'p'){
			$.ajax({
				url:'get_all_likely_chat_index',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' : search_text,
					'CurrentArrayResult' : CurrentArrayResult,
					'reciever_id': reciever_id,
					'Owner_id' : Owner_id
				},success:function(data){
					allresult = 0;
					allresultArray = [];
					var jsondata  = JSON.parse(data);
					jsondata.forEach((item) => {
						allresultArray.push(item.Message_id);
						allresult += 1;
					});
					$('#AllResult').val(allresult);
					$('#AllResult').html(allresult);
					$('#CurrentResult').val(0);
					$('#CurrentResult').html(1);
					if(allresult > 0){
						$.ajax({
						url: 'findmessage',
						method:'POST',
						type:'JSON',
						data:{
							'loadlimit' : ChatLoadLimit,
							'search_text' :  search_text,
							'CurrentArrayResult' : allresultArray[0],
							'reciver_id' : reciever_id,
							'Owner_id' : Owner_id
						},success:function(data){				
							showfoundresult(data);
							checkRefresh(Chattype);
							$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
							$('html, body').animate({scrollTop: '0px'}, 0);
						}
					});
					}else{
						$('#AllResult').val(0);
						$('#AllResult').html(0);
						$('#CurrentResult').val(0);
						$('#CurrentResult').html(0);
						check_new_message();
						clearInterval(myVars);
						myVars = setInterval(check_new_message, 1000);
						toBottom();
					}
					
				}
				
			});
		}else if(Chattype == 'g'){
			$.ajax({
				url:'get_all_likely_chat_group_index',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' : search_text,
					'CurrentArrayResult' : CurrentArrayResult,
					'chat_id': reciever_id,
					'Owner_id' : Owner_id
				},success:function(data){
					allresult = 0;
					allresultArray = [];
					var jsondata  = JSON.parse(data);
					jsondata.forEach((item) => {
						allresultArray.push(item.Group_chat_message_id);
						allresult += 1;
					});
					$('#AllResult').val(allresult);
					$('#AllResult').html(allresult);
					$('#CurrentResult').val(0);
					$('#CurrentResult').html(1);
					if(allresult > 0){
						$.ajax({
						url: 'findmessagegroup',
						method:'POST',
						type:'JSON',
						data:{
							'loadlimit' : ChatLoadLimit,
							'search_text' :  search_text,
							'CurrentArrayResult' : allresultArray[0],
							'reciver_id' : reciever_id,
							'Owner_id' : Owner_id
						},success:function(data){
							
							showfoundresult(data);
							checkRefresh(Chattype);
							
							$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
							$('html, body').animate({scrollTop: '0px'}, 0);
						}
					});
					}else{
						$('#AllResult').val(0);
						$('#AllResult').html(0);
						$('#CurrentResult').val(0);
						$('#CurrentResult').html(0);
						check_new_group_message();
						clearInterval(myVars);
						myVars = setInterval(check_new_group_message, 1000);
						toBottom();
					}
					
				}
				
			});
		}
		}
		
		
	});
	
	
	$(document).on('click','#nextfoundmessagebtn',function(e){
		var ChatLoadLimit = $('#loadlimit').val();
		var Chattype = $('#Chattype').val().toLowerCase();
		var search_text = $('#findmessageinchat').val().trim();
		var CurrentArrayResult =  allresultArray[parseInt($('#CurrentResult').val())+1];
		var reciever_id = $('#reciever_id_hid').val();
		var Owner_id = $('#Owner_chat_id').val();
		if(parseInt($('#CurrentResult').val())  >=  parseInt(allresultArray.length - 1)){
		}else{
			if(Chattype == "p"){
				$.ajax({
				url:'findmessage',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' :  search_text,
					'CurrentArrayResult' : allresultArray[parseInt($('#CurrentResult').val())+1],
					'reciver_id' : reciever_id,
					'Owner_id' : Owner_id
					
				},success:function(data){
					var CurR = parseInt($('#CurrentResult').val())+1;
					$('#CurrentResult').val(CurR);
					$('#CurrentResult').html(parseInt(CurR+1));
					showfoundresult(data);
					checkRefresh(Chattype);
					var focusdiv = "#"+allresultArray[parseInt($('#CurrentResult').val())];
					var p = $('div[name=markfound]');
					var offset = p.offset();
					//$('#message_body').scrollTop(offset.top);
					$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
					$('html, body').animate({scrollTop: '0px'}, 0);
					//scrollTop: $('body').offset().top
					//document.getElementByName(markfound).scrollIntoView();
					//$('#'+focusdiv).scroll();
					//scrollTop: $('#'+focusdiv).offset().top
					//$('#message_body').scroll($('div[name=markfound]').position());
					//$('#message_body').scrollTop('div[name=markfound]'); 
					//$('body').animate({ scrollTop: $('div[name=markfound]').scrollTop() }, 200);
					
				
					
				}
			});
				
			}else if(Chattype == "g"){
				$.ajax({
				url:'findmessagegroup',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' :  search_text,
					'CurrentArrayResult' : allresultArray[parseInt($('#CurrentResult').val())+1],
					'reciver_id' : reciever_id,
					'Owner_id' : Owner_id
					
				},success:function(data){
					var CurR = parseInt($('#CurrentResult').val())+1;
					$('#CurrentResult').val(CurR);
					$('#CurrentResult').html(parseInt(CurR+1));
					showfoundresult(data);
					checkRefresh(Chattype);
					var focusdiv = "#"+allresultArray[parseInt($('#CurrentResult').val())];
					
					var p = $('div[name=markfound]');
					var offset = p.offset();
					//$('#message_body').scrollTop(offset.top);
					$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
					$('html, body').animate({scrollTop: '0px'}, 0);
					//scrollTop: $('body').offset().top
					//document.getElementByName(markfound).scrollIntoView();
					//$('#'+focusdiv).scroll();
					//scrollTop: $('#'+focusdiv).offset().top
					//$('#message_body').scroll($('div[name=markfound]').position());
					//$('#message_body').scrollTop('div[name=markfound]'); 
					//$('body').animate({ scrollTop: $('div[name=markfound]').scrollTop() }, 200);
					
				
					
				}
			});
				
				
				
			}
			
		}
		
			
	});
	
	$(document).on('click','#previosfoundmessagebtn',function(e){
		var ChatLoadLimit = $('#loadlimit').val();
		var Chattype = $('#Chattype').val().toLowerCase();
		var search_text = $('#findmessageinchat').val().trim();
		var CurrentArrayResult =  allresultArray[parseInt($('#CurrentResult').val())-1];
		var reciever_id = $('#reciever_id_hid').val();
		var Owner_id = $('#Owner_chat_id').val();	
		if(parseInt($('#CurrentResult').val()) == parseInt(0)){
		}else{
			if(Chattype == "p"){
				$.ajax({
				url:'findmessage',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' :  search_text,
					'CurrentArrayResult' : allresultArray[parseInt($('#CurrentResult').val())-1],
					'reciver_id' : reciever_id,
					'Owner_id' : Owner_id
					
				},success:function(data){
					var CurR = parseInt($('#CurrentResult').val())-1;
					$('#CurrentResult').val(CurR);
					$('#CurrentResult').html(CurR+1);
					showfoundresult(data);
					checkRefresh(Chattype);
					$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
					$('html, body').animate({scrollTop: '0px'}, 0);
				}
				});
			}else if(Chattype == "g"){
				$.ajax({
				url:'findmessagegroup',
				method:'POST',
				type:'JSON',
				data:{
					'loadlimit' : ChatLoadLimit,
					'search_text' :  search_text,
					'CurrentArrayResult' : allresultArray[parseInt($('#CurrentResult').val())-1],
					'reciver_id' : reciever_id,
					'Owner_id' : Owner_id
				},success:function(data){
					var CurR = parseInt($('#CurrentResult').val())-1;
					$('#CurrentResult').val(CurR);
					$('#CurrentResult').html(CurR+1);
					showfoundresult(data);
					checkRefresh(Chattype);
					$('#message_body').animate($('div[name=markfound]').get(0).scrollIntoView(),50);
					$('html, body').animate({scrollTop: '0px'}, 0);
				}
				});
			}
			
		}
	});

$(document).on('submit','#imgform',function(e){
	var ChatType = $('#Chattype').val().toLowerCase();
	 
	 if(ChatType == 'p'){
		 var formData = new FormData(this);
		 $.ajax({
	      type: "POST",
	      url: "SendImage",
	      cache:false,
          contentType: false,
          processData: false,
	      enctype:"multipart/form-data",
	      data: formData,
	      success:function(data){
	    	  $('#myfilee').val(null);
	      }
	    });
	  e.preventDefault();
	 }else if(ChatType == 'g'){
		 var formData = new FormData(this);
		 $.ajax({
		      type: "POST",
		      url: "SendGroupImage",
		      cache:false,
	          contentType: false,
	          processData: false,
		      enctype:"multipart/form-data",
		      data: formData,
		      success:function(data){
		    	  $('#myfilee').val(null);
		      }
		    });
		  e.preventDefault();
	 }
});
$(document).on('change','#myfilee',function(){
	
	var ChatType = $('#Chattype').val().toLowerCase();
	 var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
	  var size_n = (Math.round(fSize*100)/100);
	  var size = size_n+' '+fSExt[i];
	  $('#sizes').val(size);
	 $('#imgform').submit();
});
$(document).on('change','#myfile',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	 var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
	  var size_n = (Math.round(fSize*100)/100);
	  var size = size_n+' '+fSExt[i];
	  $('#sizes').val(size);
});
$(document).on('click','#SendButton',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	message_input = EmojiToStringHEX($('#Message_text').val());
	var chat_text = message_input.trim();
	var Owner_id = $('#Owner_chat_id').val();
	var Reciever_id = $('#reciever_id_hid').val();
	set_read(Reciever_id);
	if(!(chat_text == "" || chat_text == null)){
		if(ChatType == "p"){
		$.ajax({
		url:'SendChatMessage',
		method:'POST',
		type:'json',
		data:{
			'Sender' : Owner_id,
			'Reciever' : Reciever_id,
			'chat_text' : chat_text
		},success:function(data){
			getMessagedata(Reciever_id);
			$('#Message_text').val('');
			message_input = "";
			toBottom();
			}
		});

	}else if(ChatType == "g"){
		set_read_group(Reciever_id);
		$.ajax({
    		url:'SendGroupChatMessage',
    		method:'POST',
    		type:'json',
    		data:{
			'Sender' : Owner_id,
			'GroupReciever_id' : Reciever_id,
			'chat_text' : chat_text
    		},success:function(data){
    			getMessagedata(Reciever_id);
    			$('#Message_text').val('');
    			message_input = "";
    			toBottom();
    		}
    	});
	}
	}
	
	
});
$(document).on("click","#emoji-picker",function(e){
	   e.stopPropagation();
	    $('.intercom-composer-emoji-popover').toggleClass("active");
	});
	$(document).click(function (e) {
	    if ($(e.target).attr('class') != '.intercom-composer-emoji-popover' && $(e.target).parents(".intercom-composer-emoji-popover").length == 0) {
	        $(".intercom-composer-emoji-popover").removeClass("active");
	    }
	});
	$(document).on("click",".intercom-emoji-picker-emoji",function(e){
	    var emojidataicon = $(this).html();
	    
		var text = $("#Message_text").val()+emojidataicon;
		message_input_text += "&#"+$(this).attr("id");
		$("#Message_text").val(text);
		var count = "&#"+$(this).attr("id");
		emoji_length.push(count.length);
	}); 
	$('.intercom-composer-popover-input').on('input', function() {
	    var query = this.value;
	    if(query != ""){
	      $(".intercom-emoji-picker-emoji:not([title*='"+query+"'])").hide();
	    }
	    else{
	      $(".intercom-emoji-picker-emoji").show();
	    }
	});		

$('#sticker img').click(function () {
	var ChatType = $('#Chattype').val().toLowerCase();
    var tr_id = $(this).attr('src'); 
  //  $('#Message_text').val(tr_id);
   $("#sticker").animate({
            height: "toggle",
            opacity: "toggle"
        }, "fast");
	var Owner_id = $('#Owner_chat_id').val();
	var Reciever_id = $('#reciever_id_hid').val();
	if(ChatType == "p"){
			$.ajax({
			url:'SendStickerMessage',
			method:'POST',
			type:'json',
			data:{
				'SendSticker' : tr_id,
				'Reciever' : Reciever_id,
			},success:function(data){
				getMessagedata(Reciever_id);
				toBottom();
			}
		});
	}else if(ChatType == "g"){
		$.ajax({
			url:'SendGroupStickerMessage',
			method:'POST',
			type:'json',
			data:{
				'SendSticker' : tr_id,
				'GroupReciever_id' : Reciever_id,
			},success:function(data){
				getMessagedata(Reciever_id);
				toBottom();
			}
		});
	}
	
});

$(document).on('keyup','#searchchat',function(){
	var Searchtype = $('#Searchtype').val().toLowerCase();
	if(Searchtype == "p"){
		var lastchat = "";
		var unreadchat = "";
		var Owner_id = $('#Owner_chat_id').val();
		clearInterval(myVars2);
		myVars2 = setInterval(check_new_Online_user, 10000);
		var searchusers = $(this).val();
		var searchuser = searchusers.replace("%", "#$@????????????????????").replace("_", "#$##???????????????????").replace("{", "#$##???????????????????").trim();
		 if(searchuser != ''){
			$.ajax({
				url:'SearchUser',
				method:'POST',
				type:'JSON',
				data:{
					'searchuser' : searchuser,
					'owner'      : Owner_id
				},success:function(data){
					var htmltext ="";
					htmltext = showuserlistUser(data);
					$('#Onlinelist_body').html('');
					$('#Onlinelist_body').append(htmltext);
				}
			});
		}else 
		{
			var htmltext ="";	
			htmltext = check_new_Online_user();
			$('#Onlinelist_body').html('');
			$('#Onlinelist_body').append(htmltext);
			 
		}
	}else if(Searchtype == "g"){
		var searchtextss = $(this).val();
		var searchtexts = searchtextss.replace("%", "#$@????????????????????").replace("_", "#$##???????????????????").trim();
		if(searchtexts.length == 0 || searchtexts == ""){
			check_new_Group_list();
			clearInterval(myVars2);
			myVars2 = setInterval(check_new_Group_list, 1000);
			
		}else{
			clearInterval(myVars2);
			$.ajax({
				url:'SeachChatGroup',
				method: 'POST',
				type:'JSON',
				data:{
					'searchtext' : searchtexts,
				},success:function(data){
					var Owner_id = $('#Owner_chat_id').val();
			var favarray = [];
			html = "";
			html +='';
			html +='<a class="list-group-item media" '+String_theme_userlist_item+' id="newchatgroupopen" data-toggle="modal" data-target="#exampleModal">';
			html +='<input type="hidden" value="/pages-back/img/profile2.png" id="1" name="img">  ';
			html +='<div id="add" class="lv-avatar pull-left"><button id = "opencreate" type="button" '+String_btn_icon_only+' class="btn btn-icon-only" ><i class="fa fa-user-plus fa-1x"></i></button></div>'; 
			html +='<div class="media-body"> ';
			html +='<div '+String_theme_userlist_item_heading+' class="list-group-item-heading textaddgroup">Create New Group</div></div></a> '; 
		//	html +='<small class="list-group-item-text c-gray">Create New Group</small> </div></a>';
			var jsondata =  JSON.parse(data);
			jsondata.forEach((item) => { favarray.push(item.favorite_mark)});
			var favindex = favarray.indexOf("1");
			if(favindex != -1){
				html += '<div class="separator">Favorite group</div>';
			}			
			jsondata.forEach((item) => {
					if(item.favorite_mark == "1"){
    		 		
    		 		html += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.Group_chat_id+'" name = "Grouplist">';
    		 		if(item.Group_img_path != null || item.Group_img_path == ""){
    		 			html += '<input type="hidden" value = "'+item.Group_img_path+'" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		else{
    		 			html += '<input type="hidden" value = "http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		html += '<input type = "hidden" id = "namegroupname" value = "'+item.Group_chat_Name+'"/>';
    		 		html += '<input type = "hidden" id = "groupdescriptions" value = "'+item.Group_Description+'"/>';
    		 		html += '<input type ="hidden" value = "'+item.Group_chat_user_create+'" id = "usercreate"  />';
    		 		html += '    <div class="lv-avatar pull-left">';
    		 		if(item.Group_img_path != null || item.Group_img_path  == ""){
    		 			html += ' <img src="'+item.Group_img_path+'" alt="" class="circle img-avatar crop-image">';
    		 		}else{
    		 			//https://www.flaticon.com/svg/vstatic/svg/847/847969.svg?token=exp=1611221899~hmac=3b2356ce8d20708e75ee63e1a3fa125c
    		 			//html += ' <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="circle img-avatar">';
    		 				html += ' <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" class="circle img-avatar crop-image">';
    		 		}   		 		
    		 		html += ' </div>';
    		 		html += ' <div class="media-body">';  
    		 		
    		 		html += '  <div class="list-group-item-heading" '+String_theme_userlist_item_heading+' id = "groupnames" value = "'+item.Group_chat_Name+'">'+item.Group_chat_Name+'</div>';
    		 		if(item.Group_Description != null || item.Group_Description == ""){
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">'+item.Group_Description+'</small>';
    		 		}else{
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">Chat Group Description</small>';
    		 		}
    		 		
    		 		if(item.Group_img_path == "1"){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.Group_chat_Name+'</span>';
    		 		}

    		 		if(item.unread_countchat > 0){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_countchat+'</span>';
    		 		}
    		 		
    		 		html += ' </div>';
    		 		html += '</a>';		   
				} 		 	
			});
		


    		html += '<div class="separator">My group</div>';
			jsondata.forEach((item) => {
					if(item.favorite_mark != "1"){
    		 		
    		 		html += '<a class="list-group-item media" '+String_theme_userlist_item+'id = "'+item.Group_chat_id+'" name = "Grouplist">';
    		 		if(item.Group_img_path != null || item.Group_img_path == ""){
    		 			html += '<input type="hidden" value = "'+item.Group_img_path+'" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		else{
    		 			html += '<input type="hidden" value = "http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id = "'+item.Group_chat_id+'" name = "img" />';
    		 		}
    		 		html += '<input type = "hidden" id = "namegroupname" value = "'+item.Group_chat_Name+'"/>';
    		 		html += '<input type = "hidden" id = "groupdescriptions" value = "'+item.Group_Description+'"/>';
    		 		html += '<input type ="hidden" value = "'+item.Group_chat_user_create+'" id = "usercreate"  />';
    		 		html += '    <div class="lv-avatar pull-left">';
    		 		if(item.Group_img_path != null || item.Group_img_path  == ""){
    		 			html += ' <img src="'+item.Group_img_path+'" alt="" class="circle img-avatar crop-image">';
    		 		}else{
    		 			//https://www.flaticon.com/svg/vstatic/svg/847/847969.svg?token=exp=1611221899~hmac=3b2356ce8d20708e75ee63e1a3fa125c
    		 			//html += ' <img src="https://bootdey.com/img/Content/avatar/avatar6.png" alt="" class="circle img-avatar">';
    		 				html += ' <img src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt="" class="circle img-avatar crop-image">';
    		 		}   		 		
    		 		html += ' </div>';
    		 		html += ' <div class="media-body">';  
    		 		
    		 		html += '  <div class="list-group-item-heading" '+String_theme_userlist_item_heading+' id = "groupnames" value = "'+item.Group_chat_Name+'">'+item.Group_chat_Name+'</div>';
    		 		if(item.Group_Description != null || item.Group_Description == ""){
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">'+item.Group_Description+'</small>';
    		 		}else{
    		 			html += '  <small id="groupdes" class="list-group-item-text c-gray">Chat Group Description</small>';
    		 		}
    		 		
    		 		if(item.Group_img_path == "1"){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.Group_chat_Name+'</span>';
    		 		}
    		 		if(item.unread_count > 0){
    		 			html += '	<span style="float: right" class="badge badge-danger float-right">'+item.unread_count+'</span>';
    		 		}
    		 		
    		 		html += ' </div>';
    		 		html += '</a>';		   
				} 		 	
			});


			
			$('#Onlinelist_body').load();
			
			$('#Onlinelist_body').html('');
		 	$('#Onlinelist_body').append(html);
				}
			})
		}
	}
	
});


$(document).on('change','#sortuserdepart',function(){
	searchuserlist();
});
$(document).on('keyup','#searchtext',function(){
	searchuserlist();	
});

$(document).on('change','#loadlimit',function(){
	var limit = $(this).val();
	var reciever_id = $('#reciever_id_hid').val();
	$.ajax({
		url:"Changeloadlimit",
		type:"JSON",
		method:"POST",
		data:{
			'limit' : limit
		},success:function(data){

		}
	});
	
});

$(document).on('keyup','input[name=groupname]',function(){
	checkcreategroup();
});
$(document).on('keyup','input[name=groupdescription]',function(){
	checkcreategroup();
});
$(document).on('change','input[name=checkboxuser]',function(){
	//alert($('input[name=checkboxuser]:checked').size());
	//$('input[name=checkboxuser]:checked').each(function() {});
	if(!(selectedsUser.includes($(this).val()))){		
			var name_depart = $(this).attr('data-name-depart').split(":");
			selectedsUser.push($(this).val());
			selectedsUserPath.push($(this).attr('id'));	
			selectedsUserName.push(name_depart[0]);
			selectedsUserDepart.push(name_depart[1]);
	}else if((selectedsUser.includes($(this).val()))){
		var name_depart = $(this).attr('data-name-depart').split(":");
		var index = selectedsUser.indexOf($(this).val());
		selectedsUser.splice(index, 1);
		var indexpath = selectedsUserPath.indexOf($(this).attr('id'));
		selectedsUserPath.splice(indexpath,1);
		var indexname = selectedsUserName.indexOf(name_depart[0]);
		selectedsUserName.splice(indexname,1);
		var indexdepart = selectedsUserDepart.indexOf(name_depart[1]);
		selectedsUserDepart.splice(indexdepart,1);
	}
	checkcreategroup();
	selectedlistreload();
});
$(document).on('click','input[name=selectuser]',function(){
	var name_depart = $(this).attr('data-name-depart').split(":");
	var index = selectedsUser.indexOf($(this).val());
	selectedsUser.splice(index, 1);
	var indexpath = selectedsUserPath.indexOf($(this).attr('id'));
	selectedsUserPath.splice(indexpath,1);
	var indexname = selectedsUserName.indexOf(name_depart[0]);
	selectedsUserName.splice(indexname,1);
	var indexdepart = selectedsUserDepart.indexOf(name_depart[1]);
	selectedsUserDepart.splice(indexdepart,1);
	selectedlistreload();
	checkcreategroup();
	searchuserlist();
});
$(document).on('click','#creategroupsubmitbtn',function(){
	$('#creategroupform').submit();
	$('#myfilee').val('');
	$('input[name=groupname]').val('');
	$('input[name=groupdescription]').val('');
	$('#searchtext').val('');
	$('#sortuserdepart option[value="all"]').attr("selected",true);
	$('#showgroupimg').attr("src","http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image");
	selectedsUser = [];
	selectedsUserPath = [];
	selectedsUserName = [];
	selectedsUserDepart = [];
	selectedlistreload();
	searchuserlist();
	checkcreategroup();
});
$(document).on('click','.close',function(e){
	$('#myfilee').val('');
	$('input[name=groupname]').val('');
	$('input[name=groupdescription]').val('');
	$('#searchtext').val('');
	$('#sortuserdepart option[value="all"]').attr("selected",true);
	$('#showgroupimg').attr("src","http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image");
	selectedsUser = [];
	selectedsUserPath = [];
	selectedsUserName = [];
	selectedsUserDepart = [];
	selectedlistreload();
	searchuserlist();
	checkcreategroup();
})
$(document).on('submit','#creategroupform',function(e){
	var formData = new FormData(this);
	$.ajax({
	    type: "POST",
	    url: "CreateNewGroup",
	    cache:false,
	    contentType: false,
	    processData: false,
	    enctype:"multipart/form-data",
	    data: formData,
	    success:function(data){

	  	  $('.close').click();	  	  
	    }
	  });
	e.preventDefault();
});
$(document).on('submit','#changegroupimageform',function(e){
	var formData = new FormData(this);
	$.ajax({
	    type: "POST",
	    url: "ChangeGroupimage",
	    cache:false,
	    contentType: false,
	    processData: false,
	    enctype:"multipart/form-data",
	    data: formData,
	    success:function(data){
	    	
			
	  	$('#settingclose').click();
		$('#chageimagefile').val(null);
	    }
	  });
	  e.preventDefault();
	    
	
});

function refresh_group_image(reciever_id_hid){
var gidss = reciever_id_hid;
	$.ajax({
	    		url: 'refresh_group_img',
	    		method: 'POST',
	    		type: 'JSON',
	    		data:{
	    			'group_chat_id' :  gidss
	    		},
	    		success:function(dataa){
	    			var newjson = JSON.parse(dataa);
	    			newjson.forEach((item) => 
	    			{
		    			if(item.Group_img_path == null || item.Group_img_path == ""){
							$('#reciever_avatar').attr('src',"http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image");
						}else{
							$('#reciever_avatar').attr('src', item.Group_img_path);
						}
						$('#reciever_id').html(item.Group_chat_Name);
						$('#reivever_id').val(item.Group_chat_id);
		 		
	    				
	    			})
	    		}
	    	});
}
$(document).on('click','#Editgroup',function(){
	$('#changegroupimageform').submit();
	$('#chageimagefile').val(null);
	$(this).prop('disabled',true);
});

function check_edit(){
	var lastpoint = $('#chageimagefile').val().lastIndexOf(".");
	  var filetype  = $('#chageimagefile').val().substr(lastpoint, $('#chageimagefile').val().length - 1);
	  if(filetype === "" || filetype === null){
	  	var gname = $('#groupnameinput').val().trim();
	 	var gdesc = $('#groupdescriptioninput').val().trim();
	 	if( (gname === "" || gdesc === "") || (gname === null || gdesc === null)){
	 		 $('#Editgroup').prop('disabled',true);
	 	}else{
	 		 $('#Editgroup').prop('disabled',false);
	 	}
	  }else{
		   if(filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG"){
		 	var gname = $('#groupnameinput').val().trim();
		 	var gdesc = $('#groupdescriptioninput').val().trim();
		 	if( (gname === "" || gdesc === "") || (gname === null || gdesc === null)){
		 		 $('#Editgroup').prop('disabled',true);
		 	}else{
		 		 $('#Editgroup').prop('disabled',false);
		 	}
		
		 }else{
		 
		 	$('#Editgroup').prop('disabled',true);
		 
		 }
	  
	  }
	

}
$(document).on('change','#chageimagefile',function(){
	var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
	  var size_n = (Math.round(fSize*100)/100);
	  var size = size_n+' '+fSExt[i];
	  $('#sizeee').val(size);
	  var lastpoint = $('#chageimagefile').val().lastIndexOf(".");
	  var filetype  = $('#chageimagefile').val().substr(lastpoint, $('#chageimagefile').val().length - 1);
	 if(filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG"){
	 	var gname = $('#groupnameinput').val().trim();
	 	var gdesc = $('#groupdescriptioninput').val().trim();
	 	if( (gname === "" || gdesc === "") || (gname === null || gdesc === null)){
	 		 $('#Editgroup').prop('disabled',true);
	 	}else{
	 		 $('#Editgroup').prop('disabled',false);
	 	}
	 }else{
	 	$('#Editgroup').prop('disabled',true);
	 }
	  $('#showgroupimginput').attr('src',window.URL.createObjectURL(this.files[0]));
});

$(document).on('change','#myfilegroup',function(){
	var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
	  fSize = this.files[0].size; i=0;while(fSize>900){fSize/=1024;i++;}
	  var size_n = (Math.round(fSize*100)/100);
	  var size = size_n+' '+fSExt[i];
	  $('#sizee').val(size);
	  var lastpoint = $('#myfilegroup').val().lastIndexOf(".");
	  var filetype  = $('#myfilegroup').val().substr(lastpoint, $('#myfilegroup').val().length - 1);
	  checkcreategroup();
	$('#showgroupimg').attr('src',window.URL.createObjectURL(this.files[0]));
});
$(document).on('click','a[name=openvid]',function(){
	var files = $(this).attr('id');
	$('#watchvid').attr('src', files);
});

$(document).on('click','img[id="data-enlargeable"]',function(){
	$(this).addClass('img-enlargeable');
	var src = $(this).attr('src');
    var modal;
    function removeModal(){ modal.remove(); $('body').off('keyup.modal-close'); }
    modal = $('<div>').css({
        background: 'RGBA(0,0,0,.5) url('+src+') no-repeat center',
        backgroundSize: 'contain',
        width:'100%', height:'100%',
        position:'fixed',
        zIndex: 99999,
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
$(document).on('click','#like_btn',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	 var Current_class = $(this).attr('Class');
	 var message_id = $(this).attr('name');
	 var like_status = "";	 
	 var Reciever_id = $('#reciever_id_hid').val();
 		set_read(Reciever_id);
	 if(Current_class == 'like-btn like-active'){
		 like_status = "0";
		 $(this).toggleClass('like-active');
	 }else{
		 like_status = "1";
		 $(this).toggleClass('like-active');
	 }
	 if(ChatType == "p"){
			 $.ajax({
			 url:"MessageLike",
			 method:"POST",
			 type:"json",
			 data:{
				 'message_id' : message_id,
				 'like_status' : like_status
			 }
		 });
	 }else if(ChatType == "g"){
		 $.ajax({
			 url:"GroupMessageLike",
			 method:"POST",
			 type:"json",
			 data:{
				 'message_id' : message_id,
				 'group_id' : Reciever_id,
				 'like_status' : like_status
			 }
		 });
	 }
	 
});

var char_count = 0;
$(document).on('keypress keyup keydown blur','#Message_text', function (e) {
	/*
	 var key = e.which || e.keyCode;
			var ctrl = e.ctrlKey ? e.ctrlKey : ((key === 17) 
       			 ? true : false);
	if(e.type == "keyup" || e.type == "keydown"){
		
		if(e.type == "keyup"){
			if (key == 86 && ctrl) { 
				char_count = 0;
				if(emoji_length.length > 1){
					var i;
						for (i = 0; i < emoji_length.length; i++) {
						  char_count += emoji_length[i];
						}
				}
       				if(message_input_text != ""){
					
						message_input_text = message_input_text + $(this).val().substr(message_input_text.lastIndexOf(message_input_text.slice(message_input_text.length - 1))+1,$(this).val().length-1);
						message_input_text.length-1;
						$(this).val().length-1
					}else if(message_input_text == ""){
						message_input_text = $(this).val();
					}
    		} 
			
		}else if(e.type == "keydown"){
			
			if(e.keyCode == 18){
				e.stopPropagation(); 
			}
			if(e.keyCode == 8){
				
					if((message_input_text.slice(message_input_text.length - 1)) == "&" && (message_input_text.slice(message_input_text.length - 2)) == "?&"){
						message_input_text = message_input_text.slice(0,-2);
					}else if((message_input_text.slice(message_input_text.length - 1)) == ";"){
						if(message_input_text.lastIndexOf("&") != -1){
							if(message_input_text.substring(message_input_text.lastIndexOf("&"),message_input_text.lastIndexOf("&")+2) == "&#"){
								message_input_text = message_input_text.slice(0,message_input_text.lastIndexOf("&"));
								emoji_length.pop();
							}
							
						}else{
							message_input_text = message_input_text.slice(0,-1);
						message_input = message_input.slice(0,-1);
						}
					}
					else {
						message_input_text = message_input_text.slice(0,-1);
						message_input = message_input.slice(0,-1);
					}
			}
			if($(this).val().trim() == ""){
					message_input_text = "";
					message_input = "";
			}
			
			

		}

	}else if
	*/if(e.type == "keypress"){
			var ChatType = $('#Chattype').val().toLowerCase();
			
			var chat_text = "";
			var text_input = EmojiToStringHEX($(this).val().trim());
			/*
			if(e.key != "Enter"){
				message_input_text += e.key;
				message_input += e.key;
				
				chat_text = EmojiToStringHEX(message_input);
			}*/
		    if(e.which == 13){
		    	var chat_text = EmojiToStringHEX($('#Message_text').val().trim());
		    	var Owner_id = $('#Owner_chat_id').val();
		    	var Reciever_id = $('#reciever_id_hid').val();
		    	if (e.key == 'Enter' && e.shiftKey)
		        {
					message_input_text  = message_input_text.trim() + "?&";
					message_input += "\n";
		            e.stopPropagation();
		            if(ChatType=="p"){
		            	set_read(Reciever_id);
		            }else if(ChatType == "g"){
		            	set_read_group(Reciever_id);
		            }
					
					//message_input = $(this).val()+"　";
		        }else if (e.key == 'Enter'){
		        	
		        	if(ChatType == "p"){
		        		set_read(Reciever_id);
		        		if(!(chat_text == "" || chat_text == null || chat_text == "")){
			        	$.ajax({
				    		url:'SendChatMessage',
				    		method:'POST',
				    		type:'json',
				    		data:{
			    			'Sender' : Owner_id,
			    			'Reciever' : Reciever_id,
			    			'chat_text' : chat_text
				    		},success:function(data){
				    			getMessagedata(Reciever_id);
				    			$('#Message_text').val('');
				    			message_input = "";
								message_input_text = "";
								emoji_length=[];
				    			toBottom();
				    		}
				    	});
		        		}else {
							$('#Message_text').val('');
				    			message_input = "";
								message_input_text = "";
								emoji_length = [];
						}
		        	}else if(ChatType == "g"){
		        		set_read_group(Reciever_id);
		        		if(!(chat_text == "" || chat_text == null || chat_text == "")){
		        		$.ajax({
				    		url:'SendGroupChatMessage',
				    		method:'POST',
				    		type:'json',
				    		data:{
			    			'Sender' : Owner_id,
			    			'GroupReciever_id' : Reciever_id,
			    			'chat_text' : chat_text
				    		},success:function(data){
				    			getMessagedata(Reciever_id);
				    			$('#Message_text').val('');
				    			message_input = "";
								message_input_text = "";
								emoji_length=[];
				    			toBottom();
				    		}
				    	});
		        		}else {
							$('#Message_text').val('');
				    			message_input = "";
								message_input_text = "";
								emoji_length=[];
						}
		        	}
		        	e.preventDefault();
		        	
		        }
		
		    }
		    emo ="";
	}
	
});

$('#Message_text').on('focus',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	if(ChatType == "p"){
		var partner_chat_id = $('#reciever_id_hid').val();
		set_read(partner_chat_id);
		toBottom();
	}else if(ChatType == "g"){
		var partner_chat_id = $('#reciever_id_hid').val();
		set_read_group(partner_chat_id);
		toBottom();
	}
	
	
});

$(document).on('keyup' , '#searchmymembertext', function(){
	var mymembertext = $(this).val().replace("%", "#$@????????????????????").replace("_", "#$##???????????????????").trim();
	var group_id = $('#groupusersetting').attr('data-group-id');
	if(mymembertext){
		$.ajax({
			url:'SearchMyMember',
			method:'POST',
			type:'JSON',
			data:{
				'group_id' : group_id,
				'member_name' : mymembertext
			},success:function(data){
				var htmlx = "";
				var Owner_id = $('#Owner_chat_id').val();
				var json = JSON.parse(data);
				json.forEach((item) => {
			         htmlx += '<div class="list-group-item media listS" '+String_listS+' id="UserTest1" name="memberlist" > '; 
			         htmlx += '<div class="lv-avatar pull-left">';
			         if(item.path == null || item.path == ''){
			        	 htmlx += ' <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">';
			         }else{
			        	 htmlx += ' <img src="'+item.path+'" alt="" class="circle img-avatar crop-image">';
			         }
			        htmlx += '</div>';
			        htmlx += '<div class="media-body" style="padding-top:0px">'; 
			        htmlx += '<span class="list-group-item-heading">'+item.name+'</span>';
			        htmlx += '<small class="list-group-item-text c-gray"> : '+item.department_id+'</small>';
			        htmlx += '<span style="float: right;" class="float-right">';
			        //selectedsmember.push(item.id.toLowerCase());
			        if(item.id.toLowerCase() != Owner_id.toLowerCase()){   	
			        	htmlx += '<a role="button" name="removemember" id = "'+item.id.toLowerCase()+'" data-gid = "'+item.Group_chat_id+'"  data-val = "'+item.Group_chat_member_id+'"><i class="fa fa-minus-circle font-red"></i></a>'; 
			        }
			        htmlx += '</span>';		
			        htmlx += '</div>';
			        htmlx += '</div>';	
				});
				$('#current_member_list').html('');
				$('#current_member_list').append(htmlx);
			}
		});
	}else{
		$.ajax({
			url:'GetCurrentMember',
			method:'POST',
			type:'json',
			data:{
				'group_id' : group_id
			},
			success:function(data){
				var htmlsq = "";
				htmlsq = getCurrentmemberlist(data);
				$('#current_member_list').html('');
				$('#current_member_list').append(htmlsq);
			}
		});
	}
});

$(document).on('click','div[id=filemenu]',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	if(ChatType == "p"){
		var Owner_id = $('#Owner_chat_id').val();
		var Reciever_id = $('#reciever_id_hid').val();

		$.ajax({
			url:'SelectFile',
			method:'POST',
			Type:'JSON',
			data:{
				'group_id' : Reciever_id,
				'Sender_id' : Owner_id,
				'ChatType' : ChatType
			},success:function(data){
				show_file(data);
				show_video(data);
				show_image(data);
			}
		});
	}else if(ChatType == "g"){
		var Owner_id = $('#Owner_chat_id').val();
		var Reciever_id = $('#reciever_id_hid').val();
		$.ajax({
			url:'SelectFile',
			method:'POST',
			Type:'JSON',
			data:{
				'group_id' : Reciever_id,
				'Sender_id' : Owner_id,
				'ChatType' : ChatType
			},success:function(data){
				show_file(data);
				show_video(data);
				show_image(data);
			}
		});
	}
});
$(document).on('click','a[name=addmember]',function(){
	var add_member = $(this).attr('id');
	var group_idd = $('#reciever_id_hid').val();
	$.ajax({
		url:'Addmember',
		method:'POST',
		type:'JSON',
		data:{
			'member_id' : add_member,
  			'group_id' : group_idd
		},success:function(data){
			selectedsmember.push(add_member);
			$.ajax({
  				url:'GetCurrentMember',
  				method:'POST',
  				type:'json',
  				data:{
  					'group_id' : group_idd
  				},
  				success:function(data){
  					var htmlsq = "";
  					htmlsq = getCurrentmemberlist(data);
  					$('#current_member_list').html('');
  					$('#current_member_list').append(htmlsq);
  				}
  			});
  			var searchtxtd = "";
  			var departd = $('#sortmemberdepart').val();
  			$.ajax({
  				url:'GetEnablelist',
  				method:'POST',
  				type:'json',
  				data:{
  					'searchtype' : 'All',
  					'searchtxt' : searchtxtd,
  					'depart' : departd
  				},success:function(datadq){
  					var htmlsd ="";
  					htmlsd = getUserComparetoMember(datadq);
  					$('#memberidlist').html('');
  					$('#memberidlist').append(htmlsd);
  				}
  			});
			$('#searchmembertext').val('');
			$('#sortmemberdepart option[value=departd]').attr("selected",true);
		}
	});
});
$(document).on('click','a[name=removemember]',function(){
	var remover_member = $(this).attr('id');
  	var group_id = $(this).attr('data-val');
  	var group_idd = $(this).attr('data-gid');
	swal({
	      title: "Are you sure!",
	      text: "You will remove this person!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	}
	        if (inputValue == true) {
	          	const index = selectedsmember.indexOf(remover_member);
	          	if (index > -1) {
	          	  selectedsmember.splice(index, 1);
	          	}
	          	$.ajax({
	          		url:'Removemember',
	          		method:'POST',
	          		type:'JSON',
	          		data:{
	          			'member_id' : remover_member,
	          			'group_id' : group_id
	          		},success:function(datad){
	          			
	          			$.ajax({
	          				url:'GetCurrentMember',
	          				method:'POST',
	          				type:'json',
	          				data:{
	          					'group_id' : group_idd
	          				},
	          				success:function(data){
	          					var htmlsq = "";
	          					htmlsq = getCurrentmemberlist(data);
	          					$('#current_member_list').html('');
	          					$('#current_member_list').append(htmlsq);
	          				}
	          			});
	          			var searchtxtd = "";
	          			var departd = "";
	          			$.ajax({
	          				url:'GetEnablelist',
	          				method:'POST',
	          				type:'json',
	          				data:{
	          					'searchtype' : 'All',
	          					'searchtxt' : searchtxtd,
	          					'depart' : departd
	          				},success:function(datadq){
	          					var htmlsd ="";
	          					htmlsd = getUserComparetoMember(datadq);
	          					$('#memberidlist').html('');
	          					$('#memberidlist').append(htmlsd);
	          				}
	          			});
	          		}
	        
	          	});
	      		}
	        });
	
});

$(document).on('keyup' , '#searchmembertext' , function(){
	searchmemberlist();
});
$(document).on('change' , '#sortmemberdepart' , function(){
	searchmemberlist();
});

$(document).on('click','#groupusersetting',function(){
	var group_id = $(this).attr('data-group-id');
	
	$.ajax({
		url:'GetCurrentMember',
		method:'POST',
		type:'json',
		data:{
			'group_id' : group_id
		},
		success:function(data){
			var htmlsq = "";
			htmlsq = getCurrentmemberlist(data);
			$('#current_member_list').html('');
			$('#current_member_list').append(htmlsq);
		}
	});
	var searchtxtd = "";
	var departd = "";
	$.ajax({
		url:'GetEnablelist',
		method:'POST',
		type:'json',
		data:{
			'searchtype' : 'All',
			'searchtxt' : searchtxtd,
			'depart' : departd
		},success:function(data){
			var htmlsd ="";
			htmlsd = getUserComparetoMember(data);
			$('#memberidlist').html('');
			$('#memberidlist').append(htmlsd);
		}
	});
	
	
});

$('#Message_text').on('focusin',function(){
	var ChatType = $('#Chattype').val().toLowerCase();
	if(ChatType == "p"){
		var partner_chat_id = $('#reciever_id_hid').val();
		set_read(partner_chat_id);
		toBottom();
	}else if(ChatType == "g"){
		var partner_chat_id = $('#reciever_id_hid').val();
		set_read_group(partner_chat_id);
		toBottom();
	}
});

$(document).on('click','a[name="userlist"]',function(){
	messid = "";
	clearInterval(myVars);
	chatloadlimit  = $('#loadlimit').val();
	$('#Chattype').val("p");
	myVars = setInterval(check_new_message, 1000);
	var reciever_id = $(this).attr("id");
	$('#reciever_id_hid').val(reciever_id);
	$('#reciever_id_hid2').val(reciever_id);
	$('#reciever_id_hid3').val(reciever_id);
	$('#reciever_id_hid4').val(reciever_id);
	$('#reciever_id').val(reciever_id);
	$('#reciever_id').html(reciever_id);
	$('#reciever_avatar').show();
	$('#description_text').html('');
	$('#description_text').val('');
	getMessagedata(reciever_id);
	$('#searchchatdata').hide();
	$('#AllResult').val(0);
	$('#AllResult').html(0);
	$('#CurrentResult').val(0);
	$('#CurrentResult').html(0);
	$('#findmessageinchat').val('');
	allresult = 0;
	allresultArray = [];
	var ChatType = $('#Chattype').val().toLowerCase();
	checkRefresh(ChatType);
	toBottom();
	toBottom();
	toBottom();
	toBottom();
	var imgid = $(this).children().children('img').attr('src');
	var imgid = $(this).children('div').children('img').attr('src');
	var imgid = $(this).children('input[name=img]').val();
	if(imgid == null || imgid == "")
	{imgid ="/pages-back/img/profile2.png";}
	$('.action-header').show();
	$('#Message_text').val('');	
	$('#message_body').show();
	$('.msb-reply').show();
	$('#groupsetting').hide();
	$('#groupusersetting').hide();
	$('#bb').hide();
	$('#reciever_avatar').attr("src",imgid);
	recid = reciever_id	;
	set_read(reciever_id);
	toBottom();
	toBottom();
	Openchat = true;
	toBottom();
	toBottom();
	toBottom();
	toBottom();
	toBottom();
});
$(document).on('click','#groupsetting',function(){
	var group_id = $('#reciever_id_hid').val();
	var Owner_id = $('#Owner_chat_id').val();
	$.ajax({
		url:'CheckFavoriteGroup',
		method:'POST',
		type:'JSON',
		data:{
			'group_id':group_id,
			'Owner_id':Owner_id
		},success:function(data){
			var jsondata = JSON.parse(data);
		 	jsondata.forEach((item) => {
		 		if(item.favorite_mark  == "1"){
		 			$('#favbox').prop('checked', true);
		 			$('#favbox').val('1');
		 		}else{
		 			$('#favbox').prop('checked', false);
		 			$('#favbox').val('0');
			 	}
		 		if(item.inviter_member_id == null){
			 		$('#leave').hide();
			 		$('#delete').show();
			 	}else{
			 		$('#leave').show();
			 		$('#delete').hide();
			 	}		 		
				//$('#chageimagefile').val(null);
		 		$('#groupnameinput').val(item.Group_chat_Name.trim());
		 		$('#groupdescriptioninput').val(item.Group_Description.trim());
				$('#showgroupimginput').attr('src',"");
				if(item.Group_img_path == null || item.Group_img_path == ""){
					$('#showgroupimginput').attr('src',"http://www.placehold.it/200x150/EFEFEF/AAAAAA&text=no+image");
				}else{
					$('#showgroupimginput').attr('src',item.Group_img_path);
				}
		 		
		 		$('#reciever_id_hid5').val(group_id);
		 		
		 	});
		 	
		}
	});
	
});
$(document).on('keyup','#groupnameinput',function(){
	check_edit();
	/*
	var name = $(this).val().trim();
	if((name === "") || (name === null)){
		$('#Editgroup').prop('disabled',true);
	}else{
		$('#Editgroup').prop('disabled',false);
	}
	var lastpoint = $('#chageimagefile').val().lastIndexOf(".");
	  var filetype  = $('#chageimagefile').val().substr(lastpoint, $(this).val().length - 1);
	 if(filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG"){
	 $('#Editgroup').prop('disabled',false);
	 }else{
	 $('#Editgroup').prop('disabled',true);
	 }
	 */
	
})
$(document).on('keyup','#groupdescriptioninput',function(){
check_edit();
/*
	var desc = $(this).val().trim();
	if((desc === "") || (desc === null)){
		$('#Editgroup').prop('disabled',true);
	}else{
		$('#Editgroup').prop('disabled',false);
	}
	var lastpoint = $('#chageimagefile').val().lastIndexOf(".");
	  var filetype  = $('#chageimagefile').val().substr(lastpoint, $(this).val().length - 1);
	 if(filetype.toUpperCase() === ".JPG" || filetype.toUpperCase() === ".PNG" || filetype.toUpperCase() === ".GIF" || filetype.toUpperCase() === ".TIFF" || filetype.toUpperCase() === ".JPEG"){
	 $('#Editgroup').prop('disabled',false);
	 }else{
	 $('#Editgroup').prop('disabled',true);
	 }*/
})
$(document).on('click','#leave',function(){
	var group_id = $('#reciever_id_hid').val();
	var Owner_id = $('#Owner_chat_id').val();
	swal({
	      title: "Are you sure!",
	      text: "You will leave this group chat!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	
	        	
	        	}
	        if (inputValue == true) {
	          	$.ajax({
	          		url:'LeaveGroup',
	          		method:'POST',
	          		type:'JSON',
	          		data:{
	          			'group_id' : group_id,
	          			'member_id' : Owner_id
	          		},success:function(data){
	          			$('#settingclose').click();
	          			$('.action-header').hide();
	          			$('#message_body').hide();
	          			$('.msb-reply').hide();
	          			$('#reciever_avatar').hide();
	          			$('#groupsetting').hide();
	          			$('#groupusersetting').hide();
	          		}
	          	});
	        	
	      		}
	        });
});
$(document).on('click','#delete',function(){
	var group_id = $('#reciever_id_hid').val();
	swal({
	      title: "Are you sure!",
	      text: "You will deleting this group chat!",
	      type: "warning",
	      showCancelButton: true,
	      confirmButtonClass: 'btn-danger',
	      confirmButtonText: 'OK'
	    }, function (inputValue) {
	        if (inputValue == false){
	        	
	        	
	        	}
	        if (inputValue == true) {
	        	$.ajax({
	        		url:'DeleteGroup',
	        		method:'POST',
	        		type:'JSON',
	        		data:{
	        			'group_id': group_id
	        		},success:function(data){
	        			$('#settingclose').click();
	          			$('.action-header').hide();
	          			$('#message_body').hide();
	          			$('.msb-reply').hide();
	          			$('#reciever_avatar').hide();
	          			$('#groupsetting').hide();
	          			$('#groupusersetting').hide();
	        		}
	        	});
	        	
	      		}
	        });
});
$(document).on('change','#favbox',function(){
	var group_id = $('#reciever_id_hid').val();
	var Owner_id = $('#Owner_chat_id').val();
	var favbox_value = $(this).val();
	if(favbox_value == "1"){
		$('#favbox').val('0');
	}else if(favbox_value == "0"){
		$('#favbox').val('1');
	}else {
		$('#favbox').val('1');
	}
	var favbox_value = $(this).val();
	$.ajax({
		url:'SetFavoriteGroup',
		method:'POST',
		type:'JSON',
		data:{
			'group_id':group_id,
			'member_id':Owner_id,
			'fav_id' : favbox_value
		},success:function(data){
			
			
		}
	});
})
$(document).on('click','a[name="Grouplist"]',function(){	
	messid = "";
	clearInterval(myVars);
	chatloadlimit  = $('#loadlimit').val();
	$('#Chattype').val("g");
	myVars = setInterval(check_new_group_message, 1000);
	var group_id = $(this).attr("id");
	var groupimage = $(this).children("input[name='img']").val();
	var group_name = $(this).children("input[id='namegroupname']").val();
	var group_desc = $(this).children("input[id='groupdescriptions']").val();
	var Group_create_user = $(this).children("input[id='usercreate']").val();
	var Owner_id = $('#Owner_chat_id').val();
	$('#reciever_id_hid').val(group_id);
	$('#reciever_id_hid2').val(group_id);
	$('#reciever_id_hid3').val(group_id);
	$('#reciever_id_hid4').val(group_id);
	$('#reciever_id').val(group_id);
	$('#groupsetting').show();	
	$('#bb').hide();
	$('#reciever_avatar').show();
	$('#reciever_avatar').attr("src",groupimage);	
	$('#reciever_id').html(group_name);
	$('#description_text').html(group_desc);
	$('#description_text').val(group_desc);
	getMessagedata(group_id);
	$('#searchchatdata').hide();
	$('#AllResult').val(0);
	$('#AllResult').html(0);
	$('#CurrentResult').val(0);
	$('#CurrentResult').html(0);
	$('#findmessageinchat').val('');
	allresult = 0;
	allresultArray = [];
	var ChatType = $('#Chattype').val().toLowerCase();
	checkRefresh(ChatType);
	toBottom();
	toBottom();
	toBottom();
	toBottom();
	$('.action-header').show();
	$('#Message_text').val('');	
	$('#message_body').show();
	$('.msb-reply').show();
	if(Group_create_user.toLowerCase() == Owner_id.toLowerCase()){
		$('#groupusersetting').show();
		$('#groupusersetting').attr('data-group-id',group_id);
	}else{
		$('#groupusersetting').hide();
	}
	recid = group_id
	set_read_group(group_id);
	toBottom();
	toBottom();
	selectedsmember = [];
	$.ajax({
			url:'GetCurrentMember',
			method:'POST',
			type:'json',
			data:{
				'group_id' : group_id
			},
			success:function(data){
				var jsondata = JSON.parse(data);
				jsondata.forEach((item) => {
					selectedsmember.push(item.id.toLowerCase());
				});
			}
		});
	toBottom();
	toBottom();
});

$('#message_body').scroll(function() {
	var limit  = $('#loadlimit').val();
	if ($('#message_body').scrollTop()  == 0 ){
		topload = true;
		 chatloadlimit = parseInt(chatloadlimit) + parseInt(limit);		
    }
});
if(linkfeed == '1'){
	var reciever_id = $('#reciever_id_hid2').val();
	check_new_Online_user();
	$("a[id='"+reciever_id+"']").click();
	check_new_Online_user();
	$("a[id='"+reciever_id+"']").click();
}
else if(linkfeed != '1' || linkfeed == null){
	$('#bb').show();
}

});

$('#myModal').on('shown.bs.modal', function () {
	  $('#video1')[0].play();
	})
	$('#myModal').on('hidden.bs.modal', function () {
	  $('#video1')[0].pause();
	})



	


	