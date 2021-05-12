<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script
	src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js"
	type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js"
	type="text/javascript"></script>
<link
	href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css"
	rel="stylesheet" type="text/css" />

<link rel="shortcut icon" href="favicon.ico" />
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.flash.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
<script type="text/javascript"
	src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.1.min.js"></script>


<link href="https://afeld.github.io/emoji-css/emoji.css"
	rel="stylesheet">

<style>
.post {
	padding: 2%;
}

.userOnline {
	padding: 2%;
	border: 2px solid #E1E5EC; 
}

.cardpost {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	max-width: 100%;
	border: 2px solid #E1E5EC;
	border-radius: 10px !important;
	background-color: #fff;
	margin-top: -2%
}

.cardpost1 {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	transition: 0.3s;
	max-width: 100%;
	border-radius: 10px !important;
	background-color: #fff;
	border: 2px solid #E1E5EC;
	margin-top: -2%
}

.card:hover {
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
}

.imgfeed {
	border-radius: 50% !important;
	object-fit: cover;
	object-position: center;
}

.imgfeed1 {
	border-radius: 50% !important;
	object-fit: cover;
	object-position: center;
}

.container {
	padding: 2%;
	max-width: 100%;
	border-radius: 50% !important;
}

.container1 {
	padding: 1%;
	max-width: 100%;
	border-radius: 5px !important;
}

.circular--portrait {
	position: relative;
	width: 50px;
	height: 50px;
	overflow: hidden;
	border-radius: 50%;
}

.image {
	margin-top: 5px !important;
	margin-left: 10px !important;   
}

.circular--portrait img {
	width: 100%;
	height: auto;
	border-radius: 50%;
}

.circular--portrait1 {
	position: relative;
	width: 50px;
	height: 50px;
	overflow: hidden;
	border-radius: 50%;
}

.imgfeed>img {
	width: 50px !important;
	height: 50px !important;
	object-fit: cover;
	object-position: center; 
}

.imgfeed1>img {
	width: 50px !important;
	height: 50px !important;
	object-fit: cover;
	object-position: center;
}

.a>img {
	width: 60px !important;
	height: 60px !important;
}

.circular--portrait1 img {
	width: 100%;
	height: auto;
	border-radius: 50%;
}

.button {
	background-color: #4CAF50;
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	max-width: 100%;
	margin-top: 1%;
}

.button4 {
	border-radius: 20px 20px 20px 20px !important;
	padding: 20px 50%;
}

.loginBtn {
	max-width: 100%;
	height: 45px;
	margin: 1.2%;
/*	border-radius: 10px;
	-webkit-border-radius: 10px;
	box-shadow: 0 2px 4px #5e5d5b; */ 
	display: flex;
	align-items: center;
	line-height: 65px;
	border-radius: 40px 40px 40px 40px !important;
	background-color: #e0e6eb; 
	margin-left: 1px;
}

.loginBtn:hover {
	transition: .2s;
	background-color: #d0dae1;
/*	color: #fff;  */
}

.textpost {
	font-size: 15px;
	color: #333;
	padding-left: 20px;
}

.seti:hover {
	background-color: #21F0E3;
	box-shadow: 10px 8px 16px 0 rgba(0, 0, 0, 0.2);
	padding: 2%;
	border-color: green;
	border-radius: 25px;
}

.inputtext {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #FFF;
	border-radius: 1px;
	height: 50px;
	box-sizing: border-box;
}

.max-lines {
	display: block; /* or inline-block */
	text-overflow: ellipsis;
	word-wrap: break-word;
	max-height: 3.6em;
	line-height: 1.8em;
}

/* .sendstyle:hover {
	color: #3598dc;
} */

.textareaComment {
	width: 100%;
height:100%;
	padding: 12px 20px;
	box-sizing: border-box;
	border: 2px solid #ccc;
	border-radius: 4px !important;
	background-color: #f8f8f8;
resize: none;
}

.bordercoment {
	border: 2px solid #ccc;
	border-radius: 4px !important;
	background-color: #f8f8f8;
}

.Like {
	position: relative;
	display: inline-block;
	margin-top: 1px;
}

.Like__link {
	cursor: pointer;
}

.Emojis {
	position: absolute;
	left: 0;
	bottom: 120%;
	-webkit-transform: translate3d(-10%, 0, 0);
	transform: translate3d(-10%, 0, 0);
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	padding: .125rem;
	border-radius: 100rem !important;
	-webkit-transition: .3s .3s;
	transition: .3s .3s;
	box-shadow: 0 0 0 1px rgba(0, 0, 0, 0.08), 0 2px 2px rgba(0, 0, 0, 0.15);
	opacity: 0;
	visibility: hidden;
}

.Emojis:hover, .Like__link.js-hover ~ .Emojis, .Like__link:hover ~
	.Emojis {
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
	opacity: 1;
	visibility: visible;
}

.Emoji {
	position: relative;
	width: 48px;
	height: 48px;
	color: #ffd972;
	cursor: pointer;
	-webkit-transition-delay: .6s, .3s;
	transition-delay: .6s, .3s;
	-webkit-transition-duration: 0s, .3s;
	transition-duration: 0s, .3s;
	-webkit-transition-property: opacity, -webkit-transform;
	transition-property: opacity, -webkit-transform;
	transition-property: transform, opacity;
	transition-property: transform, opacity, -webkit-transform;
	opacity: 0;
	-webkit-transform: translate3d(0, 100%, 0) scale(0.3);
	transform: translate3d(0, 100%, 0) scale(0.3);
}

.Emojis:hover .Emoji, .Like__link.js-hover+.Emojis .Emoji, .Like__link:hover+.Emojis .Emoji
	{
	-webkit-transform: none;
	transform: none;
	opacity: 1;
}

.Emoji .icon {
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	-webkit-transform: scale(0.8);
	transform: scale(0.8);
	-webkit-transition: -webkit-transform .2s ease;
	transition: -webkit-transform .2s ease;
	transition: transform .2s ease;
	transition: transform .2s ease, -webkit-transform .2s ease;
}

.Emoji:hover .icon {
	-webkit-transform: scale(1) translate3d(0, -10%, 0);
	transform: scale(1) translate3d(0, -10%, 0);
}

.Emojis:hover .Emoji:nth-of-type(1), .Like__link:hover+.Emojis .Emoji:nth-of-type(1)
	{
	-webkit-transition-duration: 0.2s;
	transition-duration: 0.2s;
	-webkit-transition-delay: 0s;
	transition-delay: 0s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1);
}

.Emojis:hover .Emoji:nth-of-type(2), .Like__link:hover+.Emojis .Emoji:nth-of-type(2)
	{
	-webkit-transition-duration: 0.3s;
	transition-duration: 0.3s;
	-webkit-transition-delay: 0.02s;
	transition-delay: 0.02s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.2);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.2);
}

.Emojis:hover .Emoji:nth-of-type(3), .Like__link:hover+.Emojis .Emoji:nth-of-type(3)
	{
	-webkit-transition-duration: 0.4s;
	transition-duration: 0.4s;
	-webkit-transition-delay: 0.04s;
	transition-delay: 0.04s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.4);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.4);
}

.Emojis:hover .Emoji:nth-of-type(4), .Like__link:hover+.Emojis .Emoji:nth-of-type(4)
	{
	-webkit-transition-duration: 0.5s;
	transition-duration: 0.5s;
	-webkit-transition-delay: 0.06s;
	transition-delay: 0.06s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.6);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.6);
}

.Emojis:hover .Emoji:nth-of-type(5), .Like__link:hover+.Emojis .Emoji:nth-of-type(5)
	{
	-webkit-transition-duration: 0.6s;
	transition-duration: 0.6s;
	-webkit-transition-delay: 0.08s;
	transition-delay: 0.08s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.8);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 1.8);
}

.Emojis:hover .Emoji:nth-of-type(6), .Like__link:hover+.Emojis .Emoji:nth-of-type(6)
	{
	-webkit-transition-duration: 0.7s;
	transition-duration: 0.7s;
	-webkit-transition-delay: 0.1s;
	transition-delay: 0.1s;
	-webkit-transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 2);
	transition-timing-function: cubic-bezier(0.6, 0.6, 0.5, 2);
}

.Emoji--like {
	/* color: $c-blue; */
	
}

.Emoji--love {
	/* color: $c-red; */
	
}

.icon {
	background-image:
		url("https://media.giphy.com/media/xT9DPr2QnsfTFoykFO/giphy.gif");
	background-repeat: no-repeat;
}

.icon--like {
	background-position: -6px -6px;
}

.icon--heart {
	background-position: -68px -4px;
}

.icon--haha {
	background-position: -129px -6px;
}

.icon--wow {
	background-position: -191px -6px;
}

.icon--sad {
	background-position: -252px -5px;
}

.icon--angry {
	background-position: -314px -6px;
}

*, *::before, *::after {
	box-sizing: border-box;
}

.fa-heart {
	color: red;
}

.fa-laugh-squint {
	color: #F3C200;
}

.fa-surprise {
	color: #F7CA18;
}

.fa-sad-tear {
	color: #C5BF66;
}

.fa-angry {
	color: #EF4836;
}

.image-upload>input {
	display: none;
}

#more {
	/* display: none; */
	
}

.eieiza {
	display: none;
}

.dotsza {
	display: inline;
}

button .label, button .icon-arrow {
	backface-visibility: hidden;
	transform: translateZ(0);
	perspective: 1000;
}

button .label {
	display: inline-block;
	transition: transform .5s cubic-bezier(0.86, 0, 0.07, 1);
}

button .icon-arrow {
	fill: #3F3F3F;
	height: 8px;
	top: 18.5px;
	transition: transform .5s cubic-bezier(0.86, 0, 0.07, 1), opacity .4s
		cubic-bezier(0.86, 0, 0.07, 1);
	width: 35px;
}

button .icon-arrow.before {
	left: 32px;
	margin-right: 15px;
	position: absolute;
	transform-origin: left center;
}

button .icon-arrow.after {
	margin-left: 15px;
	opacity: 0;
	position: absolute;
	right: 32px;
	transform: translateX(75%) scaleX(0.1);
	transform-origin: right center;
}

button:hover .label {
	transform: translateX(-80px);
}

button:hover .icon-arrow.before {
	opacity: 0;
	transform: translateX(-75%) scaleX(0.1);
}

button:hover .icon-arrow.after {
	opacity: 1;
	transform: translateX(0) scaleX(1);
}

button:active {
	border-color: #FD6154;
	color: #FD6154;
}

button:active .icon-arrow {
	fill: #FD6154;
}

.buttonaum:hover {
	height: 40px;
	display: flex;
	align-items: center;
	justify-content: center;
	box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
	border-radius: 20px !important;
}

.centerxy {
	display: flex;
	align-items: center;
	justify-content: center;
}

.responsive-iframe {
	position: absolute;
	top: 0;
	left: 0;
	bottom: 0;
	right: 0;
	width: 80%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

img.stk {
	width: 80px;
	height: 80px;
}

img.stkComment {
	width: 100px;
	height: 100px;
}

img.imageComment {
	width: 30%;
	height: 30%;
}

.stk:hover {
	/* tranform: scale(0.5); */
	background-color: #94A0B2;
	transition: 0.8s;
	/* width: 160px;
	height: 160px;
	z-index: 999;
	position: absolute;
	box-shadow: 3px 3px #fff;
	transition: 0.8s; */
}

.crop-image {
	object-fit: cover;
	object-position: center;
}
/****************************/
.holder_wrap {
	position: relative;
	margin: auto;
	display: block;
	height: 120px; /* กำหนดความสูงส่วนพื้นที่คลุมเนื้อหาทั้งหมด */
}

.holder_wrap_img {
	position: absolute;
	/* กำหนดการจัดตำแหน่งส่วนพื้นที่คลุมเนื้อหารุปและข้อความซ้อนทับ */
}

.holder_wrap_img img {
	position: relative; /* กำหนดการจัดตำแหน่งของรูป */
}

/* css ซ้อนทับ ชิดขอบด้านขวา */
.inner_position_right {
	position: absolute;
	display: block;
	height: 100%;
	/* กำหนดความสูงส่วนของเนื้อหาที่นำมาซ้อนทับ แบบขยายเต็ม */
	width: 50px; /* กำหนดความกว้างของเนื้อหาที่นำมาซ้อนทับ */
	top: 0px; /* css กำหนดชิดด้านบน  */
	right: 0px; /* css กำหนดชิดขวา  */
	z-index: 999;
}

.inputbackground[placeholder] {
	text-align: center;
	vertical-align: middle;
	padding-top: 10%;
	padding-bottom: 10%;
}

.showinputbackground {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 300px;
	background-size: cover;
	word-break: break-word;
	padding-right: 2%;
}

.imgborder {
	border: 1px solid #ddd;
	border-radius: 4px;
	padding: 5px;
	width: 100%;
}

.imgborder:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
}

canvas {
	height: 100px;
	width: 100px;
	border-radius: 50px;
}

.borderRGB:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
	border: 1px solid #ddd;
	border-radius: 4px;
}

.emojiborder:hover {
	box-shadow: 0 0 2px 1px rgba(0, 140, 186, 0.5);
	border: 1px solid #ddd;
	border-radius: 4px;
}

#emoji {
	font-size: 20px;
	cursor: pointer;
	z-index: 9999;
	transition: 0s background-color;
	transition-delay: 2s;
	margin: 5%;
}

#emoji:hover {
	font-size: 30px;
	z-index: 9999;
	transition-delay: 2s;
}

.emoB {
	background-color: white;
	border-radius: 60% !important;
	font-size: 30px;
	cursor: pointer;
	max-width: 50px;
	height: 50px;
}

.emoB:hover {
	background-color: #E1E5EC;
	color: black;
}

textarea:focus, input:focus {
	outline: 0;
}

.icon-b{
  color:black;
  background-color:#E1E5EC;
  border-radius:50%;
  width:45px;
  height:45px;
  line-height:45px;
  font-size:18px;
  text-align:center;
  display:inline-block;
  margin-left:22px;
  transition:all .6s ease;
}
.iconcomment {
	background-color: white;
	border-radius: 60% !important;
	cursor: pointer;
	max-width: 35px;
	height: 35px;
	margin-top: -10px;
}

.iconcomment:hover {
	background-color: #E1E5EC;
	color: black;
}

</style>

<html lang="en">
<body>
	<!--------------------------- TitleBar --------------------------->
	<div class="portlet light bordered" style="background-color: white;">
		<div class="portlet-title">

			<div class="caption">
				<i class="fa fa-edit font-red"></i> <span
					class="caption-subject font-red sbold "> FEEDS </span>
			</div>
			<div class="actions">

				<button
					style="padding-left: 65px; width: 199px; background-color: white; border: 1px solid #3F3F3F; color: #3F3F3F; display: inline-block; line-height: 1px; margin: auto; padding: 12px 32px 12px 82px; position: relative; text-decoration: none;"
					href="javascript:;" onclick="Gotofeed()">
					<svg class="icon-arrow before"> <use xlink:href="#arrow"></use>
					</svg>
					<span style="color: black" class="label">Let's Go Chat</span>
					<svg class="icon-arrow after"> <use xlink:href="#arrow"></use>
					</svg>
				</button>

				<svg style="display: none;"> <defs> <symbol id="arrow"
					viewBox="0 0 35 15">
				<title>Arrow</title>
				<path
					d="M27.172 5L25 2.828 27.828 0 34.9 7.071l-7.07 7.071L25 11.314 27.314 9H0V5h27.172z " />
				</symbol> </defs> </svg>

				<!--  <button style="width:35px; height:35px;" type="button" class="btn circle default" id="chat" onclick="Gotofeed()">
				<i class="fa fa-rss"></i>
			</button> -->
				&emsp;&emsp; <a
					class="btn btn-circle btn-icon-only btn-default fullscreen"
					href="javascript:;" data-original-title="" title=""> </a>
			</div>

		</div>

		<!--------------------------- End TitleBar --------------------------->
		<!--------------------------- PostBox --------------------------->
		<div class="row">
			<div class="col-md-9 col-sm-9 col-9  col-lg-9 "
				style="padding-right: 8%; padding-left: 8%;"> 
				<div class="row" style="display: flex; align-items: center; padding-left: 2%; padding-right: 2%;">
					<div class="col-md-12 col-sm-12  col-lg-12 post">
						<div class="cardpost ">
							<div class="container">
								<div class="row">
									<div class="col-md-1 col-9 col-sm-1  col-lg-1 ">
										<c:forEach var="fpost" items="${userpath}" varStatus="Count">
											<input type="hidden" value="${fpost.name}" id="Owner_name" />
											<c:choose>
												<c:when test="${fpost.path==null}">
													<div class="image circular--portrait imgfeed crop-image">
														<img class="imgfeed crop-image"
															src="/pages-back/img/profile2.png"> 
													</div>
												</c:when>
												<c:otherwise>
													<div class="image circular--portrait imgfeed crop-image">
														<img src="${fpost.path}" alt="">
													</div>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>


									<div class="col-md-11  col-sm-11  col-lg-11"
										style="padding-left: 4%">
										<div id="loginBtn " class="loginBtn show-modal"
											style="cursor: pointer;">
											<span class="textpost " id="element">What's on your
												mind?</span>
										</div>
									</div>


								</div>

							</div>
						</div>

					</div>
				</div>
				<div id="myModalComment" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Edit Comment</h4>
							</div>
							<div class="modal-body">



								<div class="row" style="padding-left: 15px; padding-right: 15px">
									<textarea id="demoComment" style="display: none;"></textarea>
									<textarea id="messageCommentModal" style="width: 100%"
										onkeyup="setTextEdit()"></textarea>
									<button class="btn emoB">
										<div
											style="width: 40px; height: 40px; margin-top: -5px; margin-left: -7.5px">
											<i class="fa fa-smile-o" id="emo"
												onclick="emoShowEditComment()"></i>
										</div>
									</button>
								</div>

								<div class="col-md-1 " id="emoShowEditComment">
									<div id="emoEditComment" class="text-center"
										style="z-index: 9999; display: none; position: absolute; overflow: auto; top: 20px; left: 20px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
										<table class="table table-striped table-condensed table-hover"
											id="table_id" style="margin: 0px">

											<tbody>
												<tr class="E1">
													<td class="text-center"><b id="emoji"
														onclick="addEmoEditcomment('&#128512;')">&#128512;</b> <b
														id="emoji" onclick="addEmoEditcomment('&#128515;')">&#128515;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128518;')">&#128518;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128521;')">&#128521;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128525;')">&#128525;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128528;')">&#128528;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128531;')">&#128531;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128534;')">&#128534;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128513;')">&#128513;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128516;')">&#128516;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128519;')">&#128519;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128522;')">&#128522;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128526;')">&#128526;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128529;')">&#128529;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128532;')">&#128532;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128535;')">&#128534;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128514;')">&#128514;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128517;')">&#128517;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128520;')">&#128520;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128523;')">&#128524;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128527;')">&#128527;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128530;')">&#128530;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128533;')">&#128533;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128536;')">&#128536;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128537;')">&#128537;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128538;')">&#128538;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128539;')">&#128539;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128540;')">&#128540;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128541;')">&#128541;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128542;')">&#128542;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128543;')">&#128543;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128544;')">&#128544;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128545;')">&#128545;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128546;')">&#128546;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128547;')">&#128547;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128548;')">&#128548;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128549;')">&#128549;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128550;')">&#128550;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128551;')">&#128551;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128552;')">&#128552;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128553;')">&#128553;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128554;')">&#128554;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128555;')">&#128555;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128556;')">&#128556;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128557;')">&#128557;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128558;')">&#128558;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128559;')">&#128559;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128560;')">&#128560;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128561;')">&#128561;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128562;')">&#128562;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128563;')">&#128563;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128564;')">&#128564;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128565;')">&#128565;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128566;')">&#128566;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128567;')">&#128567;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128580;')">&#128580;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#128591;')">&#128591;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129303;')">&#129303;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129304;')">&#129304;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129305;')">&#129305;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129306;')">&#129306;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129309;')">&#129309;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129310;')">&#129310;</b>
														<b id="emoji" onclick="addEmoEditcomment('&#129311;')">&#129311;</b>
													</td>

												</tr>
											</tbody>
										</table>
									</div>

								</div>

							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal" id="test" onclick="editCommentnew() "
									style="width: 100px">OK</button>
								<button type="button" class="btn" data-dismiss="modal" id="test"
									style="width: 100px; background-color: #e35b5a; color: white">Close</button>
							</div>
						</div>
					</div>
				</div>


				<!--------------------------- End PostBox --------------------------->

				<!--------------------------- post --------------------------->
				<c:forEach var="fpost" items="${userpath}" varStatus="Count">


					<form id = "Postboxx" action="AddFeednews" class="form-horizontal" method="POST"
						enctype="multipart/form-data">
						<div id="testmodal" class="modal fade"
							style="background-color: rgba(0, 0, 0, 0.5);">
							<div class="modal-content"
								style="margin-left: 30%; margin-right: 30%; margin-top: 5%; margin-bottom: 20%; min-width: 400px; min-hight: 400px">
								<div class="modal-header text-center">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title">สร้างโพสต์</h4> 
								</div>
								<div class="row modal-body">
									<div class="col-md-1  col-sm-1 col-xs-2 "
										style="margin-right: 3%; margin-left: 2%" id="textinput">
										<c:forEach var="fpost" items="${userpath}" varStatus="Count">
											<c:choose>
												<c:when test="${fpost.path==null}">
													<img class="circular--portrait imgfeed crop-image"
														src="/pages-back/img/profile2.png"
														style="max-width: 50px; max-height: 50px; bottom:4px;">

												</c:when>
												<c:otherwise>
													<img class="circular--portrait imgfeed crop-image" src="${fpost.path}" alt=""
														style="max-width: 50px; max-height: 50px; bottom:4px;">

												</c:otherwise>
											</c:choose>
										</c:forEach>
									</div>
									<c:choose>
										<c:when test="${fpost.roll=='HR'||fpost.roll=='admin'}">
											<div class="col-md-5 col-xs-4  col-sm-4 " style="">
												<c:forEach var="fpost" items="${userpath}" varStatus="Count">
													<span>${fpost.name} </span>
													<br>
													<span><i class="fa fa-user" aria-hidden="true"></i></span>
												</c:forEach>
											</div>
											<div class="col-md-5 col-xs-4  col-sm-4 text-center" style="">
												<div class="col-md-6 col-xs-12  col-sm-12 row">
													<input id=test name=test value="Every" type="radio" checked />
													<label style="margin-right: 3%"> Public</label>
												</div>
												<div class="col-md-6 col-xs-12  col-sm-12 row">
													<input id=test name=test value="officail" type="radio" /><label
														for="no"> Official</label>
												</div>

											</div>
										</c:when>
										<c:otherwise>
											<div class="col-md-8 col-xs-8  col-sm-8 " style="">
												<c:forEach var="fpost" items="${userpath}" varStatus="Count">
													<span>${fpost.name} </span>
													<br>
													<span><i class="fa fa-user" aria-hidden="true"></i></span>
												</c:forEach>
											</div>
											<input id=test name=test value="Every" type="radio" checked
												style="display: none" />
										</c:otherwise>
									</c:choose>
									<div class="col-md-12 ">

										<textarea class="inputtext" placeholder="คุณคิดอะไรอยู่?"
											onkeyup="setdetailsPost()" id="details" name="details"
											style="width: 100%; resize: none; height: 100%; margin-top: 1%; white-space: pre-wrap; overflow-wrap: break-word;"></textarea>
										<input type="hidden" id="detailsNew" name="detailsNew">
									</div>
									<div class="row">
										<div class="col-md-12 ">
											<div class="fileinput fileinput-new text-center col-md-1"
												id="imagelayout" data-provides="fileinput">
												<div class="text-center ">
													<div class="fileinput-preview fileinput-exists thumbnail "
														style="width: 100%; height: 100%; line-height: 10px;"></div>
												</div>
												<div class="" >
													<span class="btn btn-file"> 
													<span class="fileinput-new" ><i class="fa fa-picture-o fa-2x"></i></span>  
														<input type="hidden" value="" name="..."> <input
														type="file" name="fileUpload" id="myFile" value=""></span>
													<a href="javascript:;" class="btn red fileinput-exists"
														data-dismiss="fileinput" onclick="testremove()">
														Remove </a>
												</div>

											</div>
											<div class="col-md-1 "
												style="margin-top: 8px; margin-left: 9px">   
												<a id="emo" class="" style="width: 100%; height: 100%;"
													onclick="emoShow()"> <i class="fa fa-smile-o fa-2x"
													style="color: #333"></i> 
												</a>
												<div class="col-md-1 " id="emoShow">
													<div id="emo2" class="text-center"
														style="z-index: 9999; display: none; position: absolute; overflow: auto; top: 20px; left: 20px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
														<table
															class="table table-striped table-condensed table-hover"
															id="table_id" style="margin: 0px">

															<tbody>
																<tr class="E1">
																	<td class="text-center"><b id="emoji"
																		onclick="addEmo('&#128512;')">&#128512;</b> <b
																		id="emoji" onclick="addEmo('&#128515;')">&#128515;</b>
																		<b id="emoji" onclick="addEmo('&#128518;')">&#128518;</b>
																		<b id="emoji" onclick="addEmo('&#128521;')">&#128521;</b>
																		<b id="emoji" onclick="addEmo('&#128525;')">&#128525;</b>
																		<b id="emoji" onclick="addEmo('&#128528;')">&#128528;</b>
																		<b id="emoji" onclick="addEmo('&#128531;')">&#128531;</b>
																		<b id="emoji" onclick="addEmo('&#128534;')">&#128534;</b>
																		<b id="emoji" onclick="addEmo('&#128513;')">&#128513;</b>
																		<b id="emoji" onclick="addEmo('&#128516;')">&#128516;</b>
																		<b id="emoji" onclick="addEmo('&#128519;')">&#128519;</b>
																		<b id="emoji" onclick="addEmo('&#128522;')">&#128522;</b>
																		<b id="emoji" onclick="addEmo('&#128526;')">&#128526;</b>
																		<b id="emoji" onclick="addEmo('&#128529;')">&#128529;</b>
																		<b id="emoji" onclick="addEmo('&#128532;')">&#128532;</b>
																		<b id="emoji" onclick="addEmo('&#128535;')">&#128534;</b>
																		<b id="emoji" onclick="addEmo('&#128514;')">&#128514;</b>
																		<b id="emoji" onclick="addEmo('&#128517;')">&#128517;</b>
																		<b id="emoji" onclick="addEmo('&#128520;')">&#128520;</b>
																		<b id="emoji" onclick="addEmo('&#128523;')">&#128524;</b>
																		<b id="emoji" onclick="addEmo('&#128527;')">&#128527;</b>
																		<b id="emoji" onclick="addEmo('&#128530;')">&#128530;</b>
																		<b id="emoji" onclick="addEmo('&#128533;')">&#128533;</b>
																		<b id="emoji" onclick="addEmo('&#128536;')">&#128536;</b>

																		<b id="emoji" onclick="addEmo('&#128537;')">&#128537;</b>
																		<b id="emoji" onclick="addEmo('&#128538;')">&#128538;</b>
																		<b id="emoji" onclick="addEmo('&#128539;')">&#128539;</b>
																		<b id="emoji" onclick="addEmo('&#128540;')">&#128540;</b>
																		<b id="emoji" onclick="addEmo('&#128541;')">&#128541;</b>
																		<b id="emoji" onclick="addEmo('&#128542;')">&#128542;</b>
																		<b id="emoji" onclick="addEmo('&#128543;')">&#128543;</b>
																		<b id="emoji" onclick="addEmo('&#128544;')">&#128544;</b>
																		<b id="emoji" onclick="addEmo('&#128545;')">&#128545;</b>
																		<b id="emoji" onclick="addEmo('&#128546;')">&#128546;</b>
																		<b id="emoji" onclick="addEmo('&#128547;')">&#128547;</b>
																		<b id="emoji" onclick="addEmo('&#128548;')">&#128548;</b>
																		<b id="emoji" onclick="addEmo('&#128549;')">&#128549;</b>
																		<b id="emoji" onclick="addEmo('&#128550;')">&#128550;</b>
																		<b id="emoji" onclick="addEmo('&#128551;')">&#128551;</b>
																		<b id="emoji" onclick="addEmo('&#128552;')">&#128552;</b>
																		<b id="emoji" onclick="addEmo('&#128553;')">&#128553;</b>
																		<b id="emoji" onclick="addEmo('&#128554;')">&#128554;</b>
																		<b id="emoji" onclick="addEmo('&#128555;')">&#128555;</b>
																		<b id="emoji" onclick="addEmo('&#128556;')">&#128556;</b>
																		<b id="emoji" onclick="addEmo('&#128557;')">&#128557;</b>
																		<b id="emoji" onclick="addEmo('&#128558;')">&#128558;</b>
																		<b id="emoji" onclick="addEmo('&#128559;')">&#128559;</b>
																		<b id="emoji" onclick="addEmo('&#128560;')">&#128560;</b>
																		<b id="emoji" onclick="addEmo('&#128561;')">&#128561;</b>
																		<b id="emoji" onclick="addEmo('&#128562;')">&#128562;</b>
																		<b id="emoji" onclick="addEmo('&#128563;')">&#128563;</b>
																		<b id="emoji" onclick="addEmo('&#128564;')">&#128564;</b>
																		<b id="emoji" onclick="addEmo('&#128565;')">&#128565;</b>
																		<b id="emoji" onclick="addEmo('&#128566;')">&#128566;</b>
																		<b id="emoji" onclick="addEmo('&#128567;')">&#128567;</b>
																		<b id="emoji" onclick="addEmo('&#128580;')">&#128580;</b>
																		<b id="emoji" onclick="addEmo('&#128591;')">&#128591;</b>
																		<b id="emoji" onclick="addEmo('&#129303;')">&#129303;</b>
																		<b id="emoji" onclick="addEmo('&#129304;')">&#129304;</b>
																		<b id="emoji" onclick="addEmo('&#129305;')">&#129305;</b>
																		<b id="emoji" onclick="addEmo('&#129306;')">&#129306;</b>
																		<b id="emoji" onclick="addEmo('&#129309;')">&#129309;</b>
																		<b id="emoji" onclick="addEmo('&#129310;')">&#129310;</b>
																		<b id="emoji" onclick="addEmo('&#129311;')">&#129311;</b>
																	</td>

																</tr>
															</tbody>
														</table>
													</div>
												</div>
											</div>
											<div onclick="showback()" class="col-md-1"
												id="backgroundimage" style="margin-top: 8px; padding-left: 7px;">  
												<i class="fa fa-sticky-note-o fa-2x"
													style="color: #333;"></i> 
											</div>
											<div onclick="showrgb()" class="col-md-1"
												id="backgroundcolorRGB" style="margin-top: 0x; padding-left: 0%; bottom:2px;">  
												<img class="borderRGB"
													src="/pages-back/faq/background/color_wheel_16443.png"
													height="30px" width="30px">
											</div>
											<div  class="col-md-1" style="display:none;margin-top: 2%"
												id="closebg">
													<a id="emo" class="" style="width: 100%; height: 100%;"
													onclick="closebackground()"> <i class="fa fa-ban"
													style="font-size: 40px"></i>
												</a>
											</div>
										</div>
									</div>


									<div class="col-md-12 text-center" style="margin-bottom: 10px;">

										<button type="submit" value="post" id="buttonPost" disabled
											class="btn btn-primary btn-md text-center"
											style="width: 100%; padding: 2%; margin-bottom: 3%">Post</button>
									</div>

								</div>
								<input type="hidden" name="backgroundrgb" id="backgroundrgb"></input>
								<input type="hidden" name="backgroundcolor" id="backgroundcolor"></input>
								<input type="hidden" name="backgroundpath" id = "backgroundpath"></input>
								<div id="colorrgb"
									style="position: absolute; top: 30%; left: 20%; width: 100px; height: 100px; display: none">
									<canvas style="" id="colorCanvas" class="color-canvas"></canvas>
								</div>
								<div id="changebackground" class=" "
									style="width: 300px; height: 200px; overflow: scroll; position: absolute; top: 0; background-color: rgb(225, 229, 236); display: none">
									<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/1.jpg',1,'no')"
										class="col-md-4 " style="margin-top: 3%">
									<img
										class="imgborder" alt="" 
										src="/pages-back/faq/background/background_img/1.jpg"
										width="100%" height=50px></a> 
												<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/2.jpg',2,'no')"
										class="col-md-4 " style="margin-top: 3%">
									<img
										class="imgborder" alt="" 
										src="/pages-back/faq/background/background_img/2.jpg"
										width="100%" height=50px></a> 
													<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/3.jpg',3,'no')"
										class="col-md-4 " style="margin-top: 3%">
									<img
										class="imgborder" alt="" 
										src="/pages-back/faq/background/background_img/3.jpg"
										width="100%" height=50px></a> 
											<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/4.jpg',4,'no')"
										class="col-md-4 " style="margin-top: 3%">
									<img
										class="imgborder" alt="" 
										src="/pages-back/faq/background/background_img/4.jpg"
										width="100%" height=50px></a> 
															<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/5.jpg',5,'no')"
										class="col-md-4 " style="margin-top: 3%">
									<img
										class="imgborder" alt="" 
										src="/pages-back/faq/background/background_img/5.jpg"
										width="100%" height=50px></a> 
									
										 <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/6.jpg',6,'no')"
										class="col-md-4" style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/6.jpg"
										width="100%" height=50px></a> 
										<a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/7.jpg',7,'no')"
										class="col-md-4 " style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/7.jpg"
										width="100%" height=50px></a> <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/8.jpg',8,'no')"
										class="col-md-4" style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/8.jpg"
										width="100%" height=50px></a> <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/9.jpg',9,'no')"
										class="col-md-4" style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/9.jpg"
										width="100%" height=50px></a> <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/10.jpg',10,'no')"
										class="col-md-4 " style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/10.jpg"
										width="100%" height=50px></a> <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/11.jpg',11,'no')"
										class="col-md-4" style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/11.jpg"
										width="100%" height=50px></a> <a name = "backgroundimgselect" data="no"
										onclick="backgroundimg('/pages-back/faq/background/background_img/12.jpg',12,'no')"
										class="col-md-4" style="margin-top: 3%"><img
										class="imgborder" alt=""
										src="/pages-back/faq/background/background_img/12.jpg"
										width="100%" height=50px></a>
										
								</div>




							</div>
						</div>
					</form>

				</c:forEach>

				<!--------------------------- post --------------------------->
				<!--------------------------- detail --------------------------->
				<div class="test">
					<jsp:include page="/pages-back/faq/feed_listdetail.jsp"
						flush="true"></jsp:include>
				</div>
				<!--------------------------- detail --------------------------->
			</div>
			<!--------------------------- useronline --------------------------->
			<div class="col-md-3 col-sm-3  col-lg-3 userOnline bg-white "
				style="position: -webkit-sticky; position: sticky; top: 20px">


				<div class=" ms-menu  col-md-12 ">
					<div>
						<i class="fa fa-circle" aria-hidden="true"
							style="color: rgb(174, 253, 0)"></i>&emsp;Online
					
					</div>
					<form action="OpenChatFromFeed" id="GoToChatForm" method="POST">
						<input type="hidden" name="Reciever_id" id="formsender" value="" />
						<div id="Onlinelist_body"> 
							<c:forEach var="x" items="${UserOnlineList}">
								<c:choose>
									<c:when test="${x.toString() == Owner_chat_id}">

									</c:when>
									<c:otherwise>
										<%-- <input type="submit" value="${x.toString()}"
											name="Reciever_id" /> --%>
										<button style="transition: all .6s ease" type="submit"
											class="list-group-item media" id="${x.toString()}">
											<div class="lv-avatar pull-left">
												<img src="/pages-back/img/profile2.png" alt=""
													class="circle img-avatar" style="width: 50px">
											</div>
											<div class="media-body">

												<div class="list-group-item-heading">
													<c:out value="${x.toString()}">

													</c:out>

												</div>

												<small class="list-group-item-text c-gray">online</small> <span
													style="float: right" class="badge badge-danger float-right">1</span>
											</div>
										</button>

									</c:otherwise>
								</c:choose>


							</c:forEach>
						</div>

					</form>

				</div>

			</div>
			<!--------------------------- useronline --------------------------->
		</div>
	</div>


</body>
<script>

function auto_grow(element) {
    element.style.height = "5px";
    element.style.height = (element.scrollHeight)+"px";
}
</script>
<script>
// initial load post background 
var backgroudpost = false;
var backgroundid = "";
$(document).ready(function(e){
	$.ajax({
		url:'GetBackground',
		method:'POST',
		type:'JSON',
		data:{
			
		},success:function(data){
			backgroundjson = JSON.parse(data);
			var html = "";
			backgroundjson.forEach((item)=>{
				var chard = "'";
				var typechar = "";
				html += '<a name = "backgroundimgselect" onclick="backgroundimg('+chard+item.background_img_path+chard+','+item.feed_post_background_id+','+chard+'yes'+chard+')" data="yes"  class="col-md-4" style="margin-top: 3%">';
				html += '<img class="imgborder" alt="" src="'+item.background_img_path+'" width="100%" height=50px></a>';
				
			});
			$('#changebackground').append(html);
		}
	});
	
	$(document).on('submit','#Postboxx',function(e){
		var background_post_id = $('#backgroundcolor').val();
		var background_path = $('#backgroundpath').val();
		
	});
	
	
});


function initColorPicker() {
	  var canvas = document.getElementById('colorCanvas');
	  var canvasContext = canvas.getContext('2d');

	  let gradient = canvas.getContext('2d').createLinearGradient(0, 0, canvas.width, 0)
	  gradient.addColorStop(0, '#ff0000')
	  gradient.addColorStop(1 / 6, '#ffff00')
	  gradient.addColorStop((1 / 6) * 2, '#00ff00')
	  gradient.addColorStop((1 / 6) * 3, '#00ffff')
	  gradient.addColorStop((1 / 6) * 4, '#0000ff')
	  gradient.addColorStop((1 / 6) * 5, '#ff00ff')
	  gradient.addColorStop(1, '#ff0000')
	  canvas.getContext('2d').fillStyle = gradient
	  canvas.getContext('2d').fillRect(0, 0, canvas.width, canvas.height)

	  gradient = canvas.getContext('2d').createLinearGradient(0, 0, 0, canvas.height)
	  gradient.addColorStop(0, 'rgba(255, 255, 255, 1)')
	  gradient.addColorStop(0.5, 'rgba(255, 255, 255, 0)')
	  gradient.addColorStop(1, 'rgba(255, 255, 255, 0)')
	  canvas.getContext('2d').fillStyle = gradient
	  canvas.getContext('2d').fillRect(0, 0, canvas.width, canvas.height)

	  gradient = canvas.getContext('2d').createLinearGradient(0, 0, 0, canvas.height)
	  gradient.addColorStop(0, 'rgba(0, 0, 0, 0)')
	  gradient.addColorStop(0.5, 'rgba(0, 0, 0, 0)')
	  gradient.addColorStop(1, 'rgba(0, 0, 0, 1)')
	  canvas.getContext('2d').fillStyle = gradient
	  canvas.getContext('2d').fillRect(0, 0, canvas.width, canvas.height)


	  canvas.onclick = function(e) {
	  	
	    var imgData = canvasContext.getImageData((e.offsetX / canvas.clientWidth) * canvas.width, (e.offsetY / canvas.clientHeight) * canvas.height, 1, 1)
	    var rgba = imgData.data;
	    var color = "rgba(" + rgba[0] + ", " + rgba[1] + ", " + rgba[2] + ", " + rgba[3] + ")";
/* 	    alert("%c" + color, "color:" + color) */
	    $("#details").css('background-color',color);
	    $("#details").addClass('inputbackground');
		$("#colorrgb").removeAttr('top');
		$("#colorrgb").css('top','42%');
		$("#backgroundrgb").val(color);
		$("#changebackground").removeAttr('top');
		$("#changebackground").css('top','70px');
		$("#backgroundcolor").val("");
		$('#details').css('background-image', '');
		$("#imagelayout").hide();
		$("#closebg").show();
		
	
	  }
	}

	initColorPicker()

</script>
<script>
/* function background1(id){
	$("#details").css('background-image','url(https://media.giphy.com/media/KZFrf9JusXzmpnPsT6/giphy.gif)');
$("#details").css('color','white');
$("#details").css('background-repeat','no-repeat');
$("#details").css('background-size','cover');
$("#backgroundcolor").val(id);
$("#details").addClass('inputbackground');
};
function background2(id){
	$('#details').css('background-image', 'url(https://pbs.twimg.com/media/D3w2NrHW4AU8shv.jpg)');
	$("#details").css('background-repeat','no-repeat');
	$("#details").css('background-size','cover');
	$("#backgroundcolor").val(id);
	$("#details").addClass('inputbackground');
};
function background3(id){
	$('#details').css('background-image', '');
	$("#backgroundcolor").val(id);
	$("#details").removeClass('inputbackground');
	
}; */
function closebackground(){
	$("#backgroundcolor").val("");
	   $("#details").css('background-color','');
	$('#details').css('background-image', '');
	$("#backgroundrgb").val("");
	$("#details").removeClass('inputbackground');
	$("#imagelayout").show();
	$("#colorrgb").removeAttr('top');
	$("#colorrgb").css('top','30%');
	$("#changebackground").removeAttr('top');
	$("#changebackground").css('top','0');
	$("#colorrgb").hide();
	$("#changebackground").hide();
	$("#emo2").hide();
	$("#closebg").hide();
};

function backgroundimg(imageurl,id,type){

	$('#details').css('background-image', 'url('+imageurl+')');
	$("#details").css('background-repeat','no-repeat');
	$("#details").css('background-size','cover');
	$("#details").addClass('inputbackground');
	$("#colorrgb").removeAttr('top');
	$("#colorrgb").css('top','42%');
	$("#changebackground").removeAttr('top');
	$("#changebackground").css('top','70px');
	$("#imagelayout").hide();
	$("#backgroundcolor").val(id);	
	if(type == "yes"){
		$('#backgroundpath').val("yes");
	}else{
		$('#backgroundpath').val("no");
	}
	$("#closebg").show();
	backgroundid = id;
};
function showback(){
	$("#changebackground").toggle('slow');
	$("#colorrgb").hide();
	$("#emo2").hide();

}
function showrgb(){
	$("#colorrgb").toggle('slow');
	$("#changebackground").hide();
	$("#emo2").hide();
}


</script>
<script>

$(document).ready(function(){
	$( "#details" ).click(function() {
		$("#colorrgb").hide();
		$("#changebackground").hide();
		$("#emo2").hide();
	  });
	});
</script>
<script>
 function hidestcker(id){
	 $("#myFile"+id).change(function() {
			$("#sticker"+id).hide();
	//		$("#textcomment"+id).removeClass( "col-md-8" );
	//		$("#textcomment"+id).addClass( "col-md-9" );
	
		  });
	
 }

</script>
<script>
function remove(id){
	$("#sticker"+id).show();
//	$("#textcomment"+id).removeClass( "col-md-9" );
//	$("#textcomment"+id).addClass( "col-md-8" );
	//var images=document.getElementById('ImageIn'+id).empty();
	
	//$('#showImIn'+id).empty();
	//$("#myFile"+id).val("");

	
	
	/* console.log("sadasd "+images); */
	
	
	
	//$("#textcomment"+id).removeClass( "col-md-10" );
	//$("#textcomment"+id).addClass( "col-md-9" );

}

</script>

<script>
<!-- 
$(document).on('submit','#comment_image',function(e){
	console.log("comment Image");
	var formData = new FormData(this);
	e.preventDefault();
	console.log(formData);
	if(formData!=null){
		$.ajax({
	        type: "POST",
	        url : "CommentImage1",
	        data : formData,
	        contentType : false,
	        cache : false,
	        processData : false,
		      	enctype:"multipart/form-data",
	        success : function(response) {
	        	
	            console.log("SSS");
	        },

	    });

			
		

	}else{
		alert("aa");
	}

	
});

 -->


	$(document).ready(function() {
		$('#table_id').DataTable({
			
			"iDisplayLength" : 2,
			"pagingType": "full_numbers"

		});
	});
</script>
<script>
/* function addEmoalt() {
	var alt = $("#emojialt").attr("alt");

} */
var resultEmo="";

function setdetailsPost() {
	resultEmo = $("#details").val().replaceAll("😀", "&#"+"128512;")
    .replaceAll("😁", "&#"+"128513;")
    .replaceAll("😂", "&#"+"128514;")
    .replaceAll("😃", "&#"+"128515;")
    .replaceAll("😄", "&#"+"128516;")
    .replaceAll("😅", "&#"+"128517;")
    .replaceAll("😆", "&#"+"128518;")
    .replaceAll("😇", "&#"+"128519;")
    .replaceAll("😈", "&#"+"128520;")
    .replaceAll("😉", "&#"+"128521;")
    .replaceAll("😊", "&#"+"128522;")
    .replaceAll("😋", "&#"+"128523;")
    .replaceAll("😌", "&#"+"128524;")
    .replaceAll("😍", "&#"+"128525;")
    .replaceAll("😎", "&#"+"128526;")
    .replaceAll("😏", "&#"+"128527;")
    .replaceAll("😐", "&#"+"128528;")
    .replaceAll("😑", "&#"+"128529;")
    .replaceAll("😒", "&#"+"128530;")
    .replaceAll("😓", "&#"+"128531;")
    .replaceAll("😔", "&#"+"128532;")
    .replaceAll("😕", "&#"+"128533;")
    .replaceAll("😖", "&#"+"128534;")
    .replaceAll("😗", "&#"+"128535;")
    .replaceAll("😘", "&#"+"128536;")
    .replaceAll("😙", "&#"+"128537;")	
.replaceAll("😚", "&#"+"128538;")	
.replaceAll("😛", "&#"+"128539;")	
.replaceAll("😜", "&#"+"128540;")	
.replaceAll("😝", "&#"+"128541;")	
.replaceAll("😞", "&#"+"128542;")	
.replaceAll("😟", "&#"+"128543;")	
.replaceAll("😠", "&#"+"128544;")	
.replaceAll("😡", "&#"+"128545;")
.replaceAll("😢", "&#"+"128546;")
.replaceAll("😣", "&#"+"128547;")
.replaceAll("😤", "&#"+"128548;")
.replaceAll("😥", "&#"+"128549;")
.replaceAll("😦", "&#"+"128550;")	
.replaceAll("😧", "&#"+"128551;")	
.replaceAll("😨", "&#"+"128552;")	
.replaceAll("😩", "&#"+"128553;")
.replaceAll("😪", "&#"+"128554;")
.replaceAll("😫", "&#"+"128555;")	
.replaceAll("😬", "&#"+"128556;")	
.replaceAll("😭", "&#"+"128557;")
.replaceAll("😮", "&#"+"128558;")	
.replaceAll("😯", "&#"+"128559;")	
.replaceAll("😰", "&#"+"128560;")	
.replaceAll("😱", "&#"+"128561;")	
.replaceAll("😲", "&#"+"128562;")	
.replaceAll("😳", "&#"+"128563;")	
.replaceAll("😴", "&#"+"128564;")	
.replaceAll("😵", "&#"+"128565;")	
.replaceAll("😶", "&#"+"128566;")	
.replaceAll("😷", "&#"+"128567;")		
.replaceAll("🙄", "&#"+"128580;")	
.replaceAll("🙏", "&#"+"128591;")
.replaceAll("🤗", "&#"+"129303;")	
.replaceAll("🤘", "&#"+"129304;")	
.replaceAll("🤙", "&#"+"129305;")	
.replaceAll("🤚", "&#"+"129306;")	
.replaceAll("🤝", "&#"+"129309;")	
.replaceAll("🤞", "&#"+"129310;")	
.replaceAll("🤟", "&#"+"129311;");
	
	var xx = $("#detailsNew").val(resultEmo);

}


function addEmo(emo) {
	
	var textEmo =  $("#details").val()+emo;
    $("#details").val(textEmo);
 
    
    /* var str = "😀";
    var map = {
        '😀' : '&#'+'128512',
        
    };
    resultEmo = textEmo.replaceAll(str, map);
    var str = '[T] and [Z] but not [T] and [Z]';
    var result = str.replace('T',' ').replace('Z','');
    console.log(result); */
    
    
    //resultEmo = textEmo.replaceAll("😀", "&#"+"128512").replaceAll("😁", "&#"+"128513");
    resultEmo = textEmo.replaceAll("😀", "&#"+"128512;")
    .replaceAll("😁", "&#"+"128513;")
    .replaceAll("😂", "&#"+"128514;")
    .replaceAll("😃", "&#"+"128515;")
    .replaceAll("😄", "&#"+"128516;")
    .replaceAll("😅", "&#"+"128517;")
    .replaceAll("😆", "&#"+"128518;")
    .replaceAll("😇", "&#"+"128519;")
    .replaceAll("😈", "&#"+"128520;")
    .replaceAll("😉", "&#"+"128521;")
    .replaceAll("😊", "&#"+"128522;")
    .replaceAll("😋", "&#"+"128523;")
    .replaceAll("😌", "&#"+"128524;")
    .replaceAll("😍", "&#"+"128525;")
    .replaceAll("😎", "&#"+"128526;")
    .replaceAll("😏", "&#"+"128527;")
    .replaceAll("😐", "&#"+"128528;")
    .replaceAll("😑", "&#"+"128529;")
    .replaceAll("😒", "&#"+"128530;")
    .replaceAll("😓", "&#"+"128531;")
    .replaceAll("😔", "&#"+"128532;")
    .replaceAll("😕", "&#"+"128533;")
    .replaceAll("😖", "&#"+"128534;")
    .replaceAll("😗", "&#"+"128535;")
    .replaceAll("😘", "&#"+"128536;")
    .replaceAll("😙", "&#"+"128537;")	
.replaceAll("😚", "&#"+"128538;")	
.replaceAll("😛", "&#"+"128539;")	
.replaceAll("😜", "&#"+"128540;")	
.replaceAll("😝", "&#"+"128541;")	
.replaceAll("😞", "&#"+"128542;")	
.replaceAll("😟", "&#"+"128543;")	
.replaceAll("😠", "&#"+"128544;")	
.replaceAll("😡", "&#"+"128545;")
.replaceAll("😢", "&#"+"128546;")
.replaceAll("😣", "&#"+"128547;")
.replaceAll("😤", "&#"+"128548;")
.replaceAll("😥", "&#"+"128549;")
.replaceAll("😦", "&#"+"128550;")	
.replaceAll("😧", "&#"+"128551;")	
.replaceAll("😨", "&#"+"128552;")	
.replaceAll("😩", "&#"+"128553;")
.replaceAll("😪", "&#"+"128554;")
.replaceAll("😫", "&#"+"128555;")	
.replaceAll("😬", "&#"+"128556;")	
.replaceAll("😭", "&#"+"128557;")
.replaceAll("😮", "&#"+"128558;")	
.replaceAll("😯", "&#"+"128559;")	
.replaceAll("😰", "&#"+"128560;")	
.replaceAll("😱", "&#"+"128561;")	
.replaceAll("😲", "&#"+"128562;")	
.replaceAll("😳", "&#"+"128563;")	
.replaceAll("😴", "&#"+"128564;")	
.replaceAll("😵", "&#"+"128565;")	
.replaceAll("😶", "&#"+"128566;")	
.replaceAll("😷", "&#"+"128567;")		
.replaceAll("🙄", "&#"+"128580;")	
.replaceAll("🙏", "&#"+"128591;")
.replaceAll("🤗", "&#"+"129303;")	
.replaceAll("🤘", "&#"+"129304;")	
.replaceAll("🤙", "&#"+"129305;")	
.replaceAll("🤚", "&#"+"129306;")	
.replaceAll("🤝", "&#"+"129309;")	
.replaceAll("🤞", "&#"+"129310;")	
.replaceAll("🤟", "&#"+"129311;");
  
    
    
    $("#detailsNew").val(resultEmo);
    
 
    $("#buttonPost").prop("disabled", false);
	var y = $("#details").val();
    
/*     $("button").prop("disabled", !this.value); */

}



function addEmoEditcomment(emo) {
	
	var textEmoEditcomment =  $("#messageCommentModal").val()+emo;
    $("#messageCommentModal").val(textEmoEditcomment);
    textedit=textEmoEditcomment;
  
    

    
    
   /*  $("#detailsNew").val(resultEmo);
    
    console.log($("#detailsNew").val());
    $("#buttonPost").prop("disabled", false);
	var y = $("#details").val(); */


}




var stkP="";
function addstk(a,idfeed) {
	$("#sticker2"+idfeed).toggle();
		$("#picture"+idfeed).hide();
		//$("#textcomment"+idfeed).removeClass( "col-md-8" );
		//$("#textcomment"+idfeed).addClass( "col-md-9" );
	

	stkP = document.getElementById(a).getAttribute('src');
	html ="";
	html+='<div class="holder_wrap">';
	html+='		<div class="holder_wrap_img">';
	html+='			<img class="stkComment" src="'+stkP+'" >';
	html+='			<div class="inner_position_right text-right">';
	html+='				<i class="fa fa-close (alias)" style="font-size: 20px" onclick="closestk('+idfeed+')"></i>';
	html+='			</div>';
	html+='		</div>';
	html+='</div">';
	$('#JukGru'+idfeed).html('');
	$('#JukGru'+idfeed).append(html);
}
function closestk(idfeed) {
	$("#picture"+idfeed).show();
	//$("#textcomment"+idfeed).removeClass( "col-md-9");
	//$("#textcomment"+idfeed).addClass( "col-md-8");
	stkP="";
	html ="";
	$('#JukGru'+idfeed).html('');
	$('#JukGru'+idfeed).append(html);
	$("#picture").show();
	//document.getElementById("textcomment").classList.remove('col-md-9');
	//document.getElementById("textcomment").classList.add('col-md-8');
}

function stkShow(stkId) {
	$("#sticker2"+stkId).toggle("slow" );
}

function emoShow() {
	$("#emo2").toggle("slow" );
	$("#changebackground").hide();
	$("#colorrgb").hide();
}


function emoShowEditComment() {
	$("#emoEditComment").toggle("slow" );
}


</script>

<script>

	$(document).on('click','img[id="data-enlargeable"]',function(){
		$(this).addClass('img-enlargeable');
		var src = $(this).attr('src');
		var modal;
		function removeModal(){ modal.remove(); $('body').off('keyup.modal-close'); }
			modal = $('<div>').css({
			background: 'RGBA(0,0,0,.5) url('+src+') no-repeat center',

			backgroundSize: '25px',
			backgroundSize: '50%',
			backgroundSize: 'auto 50px',
			backgroundSize: 'auto 50%',
			width:'100%', height:'100%',
			position:'fixed',
			zIndex:'10000',
			top:'0', left:'0',
			cursor: 'zoom-out'
		}).click(function(){
			removeModal();
		}).appendTo('body');
			$('body').on('keyup.modal-close', function(e){
			if(e.key==='Escape'){ removeModal(); } 
		});
	});				
</script>


<script>
	var refresh_Online_user_list = setInterval(check_new_Online_user, 5000);
	check_new_Online_user();
	$(document).on('click','a[name=userlist]',function(){
		var uid = $(this).attr('id');
		$('#formsender').val(uid);
		$('#GoToChatForm').submit();
	})
	function check_new_Online_user(){
	
		$.ajax({
			url:'GetOnlinelist',
			method:'POST',
			type:'json',
    		data:{
    			'Online_stat' : 0
    		},success:function(data){
    			html ="";
    			var Owner_name = $('#Owner_name').val();
    			$('#Onlinelist_body').load();
    		 	var jsondata = JSON.parse(data);
    		 	jsondata.forEach((item) => {
    		 		if(item.uname != Owner_name){
    		 		html += '<a class="list-group-item" id = "'+item.uid+'" name = "userlist">';
    		 		if(item.img != null){
    		 			html += '<input type="hidden" value = "'+item.img+'" id = "'+item.uid+'" name = "img" />';
    		 		}
    		 		else{
    		 			html += '<input type="hidden"  value = "/pages-back/img/profile2.png" id = "'+item.uid+'" name = "img" />';
    		 		}
    		 		html += '    <div class="lv-avatar pull-left">';
    		 		if(item.img != null){
    		 			html += ' <img src="'+item.img+'" style="width:40px;height:40px;" alt="" class="circular--portrait imgfeed crop-image">';
    		 		}else{

    		 				html += ' <img src="/pages-back/img/profile2.png" style="width:40px;" alt="" class="circle img-avatar crop-image">';
    		 		}   		 		
    		 		html += ' </div>';
    		 		html += ' <div class="media-body">';
    		 		html += '  <div class="list-group-item-heading" style="font-size: 13px;" > &nbsp;&nbsp;'+item.uid+'</div>'; 
    		 		if(item.online == 1){
    		 			html += '  <small class="list-group-item-text c-gray">&nbsp;&nbsp;&nbsp;<i style="color: #35b152;" class="fa fa-circle"></i> Online</small>';
    		 		}else if (item.online == 0){
    		 			html += '  <small class="list-group-item-text c-gray">&nbsp;&nbsp;&nbsp;<i style="color: red;" class="fa fa-circle"></i> Offline</small>';
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
function showcomment(btn, more, dotsa) {

		var dots = document.getElementById(dotsa);
		var moreText = document.getElementById(more);
		var btnText = document.getElementById(btn);

		if (dots.style.display === "none") {
			dots.style.display = "inline";
			btnText.innerHTML = "ดูความคิดเห็น";
			moreText.style.display = "none";
		} else {
			dots.style.display = "none";
			btnText.innerHTML = "ซ่อนความคิดเห็น";
			moreText.style.display = "inline";
		}
	}
</script>
<!-- <script src="../assets/global/scripts/croppie.js" type="text/javascript"></script>
<script src="../assets/global/scripts/exif.js" type="text/javascript"></script> -->
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>


<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />
<script src="../assets/global/plugins/jquery.min.js"
	type="text/javascript"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>
<script>
jQuery(".showedit").hover(
		  function() {
		      jQuery(this).find(".editcomment").css("display","block");
		   },
   function() {
      jQuery(this).find(".editcomment").css("display","none");
   }

);</script>
<script>
	function Gotofeed() {
		window.location.href = 'OpenChat';
	}
	$('#emona').click(function() {
		$('.emoji-dashboard').slideToggle('fast');
	});

	$("#emona").click(function(e) {
		e.stopPropagation();
	});
</script>
<script>
	$("#details").keyup(function() {
	if(($("#details").val().trim()=="") && ($("#myFile").val()== "") ){

		$("#buttonPost").prop("disabled", true);
		}
	else if($("#detailsNew").val().trim()==""){
			
		}else{
			$("#buttonPost").prop("disabled", !this.value);
			var y = $("#details").val();
		
		}
		

	});
	$("#emoji").click(function() {
		$("#buttonPost").prop("disabled", false);
		var y = $("#details").val();
	});
	function setPositionText(idaa) {
		var ele = document.getElementById(idaa);

		ele.focus();

		// To update cursor position to recently added character in textBox
		ele.setSelectionRange(newVal.length, newVal.length);
	}

</script>
<script>
 function testremove(){	
	 if($("#details").val().trim()==""){
		$("#buttonPost").prop("disabled", true);

} else{
	$("#buttonPost").prop("disabled", false);
}}
</script>
<script>
	$("#myFile").change(function() {
		if($("#myFile").val() == "" || $("#myFile").val() == null){
			$("#imagelayout").removeClass( "col-md-12" );
			$("#imagelayout").addClass( "col-md-1" );
			$("#backgroundimage").show();
			$("#backgroundcolorRGB").show();

		
		}else{
			$("#imagelayout").removeClass( "col-md-1" );
			$("#imagelayout").addClass( "col-md-12" );
			$("#backgroundimage").hide();
			$("#backgroundcolorRGB").hide();
			$("#buttonPost").prop("disabled", false);
		}
	
	

	});
</script>
<script>
	$(document).ready(function() {
		var show_btn = $('.show-modal');
		var show_btn = $('.show-modal');
		//$("#testmodal").modal('show');

		show_btn.click(function() {
			$("#testmodal").modal('show');
		})
	});

	$(function() {
		$('#loginBtn').on('click', function(e) {
			Custombox.open({
				target : '#testmodal-1',
				effect : 'fadein'
			});
			e.preventDefault();
		});
	});
</script>
<style>
#myDIV {
	width: 100%;
	padding: 50px 0;
	text-align: center;
	background-color: lightblue;
	margin-top: 20px;
}
</style>

<script>
	$(document).ready(function() {
		$('i[id="likebutton"]').hover(function() {
			$(this).addClass('js-hover');
		});
		setTimeout(function() {
			$(this).removeClass('js-hover');
		}, 500);
	});
</script>
<script>
	function myFunction() {
		var x = document.getElementById("myDIV");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}
</script>

<script>
	function like(id, type) {
		var idContent = id;
		var react = type;

		$.ajax({
			url : "feedList_like",
			method : "POST",
			type : "JSON",
			data : {
				"id" : idContent,
				"react" : react,
			},
			success : function(data) {
				var jsondata = JSON.parse(data);
				var text = "";
			
				html ="";
				 var length = jsondata.length;
				 html+='';
				 if(length){
				jsondata.forEach((item) => {
					
					html+='<div id="id'+idContent+'" class="Like" style="width: 150px">';
					if(item.reactType == '1'){		
					html+='			<div class="Like__link">';
					html+='			<i style="width: 30px;"';
					html+='			onclick="like('+idContent+', 1)" id="likebutton"';
					html+='				class="fa fa-thumbs-up fa-2x"></i> ถูกใจจริงๆ';
					html+='				</div>';	
					}else if (item.reactType == '2'){	
					html+='			<div class="Like__link">';
					html+='				<i style="width: 30px; color: #E7505A;"';
					html+='				onclick="like('+idContent+', 2)" id="likebutton"';
					html+='				class="fa fa-gratipay fa-2x"></i> รักเลยค้าบ';
					html+='		</div>';

					}else if (item.reactType == '3'){
					html+='			<div class="Like__link">';
					html+='		<i style="width: 30px;"';
					html+='			onclick="like('+idContent+', 3)" id="likebutton"';
					html+='			class="em em-smile"></i> ฮ่า ๆๆ';
					html+='			</div>';
					}else if (item.reactType == '4'){
					html+='			<div class="Like__link">';
					html+='				<i style="width: 30px;"';
					html+='		onclick="like('+idContent+',4)" id="likebutton"';
					html+='			class="em em-astonished"></i> ว้าวซ่าาาา';
					html+='				</div>';
					}else if (item.reactType == '5'){
					html+='				<div class="Like__link">';
					html+='			<i style="width: 30px;"';
					html+='			onclick="like('+idContent+', 5)" id="likebutton"';
					html+='			class="em em-cry"></i> ร้องไห้แล้วนะ';
					html+='		</div>';
					}else if (item.reactType == '6'){
		
					html+='			<div class="Like__link">';
					html+='				<i style="width: 30px;"';
					html+='				onclick="like('+idContent+', 6)" id="likebutton"';
					html+='			class="em em-angry"></i> <span>โกรธมากเลย</span>';
					html+='			</div>';
					}
				
					
					html+='	<div class="Emojis">';
					html+='	<div class="Emoji Emoji--like"';
					html+='		onclick="like('+idContent+', 1)">';
					html+='		<div class="icon icon--like"></div>';
					html+='	</div>';
					html+='	<div class="Emoji Emoji--love"';
					html+='		onclick="like('+idContent+', 2)">';
					html+='		<div class="icon icon--heart"></div>';
					html+='	</div>';
					html+='	<div class="Emoji Emoji--haha"';
					html+='		onclick="like('+idContent+', 3)">';
					html+='		<div class="icon icon--haha"></div>';
					html+='	</div>';
					html+='	<div class="Emoji Emoji--wow"';
					html+='		onclick="like('+idContent+', 4)">';
					html+='		<div class="icon icon--wow"></div>';
					html+='	</div>';
					html+='	<div class="Emoji Emoji--sad"';
					html+='		onclick="like('+idContent+', 5)">';
					html+='		<div class="icon icon--sad"></div>';
					html+='	</div>';
					html+='	<div class="Emoji Emoji--angry"';
					html+='		onclick="like('+idContent+', 6)">';
					html+='		<div class="icon icon--angry"></div>';
					html+='	</div>';
					html+='</div>';
					html+='</div>';
				
				});
				 } else	{

					html+='	 <div id="id'+idContent+'" class="Like" style="width: 150px">';
					html+='	<div class="Like__link">';
					html+='			<i style="width: 30px; color: black;"';
					html+='		onclick="like('+idContent+', 1)" id="Likenow"';
					html+='				class="fa fa-thumbs-o-up fa-2x "></i> <span>กดไลค์ให้หน่อยจิ</span>';
					html+='				</div>';
					html+='		<div class="Emojis">';
					html+='			<div class="Emoji Emoji--like"';
					html+='				onclick="like('+idContent+', 1)">';
					html+='				<div class="icon icon--like"></div>';
					html+='			</div>';
					html+='			<div class="Emoji Emoji--love"';
					html+='				onclick="like('+idContent+', 2)">';
					html+='		<div class="icon icon--heart"></div>';
					html+='			</div>';
					html+='	<div class="Emoji Emoji--haha"';
					html+='			onclick="like('+idContent+', 3)">';
					html+='			<div class="icon icon--haha"></div>';
					html+='		</div>';
					html+='		<div class="Emoji Emoji--wow"';
					html+='			onclick="like('+idContent+', 4)">';
					html+='			<div class="icon icon--wow"></div>';
					html+='			</div>';
					html+='			<div class="Emoji Emoji--sad"';
					html+='				onclick="like('+idContent+', 5)">';
					html+='				<div class="icon icon--sad"></div>';
					html+='			</div>';
					html+='			<div class="Emoji Emoji--angry"';
					html+='				onclick="like('+idContent+', 6)">';
					html+='			<div class="icon icon--angry"></div>';
					html+='			</div>';
					html+='		</div>';
					html+='</div>';
					
				 }
				$('#ida'+idContent).html('');
				$('#ida'+idContent).append(html);
				console.log("DO this");
				countRakThur(idContent);
			}
		});
	};

	function countRakThur(feedId) {
		
	
		var html ="";
		$.ajax({ 
			url : "CountRakThur1",
			method : "POST",
			type : "JSON",
			data : {
				"feed_id" : feedId

			},
			success : function(data) {
				
				
				var jsondata = JSON.parse(data);

				
				length = jsondata.length;
				html+=''; 
				jsondata.forEach((item) => {
					
				if(item.reactType=='1'){
					html+='		<i id="" class="fa fa-thumbs-up fa-lg" style="color: blue;">';
					html+='		</i>'+item.countlike;
					}
				if(item.reactType=='2'){
					html+='		<i id="" class="fa fa-gratipay fa-lg" style="color: #E7505A;"></i>';
					html+=	item.countlike;
					}
				if(item.reactType=='3'){
					html+='		<i id="" class="em em-smile"> </i>';
					html+=	item.countlike;
					}
				if(item.reactType=='4'){
					html+='		<i id="" class="em em-astonished"> </i>';
					html+=	item.countlike;
					}
				if(item.reactType=='5'){
					html+='		<i id="" class="em em-cry"> </i>';
					html+=	item.countlike;
					}
				if(item.reactType=='6'){
					html+='		<i id="" class="em em-angry"> </i>';
					html+=	item.countlike;
					}
					
				});
				$('#nubLike'+feedId).html('');
				$('#nubLike'+feedId).append(html);
				console.log("like this");
			}
				
		});
		

	}
	
</script>
<script>

var delay = 1000;
	function addComment(id_feed, commentnew,more,dots) {

		setTimeout(function() {
			resultEmoComment = commentnew.replaceAll("😀", "&#"+"128512;")
		    .replaceAll("😁", "&#"+"128513;")
		    .replaceAll("😂", "&#"+"128514;")
		    .replaceAll("😃", "&#"+"128515;")
		    .replaceAll("😄", "&#"+"128516;")
		    .replaceAll("😅", "&#"+"128517;")
		    .replaceAll("😆", "&#"+"128518;")
		    .replaceAll("😇", "&#"+"128519;")
		    .replaceAll("😈", "&#"+"128520;")
		    .replaceAll("😉", "&#"+"128521;")
		    .replaceAll("😊", "&#"+"128522;")
		    .replaceAll("😋", "&#"+"128523;")
		    .replaceAll("😌", "&#"+"128524;")
		    .replaceAll("😍", "&#"+"128525;")
		    .replaceAll("😎", "&#"+"128526;")
		    .replaceAll("😏", "&#"+"128527;")
		    .replaceAll("😐", "&#"+"128528;")
		    .replaceAll("😑", "&#"+"128529;")
		    .replaceAll("😒", "&#"+"128530;")
		    .replaceAll("😓", "&#"+"128531;")
		    .replaceAll("😔", "&#"+"128532;")
		    .replaceAll("😕", "&#"+"128533;")
		    .replaceAll("😖", "&#"+"128534;")
		    .replaceAll("😗", "&#"+"128535;")
		    .replaceAll("😘", "&#"+"128536;")
		    .replaceAll("😙", "&#"+"128537;")	
		.replaceAll("😚", "&#"+"128538;")	
		.replaceAll("😛", "&#"+"128539;")	
		.replaceAll("😜", "&#"+"128540;")	
		.replaceAll("😝", "&#"+"128541;")	
		.replaceAll("😞", "&#"+"128542;")	
		.replaceAll("😟", "&#"+"128543;")	
		.replaceAll("😠", "&#"+"128544;")	
		.replaceAll("😡", "&#"+"128545;")
		.replaceAll("😢", "&#"+"128546;")
		.replaceAll("😣", "&#"+"128547;")
		.replaceAll("😤", "&#"+"128548;")
		.replaceAll("😥", "&#"+"128549;")
		.replaceAll("😦", "&#"+"128550;")	
		.replaceAll("😧", "&#"+"128551;")	
		.replaceAll("😨", "&#"+"128552;")	
		.replaceAll("😩", "&#"+"128553;")
		.replaceAll("😪", "&#"+"128554;")
		.replaceAll("😫", "&#"+"128555;")	
		.replaceAll("😬", "&#"+"128556;")	
		.replaceAll("😭", "&#"+"128557;")
		.replaceAll("😮", "&#"+"128558;")	
		.replaceAll("😯", "&#"+"128559;")	
		.replaceAll("😰", "&#"+"128560;")	
		.replaceAll("😱", "&#"+"128561;")	
		.replaceAll("😲", "&#"+"128562;")	
		.replaceAll("😳", "&#"+"128563;")	
		.replaceAll("😴", "&#"+"128564;")	
		.replaceAll("😵", "&#"+"128565;")	
		.replaceAll("😶", "&#"+"128566;")	
		.replaceAll("😷", "&#"+"128567;")		
		.replaceAll("🙄", "&#"+"128580;")	
		.replaceAll("🙏", "&#"+"128591;")
		.replaceAll("🤗", "&#"+"129303;")	
		.replaceAll("🤘", "&#"+"129304;")	
		.replaceAll("🤙", "&#"+"129305;")	
		.replaceAll("🤚", "&#"+"129306;")	
		.replaceAll("🤝", "&#"+"129309;")	
		.replaceAll("🤞", "&#"+"129310;")	
		.replaceAll("🤟", "&#"+"129311;")
		.replaceAll("<", "&lt;")
		.replaceAll(">", "&gt;");
			
		if((resultEmoComment == null || resultEmoComment == undefined || resultEmoComment == ' '|| resultEmoComment.trim() == '') && stkP==''){
			
				console.log("null All AND me image");
				$("#picture"+id_feed).show();
				$("#sticker"+id_feed).show();
				//$("#textcomment"+id_feed).removeClass( "col-md-9" );
				//$("#textcomment"+id_feed).addClass( "col-md-8" );
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "AddComment",
					method : "POST",
					type : "JSON",
					data : {
						"feed_id" : id_feed,
						"details" : null,
						"stk": null
					},
					success : function(data) {
						console.log("-----------------addComment     No all")
						$('#more'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;

						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							
							html+='<span id="more${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit ">';
							html+=' <div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
							html+='		<div class="col-md-1 ">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'" alt="">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
							html+='			<div class="col-md-2 text-left center ">';
										if(item.user_comment == userOnline){
							html+='				<div class="dropdown editcomment" style="display:none">';
							html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='					</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+=' <input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}				
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='				</div>';
										}
							html+='		</div>';

							html+='				</div>';
							html+='         </div>';	
							html+='         </div>';	
							html+='</span>';
						});			
						$('#more'+id_feed).html('');
						$('#more'+id_feed).append(html);
						console.log("ADD");
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "topComment",
					method : "POST",
					type : "JSON",
					data : {
							"feed_id" : id_feed,
					},
					success : function(data) {
						console.log("-----------------addComment  Top   No all")
						$('#dots'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;
						$('#'+dots).html('');
						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="dots${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
							html+='		<div class="col-md-1">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;">';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
	 						html+='			<div class="col-md-2">';
										if(item.user_comment == userOnline){
							html+='						<div class="dropdown editcomment" style="display:none">';
							html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='						</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='					</div>';					
										}
							html+='				</div>';
							html+='         </div>';
							html+='	</div>';
							html+='</span>';
						});			
						$('#dots'+id_feed).html('');
						$('#dots'+id_feed).append(html);
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});

		}else{
			if(stkP==''){
				console.log(resultEmoComment + " stkPnull");
				
				if(resultEmoComment.trim() == ''){
					console.log("null");
				}else{
				$("#picture"+id_feed).show();
				$("#sticker"+id_feed).show();
				//$("#textcomment"+id_feed).removeClass( "col-md-9" );
				//$("#textcomment"+id_feed).addClass( "col-md-8" );
			$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "AddComment",
					method : "POST",
					type : "JSON",
					data : {
						"feed_id" : id_feed,
						"details" : resultEmoComment,
						"stk": null
					},
					success : function(data) {

						console.log("-----------------addComment     ALL")
						$('#more'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;

						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="more${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit ">';
							html+=' <div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
							html+='		<div class="col-md-1 ">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'" alt="">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
							html+='			<div class="col-md-2 text-left center ">';
										if(item.user_comment == userOnline){
							html+='				<div class="dropdown editcomment" style="display:none">';
							html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='					</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='				</div>';
										}
							html+='		</div>';

							html+='				</div>';
							html+='         </div>';	
							html+='         </div>';	
							html+='</span>';
						});			
						$('#more'+id_feed).html('');
						$('#more'+id_feed).append(html);
						console.log("ADD");
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "topComment",
					method : "POST",
					type : "JSON",
					data : {
							"feed_id" : id_feed,
					},
					success : function(data) {
						console.log("-----------------addComment     One")
						$('#dots'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;
						$('#'+dots).html('');
						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="dots${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
							html+='		<div class="col-md-1">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
	 						html+='			<div class="col-md-2">';
										if(item.user_comment == userOnline){
							html+='						<div class="dropdown editcomment" style="display:none">';
							html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='						</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='					</div>';					
										}
							html+='				</div>';
							html+='         </div>';
							html+='	</div>';
							html+='</span>';
						});			
						$('#dots'+id_feed).html('');
						$('#dots'+id_feed).append(html);
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
				}
			}else if((stkP!='')&& (resultEmoComment == null || resultEmoComment == undefined || resultEmoComment == ' '
				|| resultEmoComment.trim() == '')){
				console.log(stkP + " commentnewnull");
				$("#picture"+id_feed).show();
				$("#sticker"+id_feed).show();
				//$("#textcomment"+id_feed).removeClass( "col-md-9" );
				//$("#textcomment"+id_feed).addClass( "col-md-8" );
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "AddComment",
					method : "POST",
					type : "JSON",
					data : {
						"feed_id" : id_feed,
						"details" : null,
						"stk": stkP
					},
					success : function(data) {
						console.log("-----------------addComment     ALL")
						$('#more'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;

						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="more${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit ">';
							html+=' <div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
							html+='		<div class="col-md-1 ">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'" alt="">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10">';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
							html+='			<div class="col-md-2 text-left center ">';
										if(item.user_comment == userOnline){
							html+='				<div class="dropdown editcomment" style="display:none">';
							html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='					</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='				</div>';
										}
							html+='		</div>';

							html+='				</div>';
							html+='         </div>';	
							html+='         </div>';	
							html+='</span>';
						});			
						$('#more'+id_feed).html('');
						$('#more'+id_feed).append(html);
						console.log("ADD");
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "topComment",
					method : "POST",
					type : "JSON",
					data : {
							"feed_id" : id_feed,
					},
					success : function(data) {
						console.log("-----------------addComment     One")
						$('#dots'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;
						$('#'+dots).html('');
						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="dots${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
							html+='		<div class="col-md-1">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  	<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='		</div>';
	 						html+='			<div class="col-md-2">';
										if(item.user_comment == userOnline){
							html+='						<div class="dropdown editcomment" style="display:none">';
							html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='						</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='					</div>';					
										}
							html+='				</div>';
							html+='         </div>';
							html+='	</div>';
							html+='</span>';
						});			
						$('#dots'+id_feed).html('');
						$('#dots'+id_feed).append(html);
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
			}else{
				console.log(resultEmoComment + "   " + stkP);
				$("#picture"+id_feed).show();
				$("#sticker"+id_feed).show();
				//$("#textcomment"+id_feed).removeClass( "col-md-9" );
				//$("#textcomment"+id_feed).addClass( "col-md-8" );
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "AddComment",
					method : "POST",
					type : "JSON",
					data : {
						"feed_id" : id_feed,
						"details" : resultEmoComment,
						"stk": stkP
					},
					success : function(data) {
						console.log("-----------------addComment     ALL")
						$('#more'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;

						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="more${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit ">';
							html+=' <div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
							html+='		<div class="col-md-1 ">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'" alt="">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
							html+='			<div class="col-md-2 text-left center ">';
										if(item.user_comment == userOnline){
							html+='				<div class="dropdown editcomment" style="display:none">';
							html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='					</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='				</div>';
										}
							html+='		</div>';

							html+='				</div>';
							html+='         </div>';	
							html+='         </div>';	
							html+='</span>';
						});			
						$('#more'+id_feed).html('');
						$('#more'+id_feed).append(html);
						console.log("ADD");
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
				$("#commentNew"+id_feed).css('height','40px');
				$.ajax({
					url : "topComment",
					method : "POST",
					type : "JSON",
					data : {
							"feed_id" : id_feed,
					},
					success : function(data) {
						console.log("-----------------addComment     One")
						$('#dots'+id_feed).load();
						var jsondata = JSON.parse(data);
						var text = "";
						var userOnline = "${logonUser}";
						html ="";
						length = jsondata.length;
						$('#'+dots).html('');
						jsondata.forEach((item) => {
							if(item.details!=null){
								var result = item.details.replaceAll("\n", "<br>");
							}else{
								result=item.details;
							}
							html+='<span id="dots${fpost.feed_id}">';
							html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
							html+='		<div class="col-md-1">';
										if(item.path!=null){
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img src="'+item.path+'">';
							html+='			</div>';
			
										}else{
							html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
							html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
							html+='			</div>';
										}
							html+='		</div>';
							html+='  	<div class="col-md-11">';
							html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
							html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
							if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
											}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="stkComment" src="'+item.sticker_part+'">';
											}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
								html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
								html+='				<br>';
								html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
											}else{
								html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
								html+='				<br>';
											}
							html+='			</div>';
	 						html+='			<div class="col-md-2">';
										if(item.user_comment == userOnline){
							html+='						<div class="dropdown editcomment" style="display:none">';
							html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
							html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
							html+='						</button>';
							html+='						<ul class="dropdown-menu">';
							html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
							html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
							if(item.details==undefined){
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
							}else{
								html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
							}
							html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
							html+='								</li>';
							html+='							<li><a';
							html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
							html+='						</ul>';
							html+='					</div>';					
										}
							html+='				</div>';
							html+='         </div>';
							html+='	</div>';
							html+='</span>';
						});			
						$('#dots'+id_feed).html('');
						$('#dots'+id_feed).append(html);
						jQuery(".showedit").hover(
								  function() {
								      jQuery(this).find(".editcomment").css("display","block");
								   },
						   function() {
						      jQuery(this).find(".editcomment").css("display","none");
						   }

						);
					}
				});
			}
			
		}
		document.getElementById('commentNew'+id_feed).value=null;
		var test = document.querySelectorAll("#comment_image");
		test.forEach((chang) => {
			chang.reset();
		});
	     stkP="";
	     $('#JukGru'+id_feed).html('');
	     $("#sticker2"+id_feed).css("display","none");
	     $("#showImIn"+id_feed).css("display", "none");
			$("#remove"+id_feed).css("display", "none");
		}, delay);

	     
	};
	
</script>

<script>

var textedit="";
var texteditOneA="";
var texteditPost="";


	function edit() {
		var newid = document.getElementById("demo").textContent;
		/* var newdetails = document.getElementById("message").value; */
		console.log("Gruuuu"+texteditPost);
		if(texteditPost=="" || texteditPost.trim()==""){
			console.log("texteditPost Null");
		}else{
			$.ajax({
				url : "feedList_edit",
				method : "POST",
				type : "JSON",
				data : {
					"id" : idFP,
					"detail" : texteditPost,

				},
				success : function(data) {
					location.reload();
					 var elmnt = document.getElementById("scroll"+idFP);
						elmnt.scrollIntoView();
					idFP="";

				}
			});
		}

		
	};
	
	
	function setTextPost(){
		resulttextPost = $("#messagePostModal").val().replaceAll("😀","&#"+"128512;")
	    .replaceAll("😁", "&#"+"128513;")
	    .replaceAll("😂", "&#"+"128514;")
	    .replaceAll("😃", "&#"+"128515;")
	    .replaceAll("😄", "&#"+"128516;")
	    .replaceAll("😅", "&#"+"128517;")
	    .replaceAll("😆", "&#"+"128518;")
	    .replaceAll("😇", "&#"+"128519;")
	    .replaceAll("😈", "&#"+"128520;")
	    .replaceAll("😉", "&#"+"128521;")
	    .replaceAll("😊", "&#"+"128522;")
	    .replaceAll("😋", "&#"+"128523;")
	    .replaceAll("😌", "&#"+"128524;")
	    .replaceAll("😍", "&#"+"128525;")
	    .replaceAll("😎", "&#"+"128526;")
	    .replaceAll("😏", "&#"+"128527;")
	    .replaceAll("😐", "&#"+"128528;")
	    .replaceAll("😑", "&#"+"128529;")
	    .replaceAll("😒", "&#"+"128530;")
	    .replaceAll("😓", "&#"+"128531;")
	    .replaceAll("😔", "&#"+"128532;")
	    .replaceAll("😕", "&#"+"128533;")
	    .replaceAll("😖", "&#"+"128534;")
	    .replaceAll("😗", "&#"+"128535;")
	    .replaceAll("😘", "&#"+"128536;")
	    .replaceAll("😙", "&#"+"128537;")	
.replaceAll("😚", "&#"+"128538;")	
.replaceAll("😛", "&#"+"128539;")	
.replaceAll("😜", "&#"+"128540;")	
.replaceAll("😝", "&#"+"128541;")	
.replaceAll("😞", "&#"+"128542;")	
.replaceAll("😟", "&#"+"128543;")	
.replaceAll("😠", "&#"+"128544;")	
.replaceAll("😡", "&#"+"128545;")
.replaceAll("😢", "&#"+"128546;")
.replaceAll("😣", "&#"+"128547;")
.replaceAll("😤", "&#"+"128548;")
.replaceAll("😥", "&#"+"128549;")
.replaceAll("😦", "&#"+"128550;")	
.replaceAll("😧", "&#"+"128551;")	
.replaceAll("😨", "&#"+"128552;")	
.replaceAll("😩", "&#"+"128553;")
.replaceAll("😪", "&#"+"128554;")
.replaceAll("😫", "&#"+"128555;")	
.replaceAll("😬", "&#"+"128556;")	
.replaceAll("😭", "&#"+"128557;")
.replaceAll("😮", "&#"+"128558;")	
.replaceAll("😯", "&#"+"128559;")	
.replaceAll("😰", "&#"+"128560;")	
.replaceAll("😱", "&#"+"128561;")	
.replaceAll("😲", "&#"+"128562;")	
.replaceAll("😳", "&#"+"128563;")	
.replaceAll("😴", "&#"+"128564;")	
.replaceAll("😵", "&#"+"128565;")	
.replaceAll("😶", "&#"+"128566;")	
.replaceAll("😷", "&#"+"128567;")		
.replaceAll("🙄", "&#"+"128580;")	
.replaceAll("🙏", "&#"+"128591;")
.replaceAll("🤗", "&#"+"129303;")	
.replaceAll("🤘", "&#"+"129304;")	
.replaceAll("🤙", "&#"+"129305;")	
.replaceAll("🤚", "&#"+"129306;")	
.replaceAll("🤝", "&#"+"129309;")	
.replaceAll("🤞", "&#"+"129310;")	
.replaceAll("🤟", "&#"+"129311;")
.replaceAll("<", "&lt;")
.replaceAll(">", "&gt;");
		texteditPost = resulttextPost;
	
	}

	function setTextEdit(){
		
		textedit = $("#messageCommentModal").val();
	
	}
	
	function editCommentnew(idcomment,id_feed) {
		
	    resultEmoEditcomment = textedit.replaceAll("😀", "&#"+"128512;")
	    .replaceAll("😁", "&#"+"128513;")
	    .replaceAll("😂", "&#"+"128514;")
	    .replaceAll("😃", "&#"+"128515;")
	    .replaceAll("😄", "&#"+"128516;")
	    .replaceAll("😅", "&#"+"128517;")
	    .replaceAll("😆", "&#"+"128518;")
	    .replaceAll("😇", "&#"+"128519;")
	    .replaceAll("😈", "&#"+"128520;")
	    .replaceAll("😉", "&#"+"128521;")
	    .replaceAll("😊", "&#"+"128522;")
	    .replaceAll("😋", "&#"+"128523;")
	    .replaceAll("😌", "&#"+"128524;")
	    .replaceAll("😍", "&#"+"128525;")
	    .replaceAll("😎", "&#"+"128526;")
	    .replaceAll("😏", "&#"+"128527;")
	    .replaceAll("😐", "&#"+"128528;")
	    .replaceAll("😑", "&#"+"128529;")
	    .replaceAll("😒", "&#"+"128530;")
	    .replaceAll("😓", "&#"+"128531;")
	    .replaceAll("😔", "&#"+"128532;")
	    .replaceAll("😕", "&#"+"128533;")
	    .replaceAll("😖", "&#"+"128534;")
	    .replaceAll("😗", "&#"+"128535;")
	    .replaceAll("😘", "&#"+"128536;")
	    .replaceAll("😙", "&#"+"128537;")	
	.replaceAll("😚", "&#"+"128538;")	
	.replaceAll("😛", "&#"+"128539;")	
	.replaceAll("😜", "&#"+"128540;")	
	.replaceAll("😝", "&#"+"128541;")	
	.replaceAll("😞", "&#"+"128542;")	
	.replaceAll("😟", "&#"+"128543;")	
	.replaceAll("😠", "&#"+"128544;")	
	.replaceAll("😡", "&#"+"128545;")
	.replaceAll("😢", "&#"+"128546;")
	.replaceAll("😣", "&#"+"128547;")
	.replaceAll("😤", "&#"+"128548;")
	.replaceAll("😥", "&#"+"128549;")
	.replaceAll("😦", "&#"+"128550;")	
	.replaceAll("😧", "&#"+"128551;")	
	.replaceAll("😨", "&#"+"128552;")	
	.replaceAll("😩", "&#"+"128553;")
	.replaceAll("😪", "&#"+"128554;")
	.replaceAll("😫", "&#"+"128555;")	
	.replaceAll("😬", "&#"+"128556;")	
	.replaceAll("😭", "&#"+"128557;")
	.replaceAll("😮", "&#"+"128558;")	
	.replaceAll("😯", "&#"+"128559;")	
	.replaceAll("😰", "&#"+"128560;")	
	.replaceAll("😱", "&#"+"128561;")	
	.replaceAll("😲", "&#"+"128562;")	
	.replaceAll("😳", "&#"+"128563;")	
	.replaceAll("😴", "&#"+"128564;")	
	.replaceAll("😵", "&#"+"128565;")	
	.replaceAll("😶", "&#"+"128566;")	
	.replaceAll("😷", "&#"+"128567;")		
	.replaceAll("🙄", "&#"+"128580;")	
	.replaceAll("🙏", "&#"+"128591;")
	.replaceAll("🤗", "&#"+"129303;")	
	.replaceAll("🤘", "&#"+"129304;")	
	.replaceAll("🤙", "&#"+"129305;")	
	.replaceAll("🤚", "&#"+"129306;")	
	.replaceAll("🤝", "&#"+"129309;")	
	.replaceAll("🤞", "&#"+"129310;")	
	.replaceAll("🤟", "&#"+"129311;")
	    .replaceAll("<", "&lt;")
	    .replaceAll(">", "&gt;");
		
		
		
		if(resultEmoEditcomment=="" || resultEmoEditcomment.trim()==''){

		}else{
			$.ajax({
				url : "editComment",
				method : "POST",
				type : "JSON",
				data : {
					"feed_id" : idF,
					"details" : resultEmoEditcomment,
					"id": idC
				},
				success : function(data) {
					console.log("-----------------EditComment     ALL")
					$('#more'+idF).load();
					var jsondata = JSON.parse(data);
					var text = "";
					var userOnline = "${logonUser}";
					html ="";
					length = jsondata.length;
				
					jsondata.forEach((item) => {
						if(item.details!=null){
							var result = item.details.replaceAll("\n", "<br>");
						}else{
							result=item.details;
						}
						html+='	<div class="col-md-12 center showedit ">';
						html+='<div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
						html+='		<div class="col-md-1 ">';
									if(item.path!=null){
						html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
						html+='				<img src="'+item.path+'" alt="">';
						html+='				</div>';
		
									}else{
						html+='				<div class="circular--portrait1 imgfeed1 crop-image">';
						html+='					<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
						html+='				</div>';
									}
						html+='			</div>';
						html+='  			<div class="col-md-11">';
						html+='  		<div class="col-md-10">';
						html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
						if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
							html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
										}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
							html+='				<br>';
							html+='				<img class="stkComment" src="'+item.sticker_part+'">';
										}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
							html+='				<span tyle="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
							html+='				<img class="stkComment" src="'+item.sticker_part+'">';
										}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
							html+='				<br>';
							html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
										}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
							html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
							html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
										}else{
							html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
							html+='				<br>';
										}
						html+='			</div>';
						html+='					<div class="col-md-2 text-left center ">';
									if(item.user_comment == userOnline){
						html+='					<div class="dropdown editcomment" style="display:none">';
						html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
						html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
						html+='						</button>';
						html+='						<ul class="dropdown-menu">';
						html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
						html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
						if(item.details==undefined){
							html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
						}else{
							html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
						}
						html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
						html+='								</li>';
						html+='							<li><a';
						html+='								onclick="deleteComment('+item.comment_id+','+item.feed_id+')">Delete</a></li>';
						html+='						</ul>';
						html+='					</div>';
									}
						html+='		</div>';

						html+='				</div>';
						html+='         </div>';	
						html+='         </div>';					
						
					});			
					$('#more'+idF).html('');
					$('#more'+idF).append(html);
					console.log("ADD");
					jQuery(".showedit").hover(
							  function() {
							      jQuery(this).find(".editcomment").css("display","block");
							   },
					   function() {
					      jQuery(this).find(".editcomment").css("display","none");
					   }

					);
				}
			});
			
			$.ajax({
				url : "topComment",
				method : "POST",
				type : "JSON",
				data : {
						"feed_id" : idF,
				},
				success : function(data) {
					console.log("-----------------addComment     One")
					$('#dots'+idF).load();
					var jsondata = JSON.parse(data);
					var text = "";
					var userOnline = "${logonUser}";
					html ="";
					length = jsondata.length;
					jsondata.forEach((item) => {
						if(item.details!=null){
							var result = item.details.replaceAll("\n", "<br>");
						}else{
							result=item.details;
						}
						html+='<span id="dots${fpost.feed_id}">';
						html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
						html+='		<div class="col-md-1">';
									if(item.path!=null){
						html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
						html+='				<img src="'+item.path+'">';
						html+='			</div>';
		
									}else{
						html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
						html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
						html+='			</div>';
									}
						html+='		</div>';
						html+='  	<div class="col-md-11">';
						html+='  		<div class="col-md-10">';
						html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
						if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
							html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
										}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
							html+='				<br>';
							html+='				<img class="stkComment" src="'+item.sticker_part+'">';
										}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
							html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
							html+='				<img class="stkComment" src="'+item.sticker_part+'">';
										}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
							html+='				<br>';
							html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
										}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
							html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
							html+='				<br>';
							html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
										}else{
							html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
							html+='				<br>';
										}
						html+='			</div>';
							html+='			<div class="col-md-2">';
									if(item.user_comment == userOnline){
						html+='						<div class="dropdown editcomment" style="display:none">';
						html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
						html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
						html+='						</button>';
						html+='						<ul class="dropdown-menu">';
						html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
						html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
						if(item.details==undefined){
							html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
						}else{
							html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
						}
						html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
						html+='								</li>';
						html+='							<li><a';
						html+='								onclick="deleteComment('+item.comment_id+','+item.feed_id+')">Delete</a></li>';
						html+='						</ul>';
						html+='					</div>';					
									}
						html+='				</div>';
						html+='         </div>';
						html+='	</div>';
						html+='</span>';
						
					});			
					$('#dots'+idF).html('');
					$('#dots'+idF).append(html);
					jQuery(".showedit").hover(
							  function() {
							      jQuery(this).find(".editcomment").css("display","block");
							   },
					   function() {
					      jQuery(this).find(".editcomment").css("display","none");
					   }

					);
				}
			});
			
			
			textedit="";
			texteditOneA="";
		}
		
	};
	
	function setTextEditOneA(comment_id){
		texteditOneA = $("#messageCommentOneA"+comment_id).val();

	}
	
	function editCommentnewOneA(idcomment,id_feed) {
		console.log("editCommentnewOneA " + idcomment+" "+texteditOneA+" "+id_feed);
		$.ajax({
			url : "editCommentTop",
			method : "POST",
			type : "JSON",
			data : {
					"feed_id" : id_feed,
					"id" : idcomment,
					"detail" : texteditOneA,
			},
			success : function(data) {
				location.reload();
				console.log("-----------------editCommentnewOneA     One")
				$('#dots'+id_feed).load();
				var jsondata = JSON.parse(data);
				var text = "";
				var userOnline = "${logonUser}";
				html ="";
				length = jsondata.length;

				$('#'+dots).html('');
				jsondata.forEach((item) => {
					if(item.details!=null){
						var result = item.details.replaceAll("\n", "<br>");
					}else{
						result=item.details;
					}
					html+='<span id="dots${fpost.feed_id}">';
					html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
					html+='		<div class="col-md-1">';
								if(item.path!=null){
					html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='				<img src="'+item.path+'">';
					html+='			</div>';
	
								}else{
					html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
					html+='			</div>';
								}
					html+='		</div>';
					html+='  	<div class="col-md-11">';
					html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
					html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
								if(item.sticker_part==null){
					html+='				<span style="font-size: 15px; margin-left: 2%">'+item.details+'</span><br>';	
								}else if(item.sticker_part!=null && item.details==null){
					html+='				<br><img class="stkComment" src="'+item.sticker_part+'">';
								}else{
					html+='				<span style="font-size: 15px; margin-left: 2%">'+item.details+'</span><br>';
					html+='				<img class="stkComment" src="'+item.sticker_part+'">';
								}
					html+='			</div>';
						html+='			<div class="col-md-2">';
								if(item.user_comment == userOnline){
					html+='						<div class="dropdown editcomment" style="display:none">';
					html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
					html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
					html+='						</button>';
					html+='						<ul class="dropdown-menu">';
					html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
					html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
					if(item.details==undefined){
						html+='<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
					}else{
						html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
					}
					html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
					html+='								</li>';
					html+='							<li><a';
					html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
					html+='						</ul>';
					html+='					</div>';					
								}
					html+='				</div>';
					html+='         </div>';
					html+='	</div>';
					html+='</span>';
					
				});			
				$('#dots'+id_feed).html('');
				$('#dots'+id_feed).append(html);
				jQuery(".showedit").hover(
						  function() {
						      jQuery(this).find(".editcomment").css("display","block");
						   },
				   function() {
				      jQuery(this).find(".editcomment").css("display","none");
				   }

				);
			}
		});


		textedit="";
		texteditOneA="";
	};
</script>


<script>

	function getmessage(id) {
		/* document.getElementById("demo").innerHTML = id;
		document.getElementById("message").innerHTML = details; */
	var postD=$('#oldpost'+id).val();
		$('#messagePostModal').val(postD);
		
		idFP=$('#FeedIdPost'+id).val();
		
		
		resulttextPost = $('#oldpost'+id).val().replaceAll("😀", "&#"+"128512;")
	    .replaceAll("😁", "&#"+"128513;")
	    .replaceAll("😂", "&#"+"128514;")
	    .replaceAll("😃", "&#"+"128515;")
	    .replaceAll("😄", "&#"+"128516;")
	    .replaceAll("😅", "&#"+"128517;")
	    .replaceAll("😆", "&#"+"128518;")
	    .replaceAll("😇", "&#"+"128519;")
	    .replaceAll("😈", "&#"+"128520;")
	    .replaceAll("😉", "&#"+"128521;")
	    .replaceAll("😊", "&#"+"128522;")
	    .replaceAll("😋", "&#"+"128523;")
	    .replaceAll("😌", "&#"+"128524;")
	    .replaceAll("😍", "&#"+"128525;")
	    .replaceAll("😎", "&#"+"128526;")
	    .replaceAll("😏", "&#"+"128527;")
	    .replaceAll("😐", "&#"+"128528;")
	    .replaceAll("😑", "&#"+"128529;")
	    .replaceAll("😒", "&#"+"128530;")
	    .replaceAll("😓", "&#"+"128531;")
	    .replaceAll("😔", "&#"+"128532;")
	    .replaceAll("😕", "&#"+"128533;")
	    .replaceAll("😖", "&#"+"128534;")
	    .replaceAll("😗", "&#"+"128535;")
	    .replaceAll("😘", "&#"+"128536;")
	    .replaceAll("😙", "&#"+"128537;")	
.replaceAll("😚", "&#"+"128538;")	
.replaceAll("😛", "&#"+"128539;")	
.replaceAll("😜", "&#"+"128540;")	
.replaceAll("😝", "&#"+"128541;")	
.replaceAll("😞", "&#"+"128542;")	
.replaceAll("😟", "&#"+"128543;")	
.replaceAll("😠", "&#"+"128544;")	
.replaceAll("😡", "&#"+"128545;")
.replaceAll("😢", "&#"+"128546;")
.replaceAll("😣", "&#"+"128547;")
.replaceAll("😤", "&#"+"128548;")
.replaceAll("😥", "&#"+"128549;")
.replaceAll("😦", "&#"+"128550;")	
.replaceAll("😧", "&#"+"128551;")	
.replaceAll("😨", "&#"+"128552;")	
.replaceAll("😩", "&#"+"128553;")
.replaceAll("😪", "&#"+"128554;")
.replaceAll("😫", "&#"+"128555;")	
.replaceAll("😬", "&#"+"128556;")	
.replaceAll("😭", "&#"+"128557;")
.replaceAll("😮", "&#"+"128558;")	
.replaceAll("😯", "&#"+"128559;")	
.replaceAll("😰", "&#"+"128560;")	
.replaceAll("😱", "&#"+"128561;")	
.replaceAll("😲", "&#"+"128562;")	
.replaceAll("😳", "&#"+"128563;")	
.replaceAll("😴", "&#"+"128564;")	
.replaceAll("😵", "&#"+"128565;")	
.replaceAll("😶", "&#"+"128566;")	
.replaceAll("😷", "&#"+"128567;")		
.replaceAll("🙄", "&#"+"128580;")	
.replaceAll("🙏", "&#"+"128591;")
.replaceAll("🤗", "&#"+"129303;")	
.replaceAll("🤘", "&#"+"129304;")	
.replaceAll("🤙", "&#"+"129305;")	
.replaceAll("🤚", "&#"+"129306;")	
.replaceAll("🤝", "&#"+"129309;")	
.replaceAll("🤞", "&#"+"129310;")	
.replaceAll("🤟", "&#"+"129311;")	
		.replaceAll("<", "&lt;")
		.replaceAll(">", "&gt;");

		texteditPost=resulttextPost;
		console.log("Post "+texteditPost);
		console.log("feedIdPost "+idFP);
		
	}
	function getmessageComment(idcomment, detailscomment) {
		document.getElementById("demoComment").innerHTML = idcomment;
		document.getElementById("messageComment").innerHTML = detailscomment;

	}
	
	var idC="";
	var idF="";
	function getmessageCommentnew(comment_id) {
		console.log("comment_id " + comment_id)
		var b = $('#oldcomment'+comment_id).val();
		
		$('#messageCommentModal').val(b);
		
		idC=comment_id;
		idF=$('#feedId'+comment_id).val();
		if(b=="" || b=='undefined' || b==null ||b.trim()==''){
			textedit="";
		}else{
			textedit = b;
		}
	

	}
	
	function getmessageCommentnewOneA(idcomment, detailscomment) {
		var b = $('#oldcommentOneA'+idcomment).val();
		$('#messageCommentOneA'+idcomment).val(b);
		
		console.log("DoOneA "+idcomment+"  "+b);


	}
</script>
<script>
$( document ).ready(function() {
	console.log("ready!");
	var newLinkATag = document.querySelectorAll("#linkifyJukgru");
	newLinkATag.forEach(element =>{
		var resultPost = element.innerHTML.replaceAll("\n", "<br>");
		element.innerHTML = resultPost;

	});
	
	/* id="commentNewOne" */
	var commetOne = document.querySelectorAll('#commentNewOne');
	
	commetOne.forEach(element =>{
		var result = element.innerHTML.replaceAll("\n", "<br>");
		element.innerHTML = result;
	});
	
	var commetAll = document.querySelectorAll('#commentNewAll');
	
	commetAll.forEach(element =>{
		var resultAll = element.innerHTML.replaceAll("\n", "<br>");
		element.innerHTML = resultAll;
	});
	
	
});

</script>
<script>
function delete1(id) {
		console.log("aaaaa   " + id);
		var newid = id;
		$.ajax({
			url : "DeleteFeednews",
			method : "POST",
			type : "JSON",
			data : {
				"id" : newid,
			},
			success : function(data) {
				location.reload();
	    

			}
		});
	}

	function deleteComment(id,id_feed) {
		var newid = id;
		console.log(id +"  "+idF);
		$.ajax({
			url : "DeleteComment",
			method : "POST",
			type : "JSON",
			data : {
				"id" : id,
				"feedid":id_feed
			},
			success : function(data) {
				$('#more'+id_feed).load();
				var jsondata = JSON.parse(data);
				var text = "";
				var userOnline = "${logonUser}";
				html ="";
				length = jsondata.length;
				jsondata.forEach((item) => {
					if(item.details!=null){
						var result = item.details.replaceAll("\n", "<br>");
					}else{
						result=item.details;
					}
					console.log("-----------------deleteComment     ALL");
					html+='<span id="more${fpost.feed_id}">';
					html+='	<div class="col-md-12 center showedit ">';
					html+='<div class="col-md-12 " style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">';
					html+='		<div class="col-md-1 ">';
								if(item.path!=null){
					html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='				<img src="'+item.path+'" alt="">';
					html+='				</div>';
	
								}else{
					html+='				<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='					<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
					html+='				</div>';
								}
					html+='			</div>';
					html+='  			<div class="col-md-11">';
					html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
					html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
					if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
									}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
						html+='				<br>';
						html+='				<img class="stkComment" src="'+item.sticker_part+'">';
									}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
						html+='				<img class="stkComment" src="'+item.sticker_part+'">';
									}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
						html+='				<br>';
						html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
									}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
						html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
									}else{
						html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
						html+='				<br>';
									}
					html+='			</div>';
					html+='					<div class="col-md-2 text-left center ">';
								if(item.user_comment == userOnline){
					html+='					<div class="dropdown editcomment" style="display:none">';
					html+='					<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
					html+='						<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
					html+='						</button>';
					html+='						<ul class="dropdown-menu">';
					html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
					html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
					if(item.details==undefined){
						html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
					}else{
						html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
					}
					html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
					html+='								</li>';
					html+='							<li><a';
					html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
					html+='						</ul>';
					html+='					</div>';
								}
					html+='		</div>';
					html+='				</div>';
					html+='         </div>';	
					html+='         </div>';					
					
				});			
				$('#more'+id_feed).html('');
				$('#more'+id_feed).append(html);
				jQuery(".showedit").hover(
						  function() {
						      jQuery(this).find(".editcomment").css("display","block");
						   },
				   function() {
				      jQuery(this).find(".editcomment").css("display","none");
				   }

				);
			
			}
		});
		
		$.ajax({
			url : "topComment",
			method : "POST",
			type : "JSON",
			data : {
					"feed_id" : id_feed,
			},
			success : function(data) {
				console.log("-----------------deleteComment     ONE");
				$('#dots'+id_feed).load();
				var jsondata = JSON.parse(data);
				var text = "";
				var userOnline = "${logonUser}";
				html ="";
				length = jsondata.length;
				$('#dots'+id_feed).html('');
				jsondata.forEach((item) => {
					if(item.details!=null){
						var result = item.details.replaceAll("\n", "<br>");
					}else{
						result=item.details;
					}
					html+='<span id="dots${fpost.feed_id}">';
					html+='	<div class="col-md-12 center showedit " style="border-bottom: 1px solid #D4CDCD;padding-top:2%;padding-bottom:2%">';
					html+='		<div class="col-md-1">';
								if(item.path!=null){
					html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='				<img src="'+item.path+'">';
					html+='			</div>';
	
								}else{
					html+='			<div class="circular--portrait1 imgfeed1 crop-image">';
					html+='				<img class="imgfeed crop-image" src="/pages-back/img/profile2.png">';
					html+='			</div>';
								}
					html+='		</div>';
					html+='  	<div class="col-md-11">';
					html+='  		<div class="col-md-10" style="  word-break: break-all;" >';
					html+='     		<span style="font-size: 15px;">'+item.name+'</span><br>';
					if(item.details!=null && item.sticker_part==null && item.commentImage_path==null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
									}else if(item.details==null && item.sticker_part!=null && item.commentImage_path==null){
						html+='				<br>';
						html+='				<img class="stkComment" src="'+item.sticker_part+'">';
									}else if(item.details!=null && item.sticker_part!=null && item.commentImage_path==null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
						html+='				<img class="stkComment" src="'+item.sticker_part+'">';
									}else if(item.details==null && item.sticker_part==null && item.commentImage_path!=null){
						html+='				<br>';
						html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
									}else if(item.details!=null && item.sticker_part==null && item.commentImage_path!=null){
						html+='				<span style="font-size: 15px;"><div style="margin-left: 1%">'+result+'</div></span>';
						html+='				<br>';
						html+='				<img class="imageComment" id="data-enlargeable" style="cursor: pointer;" src="'+item.commentImage_path+'">';
									}else{
						html+='				<span style="font-size: 15px; margin-left: 2%">error</span>';
						html+='				<br>';
									}
					html+='			</div>';
						html+='			<div class="col-md-2">';
								if(item.user_comment == userOnline){
					html+='						<div class="dropdown editcomment" style="display:none">';
					html+='						<button class="btn dropdown-toggle" type="button" style="background-color: #fff" data-toggle="dropdown">';
					html+='							<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>';
					html+='						</button>';
					html+='						<ul class="dropdown-menu">';
					html+='							<li><a data-toggle="modal" 	data-target="#myModalComment"';
					html+='								onclick="getmessageCommentnew('+item.comment_id+')">Edit</a>';
					if(item.details==undefined){
						html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="">';
					}else{
						html+='	<input type="hidden" id="oldcomment'+item.comment_id+'" value="'+item.details+'">';
					}
					html+='								<input type="hidden" id="feedId'+item.comment_id+'" value="'+item.feed_id+'">';
					html+='								</li>';
					html+='							<li><a';
					html+='								onclick="deleteComment('+item.comment_id+','+id_feed+')">Delete</a></li>';
					html+='						</ul>';
					html+='					</div>';					
								}
					html+='				</div>';
					html+='         </div>';
					html+='	</div>';
					html+='</span>';

				});			
				$('#dots'+id_feed).html('');
				$('#dots'+id_feed).append(html);
				jQuery(".showedit").hover(
						  function() {
						      jQuery(this).find(".editcomment").css("display","block");
						   },
				   function() {
				      jQuery(this).find(".editcomment").css("display","none");
				   }

				);
			}
		});
	}
</script>

<script>
	function postFeed() {
		var csa = $('#details').val().trim();
		
		consolelog(resultEmo);
		$.ajax({
			url : "AddFeednews",
			method : "POST",
			type : "JSON",
			data : {
				"details" : csa,
			},
			success : function(data) {
				location.reload();
			}
		});

	}
</script>

</html>
