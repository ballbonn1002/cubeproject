<html>
<head>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>

<meta property="og:title" content="Mark's Favorites at AEO" />
<meta property="og:image" content="http://markcarlson.io/wp-content/uploads/2016/12/Heart_font_awesome.svg.png" />

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="sweetalert2.all.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill"></script>
<script src="sweetalert2.min.js"></script>
<link rel="stylesheet" href="sweetalert2.min.css">
<link rel="shortcut icon" href="favicon.ico" />
<script
	src="/assets/global/plugins/fancybox/lib/jquery-1.10.1.min.js"></script>
<script
	src="/assets/global/plugins/jquery-ui/jquery-ui.min.js"></script>
	<script  src="https://code.jquery.com/jquery-3.1.1.min.js"  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
	<script src="https://use.fontawesome.com/aa95071b26.js"></script>
	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
	<script  src="https://code.jquery.com/jquery-3.1.1.min.js"  integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="  crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js" ></script>
	<script src="https://use.fontawesome.com/aa95071b26.js"></script>
	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
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
	src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/> 

<link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
   <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
   
</head>
<style>
#sticker{
	z-index: 1000; 
    position: absolute; 
    display:inline;   
    box-shadow: 0 1px 15px 1px rgba(0,0,0,.08);
    border-radius: 6px;
    margin-top:60px;
} 
@media (max-width:767px) {
    #ultheme {
    left:-195px; 

}
}
@media (max-width:760px) {
    #bb {
	  position: absolute;
	  width: 300px;
	  height: 200px;
	  top: 50%;
	  left: 50%;
	  margin: -100px 0 0 -150px;
}
}
@media (min-width:768px) {
    #bb {
    color: black;
    text-align: center;
    margin-top :22%;
	margin-left :40%;
    display:inline-block;
    transition:all .6s ease;
}
}
#messages-main {
    position: relative;
    margin: 0 auto;
    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
    transition:all .6s ease;
}
#messages-main:after, #messages-main:before {
    content: " ";
    display: table;
}
#messages-main .ms-menu {
    position: absolute;
    left: 0;
    top: 0;
    border-right: 2px solid #E1E5EC; 
    padding-bottom: 50px;
    height: 100%;
    width: 240px;
    background: #f5f8fd;
    transition:all .6s ease;
}
 
.bb {
    color: black;
    text-align: center;
    margin-top :22%;
	margin-left :40%;
    display:inline-block;
    transition:all .6s ease;
}
p {
    color: #ACB5C3;
}
.white::placeholder {
  color: white;  
}
@media (min-width:768px) {
    #messages-main .ms-body {
    padding-left: 240px;
}
}@media (max-width:767px) {
    #messages-main .ms-menu {
    height: calc(100% - 58px);
    display: none;
    z-index: 1;
    top: 58px;
    transition:all .6s ease; 
}
#messages-main .ms-menu.toggled{
    display: block;
    width: 100%
}
}@media (max-width:767px) {
    .portlet.light {
    padding-right:0px;
    padding-left:0px;
}
}@media (max-width:767px) {
    .container, .container-fluid {
    padding:0px;
}

#messages-main .ms-body {
    overflow: hidden;
}
}
@media (max-width:900px) {
    #modalrespon {
    display: none;
}
}
#messages-main .ms-user {
    padding: 15px;
    background: #f5f8fd;

}
#messages-main .ms-user>div {
    padding: 3px 5px 0 15px;
    padding-left: 45px;
    font-size: 11px;
}
#messages-main #ms-compose {
    position: fixed;
    bottom: 120px;
    z-index: 1;
    right: 30px;
    box-shadow: 0 0 4px rgba(0, 0, 0, .14), 0 4px 8px rgba(0, 0, 0, .28);
}
#ms-menu-trigger {
    user-select: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 50px;
    height: 100%;
    padding-right: 10px;
    padding-top: 19px;
}
#ms-menu-trigger i {
    font-size: 21px;
}
#ms-menu-trigger.toggled i:before {
    content: '\f2ea'
}
.fc-toolbar:before, .login-content:after {
    content: ""
}
.message-feed {
    padding: 10px;
    margin: 0px;
}
#footer, .fc-toolbar .ui-button, .fileinput .thumbnail, .four-zero, .four-zero footer>a, .ie-warning, .login-content, .login-navigation, .pt-inner, .pt-inner .pti-footer>a {
    text-align: center;
}
.message-feed.right>.pull-right {
    margin-left: 15px;
}
.chat-right {
    background: #daf2ff;
    color: #474b52;
    word-break:break-all; 
    width: auto; 
    transition:all .6s ease;
    padding: 12px 17px 13px;
    border-radius: 2px; 
    display: inline-block;
    overflow-wrap: break-word;
    max-width: 80%;
    background-attachment: fixed; 

}
.chat-left {
	background: #eef1f5;
    color: #474b52;
    word-break:break-all; 
    width: auto; 
    transition:all .6s ease;
    padding: 12px 17px 13px;
    border-radius: 2px; 
    display: inline-block;
    overflow-wrap: break-word;
    max-width: 80%;
}
.mf-date {
    display: block;
    color: #B3B3B3;
    margin-top: 7px;
}
.mf-date>i {
    font-size: 14px;
    line-height: 100%;
    position: relative;
    top: 1px;
}
.msb-reply {
    box-shadow: 0 -20px 20px -5px #fff;
    position: relative;
    border-top: 0px solid #eee;
    background: #f8f8f8;
}
.four-zero, .lc-block {
    box-shadow: 0 1px 11px rgba(0, 0, 0, .27);
}
.msb-reply textarea {
    font-size: 13px;
    border: 0;
    padding: 10px 15px;
    resize: none;
    height: 60px;
    background: 0 0;
    transition:all .6s ease;
}

.msb-reply button {
    position: absolute;
    top: 0;
    right: 0;
    border: 0;
    height: 100%;
    width: 60px;
    font-size: 20px;
    color: #2196f3;
    background: 0 0;
    transition:all .6s ease;
}
.msb-reply button:hover {
    background: white;
}
.img-avatar {
    height: 37px;
    border-radius: 2px;
    width: 37px;
}
.list-group.lg-alt .list-group-item {
    border: 0;
    margin:0;
    transition:all .6s ease; 
}
.p-15 {
    padding: 15px!important;
    padding-top: 0px!important;
    padding-bottom: 0px!important;
    transition:all .6s ease;
}
.btn:not(.btn-alt) {
    border: 0;
}
.action-header {
    position: relative;
    background: white;
    padding: 15px 13px 15px 17px;
    border-bottom: 2px solid #E1E5EC;
    transition:all .6s ease;
}
@media (max-width:767px) {
    .action-header {
    height: 60px;
}
}
.ah-actions {
    z-index: 3;
    float: right;
    margin-top: 7px;
    position: relative;
}
.actions {
    list-style: none;
    padding: 0;
    margin: 0;
}
.actions>li {
    display: inline-block;
}

.actions:not(.a-alt)>li>a>i {
    color: #939393;
}
.actions>li>a>i {
    font-size: 20px;
}
.actions>li>a {
    display: block;
    padding: 0 10px;
}
.ms-body{
    background:#fff;  
    transition:all .6s ease;
}
#ms-menu-trigger {
    user-select: none;
    position: absolute;
    left: 0;
    top: 0;
    width: 50px;
    height: 100%;
    padding-right: 10px;
    padding-top: 19px;
    cursor:pointer;
}
#ms-menu-trigger, .message-feed.right {
    text-align: right;
}
#ms-menu-trigger, .toggle-switch {
    -webkit-user-select: none;
    -moz-user-select: none;
}

.hidinput{
opacity:0.0;
filter: alpha(opacity=0); 

}
.center{
position: relative;
text-align: center;
top:100px;
}

.bs-container{
  border-radius: 50px!important;
  position: absolute !important;  
  background: white;
  margin: auto;
  top:300px;  
  overflow:hidden;   
  width:99%;
  height:69px;
  transition:all .6s ease;
}

.button{
  position:absolute;
  text-align:center;
  line-height:45px;
  font-size:30px;
  color:white;
  background-color: #E1E5EC;
  border-radius:50%;
  width:45px;
  height:45px;
  left:15px;
  top:12px;
  cursor:pointer;
  transition: all .6s ease;
  transform: rotate(0deg);
}

.button-rotate{
  transform: rotate(45deg);
}

.button2{
  transform-origin: -60px 0px;
  transition:all .6s ease;
}

.rotate-button2{
  transform:rotate(-120deg);
  transition:all .6s ease;
}

.rotate-buttonemoji{
  transform:rotate(-120deg);
  transition:all .6s ease;
}

textarea{
  border:0;
  position:absolute;
  left:70px;
  top:12px;
  font-size:16px;
  padding:13px;
  color:black;
  border-radius:50px !important;
  transform-origin: -40px 0px;
  width:85%;
  transition:all .6s ease;
  display:block;
}
#SendButton {
	margin-left: 92%;
}
#emoji-picker{
	margin-left: 86%; 
}
@media (max-width:768px) {
    textarea {
    width:60%;
}
}
@media (max-width:768px) {
    #emoji-picker {
    margin-left: 64%; 
}
	#SendButton {
    margin-left: 78%; 
}
}
.rotate-textarea{
  transform:rotate(-90deg);
  transition:all .6s ease;
}

textarea::placeholder { 
    color: black; 
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

.tools{
  position:absolute;
  left:52px;
  top:11px;
  transform-origin: -30px 20px;
  transform:rotate(90deg);
  transition:all .6s ease;
}

.tools-rotate{
  transform:rotate(0deg);
  transition:all .6s ease;
}

/*---------------------------------------------ButtonGofeed---------------------------------------------------*/

button .label,
button .icon-arrow {
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
    transition: transform .5s cubic-bezier(0.86, 0, 0.07, 1), opacity .4s cubic-bezier(0.86, 0, 0.07, 1);
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

/*------------------------------------ theme -----------------------------------*/
.dark {
  width: 25px !important;
  height: 25px !important;
  line-height: 20px;
  text-align: center;
  padding: 0;
  border-radius: 50%;
  background-color:#2f3136;
}

.mlight {
 width: 25px !important;
  height: 25px !important;
  line-height: 20px;
  text-align: center;
  padding: 0;
  border-radius: 50%;
  background-color: #f5f8fd;
}

.tcandy {
  width: 25px !important;
  height: 25px !important;
  line-height: 20px;
  text-align: center;
  padding: 0; 
  border-radius: 50%;
  background: linear-gradient(-45deg, #FFA63D, #FF3D77, #338AFF, #3CF0C5);
}

.tsea {
  width: 25px !important;
  height: 25px !important;
  line-height: 20px;
  text-align: center;
  padding: 0;
  border-radius: 50%;
  background: linear-gradient(203deg, rgba(142,228,195,1) 0%, rgba(148,204,233,1) 100%);
  
/*--------------------------------------------------------------------------------------------------*/
  
}
.btn-circle i {
  position: relative;
  top: -1px;
}

.btn-circle-sm {
  width: 35px;
  height: 35px;
  line-height: 35px;
  font-size: 0.9rem;
}

.btn-circle-lg {
  width: 55px;
  height: 55px;
  line-height: 55px;
  font-size: 1.1rem;
}

.btn-circle-xl {
  width: 70px;
  height: 70px;
  line-height: 70px;
  font-size: 1.3rem;
}

/*----------------------------------------------- scrollbar -------------------------------- */

.scroll-box::-webkit-scrollbar,
.scroll-box::-webkit-scrollbar-thumb {
  width:10px;
  border-radius: 10px; 
  scroll-behavior: smooth;
}
.scroll-box::-webkit-scrollbar-thumb {
  background: rgba(0,0,0,.2); 
}

.thin::-webkit-scrollbar {
width: 2px; } 



/*------------------------------------- like ------------------------------------------------ */
.like-btn{
  display: inline-block;
  Cursor: pointer;
  width: 40px;
  height: 40px;
}

.like-btn {
  background: url('https://i.ibb.co/vw78mf3/heart.png') no-repeat 0% 50%;
  background-size: 2900%;
}

.like-active{
  animation-name: animate;
  animation-duration: .8s;   
  animation-iteration-count: 1; 
  animation-fill-mode: forwards; 
}
.like-active {
  animation-timing-function: steps(28);
}

@keyframes animate {
  0%   { background-position: left;}
  50%  { background-position: right;}
  100% { background-position: right;}
}

/*---------------------------------------emoji------------------------------------------- */
 
 .intercom-composer-popover-input{
    font-size-adjust: none;
    font-size: 100%;
    font-style: normal;
    letter-spacing: normal;
    font-stretch: normal;
    font-variant: normal;
    font-weight: 400;
    font: normal normal 100% "intercom-font", "Helvetica Neue", Helvetica, Arial, sans-serif;
    text-align: left;
    text-align-last: auto;
    text-decoration: none;
    -webkit-text-emphasis: none;
    text-emphasis: none;
    text-height: auto;
    text-indent: 0;
    text-justify: auto;
    text-outline: none;
    text-shadow: none;
    text-transform: none;
    text-wrap: normal;
    alignment-adjust: auto;
    alignment-baseline: baseline;
    -webkit-animation: none 0 ease 0 1 normal;
    animation: none 0 ease 0 1 normal;
    -webkit-animation-play-state: running;
    animation-play-state: running;
    -webkit-appearance: normal;
    -moz-appearance: normal;
    appearance: normal;
    azimuth: center;
    -webkit-backface-visibility: visible;
    backface-visibility: visible;
    background: none 0 0 auto repeat scroll padding-box transparent;
    background-color: transparent; 
    background-image: none;
    baseline-shift: baseline;
    binding: none;
    bleed: 6pt;
    bookmark-label: content();
    bookmark-level: none;
    bookmark-state: open;
    bookmark-target: none;
    border: 0 none transparent;
    border-radius: 0;
    bottom: auto;
    box-align: stretch;
    -webkit-box-decoration-break: slice;
    box-decoration-break: slice;
    box-direction: normal;
    box-flex: 0.0;
    box-flex-group: 1;
    box-lines: single;
    box-ordinal-group: 1;
    box-orient: inline-axis;
    box-pack: start;
    box-shadow: none;
    box-sizing: content-box;
    -webkit-column-break-after: auto;
    break-after: auto;
    -webkit-column-break-before: auto;
    break-before: auto;
    -webkit-column-break-inside: auto;
    break-inside: auto;
    caption-side: top;
    clear: none;
    clip: auto;
    color: inherit;
    color-profile: auto;
    -webkit-column-count: auto;
    -moz-column-count: auto;
    column-count: auto;
    -webkit-column-fill: balance;
    -moz-column-fill: balance;
    column-fill: balance;
    -webkit-column-gap: normal;
    -moz-column-gap: normal;
    column-gap: normal;
    -webkit-column-rule: medium medium #1f1f1f;
    -moz-column-rule: medium medium #1f1f1f;
    column-rule: medium medium #1f1f1f;
    -webkit-column-span: 1;
    -moz-column-span: 1;
    column-span: 1;
    -webkit-column-width: auto;
    -moz-column-width: auto;
    column-width: auto;
    -webkit-columns: auto auto;
    -moz-columns: auto auto;
    columns: auto auto;
    content: normal;
    counter-increment: none;
    counter-reset: none;
    crop: auto;
    cursor: auto;
    direction: ltr;
    display: inline;
    dominant-baseline: auto;
    drop-initial-after-adjust: text-after-edge;
    drop-initial-after-align: baseline;
    drop-initial-before-adjust: text-before-edge;
    drop-initial-before-align: caps-height;
    drop-initial-size: auto;
    drop-initial-value: initial;
    elevation: level;
    empty-cells: show;
    fit: fill;
    fit-position: 0 0;
    float: none;
    float-offset: 0 0;
    grid-columns: none;
    grid-rows: none;
    hanging-punctuation: none;
    height: auto;
    hyphenate-after: auto;
    hyphenate-before: auto;
    hyphenate-character: auto;
    hyphenate-lines: no-limit;
    hyphenate-resource: none;
    -webkit-hyphens: manual;
    -ms-hyphens: manual;
    hyphens: manual;
    icon: auto;
    image-orientation: auto;
    image-rendering: auto;
    image-resolution: normal;
    inline-box-align: last;
    left: auto;
    line-height: inherit;
    line-stacking: inline-line-height exclude-ruby consider-shifts;
    list-style: disc outside none;
    margin: 0;
    marks: none;
    marquee-direction: forward;
    marquee-loop: 1;
    marquee-play-count: 1;
    marquee-speed: normal;
    marquee-style: scroll;
    max-height: none;
    max-width: none;
    min-height: 0;
    min-width: 0;
    move-to: normal;
    nav-down: auto;
    nav-index: auto;
    nav-left: auto;
    nav-right: auto;
    nav-up: auto;
    opacity: 1;
    orphans: 2;
    outline: medium none invert;
    outline-offset: 0;
    overflow: visible;
    overflow-style: auto;
    padding: 0;
    page: auto;
    page-break-after: auto;
    page-break-before: auto;
    page-break-inside: auto;
    page-policy: start;
    -webkit-perspective: none;
    perspective: none;
    -webkit-perspective-origin: 50% 50%;
    perspective-origin: 50% 50%;
    pointer-events: auto;
    position: absolute;
    presentation-level: 0;
    punctuation-trim: none;
    quotes: none;
    rendering-intent: auto;
    resize: none;
    right: auto;
    rotation: 0;
    rotation-point: 50% 50%;
    ruby-align: auto;
    ruby-overhang: none;
    ruby-position: before;
    ruby-span: none;
    size: auto;
    string-set: none;
    table-layout: auto;
    top: 0;
    -webkit-transform: none;
    -ms-transform: none;
    transform: none;
    -webkit-transform-origin: 50% 50% 0;
    -ms-transform-origin: 50% 50% 0;
    transform-origin: 50% 50% 0;
    -webkit-transform-style: flat;
    transform-style: flat;
    transition: all 0 ease 0;
    unicode-bidi: normal;
    vertical-align: baseline;
    white-space: normal;
    white-space-collapse: collapse;
    widows: 2;
    width: auto;
    word-break: normal;
    word-spacing: normal;
    word-wrap: normal;
    z-index: auto;
    text-align: start;
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(enabled=false)";
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale;
  
}
.intercom-composer-popover {
    position: absolute; 
    right: 5%; 
    box-shadow: 0 1px 15px 1px rgba(0,0,0,.08);

    border-radius: 6px;
    transition-duration: 200ms;
    transition-delay: 0ms;
    transform-style: flat;
    transform-origin: 50% 50% 0;
    opacity: 0;
    transition: all 0.2s linear;  
    visibility: hidden;
    top:30px;
}
.aw{
	background-color: #fff; 
}
.intercom-composer-popover.active{
	top:40px;
	visibility: visible;
	opacity:1;
} 
.intercom-emoji-picker {
    width: 330px;
    height: 260px; 
}
@media (max-width:768px) {
    .intercom-emoji-picker {
    width: 250px;
}
}
.intercom-composer-popover-header {
    position: absolute;
    top: 0;
    left: 20px;
    right: 20px;
    height: 40px;
    border-bottom: 1px solid #edeff1;
}
.intercom-composer-popover-input {
    background-image: url(https://js.intercomcdn.com/images/search.7ae40c25.png);
    background-size: 16px 16px;
    background-repeat: no-repeat;
    background-position: 0 12px;
    font-weight: 400;
    font-size: 14px;
    color: #6e7a89;
    padding-left: 25px;
    height: 40px;
    width: 100%;
    box-sizing: border-box;
    background-image: url(https://js.intercomcdn.com/images/search@2x.9f02b9f3.png);
    border:none;
    outline: none;
}
.intercom-composer-popover-body {
    position: absolute;
    top: 40px;
    left: 0;
    right: 0;
    bottom: 5px;
    padding: 0 20px;
    overflow-y: scroll;
}
.intercom-emoji-picker-group {
    margin: 10px -5px;
}
.intercom-emoji-picker-group {
    margin: 10px -5px;
}
.intercom-emoji-picker-group-title {
    color: #b8c3ca;
    font-weight: 400;
    font-size: 13px;
    margin: 5px;
}
.intercom-emoji-picker-emoji {
    padding: 5px;
    width: 30px;
    line-height: 30px;
    display: inline-table;
    text-align: center;
    cursor: pointer;
    vertical-align: middle;
    font-size: 28px;
    transition: -webkit-transform 60ms ease-out;
    transition: transform 60ms ease-out;
    transition: transform 60ms ease-out,-webkit-transform 60ms ease-out;
    transition-delay: 60ms;
    font-family: Apple Color Emoji,Segoe UI Emoji,NotoColorEmoji,Segoe UI Symbol,Android Emoji,EmojiSymbols;
}
.intercom-emoji-picker-emoji:hover {
    transition-delay: 0ms;
    -webkit-transform: scale(1.4);
    -ms-transform: scale(1.4);
    transform: scale(1.4);
}


.chat-input-tool{
  background-color: #32A8E6;
  padding: 10px;
  border:none;  
  border-radius: 5px;
  position: absolute;
  bottom:20px;
  left: 50%;
  outline:none;
}

/*------------------------------------------------------*/

.trigger {
 /*   background-color: green; */
    color: #fff
}

.modal,
.fade,
.show {
    padding-left: 15px;
    padding-right: 15px;
}

h2 {
    margin-bottom: 15px;
    margin-top: 10px; 
    color: #000
}

.modal-content {
    border: none;
    background: transparent;
    padding: 0 19px
}

.close {
    position: relative;
    top: 15px; 
    z-index: 1;
    font-size: 30px;
    font-weight: bold;
    line-height: 1;
    color: black
}

.modal-header {
    border: none
}

.modal-header .close {
    padding: 0rem 1rem !important;
    margin: -1rem -1rem -1rem auto
}

.modal-body {
    border: none;
    background-color: #f5f8fd;
    height: 50%;  
    border-radius: .90rem !important; 
}
.close.focus,
.close:focus {
    outline: 0;
    box-shadow: none !important
}



@media (min-width:599px) {
    .modal-dialog {
        max-width: 47rem
    }

    .details { 
    padding-left: 0px;
    height:650px;  

    }

    .text-muted a {
        color: #c0bfbf;
        font-weight: bold;
        text-decoration: underline
    }

    small.para {
        font-weight: bold;
        font-size: 14px;
        color: #63686c
    }
}
/*------------------------------inputLine------------------------------------------*/
.text-line {
        background-color: transparent;
        color: black;
        outline: none;
        outline-style: none;
        outline-offset: 0; 
        border-top: none;
        border-left: none;
        border-right: none;
        border-bottom: solid #eeeeee 1px;
    }
/*-----------------------------------------------------------------------------*/
select {
    border: 1px solid #EEE;
    border-radius: .25rem;
    padding: .5rem 1.5rem .5rem .5rem;
    display: flex;
    background-color: white;
    outline: 0;
    cursor: pointer;
    appearance: none; 
}
/*-----------------------------------------------------------------------------*/
.circleimg {
	width: 110px;  
	height: 110px;  
	margin-left: 185px;
	border-radius:110px !important; 
}
.btn-icon-only {
	transition:all .6s ease;
}
.textaddgroup {
	margin-top: 7px;
}

.crop-image {
	object-fit: cover;
    object-position: center; 
}

/*----------------------------------gradient animation-------------------------------------------*/

@keyframes gradient { 
  0%{background-position:0 0}
  100%{background-position:100% 0}
}

.gradient-animation {
    background: linear-gradient(-45deg, #FFA63D, #FF3D77, #338AFF, #3CF0C5);
	background-size: 300% 300%;
    clip-path: polygon(0 85%, 100% 85%, 100% 100%, 0% 100%);
    -webkit-animation: AnimationName 5s linear infinite;
    -moz-animation: AnimationName 5s linear infinite;
    animation: AnimationName 5s linear infinite;
} 

@-webkit-keyframes AnimationName {
    0%{background-position:0% 51%}
    50%{background-position:100% 50%}
    100%{background-position:0% 51%}
}
@-moz-keyframes AnimationName {
    0%{background-position:0% 51%}
    50%{background-position:100% 50%}
    100%{background-position:0% 51%}
}
@keyframes AnimationName {
    0%{background-position:0% 51%}
    50%{background-position:100% 50%}
    100%{background-position:0% 51%}
}
	
.gradient-animation-bg {
    background: linear-gradient(270deg, #ff0000, #ff8200, #f5ff00, #4cff00, #00f8ff, #0001ff, #ff00fc, #be00ff, #ffffff);
	background-size: 300% 300%;
    -webkit-animation: AnimationName 2s linear infinite forwards;
    -moz-animation: AnimationName 2s infinite linear forwards;
    animation: AnimationName 2s infinite linear forwards;
	
	}
	
.gradient-animation-bt{
	background: linear-gradient(-45deg, #FFA63D, #FF3D77, #338AFF, #3CF0C5);
	background-size: 300% 300% ;
    -webkit-animation: AnimationName 5s linear infinite;
    -moz-animation: AnimationName 5s linear infinite;
    animation: AnimationName 5s linear infinite; 
	}
	
.gradient-animation-ic {

	}

/*----------------------------------changclass-------------------------------------------*/
.bgrgb {
	background:radial-gradient(circle at 0% 0%, #373b52, #252736 51%, #1d1e26) !important;
}
.bguser {
	background: linear-gradient(180deg, rgba(55,59,82,1) 2%, rgba(37,39,54,1) 27%, rgba(29,30,38,1) 55%) !important;
}
.btnblack{
	background:radial-gradient(circle, rgba(72,77,88,1) 0%, rgba(47,49,54,1) 100%);
}
.btnwhite{
	background:radial-gradient(circle, rgba(142,158,228,1) 0%, rgba(148,200,233,1) 100%);
}
.colorCM{
color:#E1E5EC;
}

/*----------------------------------modal-------------------------------------------*/
.listS {
	margin-top: 0px; 
	border:0px;
}
.scbox{
	height:25%; 
	overflow-y: auto; 
	position: relative; 
	dispay:inline; 
	border-radius: 1rem !important; 
	background-color:white;
}

/*-----------------------------------tabindex-----------------------------------------------*/

:root {
  --contentHeight: 30vh;
  --sectionWidth: 700px;
}

* {
  outline: 0;
  box-sizing: border-box;
}

section {
  max-width: var(--sectionWidth);
  margin: 40px auto;
  width: 97%;
  color: black;
}

summary {
  display: block;
  cursor: pointer;
  padding-top: 0px;
  transition: .3s;
  border-bottom: 2px solid;
  user-select: none;
}

details > summary {
  list-style: none;
}
details > summary::-webkit-details-marker {
  display: none;
}

details > div {
  display: flex;
  flex-wrap: wrap;
  overflow: auto;
  height: 100%;
  user-select: none;
  padding: 0 20px;
  font-family: "Karla", sans-serif;
  line-height: 1.5;
  padding-right:0px !important;
}
details > div > div { 
  width:100px;
  height:100px;
  margin: 2px; 
  
} 

details > #file-file > div { 
  margin: 2px !important; 
  width:400px !important; 
  height:40px !important;

}

details > div > div > a > img { 
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}
details > div > div > a > video { 
  width: 100%;
  height: 100%;
  object-fit: cover;
  object-position: center;
}

details > div > div > a { 
  flex: 1;
  
}

@media (min-width: 768px) {
  details[open] > div > p {
    opacity: 0;
    animation-name: showContent;
    animation-duration: 0.6s;
    animation-delay: 0.2s;
    animation-fill-mode: forwards;
    margin: 0;
    padding-left: 20px;
  }

  details[open] > div {
    animation-name: slideDown;
    animation-duration: 0.3s;
    animation-fill-mode: forwards;
  }

  details[open] > div > img {
    opacity: 0;
    height: 100%;
    margin: 0;
    animation-name: showImage;
    animation-duration: 0.3s;
    animation-delay: 0.15s;
    animation-fill-mode: forwards;
  }
}

@keyframes slideDown {
  from {
    opacity: 0;
    height: 0;
    padding: 0;
  }

  to {
    opacity: 1;
    height: var(--contentHeight);
    padding: 20px;
  }
}

@keyframes showImage {
  from {
    opacity: 0;
    clip-path: inset(50% 0 50% 0);
    transform: scale(0.4);
  }

  to {
    opacity: 1;
    clip-path: inset(0 0 0 0);
  }
}

@keyframes showContent {
  from {
    opacity: 0;
  }
  to {
    opacity: 1;
  }
} 

/*--------------------------------------dropdownedit--------------------------------------------*/

.labell {
  color: white;
  padding-right: 3px;
  padding-left: 3px;
  padding-top: 2px;
  padding-bottom: 2px; 
  font-size:10px;
  font-weight: bold;
  margin-right: 5px;
  border-radius: 3px !important; 
  float: left;
}

.combobox select, .combobox select option { color: black; }
.combobox select:invalid, .combobox select option[value=""] { color:#c2cad8;}

.combobox {position:absolute; left:10px;}
.combobox>div { position:relative; font-size:1em; } 
.combobox select {  
    padding:0;
    border:1px solid #c2cad8 !important;
    width:60px; 
    height:31px !important;
    border-radius: 5px !important;
    text-align
}
.combobox input {
    position:absolute;top:1px;left:0px;
    padding:0px; margin:0px; width:40px; 
    border:1px solid #c2cad8; border-right:none; border-top:none;
    border-radius: 50px 0px 0px 50px !important;   
    height:30px !important;
}   
.combobox>div:after{ 
    position:absolute; top:0px; right:5px; height:100%; width:40px
    box-sizing:border-box; content:"▼"; border:0px solid #c2cad8; pointer-events:none;
    display:flex; flex-direction:row; align-items:center; justify-content:center;
    color:#c2cad8; border-radius: 50px !important;  height:30px !important;
} 
.combobox select:focus, .combobox input:focus {outline:none;}
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
  -webkit-appearance: none;
  margin: 0;
}
.combobox select option {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
  max-width: 100px;
}

#groupnames{
	overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis;
    max-width: 100px;  
}
#groupdes{
	display: inline-block;
    width: 100px;
    white-space: nowrap;
    overflow: hidden !important;
    text-overflow: ellipsis;
}
#searchchatdata{
	width: 250px;
	display:inline;
	margin-left:15px;
	margin-top:2px;
	position:absolute;
}
#nextfoundmessagebtn{
	left:228.5px;
}
#previosfoundmessagebtn{
	left:217px;
}
@media (max-width:768px) {
    #searchchatdata {
    width: 200px;
}
#nextfoundmessagebtn {
    left:185px;
}
#previosfoundmessagebtn {
  	 left:173px;
}
} 
.labelgroup{
	color: #ACB5C3; 
	font-size: 0.900em;
	position: relative;
	top: 9px;
	z-index: 2;
	margin-top:0px;
	padding-left:3px;
	padding-right:20px;
}
.separator {
    display: flex;
    align-items: center;
    text-align: center;
    color: #ACB5C3; 
	font-size: 0.900em;
	position: relative;
	top: 1px !important;
	z-index: 2;
	height:0px;
}
.separator::before, .separator::after {
    content: '';
    flex: 1;
    border-bottom: 1px solid #ACB5C3; 
}
.separator::before {
    margin-right: .25em;
}
.separator::after {
    margin-left: .25em;
}

/*--------------------------------------tab--------------------------------------------*/
''
.tabs {
  max-width: var(--sectionWidth);
  margin: 40px auto;
  width: 97%;
  color: black;
}

.tabs > input[type="radio"] {
  display: none;
}

.tabs > div {
  display: none;
  border: 0px solid #e0e0e0;
  padding: 10px 15px;
  font-size: 16px;
}

#tab-btn-1:checked ~ #content-1,
#tab-btn-2:checked ~ #content-2,
#tab-btn-3:checked ~ #content-3 {
  display: block;
}
#content-1,#content-2,#content-3{
 	padding-top: 0px; 
}

.tabs > label {
  display: inline-block;
  text-align: center;
  vertical-align: middle;
  user-select: none;
  border: 0px solid #e0e0e0;
  padding: 2px 8px;
  font-size: 16px;
  line-height: 1.5;
  cursor: pointer;
  position: relative;
  top: 1px;
  margin-bottom: 5px;
  margin-left:15px;
  border-radius:10px 10px 0px 0px !important;
} 

.tabs > label:not(:first-of-type) {
  border-left: none;
} 

.tabs > input[type="radio"]:checked + label {
  border-bottom: 2px solid black; 
  transition:all .6s ease;
}

.arrowsearch {
  border: solid #8396af;
  border-width: 0 2px 2px 0;
  display: inline-block;
  padding: 3px;
}

.arrowup {
  transform: rotate(-135deg);
  -webkit-transform: rotate(-135deg);
}

.arrowdown {
  transform: rotate(45deg); 
  -webkit-transform: rotate(45deg);
}

.emoDB{
	background: radial-gradient(circle at 0% 0%, #373b52, #252736 51%, #1d1e26) !important;
}

.emoDBW{
	background-color: white;
} 

.emoDBB{
	background-color: #2f3136 ;
} 
.colorW{
	color:white;
}
.colorB{
	color:black;
}
.btn-group>.dropdown-menu:after, .dropdown-toggle>.dropdown-menu:after, .dropdown>.dropdown-menu:after { 
	content: none !important;
}
.btn-group>.dropdown-menu:before, .dropdown-toggle>.dropdown-menu:before, .dropdown>.dropdown-menu:before{ 
	content: none !important;
}
} 

</style>

<body>
<div class="portlet light bordered" id="chatbored">
		<div class="portlet-title">

			<div class="caption" style="margin-left: 10px;">
				<i class="fa fa-comment"></i> <span
					class="caption-subject font-red sbold"> CHAT </span>
			</div>
			<div class="actions">
			
			<button style="padding-left: 65px; width: 199px; background-color: white; border: 1px solid #3F3F3F; color: #3F3F3F; display: inline-block; line-height: 1px; margin: auto; padding: 12px 32px 12px 82px; position: relative; text-decoration: none;"
			 onclick="Gotofeed()">
			    <svg class="icon-arrow before">
			        <use xlink:href="#arrow"></use>
			    </svg>
			    <span style="color:black" class="label">Let's Social Feed</span>
			    <svg class="icon-arrow after">
			        <use xlink:href="#arrow"></use>
			    </svg>
			</button>

			<svg style="display: none;">
			  <defs>
			    <symbol id="arrow" viewBox="0 0 35 15">
			      <title>Arrow</title>
			      <path d="M27.172 5L25 2.828 27.828 0 34.9 7.071l-7.07 7.071L25 11.314 27.314 9H0V5h27.172z "/>
			    </symbol>
			  </defs>
			</svg>
	
				&emsp;&emsp; <a
					class="btn btn-circle btn-icon-only btn-default fullscreen"
					href="javascript:;" data-original-title="" title=""></a>
			</div>
			
		</div>
		 
<div class="portlet-body" id="chatboxinchat" style="height:100% ;">
<div class="container bootstrap snippets bootdey" id="borred chat" style="width: 100%; height:100% !important;"> 
    <div class="tile tile-alt" id="messages-main" style="">
        <div class="ms-menu">
            <div style="transition:all .6s ease;" class="ms-user clearfix">
            <c:choose>
            	<c:when test="${Userpath != null}">
            		 <input type="hidden" value="${Userpath}" id ="pro_img"/>
               		 <img src="${Userpath}" alt="" class="circle img-avatar pull-left crop-image">
            	</c:when>
            	<c:otherwise>
            		 <input type="hidden" value="/pages-back/img/profile2.png" id ="pro_img"/>
               		 <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar pull-left">
            	</c:otherwise>
            </c:choose>
           		<input type="hidden" id = "start_theme"name = "start_theme" value="${theme}"/>
                <div><input type = "hidden" name = "Owner_chat_id" id= "Owner_chat_id" value = "<c:out value="${Owner_chat_id}"></c:out>"/><c:out value="${Owner_chat_id}"></c:out><br><c:out value="${email}"></c:out>
                <div id="settheme" style="float:right;" class="dropdown"><a  data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i style="color:#2f3136" class="fa fa-cog fa-xs"></i></a> 
				  	<div id="ultheme" class="dropdown-menu border-0 shadow hold-on-click" style="height:250px; width: 200px; border:0px; border-radius:3% !important; cursor: pointer; top:7px;"> 
				  	<h5 style="margin-top: 10px;">&nbsp; MODES</h5> 
				  	<ul style="list-style-type:none; padding-left:0px;">
				  		<li class="t" id="theme" style="padding-left: 20px;"><input type="hidden" value="white"><span class="btn mlight btn-circle btn-circle-sm m-1"></span><span style="font-size: 0.875em;">&nbsp;&nbsp;&nbsp;Default</span></li>
			            <li class="t" id="theme" style="padding-left: 20px; padding-top: 10px;"><input type="hidden" value="dark"><span class="btn dark btn-circle btn-circle-sm m-1"></span><span style="font-size: 0.875em;">&nbsp;&nbsp;&nbsp;Dark</span></li>
			            <li class="t" id="theme" style="padding-left: 20px; padding-top: 10px;"><input type="hidden" value="candy"><span class="btn gradient-animation-bt btn-circle btn-circle-sm m-1" style="width: 25px;height: 25px;padding-left: 0px;padding-top: 0px;padding-right: 0px;padding-bottom: 0px;"></span><span style="font-size: 0.875em;">&nbsp;&nbsp;&nbsp;Midnight RGB</span></li> 
		            </ul>
		            <hr> 
		          					<h5>&nbsp; SETTING</h5> 
				                        <div style="color: black;" class="combobox"><div>
				                        <p style="float:left; margin-right:10px; margin-top:5px;">Load limit chat : </p>
										    <select style="float:right" class="" id="loadlimit" >										    	
												<c:choose>
										    		<c:when test="${chat_load_limit == 10}"><option value="10" selected >10</option> </c:when>
										    		<c:otherwise><option value="10" >10</option> </c:otherwise>
										    	</c:choose>
										    	<c:choose>
										    		<c:when test="${chat_load_limit == 15}"><option value="15" selected >15</option> </c:when>
										    		<c:otherwise><option value="15" >15</option> </c:otherwise>
										    	</c:choose>
										    	<c:choose>
										    		<c:when test="${chat_load_limit == 20}"><option value="20" selected >20</option> </c:when>
										    		<c:otherwise><option value="20" >20</option> </c:otherwise>
										    	</c:choose>
										    	<c:choose>
										    		<c:when test="${chat_load_limit == 25}"><option value="25" selected >25</option> </c:when>
										    		<c:otherwise><option value="25" >25</option> </c:otherwise>
										    	</c:choose>
										    	<c:choose>
										    		<c:when test="${chat_load_limit == 30}"><option value="30" selected >30</option> </c:when>
										    		<c:otherwise><option value="30" >30</option> </c:otherwise>
										    	</c:choose>
										        
										    </select>
										</div></div> 
		          </div>
		          
	            </div>              
	            </div>
                </div> 
         
            <div style="" class="p-15">
            	<input id="searchchat" type="text" class="form-control circle" placeholder="&#xF002; Search" style="font-family:sans-serif, FontAwesome" autocomplete = "off">
                <div style="padding-top: 10px;" class="dropdown"> 
                    <div class="btn btn-block default circle btnwhite" id="ulMessageGroup" style="color: white; background-color:#404040;" data-toggle="dropdown"><p1 id="p1"><i class="fa fa-envelope"></i> Messages</p1> <i class="caret m-l-5"></i></div>
                    <ul id="ulmes" style="border: 0px;" class="dropdown-menu dm-icon w-100">
                        <li><a id="li1"><i class="fa fa-envelope"></i> Messages </a></li>
                        <li><a id="li2"><i class="fa fa-users"></i> Group </a></li>
                    </ul>            
               </div> 
               </div> 
               
             	<div style="" class="p-16">
               		<input type="" style="height:2px; border:none; background: transparent  ">         
            	</div> 
            
            <div class="list-group lg-alt">
           <div style= "height:100px; "> 
            <div class="scroll-box thin" id="Onlinelist_body" style= "height:575px;overflow-y: auto;" >
            	<c:forEach var="x" items="${UserOnlineList}">
            		<c:choose>
	            		<c:when test="${x.toString() == Owner_chat_id}">
	            		</c:when>
	            		<c:otherwise>
		            		<a style="transition:all .6s ease" class="list-group-item media" id="${x.toString()}" name = "userlist">
			                    <div class="slv-avatar pull-left">
			                        <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar">
			                    </div>
			                    <div class="media-body">
			                        <div class="list-group-item-heading"><c:out value="${x.toString()}"></c:out></div>
			                        <small class="list-group-item-text c-gray">online</small>
			                        <span style="float: right" class="badge badge-danger float-right">1</span>
			                    </div>
			                </a>
	            		</c:otherwise>
            		</c:choose>
            	</c:forEach>
            	
                </div>
            </div>
            </div>
        </div>       
        
        <input type = "hidden" value ="${linkfeed}" id = "linkfeed"/>
        <div id="chat_body" style= "height:100%;">
        <div class="ms-body" style= "height:750px;"> 
        		<div class="visible-xs" id="ms-menu-trigger">
                    <i id="abc" class="fa fa-bars"></i>
                </div> 
            <div id="aabb" class="action-header clearfix"> 
            
            <div class="visible-xs" id="ms-menu-trigger">
                    <i class="fa fa-bars"></i>
                </div> 
                
                <c:choose>
                	<c:when test="${linkfeed == 1}">
                		<div class="pull-left hidden-xs">                 
		                    <div class="lv-avatar pull-left">
		                         <img src="${Reciever_pro_img}" alt="" class="circle img-avatar m-r-10 crop-image" id="reciever_avatar">&nbsp;&nbsp;
		                    </div>
                    		<span id = "reciever_id"></span><input type="hidden" id = "reciever_id_hid" value ="${reciever_id}" /><input type="hidden" id = "Chattype" value="p"/>
                    		<input type="hidden" id = "reciever_id_hid" value ="${reciever_id}" /><input type="hidden" id = "Searchtype" value="p"/>
                		</div>
                	</c:when>
                	<c:otherwise>
                		<div class="pull-left hidden-xs">                 
		                    <div class="lv-avatar pull-left">
		                         <img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar m-r-10 crop-image" id="reciever_avatar">&nbsp;
		                    	                     
                    		<span id = "reciever_id"></span> 
                    		<input type="hidden" id = "reciever_id_hid" value ="" /><input type="hidden" id="Chattype" value = "p">
                    		<input type="hidden" id = "Searchtype" value="p"/> 
                    		</div>
                		</div> 
                	</c:otherwise>
                </c:choose>
                <div id="modalrespon">
                <div data-toggle="modal" data-target="#Modalgroupsetting" class="icon-b circle" id="groupsetting" role="button" style="float:right;">
                <a class=""> 
                <i style="transition:all .6s ease;" class="fa fa-cog"></i></a> 
                </div>
                </div>
               	
                <div style="position: absolute; display: inline;">
                <div id="searchchatdata">

				<input id="findmessageinchat" type="text" class="form-control circle" placeholder="&#xF002; Search" style="font-family:sans-serif, FontAwesome" autocomplete = "off">
				<i role="button" id="nextfoundmessagebtn" style="position: relative; bottom:33px" class="arrowsearch arrowup"></i>
				<i role="button" id="previosfoundmessagebtn" style="position: relative;  bottom:22px;" class="arrowsearch arrowdown"></i>
				<p style="position: absolute; left:15px; top:40px;">คำที่ <span id ="CurrentResult" value = "0">0</span></p>
				<p style="position: absolute; left:70px; top:40px;">จาก <span id ="AllResult" value= "0">0</span> ข้อความ</p>

				</div>
				</div>
		 	<div id="modalrespon">
                <div class="icon-b circle gradient-animation-bt" id="searchinchat" role="button" style="float: right; color: rgb(255, 255, 255);">
                <i style="transition: all 0.6s ease 0s; color: rgb(255, 255, 255);" class="fa fa-search" aria-hidden="true"></i>
                </div>

                <div class="icon-b circle" role="button" style="float:right;" data-toggle="modal" data-target="#Modalgroupbar" id = "filemenu">
                <a class="" >
                <i style="transition:all .6s ease;" class="fa fa-bars"></i></a>  
                </div>
                
                <div data-toggle="modal" data-target="#Modalusersetting" class="icon-b circle" id="groupusersetting" role="button" style="float:right;">
                <a class="">
                <i style="transition:all .6s ease;" class="fa fa-user-plus"></i></a>  
                </div> 
			</div>
              
            </div>
            <div style= "height:300px;">
            <div style="height:300px;">
            <c:set var="chat_owner_id" value ="${Owner_chat_id}"></c:set>
    		<div class="scroll-box" id="message_body" style= "height: 590px;overflow-y: auto;"> 
    			<c:choose>
    				<c:when test="${linkfeed == '1'}" >
    				
    					<c:forEach var="item" items="${message}">
    						<c:choose>
    							<c:when test="${item.Sender_id.toLowerCase() == Owner_chat_id.toLowerCase() }">
    								<div class="message-feed right" >
    									<div class="pull-right">
    										<c:choose>
    											<c:when test="${Userpath != null}">
    												<img src="${Userpath}" alt="" class="circle img-avatar">
    											</c:when>
    											<c:otherwise>
    												<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar">
    											</c:otherwise>
    										</c:choose>    									
    									<div>
	    									<c:choose>
	    										<c:when test="${item.Reciever_read_status == '1' }">
	    											<i style="color: #E1E5EC; padding-top: 15px; float:left" class="fa fa-check"></i>
	    										</c:when>
	    									</c:choose>
    									</div>
    									</div>
    									<div class="media-body">
    										<div class="circle chat-right" id="${item.Message_id}">  
    											<c:out value="${item.Message_text}"></c:out>
    										 </div>
    										 <small class="mf-date"><i class="fa fa-clock-o"></i><c:out value="${item.Chat_time}"></c:out></small>
    									</div>
    								</div>
    							</c:when>
    							<c:otherwise>
    								<div class="message-feed media">
										<div class="pull-left">
										<c:choose>
											<c:when test="${Reciever_pro_img != null}">
												<img src="${Reciever_pro_img}" alt="" class="circle img-avatar">
											</c:when>
											<c:otherwise>
												<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar">
											</c:otherwise>
										</c:choose>				
										</div>
										<div class="media-body">
										<div class="circle chat-left">
											<c:out value="${item.Message_text}"></c:out>									
										</div>
										<small class="mf-date"><i class="fa fa-clock-o"></i> <c:out value="${item.Chat_time}"></c:out></small> 
										 	
										</div>
									</div>									
    							</c:otherwise>
    						</c:choose>
    					</c:forEach>
    				</div>
    				</c:when>
    				<c:when test="${linkfeed != '1' || linkfeed == null}">
					</div>
    				<div class="cover-bar"></div>
    				
				                    <div id="bb" class="bb">
				                    <i style="font-size: 150px;" class="fa fa-comments colorCM"></i><br><br><br>
				                    <p>เริ่มการแชท!</p> 
				           			</div> 
    				</c:when>
    			</c:choose>
    		</div>

            <div class="msb-reply">
           <div class="bs-container"> 
          <div id="btnrotate" class="button circle">+</div>
		      <div id="message-box" class="message">
		      	<div class="emoji-panel">
		        <textarea id="Message_text" style="background-color:#E1E5EC; height:45px; white-space: pre-line; outline: none; outline-style: none; outline-offset: 0;" placeholder="Message" contenteditable="true"></textarea>
		        <button id="emoji-picker" style="position:absolute; line-height:45px; font-size:22px;background-color: none;
		        border-radius:50%; width:45px; height:45px; left:15px; top:12px; transform-origin: -60px 0px; transition:all .7s ease; outline: none; outline-style: none; outline-offset: 0; " 
		        class="buttonemoji circle noHover">
		        <i style="color: black; transition:all .6s ease;" class="fa fa-smile-o"></i>
		        </button>
		        </div>

		        <button id="SendButton" style=" position:absolute; line-height:45px; font-size:22px;background-color: none;
		        border-radius:50%; width:45px; height:45px; left:15px; top:12px; transform-origin: -60px 0px; transition:all .7s ease; outline: none; outline-style: none; outline-offset: 0;" 
		        class="buttonemoji circle">
		        <i class="fa fa-send"></i>
		        </button>
		      </div>
		      
		      <div class="tools">
		        <div class="icon-b circle" id="stk" role="button"><i style="transition:all .6s ease;" class="fa fa-sticky-note-o"></i></div>
		        <div class="icon-b circle">	
			        <form id = "imgform" enctype="multipart/form-data" method="post">
							        <input type="hidden" name="userUploadId" value="-">
									<input type="hidden" name="fileUploadSize" value="" id="sizes">
									<input type="hidden" name="userUploadCreate" value="${Owner_chat_id}"> 
									<input type="hidden" id ="reciever_id_hid2" name = "reciever_id_hid2" value ="${reciever_id}"/>
								 <label class="file_upload">
								  	<input style="display:none;" type="file" name="fileUpload" id="myfilee">
										<i role="button" class="fa fa-image" aria-hidden="true" style="position: absolute; position:relative;"></i>
								 </label>
					</form>
				   </div>
				   <div class="icon-b circle">	   
			        <form id = "fileform" enctype="multipart/form-data" method="post">
							        <input type="hidden" name="userUploadId" value="${Owner_chat_id}">
									<input type="hidden" name="fileUploadSize" value="" id="size">
									<input type="hidden" name="userUploadCreate" value="${Owner_chat_id}"> 
									<input type="hidden" id ="reciever_id_hid3" name = "reciever_id_hid3" value ="${reciever_id}"/>
								 
								 <label class="file_upload">
								  	<input style="display:none;" type="file" name="fileUpload" id="myfilefile">
										<i role="button" class="fa fa-paperclip" aria-hidden="true" style="position: absolute; position:relative;"></i>
								 </label>
					</form>
				   </div> 
	        </div>
	        </div>
	        <div class="intercom-composer-popover intercom-composer-emoji-popover emoDBW" style="" id="Emoji">
		        <div class="intercom-emoji-picker"> 
		        <div class="intercom-composer-popover-header">
		        <p style="padding-top: 15px;">EMOJI</p></div>
		        <div class="intercom-composer-popover-body-container">
		        <div class="scroll-box intercom-composer-popover-body">
		        <div class="intercom-emoji-picker-groups">
		        <div class="intercom-emoji-picker-group">
		        <div class="intercom-emoji-picker-group-title">Hand</div>
		        <span id="x1F600;" class="intercom-emoji-picker-emoji" title="">😀</span>
		        <span id="x1F44D;"class="intercom-emoji-picker-emoji" title="">👍</span>
		        <span id="x1F44E;" class="intercom-emoji-picker-emoji" title="">👎</span>
		        <span id="x1F44F;" class="intercom-emoji-picker-emoji" title="">👏</span>
		        <span id="x1F91D;" class="intercom-emoji-picker-emoji" title="">🤝</span>
		        <span id="x1F44A;" class="intercom-emoji-picker-emoji" title="">👊</span>
		        <span id="x270C;" class="intercom-emoji-picker-emoji" title="">✌️</span>
		        <span id="x1F44B;" class="intercom-emoji-picker-emoji" title="">👋</span>
		        <span id="x1F91F;" class="intercom-emoji-picker-emoji" title="">🤟</span>
		        <span id="x1F919;" class="intercom-emoji-picker-emoji" title="">🤙</span>
		        <span id="x1F4AA;" class="intercom-emoji-picker-emoji" title="">💪</span>
		        <span id="x1F64F;" class="intercom-emoji-picker-emoji" title="">🙏</span>
		        <div class="intercom-emoji-picker-group">
		        <div class="intercom-emoji-picker-group-title">People</div>
		        <span id="x1F604;" class="intercom-emoji-picker-emoji" title="smile">😄</span>
		        <span id="x1F603;" class="intercom-emoji-picker-emoji" title="smiley">😃</span>
		        <span id="x1F60A;" class="intercom-emoji-picker-emoji" title="blush">😊</span>
		        <span id="x1F609;" class="intercom-emoji-picker-emoji" title="wink">😉</span>
		        <span id="x1F60D;" class="intercom-emoji-picker-emoji" title="heart_eyes">😍</span>
		        <span id="x1F618;" class="intercom-emoji-picker-emoji" title="kissing_heart">😘</span>
		        <span id="x1F61A;" class="intercom-emoji-picker-emoji" title="kissing_closed_eyes">😚</span>
		        <span id="x1F617;" class="intercom-emoji-picker-emoji" title="kissing">😗</span>
		        <span id="x1F619;" class="intercom-emoji-picker-emoji" title="kissing_smiling_eyes">😙</span>
		        <span id="x1F61C;" class="intercom-emoji-picker-emoji" title="stuck_out_tongue_winking_eye">😜</span>
		        <span id="x1F61D;" class="intercom-emoji-picker-emoji" title="stuck_out_tongue_closed_eyes">😝</span>
		        <span id="x1F61B;" class="intercom-emoji-picker-emoji" title="stuck_out_tongue">😛</span>
		        <span id="x1F633;" class="intercom-emoji-picker-emoji" title="flushed">😳</span>
		        <span id="x1F601;" class="intercom-emoji-picker-emoji" title="grin">😁</span>
		        <span id="x1F614;" class="intercom-emoji-picker-emoji" title="pensive">😔</span>
		        <span id="x1F60C;" class="intercom-emoji-picker-emoji" title="relieved">😌</span>
		        <span id="x1F612;" class="intercom-emoji-picker-emoji" title="unamused">😒</span>
		        <span id="x1F61E;" class="intercom-emoji-picker-emoji" title="disappointed">😞</span>
		        <span id="x1F623;" class="intercom-emoji-picker-emoji" title="persevere">😣</span>
		        <span id="x1F622;" class="intercom-emoji-picker-emoji" title="cry">😢</span>
		        <span id="x1F602;" class="intercom-emoji-picker-emoji" title="joy">😂</span>
		        <span id="x1F62D;" class="intercom-emoji-picker-emoji" title="sob">😭</span>
		        <span id="x1F62A;" class="intercom-emoji-picker-emoji" title="sleepy">😪</span>
		        <span id="x1F625;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">😥</span>
		        <span id="x1F630;" class="intercom-emoji-picker-emoji" title="cold_sweat">😰</span>
		        <span id="x1F97A;" class="intercom-emoji-picker-emoji" title="pensive">🥺</span>
		        <span id="x1F621;" class="intercom-emoji-picker-emoji" title="pensive">😡</span>
		        <span id="x1F92C;" class="intercom-emoji-picker-emoji" title="relieved">🤬</span>
		        <span id="x1F92F;" class="intercom-emoji-picker-emoji" title="unamused">🤯</span>
		        <span id="x1F976;" class="intercom-emoji-picker-emoji" title="disappointed">🥶</span>
		        <span id="x1F975;" class="intercom-emoji-picker-emoji" title="persevere">🥵</span>
		        <span id="x1F631;" class="intercom-emoji-picker-emoji" title="cry">😱</span>
		        <span id="x1F917;" class="intercom-emoji-picker-emoji" title="joy">🤗</span>
		        <span id="x1F92B;" class="intercom-emoji-picker-emoji" title="sob">🤫</span>
		        <span id="x1F644;" class="intercom-emoji-picker-emoji" title="sleepy">🙄</span>
		        <span id="x1F632;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">😲</span>
		        <span id="x1F971;" class="intercom-emoji-picker-emoji" title="cold_sweat">🥱</span>
		        <span id="x1F634;" class="intercom-emoji-picker-emoji" title="joy">😴</span>
		        <span id="x1F974;" class="intercom-emoji-picker-emoji" title="sob">🥴</span>
		        <span id="x1F922;" class="intercom-emoji-picker-emoji" title="sleepy">🤢</span>
		        <span id="x1F92E;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">🤮</span>
		        <span id="x1F637;" class="intercom-emoji-picker-emoji" title="cold_sweat">😷</span>
		        <span id="x1F912;" class="intercom-emoji-picker-emoji" title="joy">🤒</span>
		        <span id="x1F911;" class="intercom-emoji-picker-emoji" title="sob">🤑</span>
		        <span id="x1F608;" class="intercom-emoji-picker-emoji" title="sleepy">😈</span>
		        <span id="x1F4A9;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">💩</span>
		        <span id="x1F47B;" class="intercom-emoji-picker-emoji" title="cold_sweat">👻</span>
		        <span id="x2620;" class="intercom-emoji-picker-emoji" title="joy">☠️</span>
		        <span id="x1F47D;" class="intercom-emoji-picker-emoji" title="sob">👽</span>
		        <span id="x1F647;" class="intercom-emoji-picker-emoji" title="sleepy">🙇‍♂️</span>
		        <span id="x1F481;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">💁‍♀️</span>
		        <span id="x1F645;" class="intercom-emoji-picker-emoji" title="cold_sweat">🙅‍♂️</span>
		        <span id="x1F64B;" class="intercom-emoji-picker-emoji" title="joy">🙋</span>
		        <span id="x1F9CF;" class="intercom-emoji-picker-emoji" title="sob">🧏‍♀️</span>
		        <span id="x1F926;" class="intercom-emoji-picker-emoji" title="sleepy">🤦‍♂️</span>
		        <span id="x1F937;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">🤷</span>
		        <span id="x1F491;" class="intercom-emoji-picker-emoji" title="cold_sweat">👩‍❤️‍👨</span>
		        <span id="x1F469;" class="intercom-emoji-picker-emoji" title="joy">👩‍❤️‍👩</span>
		        <span id="x1F468;" class="intercom-emoji-picker-emoji" title="sob">👨‍❤️‍👨</span>
		        <span id="x1F496;" class="intercom-emoji-picker-emoji" title="sleepy">❤️</span>
		        <span id="x1F9E1;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">🧡</span>
		        <span id="x1F49B;" class="intercom-emoji-picker-emoji" title="cold_sweat">💛</span>
		        <span id="x1F49A;" class="intercom-emoji-picker-emoji" title="joy">💚</span>
		        <span id="x1F499;" class="intercom-emoji-picker-emoji" title="sob">💙</span>
		        <span id="x1F49C;" class="intercom-emoji-picker-emoji" title="sleepy">💜</span>
		        <span id="x1F5A4;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">🖤</span>
		        <span id="x1F90D;" class="intercom-emoji-picker-emoji" title="cold_sweat">🤍</span>
		        <span id="x1F90E;" class="intercom-emoji-picker-emoji" title="joy">🤎</span>
		        <span id="x1F494;" class="intercom-emoji-picker-emoji" title="sob">💔‍</span>
		        <span id="x1F493;" class="intercom-emoji-picker-emoji" title="sleepy">💓</span>
		        <span id="x1F495;" class="intercom-emoji-picker-emoji" title="disappointed_relieved">💕</span>
		        <span id="x1F49D;" class="intercom-emoji-picker-emoji" title="cold_sweat">💝</span> 
		        <span id="x1F497;" class="intercom-emoji-picker-emoji" title="joy">💗</span>
		        <span id="x1F49F;" class="intercom-emoji-picker-emoji" title="sob">💟</span>
		        <div class="intercom-emoji-picker-group-title">Weather</div>
		        <span id="x1F319;" class="intercom-emoji-picker-emoji" title="">🌙</span>
		        <span id="x2B50;" class="intercom-emoji-picker-emoji" title="">⭐</span>
		        <span id="x2728;" class="intercom-emoji-picker-emoji" title="">✨</span>
		        <span id="x26A1;" class="intercom-emoji-picker-emoji" title="">⚡</span>
		        <span id="x1F525;" class="intercom-emoji-picker-emoji" title="">🔥</span>
		        <span id="x1F32A;" class="intercom-emoji-picker-emoji" title="">🌪</span>
		        <span id="x1F308;" class="intercom-emoji-picker-emoji" title="">🌈</span>
		        <span id="x2600;" class="intercom-emoji-picker-emoji" title="">☀</span>
		        <span id="x1F324;" class="intercom-emoji-picker-emoji" title="">🌤</span>
		        <span id="x2601;" class="intercom-emoji-picker-emoji" title="">☁</span>
		        <span id="x1F326;" class="intercom-emoji-picker-emoji" title="">🌦</span> 
		        <span id="x1F327;" class="intercom-emoji-picker-emoji" title="">🌧</span>
		        <span id="x26C8;" class="intercom-emoji-picker-emoji" title="">⛈</span>
		        <span id="x1F328;" class="intercom-emoji-picker-emoji" title="">🌨</span>
		        <span id="x2744;" class="intercom-emoji-picker-emoji" title="">❄</span>
		        <span id="x2603;" class="intercom-emoji-picker-emoji" title="">☃</span>
		        <span id="x1F4A8;" class="intercom-emoji-picker-emoji" title="">💨</span>
		        <span id="x1F4A7;" class="intercom-emoji-picker-emoji" title="">💧</span>
		        <span id="x1F4A6;" class="intercom-emoji-picker-emoji" title="">💦</span>
		        <span id="x2614;" class="intercom-emoji-picker-emoji" title="">☔</span>
		        <span id="x2602;" class="intercom-emoji-picker-emoji" title="">☂</span>
		        <span id="x1F30A;" class="intercom-emoji-picker-emoji" title="">🌊</span>
		        <span id="x1F32B;" class="intercom-emoji-picker-emoji" title="">🌫</span>
		        </div></div></div></div></div></div><div class="intercom-composer-popover-caret"></div></div>
    			<div style="width:50px;"> 
    				<table id="sticker" class="emoDBW" enctype="multipart/form-data" method="post">
    				<tbody>
  					<tr class="1"> 
    				<td id="1"><div role="button"><img src="pages-back/chatbox/Stricker_path/1.png" style="height:80px; width:80px;"></div></td>
    				<td id="2"><div role="button"><img src="pages-back/chatbox/Stricker_path/2.png" style="height:80px; width:80px;"></div></td>
    				<td id="3"><div role="button"><img src="pages-back/chatbox/Stricker_path/3.png" style="height:80px; width:80px;"></div></td>
    				<td id="4"><div role="button"><img src="pages-back/chatbox/Stricker_path/4.png" style="height:80px; width:80px;"></div></td>
  					</tr>
  					<tr class="2">
    				<td id="5"><div role="button"><img src="pages-back/chatbox/Stricker_path/5.png" style="height:80px; width:80px;"></div></td>
    				<td id="6"><div role="button"><img src="pages-back/chatbox/Stricker_path/6.png" style="height:80px; width:80px;"></div></td>
    				<td id="7"><div role="button"><img src="pages-back/chatbox/Stricker_path/7.png" style="height:80px; width:80px;"></div></td>
    				<td id="8"><div role="button"><img src="pages-back/chatbox/Stricker_path/8.png" style="height:80px; width:80px;"></div></td>
  					</tr>
  					<tr class="3">
    				<td id="9"><div role="button"><img src="pages-back/chatbox/Stricker_path/9.png" style="height:80px; width:80px;"></div></td>
    				<td id="10"><div role="button"><img src="pages-back/chatbox/Stricker_path/10.png" style="height:80px; width:80px;"></div></td>
    				<td id="11"><div role="button"><img src="pages-back/chatbox/Stricker_path/11.png" style="height:80px; width:80px;"></div></td>
    				<td id="12"><div role="button"><img src="pages-back/chatbox/Stricker_path/12.png" style="height:80px; width:80px;"></div></td>
  					</tr>
  					</tbody>
  					</table>
  				</div>
  				</div>
	    </div>
	</div>
	</div>
	</div>	
	</div>
	 </div>
        </div>
       <div class="modal fade" id="exampleModalvid" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabedlvid" aria-hidden="true" style="z-index:99999;" >
        <a href="#close"  title="close" class="close" data-dismiss="modal"     aria-hidden="true" id="close">x</a>
		<div class="modal-dialog" role="document" style=" width:200%; height:90%; position: absolute;left: 50%;top: 50%;transform: translate(-50%, -50%);">      
		 <video id="watchvid" style="width:200%; height:90%; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);" controls autoplay> </video>     
		</div>
		</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog" role="document">
				           <form id = "creategroupform" enctype="multipart/form-data" method="post">
				               <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
				                <div class="modal-body p-0 row">
				                    <div style="padding-right: 0px;" class="details col-12 col-lg-12">
									<input type="hidden" id = "selectuser" name = "selectuser" />
				                   <h4><center>CREATE NEW GROUP</center></h4>  
				                        <div class="" >	
			        			
							        <input type="hidden" name="userUploadId" value="${Owner_chat_id}">
									<input type="hidden" name="fileUploadSize" value="" id="sizee">
									<input type="hidden" name="userUploadCreate" value="${Owner_chat_id}"> 
									<input type="hidden" id ="reciever_id_hid4" name = "reciever_id_hid4" value ="${reciever_id}"/>
								<div class="">
								 <label class="file_upload"> 
								  	<input style="display:none;" type="file" name="fileUpload" id="myfilegroup"> 
								  	 <img style="" class="circleimg crop-image" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id ="showgroupimg">	   
								 </label> 
								</div>
							   </div>
							   <div> 
							   <input name="groupname" style="width: 70%; margin: 0 auto; margin-top:5px; border: none; border-radius: .50rem !important;" type="text" class="form-control" placeholder="group name" autocomplete="off"> 
							   </div>
							   <div style="">
							   <input name="groupdescription" style="width: 70%; margin: 0 auto; margin-top:5px; border: none; border-radius: .50rem !important; " type="text" class="form-control" placeholder="description" autocomplete="off">
							   </div> 
							   <input id="searchtext" type="text" class="form-control" placeholder="&#xF002; Search" style="font-family:sans-serif, FontAwesome; width: 60%; margin-left:70px; margin-top:7px; float:left; margin-right: 10px; border: none; border-radius: .50rem !important;" autocomplete="off">
							   <select name ="sortuserdepart" id ="sortuserdepart" class="selectbox sel" style="margin-top:7px; border: none; padding:6px; border-radius: .50rem !important; height: 32px;">
							   	<option value ="all">ALL</option>  
							   <c:forEach var="de" items="${alldepartment }"> 
							   		<option value ="${de.id}">${de.id}</option> 
							   </c:forEach> 
							   </select>   
							   			<p  style="position: relative; dispay:inline; margin-bottom: 1px;">selected</p>	
				                       <div class="scroll-box thin scbox" id = "selectedlist" >  
				                          </div> 
				                          <p style="margin-bottom: 2px; margin-top: 10px;">user</p>	 
				                          <div class="scroll-box thin scbox" id="useridlist"> 
				                        <c:forEach var= "userenable" items="${alluserenable}">
				                        <c:choose>
				                        	<c:when test="${userenable.id != Owner_chat_id}">
						                        	 <div class="list-group-item media listS" id="UserTest1" name="userlist"> 
							                    <div class="lv-avatar pull-left">
							                    <c:choose>
							                    	<c:when test="${userenable.path == null || usereanble.path == ''}">
							                    		<img src="/pages-back/img/profile2.png" alt="" class="circle img-avatar crop-image">
							                    	</c:when>
							                    	<c:otherwise>
							                    	 	<img src="${userenable.path}" alt="" class="circle img-avatar crop-image">
							                    	</c:otherwise>
							                    </c:choose>
							                       
							                    </div>
							                    <div class="media-body" style=""> 
							                        <span class="list-group-item-heading">${userenable.name}</span> 
							                        <small class="list-group-item-text c-gray"> : ${userenable.department_id}</small>  
													<span style="float: right;" class="float-right">
													<c:choose>
							                    	<c:when test="${userenable.path == null || usereanble.path == ''}">
													<input type ="checkbox" value ="${userenable.id }" data-name-depart = "${userenable.name}:${userenable.department_id}"name ="checkboxuser" id = "dd${userenable.id}"/> 
													</c:when>
							                    	<c:otherwise>
							                    	<input type ="checkbox" value ="${userenable.id }" data-name-depart = "${userenable.name}:${userenable.department_id}"name ="checkboxuser" id = "${userenable.path}"/> 
							                    	</c:otherwise>
							                    	</c:choose>
													</span>
							                    </div>
			              					  	</div>			                    
				                        	</c:when> 
				                        </c:choose>   
				                        </c:forEach>
				                          </div>  		                             
				                    </div>  
									<button id="creategroupsubmitbtn" type="button" class="btn btn-default btnmodal btnwhite" style="width:100%; position: relative; margin-top:40px; border-radius: .50rem !important; color: white; margin-bottom:15px" >Done</button>
				                </div>
				                </form>
				                </div>
				                </div>
				               <div class="modal fade" id="Modalusersetting" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog" role="document">
				           <form id = "creategroupform" enctype="multipart/form-data" method="post">
				                <div class="modal-body p-0 row" style="width:700px; position:relative; right:15%;"> 
				                <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
				                   <center><h3 style="padding-top:10px;">USER MANAGEMENT</h3></center> 
				                    <div class="details col-12 col-lg-6">
				                    <p style="margin-bottom: 5px; margin-top: 10px !important;">members</p>
				                    <input id="searchmymembertext" type="text" class="form-control" placeholder="&#xF002; Search" style="font-family:sans-serif, FontAwesome; width: 100%; margin-bottom:20px; border: none; border-radius: .70rem !important; display:inline;" autocomplete="off"> 
				                       <div class="scroll-box thin scbox" id = "current_member_list" style= "posution:relative; height:80%; overflow-y: auto; position: relative; dispay:inline; border-radius: .90rem !important; background-color:white;" > 
				                       
				                       </div>
				                    </div>
				                    <div class="details col-12 col-lg-6">
				                    <p style="margin-bottom: 5px; margin-top: 10px;">user</p>	
				                       <input id="searchmembertext" type="text" class="form-control" placeholder="&#xF002; Search" style="font-family:sans-serif, FontAwesome; width: 82%; border: none; border-radius: .70rem !important; margin-right: 10px; display:inline; margin-bottom:20px;" autocomplete="off">
									   <select name ="sortmemberdepart" id ="sortmemberdepart" class="selectbox sel" style="border: none; border-radius: .70rem !important; height: 33px; padding-top:6px; float:right; margin-bottom:20px;">   
									   	<option value ="all">ALL</option> 
									   <c:forEach var="de" items="${alldepartment }"> 
									   		<option value ="${de.id}">${de.id}</option>  
									   </c:forEach> 
									   </select>				                           
				                          <div class="scroll-box thin scbox" id="memberidlist" style= "height:80%; overflow-y: auto; position: relative; dispay:inline; border-radius: 1rem !important; background-color:white;  /* border: 1px solid; border-radius: .50rem !important; border-color: #eeeeee; */" > 
				                          </div>  		                             
				                    </div> 
				                </div>
				                </form>
				                </div>
				                </div>
				                <div class="modal fade" id="Modalgroupsetting" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				        <div class="modal-dialog" role="document">
				           
				                <div class="modal-body p-0 row"> 
				                <button type="button" id = "settingclose" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				                    <div style="padding-right: 0px; height: 50%" class="details col-12 col-lg-12">
									<input type="hidden" id = "selectuser" name = "selectuser" /> 
				                   <h3><center>GROUP SETTING</center></h3>     
			        			<form id = "changegroupimageform" enctype="multipart/form-data" method="post">
			        				<input type="hidden" name="group_chat_id" id = "group_chat_id"value = ""/>
							        <input type="hidden" name="userUploadId" value="${Owner_chat_id}">
									<input type="hidden" name="fileUploadSize" value="" id="sizeee">
									<input type="hidden" name="userUploadCreate" value="${Owner_chat_id}"> 
								 <c:choose>
								 	<c:when test="${linkfeed == 1}">
								 		<input type="hidden" id ="reciever_id_hid5" name = "reciever_id_hid5" value ="${reciever_id}"/>
								 	</c:when>
								 	<c:otherwise>
								 		<input type="hidden" id ="reciever_id_hid5" name = "reciever_id_hid5" value =""/>
								 	</c:otherwise>
								 </c:choose>

								<div class="">
								 <label class="file_upload"> 
								  	<input style="display:none;" type="file" name="fileUpload" id="chageimagefile"> 
								  	 <img style="margin-top: 20px;" class="circleimg crop-image" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" id ="showgroupimginput">	 
								 </label> 
								</div>							   
								
							   <div>  
							   <input name="groupname" id="groupnameinput" style="width: 80%; margin-right: 10px; margin-left: 50px; margin-top:20px; border: none; border-radius: .50rem !important; float:left" type="text" class="form-control" placeholder="name group"  autocomplete="off"> 
							   <span id=""><i style="transition:all .6s ease; margin: 0 auto; top:25px; position:relative" class="fa fa-pencil"></i></span></div><br>
							   <div style="">  
							   <input name="groupdescription" id="groupdescriptioninput" style="width: 80%; margin-right: 10px; margin-left: 50px; margin-top:5px; border: none; border-radius: .50rem !important; float:left" type="text" class="form-control" placeholder="description" autocomplete="off">
							    <span id=""><i style="transition:all .6s ease; margin: 0 auto; top:25px; position:relative" class="fa fa-pencil"></i></span></div><br><br><hr style="border: .5px solid #E1E5EC;">   
							    <button id = "Editgroup" type="submit" class="btn btn-default btnLeavemodal btnwhite" style="width:100%; position: relative; dispay:inline; border-radius: .50rem !important; color: white;  margin-top:10px;" >Save</button>
							    </form>
							    <div class="list-group-item media" style="border:0px">
				                    <div class="media-body">
				                        <div style="float: left;" class="list-group-item-heading">Add to favorites</div>
				                        <span style="float: right;" class="float-right">											
					                    	<input type="checkbox" class="switch" name ="favbox" id = "favbox"/> 
										</span>
				                    </div>
				                </div>					         		                             
				                    </div> 
				                    	<button id="leave" name="Swal" type="button" class="btn btn-default btnLeavemodal" style="width:100%; position: relative; dispay:inline; border-radius: .50rem !important;background: radial-gradient(circle, rgba(255,35,35,1) 48%, rgba(241,118,118,1) 100%); color: white;  margin-top:10px;" >Leave group</button>
				                    	<button id="delete" type="button" class="btn btn-default btnLeavemodal" style="width:100%; position: relative; dispay:inline; border-radius: .50rem !important;background: radial-gradient(circle, rgba(255,35,35,1) 48%, rgba(241,118,118,1) 100%); color: white;  margin-top:10px;" >Delete group</button>
				                	</div>
				               	 </div>
				                </div>
				                
				                
				                <div class="modal fade" id="Modalgroupbar" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" >
				        <div class="modal-dialog" role="document" >
				           <form id = "creategroupform" enctype="multipart/form-data" method="post">
				               <div class="modal-body p-0 row" style="width: 550px">
				                <h3>MY ALL FILE</h3> 
				                <div class="tabs">
								    <input type="radio" name="tab-btn" id="tab-btn-1" value="" checked>
								    <label class="tabbtn" for="tab-btn-1">Image</label>
								    <input type="radio" name="tab-btn" id="tab-btn-2" value="">
								    <label class="tabbtn" for="tab-btn-2">Video</label>
								    <input type="radio" name="tab-btn" id="tab-btn-3" value="">
								    <label class="tabbtn" for="tab-btn-3">File</label>
								
								    <div id="content-1">
								      <details open>
								    <summary></summary>
								    <div id = "img-file" class="scroll-box">
								      <div><a><img src="/upload/user/44_1454360.jpg"/></a></div>
								      <div><a><img src="/upload/user/77_134421984_213815716905495_4509452763573196924_n.jpg"/></a></div>
								      <div><a><img src="/upload/user/44_1454360.jpg"/></a></div>
								      <div><a><img src="/upload/user/44_1454360.jpg"/></a></div>
								      <div><a><img src="/upload/user/44_1454360.jpg"/></a></div>
								      <div><a><img src="/upload/user/44_1454360.jpg"/></a></div>
								    </div>
								  </details>
								    </div>
								    <div id="content-2">
								     <details open>
								    <summary></summary> 
								      <div id = "vid-file" class="scroll-box">
								      <div><a><video src="/upload/user/78_T.mp4"></video></a></div>
								      <div><a><video src="/upload/user/80_mylivewallpapers.com-Devil-Girl.mp4"></video></a></div>
									  <div><a><video src="/upload/user/78_T.mp4"></video></a></div>
								      <div><a><video src="/upload/user/80_mylivewallpapers.com-Devil-Girl.mp4"></video></a></div><div><a><video src="/upload/user/78_T.mp4"></video></a></div>
								      <div><a><video src="/upload/user/80_mylivewallpapers.com-Devil-Girl.mp4"></video></a></div>
								    </div>
								    </details>
								    </div>
								    <div id="content-3">
								    <details open>
								    <summary></summary>
								      <div id = "file-file" class="scroll-box">
								      <div><a></a></div>
								      <div><a></a></div>
								    </div>
								     </details>
								    </div>
								  </div>   
				              
				                </div> 
				                </form>      
				        </div>
				    </div>
				   
	</body>
 <script>
function EmojiToStringHEX(String){
	var Text  = String.replaceAll("😀", "&#"+"x1F600;")
    .replaceAll("👍", "&#"+"x1F44D;")
    .replaceAll("👎", "&#"+"x1F44E;")
    .replaceAll("👏", "&#"+"x1F44F;")
    .replaceAll("🤝", "&#"+"x1F91D;")
    .replaceAll("👊", "&#"+"x1F44A;")
    .replaceAll("✌️", "&#"+"x270C;")
    .replaceAll("👋", "&#"+"x1F44B;")
    .replaceAll("🤟", "&#"+"x1F91F;")
    .replaceAll("🤙", "&#"+"x1F919;")
    .replaceAll("💪", "&#"+"x1F4AA;")
    .replaceAll("🙏", "&#"+"x1F64F;")
    .replaceAll("😄", "&#"+"x1F604;")
    .replaceAll("😃", "&#"+"x1F603;")
    .replaceAll("😊", "&#"+"x1F60A;")
    .replaceAll("😉", "&#"+"x1F609;")
    .replaceAll("😍", "&#"+"x1F60D;")
    .replaceAll("😘", "&#"+"x1F618;")
    .replaceAll("😚", "&#"+"x1F61A;")
    .replaceAll("😗", "&#"+"x1F617;")
    .replaceAll("😙", "&#"+"x1F619;")
    .replaceAll("😜", "&#"+"x1F61C;")
    .replaceAll("😝", "&#"+"x1F61D;")
    .replaceAll("😛", "&#"+"x1F61B;")
    .replaceAll("😳", "&#"+"x1F633;")
	.replaceAll("😁", "&#"+"x1F601;")
	.replaceAll("😔", "&#"+"x1F614;")
	.replaceAll("😌", "&#"+"x1F60C;")
	.replaceAll("😒", "&#"+"x1F612;")
	.replaceAll("😞", "&#"+"x1F61E;")
	.replaceAll("😣", "&#"+"x1F623;")
	.replaceAll("😢", "&#"+"x1F622;")
	.replaceAll("😂", "&#"+"x1F602;")
	.replaceAll("😭", "&#"+"x1F62D;")
	.replaceAll("😪", "&#"+"x1F62A;")
	.replaceAll("😥", "&#"+"x1F625;")
	.replaceAll("😰", "&#"+"x1F630;")
	.replaceAll("🥺", "&#"+"x1F97A;")
	.replaceAll("😡", "&#"+"x1F621;")
	.replaceAll("🤬", "&#"+"x1F92C;")
	.replaceAll("🤯", "&#"+"x1F92F;")
	.replaceAll("🥶", "&#"+"x1F976;")
	.replaceAll("🥵", "&#"+"x1F975;")
	.replaceAll("😱", "&#"+"x1F631;")
	.replaceAll("🤗", "&#"+"x1F917;")
	.replaceAll("🤫", "&#"+"x1F92B;")
	.replaceAll("🙄", "&#"+"x1F644;")
	.replaceAll("😲", "&#"+"x1F632;")
	.replaceAll("🥱", "&#"+"x1F971;")
	.replaceAll("😴", "&#"+"x1F634;")
	.replaceAll("🥴", "&#"+"x1F974;")
	.replaceAll("🤢", "&#"+"x1F922;")
	.replaceAll("🤮", "&#"+"x1F92E;")
	.replaceAll("😷", "&#"+"x1F637;")
	.replaceAll("🤒", "&#"+"x1F912;")
	.replaceAll("🤑", "&#"+"x1F911;")
	.replaceAll("😈", "&#"+"x1F608;")
	.replaceAll("💩", "&#"+"x1F4A9;")
	.replaceAll("👻", "&#"+"x1F47B;")
	.replaceAll("☠️", "&#"+"x2620;")
	.replaceAll("👽", "&#"+"x1F47D;")
	.replaceAll("🙇‍♂️", "&#"+"x1F647;")
	.replaceAll("💁‍♀️", "&#"+"x1F481;")
	.replaceAll("🙅‍♂️", "&#"+"x1F645;")
	.replaceAll("🙋", "&#"+"x1F64B;")
	.replaceAll("🧏‍♀️", "&#"+"x1F9CF;")
	.replaceAll("🤦‍♂️", "&#"+"x1F926;")
	.replaceAll("🤷", "&#"+"x1F937;")
	.replaceAll("👩‍❤️‍👨", "&#"+"x1F491;")
	.replaceAll("👩‍❤️‍👩", "&#"+"x1F469;")
	.replaceAll("👨‍❤️‍👨", "&#"+"x1F468;")
	.replaceAll("❤️", "&#"+"x1F496;")
	.replaceAll("🧡", "&#"+"x1F9E1;")
	.replaceAll("💛", "&#"+"x1F49B;")
	.replaceAll("💚", "&#"+"x1F49A;")
	.replaceAll("💙", "&#"+"x1F499;")
	.replaceAll("💜", "&#"+"x1F49C;")
	.replaceAll("🖤", "&#"+"x1F5A4;")
	.replaceAll("🤍", "&#"+"x1F90D;")
	.replaceAll("🤎", "&#"+"x1F90E;")
	.replaceAll("💔", "&#"+"x1F494;")
	.replaceAll("💓", "&#"+"x1F493;")
	.replaceAll("💕", "&#"+"x1F495;")
	.replaceAll("💝", "&#"+"x1F49D;")
	.replaceAll("💗", "&#"+"x1F497;")
	.replaceAll("💟", "&#"+"x1F49F;")
	.replaceAll("🌙", "&#"+"x1F319;")
	.replaceAll("⭐", "&#"+"x2B50;")
	.replaceAll("✨", "&#"+"x2728;")
	.replaceAll("⚡", "&#"+"x26A1;")
	.replaceAll("🔥", "&#"+"x1F525;")
	.replaceAll("🌪", "&#"+"x1F32A;")
	.replaceAll("🌈", "&#"+"x1F308;")
	.replaceAll("☀", "&#"+"x2600;")
	.replaceAll("🌤", "&#"+"x1F324;")
	.replaceAll("☁", "&#"+"x2601;")
	.replaceAll("🌦", "&#"+"x1F326;")
	.replaceAll("🌧", "&#"+"x1F327;")
	.replaceAll("⛈", "&#"+"x26C8;")
	.replaceAll("🌨", "&#"+"x1F328;")
	.replaceAll("❄", "&#"+"x2744;")
	.replaceAll("☃", "&#"+"x2603;")
	.replaceAll("💨", "&#"+"x1F4A8;")
	.replaceAll("💧", "&#"+"x1F4A7;")
	.replaceAll("💦", "&#"+"x1F4A6;")
	.replaceAll("☔", "&#"+"x2614;")
	.replaceAll("☂", "&#"+"x2602;")
	.replaceAll("🌊", "&#"+"x1F30A;")
	.replaceAll("🌫", "&#"+"x1F32B;")
	.replaceAll("　", "&#"+"12288;");

	return Text;
}

function replaceShowMessage(text){
	return text.replaceAll("â€‡","<br/>");
}

$(function(){
    $('#exampleModalvid').modal({
        show: false
    }).on('hidden.bs.modal', function(){
        $(this).find('video')[0].pause();
    });
});

	
$(document).ready(function(){
	$('#sticker').hide();
	  $("#stk").click(function(){
	    	$("#sticker").fadeToggle('fast');
	  });  
});

var flag = 0;

$(".button").on('click',function(){
  if(flag == 0){
    on();
    flag = 1;
  }else{
    off();
    flag = 0;
  }
});

function on(){
  $('textarea').addClass('rotate-textarea');
  $('.button2').addClass('rotate-button2');
  $('.buttonemoji').addClass('rotate-buttonemoji');
  $('.button').addClass('button-rotate');
  $('.tools').addClass('tools-rotate');
}

function off(){
  $('textarea').removeClass('rotate-textarea');
  $('.button2').removeClass('rotate-button2');
  $('.buttonemoji').removeClass('rotate-buttonemoji');
  $('.button').removeClass('button-rotate');
  $('.tools').removeClass('tools-rotate');
}

function Gotofeed(){
	window.location.href = 'feedList_open';		 
}

$(function(){
   if ($('#ms-menu-trigger')[0]) {
        $('body').on('click', '#ms-menu-trigger', function() {
            $('.ms-menu').toggleClass('toggled'); 
        });
    }
});

$(document).on('click', '#ulmes > li > a', function(){
    $('#p1').html($(this).html());
});


 
</script>
<script type="text/javascript" src="pages-back/chatbox/Script/Chat_search_function.js"></script>


</html>
