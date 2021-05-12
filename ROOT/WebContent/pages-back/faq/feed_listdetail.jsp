<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-lg-12 col-xs-12 col-sm-12">
	<!-- <div class="portlet light bordered"> -->
	<div class="portlet-body">
		<div class="mt-element-list">




			<c:forEach var="fpost" items="${feedPostMerge}" varStatus="Count">
				<div class="row ">
					<div class="col-md-12 post ">
						<div class="cardpost1 ">
							<div class="container1 ">
								<div class="row "
									style="display: flex; align-items: center; padding-left: 1%">
									<div class="col-md-1 ">
										<c:choose>
											<c:when test="${fpost.path==null}">
												<div class="circular--portrait imgfeed crop-image">
													<img class="imgfeed crop-image"
														src="/pages-back/img/profile2.png">
												</div>
											</c:when>
											<c:otherwise>
												<div class="circular--portrait imgfeed1 crop-image">
													<img class="imgfeed crop-image" src="${fpost.path}" alt="">
												</div>
											</c:otherwise>
										</c:choose>
									</div>


									<div class="col-md-8  " style="margin-left: 2%">
										<span style="font-size: 14px; font-style:;"><strong>${fpost.name}</strong>
										</span><br> <span data-toggle="tooltip"
											title="${fpost.fullDate}" style="cursor: pointer;"
											style="font-size: 14px;">${fpost.lastPostTime} </span>

										<script>
									$(document).ready(function() {
										$('[data-toggle="tooltip"]').tooltip();
									});
								</script>
									</div>

									<div class="col-md-3  ">
										<div class="col-md-7 text-right ">
											<c:choose>
												<c:when test="${fpost.status_post==1}">

													<marquee data-toggle="tooltipRole" title="${fpost.role}"
														scrollamount="10" class="text-right" direction="down"
														style="height: 40px; width: 40px; cursor: pointer;">
														<i class="fa fa-star"
															style="font-size: 30px; color: #F7CA18"></i>
													</marquee>

													<script>
												$(document)
														.ready(
																function() {
																	$(
																			'[data-toggle="tooltipRole"]')
																			.tooltip();
																});
											</script>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>

										</div>
										<div class="col-md-5  ">
											<c:choose>
												<c:when test="${fpost.user_id==logonUser}">
													<div class="dropdown">
														<button class="btn dropdown-toggle" type="button"
															style="width: 30px; height: 30px; background-color: #fff"
															data-toggle="dropdown">
															<i class="fa fa-ellipsis-h" style="font-size: 30px"></i>
														</button>
														<ul class="dropdown-menu">
															<li><a data-toggle="modal" data-target="#myModal"
																onclick="getmessage('${fpost.feed_id}')">Edit</a> <input
																type="hidden" id="oldpost${fpost.feed_id}"
																value="${fpost.details}"> <input type="hidden"
																id="FeedIdPost${fpost.feed_id}" value="${fpost.feed_id}">
															</li>
															<li><a onclick="delete1('${fpost.feed_id}')">Delete</a></li>
														</ul>
													</div>
												</c:when>
												<c:otherwise>
												</c:otherwise>
											</c:choose>
										</div>

									</div>
								</div>

								<br>
								<c:choose>
									<c:when
										test="${fpost.backgroundType==null  && fpost.backgroundRGB==null }">
										<div class="row "
											style="padding-left: 2%; margin: 0; position: relative; color: black;">
											<span class=""
												style="font-size: 18px; overflow-wrap: break-word;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when test="${fpost.backgroundType==null}">
										<div class="row showinputbackground"
											style="background-color:${fpost.backgroundRGB};padding-left: 2%;  margin: 0; position: relative; color: black;">
											<span class=""
												style="font-size: 18px; overflow-wrap: break-word;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==1 || fpost.backgroundType=='1'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/1.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==2 || fpost.backgroundType=='2'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/2.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==3 || fpost.backgroundType=='3'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/3.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==4 || fpost.backgroundType=='4'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/4.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==5 || fpost.backgroundType=='5'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/5.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==6 || fpost.backgroundType=='6'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/6.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==7 || fpost.backgroundType=='7'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/7.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==8 || fpost.backgroundType=='8'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/8.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==9 || fpost.backgroundType=='9'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/9.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==10 || fpost.backgroundType=='10'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/10.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==11 || fpost.backgroundType=='11'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/11.jpg'); color: black">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when
										test="${fpost.backgroundType==12 || fpost.backgroundType=='12'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('/pages-back/faq/background/background_img/12.jpg');">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
									<c:when test="${fpost.backgroundType==99 || fpost.backgroundType=='99'}">
										<div class="row showinputbackground"
											style="padding-left: 2%; margin: 0; position: relative; background-image: url('${fpost.background_img_path}');">
											<span class=""
												style="font-size: 20px; font-family: Maledpan, Maitree;"
												id="linkifyJukgru">${fpost.details}</span>
										</div>
									</c:when>
								</c:choose>

								<c:choose>

									<c:when test="${fpost.path_url==null || fpost.path_url==''}">
										<c:choose>
											<c:when test="${fpost.upload_type == 'link'}">
												<br>
												<div class="row">
													<div class="col-md-12 text-center "
														style="margin-bottom: 2%; cursor: pointer;">
														<iframe width="80%" height="380px" src="${fpost.linkUrl}"
															allowfullscreen> </iframe>
													</div>
												</div>
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>

									</c:when>

									<c:when test="${fpost.upload_type == 'mp4'}">
										<br>
										<div class="row">
											<div class=" col-md-12 text-center"
												style="margin-bottom: 2%; cursor: pointer;">
												<video src="${fpost.path_url}" width="80%" height="80%"
													controls>
												</video>
											</div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="row">
											<div class=" col-md-12 text-center"
												style="margin-bottom: 2%; cursor: pointer;">
												<img id="data-enlargeable" src="${fpost.path_url}"
													style="width: 100%; max-width: 300px">
											</div>
										</div>

									</c:otherwise>
								</c:choose>
								<div class="row" id="nubLike${fpost.feed_id}"
									style="margin-left: 1%; margin-bottom: 2%; margin-top: 2%">
									<c:if test="${fpost.countLike>0}">
										<i id="" class="fa fa-thumbs-up fa-lg" style="color: blue;">
										</i> ${fpost.countLike} </c:if>
									<c:if test="${fpost.countLove>0}">
										<i id="" class="fa fa-gratipay fa-lg" style="color: #E7505A;"></i>
							${fpost.countLove} </c:if>
									<c:if test="${fpost.countHaha>0}">
										<i id="" class="em em-smile"> </i>
							${fpost.countHaha} </c:if>
									<c:if test="${fpost.countWow>0}">
										<i id="" class="em em-astonished"> </i>
							${fpost.countWow} </c:if>
									<c:if test="${fpost.countSad>0}">
										<i id="" class="em em-cry"> </i>
							${fpost.countSad} </c:if>
									<c:if test="${fpost.countAngry>0}">
										<i id="" class="em em-angry"> </i>
							${fpost.countAngry}</c:if>


								</div>

								<div class=" "
									style="height: 40px; display: flex; align-items: center; border-bottom: 1px solid #808080; border-top: 1px solid #808080;">
									<div class="col-md-6 text-center buttonaum"
										id="ida${fpost.feed_id}">

										<c:choose>
											<c:when test="${fpost.likeYang ==1}">

												<div id="id${fpost.feed_id}" class="Like"
													style="width: 150px">
													<c:choose>
														<c:when test="${fpost.reactType == '1'}">
															<div class="Like__link">
																<i style="width: 30px;"
																	onclick="like('${fpost.feed_id}', '1')" id="likebutton"
																	class="fa fa-thumbs-up fa-2x"></i> ถูกใจจริงๆ
															</div>
														</c:when>
														<c:when test="${fpost.reactType == '2'}">
															<div class="Like__link">
																<i style="width: 30px; color: #E7505A;"
																	onclick="like('${fpost.feed_id}', '2')" id="likebutton"
																	class="fa fa-gratipay fa-2x"></i> รักเลยค้าบ
															</div>
														</c:when>
														<c:when test="${fpost.reactType == '3'}">
															<div class="Like__link">
																<i style="width: 30px;"
																	onclick="like('${fpost.feed_id}', '3')" id="likebutton"
																	class="em em-smile"></i> ฮ่า ๆๆ
															</div>
														</c:when>
														<c:when test="${fpost.reactType == '4'}">
															<div class="Like__link">
																<i style="width: 30px;"
																	onclick="like('${fpost.feed_id}', '4')" id="likebutton"
																	class="em em-astonished"></i> ว้าวซ่าาาา
															</div>
														</c:when>
														<c:when test="${fpost.reactType == '5'}">
															<div class="Like__link">
																<i style="width: 30px;"
																	onclick="like('${fpost.feed_id}', '5')" id="likebutton"
																	class="em em-cry"></i> ร้องไห้แล้วนะ
															</div>
														</c:when>
														<c:when test="${fpost.reactType == '6'}">
															<div class="Like__link">
																<i style="width: 30px;"
																	onclick="like('${fpost.feed_id}', '6')" id="likebutton"
																	class="em em-angry"></i> <span>โกรธมากเลย</span>
															</div>
														</c:when>
													</c:choose>

													<div class="Emojis">
														<div class="Emoji Emoji--like"
															onclick="like('${fpost.feed_id}', '1')">
															<div class="icon icon--like"></div>
														</div>
														<div class="Emoji Emoji--love"
															onclick="like('${fpost.feed_id}', '2')">
															<div class="icon icon--heart"></div>
														</div>
														<div class="Emoji Emoji--haha"
															onclick="like('${fpost.feed_id}', '3')">
															<div class="icon icon--haha"></div>
														</div>
														<div class="Emoji Emoji--wow"
															onclick="like('${fpost.feed_id}', '4')">
															<div class="icon icon--wow"></div>
														</div>
														<div class="Emoji Emoji--sad"
															onclick="like('${fpost.feed_id}', '5')">
															<div class="icon icon--sad"></div>
														</div>
														<div class="Emoji Emoji--angry"
															onclick="like('${fpost.feed_id}', '6')">
															<div class="icon icon--angry"></div>
														</div>
													</div>
												</div>
											</c:when>
											<c:otherwise>
												<div id="id${fpost.feed_id}" class="Like"
													style="width: 150px">
													<div class="Like__link">
														<i style="width: 30px; color: black;"
															onclick="like('${fpost.feed_id}', '1')" id="Likenow"
															class="fa fa-thumbs-o-up fa-2x "></i> <span>กดไลค์ให้หน่อยจิ</span>
													</div>
													<div class="Emojis">
														<div class="Emoji Emoji--like"
															onclick="like('${fpost.feed_id}', '1')">
															<div class="icon icon--like"></div>
														</div>
														<div class="Emoji Emoji--love"
															onclick="like('${fpost.feed_id}', '2')">
															<div class="icon icon--heart"></div>
														</div>
														<div class="Emoji Emoji--haha"
															onclick="like('${fpost.feed_id}', '3')">
															<div class="icon icon--haha"></div>
														</div>
														<div class="Emoji Emoji--wow"
															onclick="like('${fpost.feed_id}', '4')">
															<div class="icon icon--wow"></div>
														</div>
														<div class="Emoji Emoji--sad"
															onclick="like('${fpost.feed_id}', '5')">
															<div class="icon icon--sad"></div>
														</div>
														<div class="Emoji Emoji--angry"
															onclick="like('${fpost.feed_id}', '6')">
															<div class="icon icon--angry"></div>
														</div>
													</div>
												</div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-md-6 text-center buttonaum ">
										<i onclick="setPositionText('commentNew${fpost.feed_id}')"
											class="fa fa-comment-o" aria-hidden="true"
											style="cursor: pointer;"> แสดงความคิดเห็น</i>
									</div>
								</div>

								<!-- ------------------------------- -->
								<div class="text-left" style="padding-top: 2%; margin-left: 3%">
									<button
										onclick="showcomment('myBtn+${fpost.feed_id}','more${fpost.feed_id}','dots${fpost.feed_id}')"
										id="myBtn+${fpost.feed_id}"
										style="font-size: 14px; color: #578EBE; background-color: Transparent; background-repeat: no-repeat; border: none; cursor: pointer; overflow: hidden; outline: none;">ดูความคิดเห็น</button>
								</div>

								<!--------------------------- CommentList Index 0--------------------------->
								<span id="dots${fpost.feed_id}" class="dotsza"> <c:forEach
										var="topcom" items="${topUserComment}" varStatus="Count">
										<c:choose>
											<c:when test="true">
												<c:choose>
													<c:when test="${fpost.feed_id==topcom.feed_id}">
														<div class="col-md-12 center showedit "
															style="border-bottom: 1px solid #D4CDCD; padding-top: 2%; padding-bottom: 2%">

															<div class="col-md-1  ">
																<c:choose>
																	<c:when test="${topcom.path==null}">
																		<div class="circular--portrait1 imgfeed1 crop-image">
																			<img class="imgfeed crop-image"
																				src="/pages-back/img/profile2.png">
																		</div>
																	</c:when>
																	<c:otherwise>
																		<div class="circular--portrait1 imgfeed1 crop-image">
																			<img src="${topcom.path}" alt="">
																		</div>
																	</c:otherwise>
																</c:choose>
															</div>
															<div class="col-md-11">
																<div class="col-md-10  " style="  word-break: break-all;">
																	<span style="font-size: 15px; font-style:;">
																		${topcom.name} </span><br>
																	<%-- <c:choose>
																		<c:when test="${topcom.sticker_part==null}">
																			<span id="aaaa" name="aaaa"
																				style="font-size: 15px; margin-left: 2%">
																				${topcom.details} </span>
																			<br>
																		</c:when>
																		<c:when
																			test="${topcom.sticker_part!=null && topcom.details==null}">
																			<br>
																			<img class="stkComment" src="${topcom.sticker_part}">
																		</c:when>
																		<c:otherwise>
																			<span id="aaaa" name="aaaa"
																				style="font-size: 15px; margin-left: 2%">
																				${topcom.details} </span>
																			<br>
																			<img class="stkComment" src="${topcom.sticker_part}">
																		</c:otherwise>
																	</c:choose> --%>
																	<c:choose>
																		<c:when
																			test="${topcom.details!=null && topcom.sticker_part==null && topcom.commentImage_path==null}">
																			<span style="font-size: 15px;">
																				<div style="margin-left: 1%" id="commentNewOne">${topcom.details}</div>
																			</span>
																			<br>
																		</c:when>
																		<c:when
																			test="${topcom.details==null && topcom.sticker_part!=null && topcom.commentImage_path==null}">
																			<br>
																			<img class="stkComment" src="${topcom.sticker_part}">
																		</c:when>
																		<c:when
																			test="${topcom.details!=null && topcom.sticker_part!=null && topcom.commentImage_path==null}">
																			<span style="font-size: 15px;">
																				<div style="margin-left: 1%" id="commentNewOne">${topcom.details}</div>
																			</span>
																			<br>
																			<img class="stkComment" src="${topcom.sticker_part}">
																		</c:when>
																		<c:when
																			test="${topcom.details==null && topcom.sticker_part==null && topcom.commentImage_path!=null}">
																			<br>
																			<img class="imageComment" id="data-enlargeable"
																				style="cursor: pointer;"
																				src="${topcom.commentImage_path}">
																		</c:when>
																		<c:when
																			test="${topcom.details!=null && topcom.sticker_part==null && topcom.commentImage_path!=null}">
																			<span style="font-size: 15px;">
																				<div style="margin-left: 1%" id="commentNewOne">${topcom.details}</div>
																			</span>
																			<br>
																			<img class="imageComment" id="data-enlargeable"
																				style="cursor: pointer;"
																				src="${topcom.commentImage_path}">
																		</c:when>
																		<c:otherwise>
																			<span id="aaaa" name="aaaa"
																				style="font-size: 15px; margin-left: 2%">
																				error</span>
																			<br>

																		</c:otherwise>
																	</c:choose>
																</div>
																<div class="col-md-2">
																	<c:choose>
																		<c:when test="${topcom.user_comment==logonUser}">
																			<div class="dropdown editcomment"
																				style="display: none">
																				<button class="btn dropdown-toggle" type="button"
																					style="background-color: #fff"
																					data-toggle="dropdown">
																					<i class="fa fa-ellipsis-h" style="font-size: 20px"></i>
																				</button>
																				<ul class="dropdown-menu">
																					<li><a data-toggle="modal"
																						data-target="#myModalComment"
																						onclick="getmessageCommentnew('${topcom.comment_id}')">Edit</a>
																						<input type="hidden"
																						id="oldcomment${topcom.comment_id}"
																						value="${topcom.details}"> <input
																						type="hidden" id="feedId${topcom.comment_id}"
																						value="${topcom.feed_id}"></li>
																					<li><a
																						onclick="deleteComment('${topcom.comment_id}','${topcom.feed_id}')">Delete</a></li>
																				</ul>
																			</div>
																		</c:when>
																		<c:otherwise>
																		</c:otherwise>
																	</c:choose>
																</div>


															</div>
														</div>

													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose>
											</c:when>
											<c:otherwise>
											</c:otherwise>
										</c:choose>

									</c:forEach></span>
								<!--------------------------- End CommentList Index 0--------------------------->
								<!--------------------------- CommentList Index All--------------------------->
								<div class="row ">
									<div id="aaaa" name="aaaa">
										<span id="more${fpost.feed_id}" class="eieiza"> <c:forEach
												var="com" items="${comment}" varStatus="Count">
												<c:choose>
													<c:when test="${fpost.feed_id==com.feed_id}">
														<div class="col-md-12 center showedit ">
															<div class="col-md-12"
																style="border-bottom: 1px solid #D4CDCD; padding-bottom: 1%; padding-top: 1%">
																<div class="col-md-1  ">
																	<c:choose>
																		<c:when test="${com.path==null}">
																			<div class="circular--portrait imgfeed crop-image">
																				<img class="imgfeed crop-image"
																					src="/pages-back/img/profile2.png">
																			</div>
																		</c:when>
																		<c:otherwise>
																			<div class="circular--portrait1 imgfeed1 crop-image">
																				<img src="${com.path}" alt="">
																			</div>
																		</c:otherwise>
																	</c:choose>
																</div>
																<div class="col-md-11">
																	<div class="col-md-10  ">
																		<span style="font-size: 15px;">${com.name} </span><br>
																		<!-- commentNewAll -->
																		<c:choose>
																			<c:when
																				test="${com.details!=null && com.sticker_part==null && com.commentImage_path==null}">
																				<span id="aaaa" name="aaaa" style="font-size: 15px;">
																					<div style="margin-left: 1%" id="commentNewAll">${com.details}</div>
																				</span>
																				<br>
																			</c:when>
																			<c:when
																				test="${com.details==null && com.sticker_part!=null && com.commentImage_path==null}">
																				<br>
																				<img class="stkComment" src="${com.sticker_part}">
																			</c:when>
																			<c:when
																				test="${com.details!=null && com.sticker_part!=null && com.commentImage_path==null}">
																				<span id="aaaa" name="aaaa" style="font-size: 15px;">
																					<div style="margin-left: 1%" id="commentNewAll">${com.details}</div>
																				</span>
																				<br>
																				<img class="stkComment" src="${com.sticker_part}">
																			</c:when>
																			<c:when
																				test="${com.details==null && com.sticker_part==null && com.commentImage_path!=null}">
																				<br>
																				<img class="imageComment" id="data-enlargeable"
																					style="cursor: pointer;"
																					src="${com.commentImage_path}">
																			</c:when>
																			<c:when
																				test="${com.details!=null && com.sticker_part==null && com.commentImage_path!=null}">
																				<span id="aaaa" name="aaaa" style="font-size: 15px;">
																					<div style="margin-left: 1%" id="commentNewAll">${com.details}</div>
																				</span>
																				<br>
																				<img class="imageComment" id="data-enlargeable"
																					style="cursor: pointer;"
																					src="${com.commentImage_path}">
																			</c:when>
																			<c:otherwise>
																				<span id="aaaa" name="aaaa"
																					style="font-size: 15px; margin-left: 2%">
																					error</span>
																				<br>

																			</c:otherwise>
																		</c:choose>
																	</div>

																	<div class="col-md-2   ">
																		<c:choose>
																			<c:when test="${com.user_comment==logonUser}">
																				<div class="dropdown editcomment"
																					style="display: none">
																					<button class="btn dropdown-toggle" type="button"
																						style="background-color: #FFF"
																						data-toggle="dropdown">
																						<i class="fa fa-ellipsis-h"
																							style="font-size: 20px"></i>
																					</button>
																					<ul class="dropdown-menu">
																						<li><a data-toggle="modal"
																							data-target="#myModalComment"
																							onclick="getmessageCommentnew('${com.comment_id}')">Edit</a>
																							<input type="hidden"
																							id="oldcomment${com.comment_id}"
																							value="${com.details}"> <input
																							type="hidden" id="feedId${com.comment_id}"
																							value="${com.feed_id}"></li>
																						<li><a
																							onclick="deleteComment('${com.comment_id}','${com.feed_id}')">Delete</a></li>
																						<li><a
																							onclick="test123('${com.comment_id}','${com.details}','${com.feed_id}')">test</a></li>
																					</ul>
																				</div>
																			</c:when>
																			<c:otherwise>
																			</c:otherwise>
																		</c:choose>
																	</div>
																</div>
															</div>
														</div>
													</c:when>
													<c:otherwise>

													</c:otherwise>
												</c:choose>

											</c:forEach>
										</span>
									</div>
									<!--------------------------- End CommentList Index All--------------------------->
									<div class="col-md-12 " style="margin-top: 2%;">
										<div class="col-md-1 " style="padding: 0;">
											<c:forEach var="fpostphoto" items="${userpath}"
												varStatus="Count">
												<c:choose>
													<c:when test="${fpostphoto.path==null}">
														<div class="circular--portrait imgfeed crop-image">
															<img class="imgfeed crop-image"
																src="/pages-back/img/profile2.png">
														</div>
													</c:when>
													<c:otherwise>
														<div class="">
															<img class="circular--portrait1 imgfeed1 crop-image"
																src="${fpostphoto.path}" alt="">
														</div>
													</c:otherwise>
												</c:choose>
											</c:forEach>

										</div>
										<div class="col-md-11 bordercoment "
											style="border-radius: 50px !important; margin-left: -1px; bottom:5px; padding-right:20px;">
											<div class="col-md-9" id="textcomment${fpost.feed_id}"
												style="padding: 0;">
												<textarea oninput="auto_grow(this)" class=" textareaComment " onkeypress=""
													id="commentNew${fpost.feed_id}" name="commentNew"
													placeholder="เขียนความคิดเห็น.."
													style="height: 40px; border-radius: 50px !important; overflow: hidden; margin-top: 2%; margin-bottom: 1.4%; line-height:1.2;"></textarea>
												<div id="JukGru${fpost.feed_id}"></div>
												<div id="imgPreview"></div>

											</div>
											<div id="image_frame"></div>
											            

											<!-- <form action="CommentImage1" id="comment_image" method="post"		
																			enctype="multipart/form-data">
												<input type="file" name="fileupload" required="required">
												<input type="submit" value="Upload">             
											</form> -->
											<form id="comment_image" method="POST"
												enctype="multipart/form-data">


												<%-- <div class="col-md-1 ">
													<a id="emo" class="   " style="width: 100%; height: 60px;"
														onclick="emoShowComment(${fpost.feed_id})"> <i
														class="fa fa-smile-o sendstyle " style="font-size: 30px"></i>
													</a>
													<div class="" id="emoShow">
														<div id="emoComment${fpost.feed_id}" class="text-center"
															style="z-index: 9999; display: none; position: absolute; overflow: auto; top: 20px; left: 20px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
															<table
																class="table table-striped table-condensed table-hover"
																id="table_id" style="margin: 0px">

																<tbody>
																	<tr class="E1">
																		<td class="text-center"><b id="emoji"
																			onclick="addEmoComment('&#128512;','commentNew${fpost.feed_id}')">&#128512;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128515;','commentNew${fpost.feed_id}')">&#128515;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128518;','commentNew${fpost.feed_id}')">&#128518;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128521;','commentNew${fpost.feed_id}')">&#128521;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128525;','commentNew${fpost.feed_id}')">&#128525;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128528;','commentNew${fpost.feed_id}')">&#128528;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128531;','commentNew${fpost.feed_id}')">&#128531;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128534;','commentNew${fpost.feed_id}')">&#128534;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128513;','commentNew${fpost.feed_id}')">&#128513;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128516;','commentNew${fpost.feed_id}')">&#128516;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128519;','commentNew${fpost.feed_id}')">&#128519;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128522;','commentNew${fpost.feed_id}')">&#128522;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128526;','commentNew${fpost.feed_id}')">&#128526;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128529;','commentNew${fpost.feed_id}')">&#128529;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128532;','commentNew${fpost.feed_id}')">&#128532;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128535;','commentNew${fpost.feed_id}')">&#128534;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128514;','commentNew${fpost.feed_id}')">&#128514;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128517;','commentNew${fpost.feed_id}')">&#128517;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128520;','commentNew${fpost.feed_id}')">&#128520;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128523;','commentNew${fpost.feed_id}')">&#128524;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128527;','commentNew${fpost.feed_id}')">&#128527;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128530;','commentNew${fpost.feed_id}')">&#128530;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128533;','commentNew${fpost.feed_id}')">&#128533;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128536;','commentNew${fpost.feed_id}')">&#128536;</b>

																			<b id="emoji"
																			onclick="addEmoComment('&#128537;','commentNew${fpost.feed_id}')">&#128537;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128538;','commentNew${fpost.feed_id}')">&#128538;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128539;','commentNew${fpost.feed_id}')">&#128539;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128540;','commentNew${fpost.feed_id}')">&#128540;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128541;','commentNew${fpost.feed_id}')">&#128541;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128542;','commentNew${fpost.feed_id}')">&#128542;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128543;','commentNew${fpost.feed_id}')">&#128543;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128544;','commentNew${fpost.feed_id}')">&#128544;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128545;','commentNew${fpost.feed_id}')">&#128545;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128546;','commentNew${fpost.feed_id}')">&#128546;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128547;','commentNew${fpost.feed_id}')">&#128547;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128548;','commentNew${fpost.feed_id}')">&#128548;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128549;','commentNew${fpost.feed_id}')">&#128549;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128550;','commentNew${fpost.feed_id}')">&#128550;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128551;','commentNew${fpost.feed_id}')">&#128551;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128552;','commentNew${fpost.feed_id}')">&#128552;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128553;','commentNew${fpost.feed_id}')">&#128553;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128554;','commentNew${fpost.feed_id}')">&#128554;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128555;','commentNew${fpost.feed_id}')">&#128555;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128556;','commentNew${fpost.feed_id}')">&#128556;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128557;','commentNew${fpost.feed_id}')">&#128557;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128558;','commentNew${fpost.feed_id}')">&#128558;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128559;','commentNew${fpost.feed_id}')">&#128559;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128560;','commentNew${fpost.feed_id}')">&#128560;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128561;','commentNew${fpost.feed_id}')">&#128561;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128562;','commentNew${fpost.feed_id}')">&#128562;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128563;','commentNew${fpost.feed_id}')">&#128563;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128564;','commentNew${fpost.feed_id}')">&#128564;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128565;','commentNew${fpost.feed_id}')">&#128565;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128566;','commentNew${fpost.feed_id}')">&#128566;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128567;','commentNew${fpost.feed_id}')">&#128567;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128580;','commentNew${fpost.feed_id}')">&#128580;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#128591;','commentNew${fpost.feed_id}')">&#128591;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129303;','commentNew${fpost.feed_id}')">&#129303;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129304;','commentNew${fpost.feed_id}')">&#129304;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129305;','commentNew${fpost.feed_id}')">&#129305;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129306;','commentNew${fpost.feed_id}')">&#129306;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129309;','commentNew${fpost.feed_id}')">&#129309;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129310;','commentNew${fpost.feed_id}')">&#129310;</b>
																			<b id="emoji"
																			onclick="addEmoComment('&#129311;','commentNew${fpost.feed_id}')">&#129311;</b>
																		</td>

																	</tr>
																</tbody>
															</table>
														</div>
													</div>
												</div>



												<div class="fileinput fileinput-new col-md-1 "
													style="padding-left: 2%;" data-provides="fileinput"
													id="picture${fpost.feed_id}">
													<div class="text-center ">
														<div class="fileinput-preview fileinput-exists thumbnail "
															style="width: 100%; height: 100%"></div>
													</div>

													<a><span class="default btn-file "
														onclick="hidestcker('${fpost.feed_id}')"> <span
															class="fileinput-new "><i style="font-size: 30px;"
																class="fa fa-picture-o  sendstyle"></i></span> <input
															type="hidden" value="" name="..."> <input
															type="file" name="fileUpload" id="myFile${fpost.feed_id}"
															value="">
													</span></a> <a onclick="remove('${fpost.feed_id}')"
														href="javascript:;" class="btn red fileinput-exists"
														data-dismiss="fileinput"> Remove </a>


												</div>




												<div class="col-md-1 " id="sticker${fpost.feed_id}"
													style="padding-left: 2%;">
													<div id="sticker2${fpost.feed_id}" class="text-center"
														style="display: none; position: absolute; overflow: auto; top: -300px; left: -70px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
														<table
															class="table table-striped table-condensed table-hover"
															id="table_id" style="margin: 0px">

															<tbody>
																<tr class="T1">
																	<td class="text-center"><img class="stk"
																		id="Photo1"
																		onclick="addstk('Photo1','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/1.png"> <img
																		class="stk" id="Photo4"
																		onclick="addstk('Photo4','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/4.png"> <img
																		class="stk" id="Photo7"
																		onclick="addstk('Photo7','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/7.png"> <img
																		class="stk" id="PhotoC1"
																		onclick="addstk('PhotoC1','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C1.png"> <img
																		class="stk" id="PhotoC4"
																		onclick="addstk('PhotoC4','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C4.png"> <img
																		class="stk" id="PhotoC7"
																		onclick="addstk('PhotoC7','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C7.png"> <img
																		class="stk" id="PhotoCa1"
																		onclick="addstk('PhotoCa1','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca1.png">
																		<img class="stk" id="PhotoCa4"
																		onclick="addstk('PhotoCa4','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca4.png">
																		<img class="stk" id="PhotoS4"
																		onclick="addstk('PhotoS4','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/S4.png"></td>

																	<td class="text-center"><img class="stk"
																		id="Photo2"
																		onclick="addstk('Photo2','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/2.png"> <img
																		class="stk" id="Photo5"
																		onclick="addstk('Photo5','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/5.png"> <img
																		class="stk" id="Photo8"
																		onclick="addstk('Photo8','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/8.png"> <img
																		class="stk" id="PhotoC2"
																		onclick="addstk('PhotoC2','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C2.png"> <img
																		class="stk" id="PhotoC5"
																		onclick="addstk('PhotoC5','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C5.png"> <img
																		class="stk" id="PhotoCa2"
																		onclick="addstk('PhotoCa2','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca2.png">
																		<img class="stk" id="PhotoCa5"
																		onclick="addstk('PhotoCa5','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca5.png">
																		<img class="stk" id="PhotoS2"
																		onclick="addstk('PhotoS2','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/S2.png"> <img
																		class="stk" id="PhotoS5"
																		onclick="addstk('PhotoS5','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/S5.png"></td>

																	<td class="text-center"><img class="stk"
																		id="Photo3"
																		onclick="addstk('Photo3','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/3.png"> <img
																		class="stk" id="Photo6"
																		onclick="addstk('Photo6','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/6.png"> <img
																		class="stk" id="Photo9"
																		onclick="addstk('Photo9','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/9.png"> <img
																		class="stk" id="PhotoC3"
																		onclick="addstk('PhotoC3','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C3.png"> <img
																		class="stk" id="PhotoC6"
																		onclick="addstk('PhotoC6','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/C6.png"> <img
																		class="stk" id="PhotoCa3"
																		onclick="addstk('PhotoCa3','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca3.png">
																		<img class="stk" id="PhotoCa6"
																		onclick="addstk('PhotoCa6','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/Ca6.png">
																		<img class="stk" id="PhotoS3"
																		onclick="addstk('PhotoS3','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/S3.png"> <img
																		class="stk" id="PhotoS6"
																		onclick="addstk('PhotoS6','${fpost.feed_id}')"
																		src="pages-back/faq/StrickerFeed_path/S6.png"></td>

																</tr>


															</tbody>
														</table>
													</div>


													<a id="sticker1${fpost.feed_id}" class="   "
														style="width: 100%; height: 60px;"
														onclick="stkShow(${fpost.feed_id})"> <i
														class="fa fa-sticky-note-o sendstyle "
														style="font-size: 30px"></i>
													</a>


													<input id="stickerId" type="hidden" value="${fpost.feed_id}"></input>
												</div>
												<div class="col-md-1 " style="padding: 0;">
													<button type="submit" value="post" id="testdata"
														onclick="addComment('${fpost.feed_id}',document.getElementById('commentNew${fpost.feed_id}').value,'more${fpost.feed_id}','dots${fpost.feed_id}')"
														style="width: 100%; border: none; background: none; outline: none;">
														<i class="  fa fa-send  sendstyle"
															style="font-size: 30px;"></i>
													</button>

												</div>
												 --%>
												<div class="col-md-3">
													<div class="row">
														<div class="col-md-3">

															<button class="btn iconcomment" onclick="emoShowComment(${fpost.feed_id})">
																<div
																	style="width: 25px; height: 25px; margin-top: 4px; margin-left: -8px">
																	<i class="fa fa-smile-o" style="font-size: 25px" ></i>
																</div>
															</button>

															<div class="" id="emoShow">
																<div id="emoComment${fpost.feed_id}" class="text-center"
																	style="z-index: 9999; display: none; position: absolute; overflow: auto; top: 20px; left: 20px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
																	<table
																		class="table table-striped table-condensed table-hover"
																		id="table_id" style="margin: 0px">

																		<tbody>
																			<tr class="E1">
																				<td class="text-center"><b id="emoji"
																					onclick="addEmoComment('&#128512;','commentNew${fpost.feed_id}')">&#128512;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128515;','commentNew${fpost.feed_id}')">&#128515;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128518;','commentNew${fpost.feed_id}')">&#128518;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128521;','commentNew${fpost.feed_id}')">&#128521;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128525;','commentNew${fpost.feed_id}')">&#128525;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128528;','commentNew${fpost.feed_id}')">&#128528;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128531;','commentNew${fpost.feed_id}')">&#128531;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128534;','commentNew${fpost.feed_id}')">&#128534;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128513;','commentNew${fpost.feed_id}')">&#128513;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128516;','commentNew${fpost.feed_id}')">&#128516;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128519;','commentNew${fpost.feed_id}')">&#128519;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128522;','commentNew${fpost.feed_id}')">&#128522;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128526;','commentNew${fpost.feed_id}')">&#128526;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128529;','commentNew${fpost.feed_id}')">&#128529;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128532;','commentNew${fpost.feed_id}')">&#128532;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128535;','commentNew${fpost.feed_id}')">&#128534;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128514;','commentNew${fpost.feed_id}')">&#128514;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128517;','commentNew${fpost.feed_id}')">&#128517;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128520;','commentNew${fpost.feed_id}')">&#128520;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128523;','commentNew${fpost.feed_id}')">&#128524;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128527;','commentNew${fpost.feed_id}')">&#128527;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128530;','commentNew${fpost.feed_id}')">&#128530;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128533;','commentNew${fpost.feed_id}')">&#128533;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128536;','commentNew${fpost.feed_id}')">&#128536;</b>

																					<b id="emoji"
																					onclick="addEmoComment('&#128537;','commentNew${fpost.feed_id}')">&#128537;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128538;','commentNew${fpost.feed_id}')">&#128538;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128539;','commentNew${fpost.feed_id}')">&#128539;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128540;','commentNew${fpost.feed_id}')">&#128540;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128541;','commentNew${fpost.feed_id}')">&#128541;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128542;','commentNew${fpost.feed_id}')">&#128542;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128543;','commentNew${fpost.feed_id}')">&#128543;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128544;','commentNew${fpost.feed_id}')">&#128544;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128545;','commentNew${fpost.feed_id}')">&#128545;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128546;','commentNew${fpost.feed_id}')">&#128546;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128547;','commentNew${fpost.feed_id}')">&#128547;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128548;','commentNew${fpost.feed_id}')">&#128548;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128549;','commentNew${fpost.feed_id}')">&#128549;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128550;','commentNew${fpost.feed_id}')">&#128550;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128551;','commentNew${fpost.feed_id}')">&#128551;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128552;','commentNew${fpost.feed_id}')">&#128552;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128553;','commentNew${fpost.feed_id}')">&#128553;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128554;','commentNew${fpost.feed_id}')">&#128554;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128555;','commentNew${fpost.feed_id}')">&#128555;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128556;','commentNew${fpost.feed_id}')">&#128556;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128557;','commentNew${fpost.feed_id}')">&#128557;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128558;','commentNew${fpost.feed_id}')">&#128558;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128559;','commentNew${fpost.feed_id}')">&#128559;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128560;','commentNew${fpost.feed_id}')">&#128560;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128561;','commentNew${fpost.feed_id}')">&#128561;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128562;','commentNew${fpost.feed_id}')">&#128562;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128563;','commentNew${fpost.feed_id}')">&#128563;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128564;','commentNew${fpost.feed_id}')">&#128564;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128565;','commentNew${fpost.feed_id}')">&#128565;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128566;','commentNew${fpost.feed_id}')">&#128566;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128567;','commentNew${fpost.feed_id}')">&#128567;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128580;','commentNew${fpost.feed_id}')">&#128580;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#128591;','commentNew${fpost.feed_id}')">&#128591;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129303;','commentNew${fpost.feed_id}')">&#129303;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129304;','commentNew${fpost.feed_id}')">&#129304;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129305;','commentNew${fpost.feed_id}')">&#129305;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129306;','commentNew${fpost.feed_id}')">&#129306;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129309;','commentNew${fpost.feed_id}')">&#129309;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129310;','commentNew${fpost.feed_id}')">&#129310;</b>
																					<b id="emoji"
																					onclick="addEmoComment('&#129311;','commentNew${fpost.feed_id}')">&#129311;</b>
																				</td>

																			</tr>
																		</tbody>
																	</table>
																</div>
															</div>
														</div>


														<div class="fileinput fileinput-new col-md-3"
															data-provides="fileinput" id="picture${fpost.feed_id}">

															<span class="default btn-file"
																onclick="hidestcker('${fpost.feed_id}')"> <span
																class="fileinput-new ">

																	<button class="btn iconcomment">
																		<div
																			style="width: 25px; height: 25px; margin-top: 4px; margin-left: -8px">
																			<i class="fa fa-picture-o" style="font-size: 20px"
																				onclick=""></i>
																		</div>
																	</button>


															</span> <input type="hidden" value="" name="..."> <input
																type="file" name="fileUpload"
																id="myFile${fpost.feed_id}" value=""
																onchange="setdisplayimage(${fpost.feed_id})">
															</span>
															
															
															<a onclick="remove('${fpost.feed_id}')" style="display: none; position: absolute; z-index:1; bottom: 115px; width:33px; height:33px;"    
																id="remove${fpost.feed_id}"
																href="javascript:;" class="btn red fileinput-exists btn-sm circle"
																data-dismiss="fileinput"><i class="fa fa-trash-o fa-lg"></i></a>

															<div style="position:relative; right:20px; top: 30px; width: 70px; "> 
															
															<div id="showImIn${fpost.feed_id}"
																style="height: 140px; display: none">

																<div
																	class="fileinput-preview fileinput-exists thumbnail "
																	id="ImageIn${fpost.feed_id}"
																	style=""></div>  


															</div>
															
															
															</div>
														



														</div>
														<div class="col-md-3" id="sticker${fpost.feed_id}">
															<div id="sticker2${fpost.feed_id}" class="text-center"
																style="display: none; position: absolute; overflow: auto; top: -300px; left: -70px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
																<table
																	class="table table-striped table-condensed table-hover"
																	id="table_id" style="margin: 0px">

																	<tbody>
																		<tr class="T1">
																			<td class="text-center"><img class="stk"
																				id="Photo1"
																				onclick="addstk('Photo1','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/1.png">
																				<img class="stk" id="Photo4"
																				onclick="addstk('Photo4','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/4.png">
																				<img class="stk" id="Photo7"
																				onclick="addstk('Photo7','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/7.png">
																				<img class="stk" id="PhotoC1"
																				onclick="addstk('PhotoC1','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C1.png">
																				<img class="stk" id="PhotoC4"
																				onclick="addstk('PhotoC4','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C4.png">
																				<img class="stk" id="PhotoC7"
																				onclick="addstk('PhotoC7','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C7.png">
																				<img class="stk" id="PhotoCa1"
																				onclick="addstk('PhotoCa1','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca1.png">
																				<img class="stk" id="PhotoCa4"
																				onclick="addstk('PhotoCa4','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca4.png">
																				<img class="stk" id="PhotoS4"
																				onclick="addstk('PhotoS4','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/S4.png"></td>

																			<td class="text-center"><img class="stk"
																				id="Photo2"
																				onclick="addstk('Photo2','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/2.png">
																				<img class="stk" id="Photo5"
																				onclick="addstk('Photo5','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/5.png">
																				<img class="stk" id="Photo8"
																				onclick="addstk('Photo8','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/8.png">
																				<img class="stk" id="PhotoC2"
																				onclick="addstk('PhotoC2','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C2.png">
																				<img class="stk" id="PhotoC5"
																				onclick="addstk('PhotoC5','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C5.png">
																				<img class="stk" id="PhotoCa2"
																				onclick="addstk('PhotoCa2','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca2.png">
																				<img class="stk" id="PhotoCa5"
																				onclick="addstk('PhotoCa5','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca5.png">
																				<img class="stk" id="PhotoS2"
																				onclick="addstk('PhotoS2','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/S2.png">
																				<img class="stk" id="PhotoS5"
																				onclick="addstk('PhotoS5','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/S5.png"></td>

																			<td class="text-center"><img class="stk"
																				id="Photo3"
																				onclick="addstk('Photo3','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/3.png">
																				<img class="stk" id="Photo6"
																				onclick="addstk('Photo6','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/6.png">
																				<img class="stk" id="Photo9"
																				onclick="addstk('Photo9','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/9.png">
																				<img class="stk" id="PhotoC3"
																				onclick="addstk('PhotoC3','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C3.png">
																				<img class="stk" id="PhotoC6"
																				onclick="addstk('PhotoC6','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/C6.png">
																				<img class="stk" id="PhotoCa3"
																				onclick="addstk('PhotoCa3','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca3.png">
																				<img class="stk" id="PhotoCa6"
																				onclick="addstk('PhotoCa6','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/Ca6.png">
																				<img class="stk" id="PhotoS3"
																				onclick="addstk('PhotoS3','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/S3.png">
																				<img class="stk" id="PhotoS6"
																				onclick="addstk('PhotoS6','${fpost.feed_id}')"
																				src="pages-back/faq/StrickerFeed_path/S6.png"></td>

																		</tr>


																	</tbody>
																</table>
															</div>


															<%-- <a id="sticker1${fpost.feed_id}" class="   "
																style="width: 100%; height: 60px;"
																onclick="stkShow(${fpost.feed_id})"> <i
																class="fa fa-sticky-note-o sendstyle "
																style="font-size: 30px"></i>
															</a>  --%>

															<button class="btn iconcomment"
																id="sticker1${fpost.feed_id}" class="">
																<div
																	style="width: 25px; height: 25px; margin-top: 4px; margin-left: -8px">
																	<i class="fa fa-sticky-note-o" style="font-size: 20px"
																		id="emo" onclick="stkShow(${fpost.feed_id})"></i>
																</div>
																<input id="stickerId" type="hidden"
																	value="${fpost.feed_id}"> </input>
															</button>


														</div>
														<div class="col-md-3">
															<button class="btn iconcomment" type="submit"
																value="post" id="testdata">
																<div
																	style="width: 25px; height: 25px; margin-top: 4px; margin-left: -10px">
																	<i class="fa fa-send" style="font-size: 19px" 
																		onclick="addComment('${fpost.feed_id}',document.getElementById('commentNew${fpost.feed_id}').value,'more${fpost.feed_id}','dots${fpost.feed_id}')""></i>
																</div>
															</button>




															<%-- <button type="submit" value="post" id="testdata"
																onclick="addComment('${fpost.feed_id}',document.getElementById('commentNew${fpost.feed_id}').value,'more${fpost.feed_id}','dots${fpost.feed_id}')"
																style="width: 100%; border: none; background: none; outline: none;">
																<i class="  fa fa-send  sendstyle"
																	style="font-size: 30px;"></i>
															</button> --%>

														</div>

													</div>

												</div>

												<!-- 					<div class="col-md-1">
													<a class=" btn bg-white centerxy " type="submit"
														value="post" style="width: 100%; height: 60px;"
														onclick="addComment('${fpost.feed_id}',document.getElementById('commentNew+${fpost.feed_id}').value,'more${fpost.feed_id}','dots${fpost.feed_id}')">
														<i class="fa fa-send  sendstyle  "
														style="font-size: 30px;"></i>

													</a>
											

												</div> 
																			<div class="col-md-12 text-center"
													style="margin-bottom: 10px;">

													
												</div> -->

											</form>
										</div>
									</div>

								</div>

							</div>
						</div>
					</div>
				</div>

				<!--------------------------- Modal --------------------------->
				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">

						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Edit Post</h4>
							</div>
							<div class="modal-body">
								<div class="row" style="padding-left: 15px; padding-right: 15px">
									<textarea id="demo" style="display: none;"></textarea>
									<textarea id="messagePostModal" style="width: 100%"
										onkeyup="setTextPost()"></textarea>
									<input type="hidden" id="detailsEditHidden">
									<button class="btn emoB">

										<div
											style="width: 40px; height: 40px; margin-top: -5px; margin-left: -7.5px">
											<i class="fa fa-smile-o" id="emo" onclick="emoShow3()"></i>
										</div>

									</button>


								</div>

								<div class="col-md-1 " id="emoShow3">
									<div id="emo3" class="text-center"
										style="z-index: 9999; display: none; position: absolute; overflow: auto; top: 20px; left: 20px; border; background-color: #E1E5EC; width: 280px; height: 250px;">
										<table class="table table-striped table-condensed table-hover"
											id="table_id" style="margin: 0px">

											<tbody>
												<tr class="E1">
													<td class="text-center"><b id="emoji"
														onclick="addEmopost('&#128512;')">&#128512;</b> <b
														id="emoji" onclick="addEmopost('&#128515;')">&#128515;</b>
														<b id="emoji" onclick="addEmopost('&#128518;')">&#128518;</b>
														<b id="emoji" onclick="addEmopost('&#128521;')">&#128521;</b>
														<b id="emoji" onclick="addEmopost('&#128525;')">&#128525;</b>
														<b id="emoji" onclick="addEmopost('&#128528;')">&#128528;</b>
														<b id="emoji" onclick="addEmopost('&#128531;')">&#128531;</b>
														<b id="emoji" onclick="addEmopost('&#128534;')">&#128534;</b>
														<b id="emoji" onclick="addEmopost('&#128513;')">&#128513;</b>
														<b id="emoji" onclick="addEmopost('&#128516;')">&#128516;</b>
														<b id="emoji" onclick="addEmopost('&#128519;')">&#128519;</b>
														<b id="emoji" onclick="addEmopost('&#128522;')">&#128522;</b>
														<b id="emoji" onclick="addEmopost('&#128526;')">&#128526;</b>
														<b id="emoji" onclick="addEmopost('&#128529;')">&#128529;</b>
														<b id="emoji" onclick="addEmopost('&#128532;')">&#128532;</b>
														<b id="emoji" onclick="addEmopost('&#128535;')">&#128534;</b>
														<b id="emoji" onclick="addEmopost('&#128514;')">&#128514;</b>
														<b id="emoji" onclick="addEmopost('&#128517;')">&#128517;</b>
														<b id="emoji" onclick="addEmopost('&#128520;')">&#128520;</b>
														<b id="emoji" onclick="addEmopost('&#128523;')">&#128524;</b>
														<b id="emoji" onclick="addEmopost('&#128527;')">&#128527;</b>
														<b id="emoji" onclick="addEmopost('&#128530;')">&#128530;</b>
														<b id="emoji" onclick="addEmopost('&#128533;')">&#128533;</b>
														<b id="emoji" onclick="addEmopost('&#128536;')">&#128536;</b>
														<b id="emoji" onclick="addEmopost('&#128537;')">&#128537;</b>
														<b id="emoji" onclick="addEmopost('&#128538;')">&#128538;</b>
														<b id="emoji" onclick="addEmopost('&#128539;')">&#128539;</b>
														<b id="emoji" onclick="addEmopost('&#128540;')">&#128540;</b>
														<b id="emoji" onclick="addEmopost('&#128541;')">&#128541;</b>
														<b id="emoji" onclick="addEmopost('&#128542;')">&#128542;</b>
														<b id="emoji" onclick="addEmopost('&#128543;')">&#128543;</b>
														<b id="emoji" onclick="addEmopost('&#128544;')">&#128544;</b>
														<b id="emoji" onclick="addEmopost('&#128545;')">&#128545;</b>
														<b id="emoji" onclick="addEmopost('&#128546;')">&#128546;</b>
														<b id="emoji" onclick="addEmopost('&#128547;')">&#128547;</b>
														<b id="emoji" onclick="addEmopost('&#128548;')">&#128548;</b>
														<b id="emoji" onclick="addEmopost('&#128549;')">&#128549;</b>
														<b id="emoji" onclick="addEmopost('&#128550;')">&#128550;</b>
														<b id="emoji" onclick="addEmopost('&#128551;')">&#128551;</b>
														<b id="emoji" onclick="addEmopost('&#128552;')">&#128552;</b>
														<b id="emoji" onclick="addEmopost('&#128553;')">&#128553;</b>
														<b id="emoji" onclick="addEmopost('&#128554;')">&#128554;</b>
														<b id="emoji" onclick="addEmopost('&#128555;')">&#128555;</b>
														<b id="emoji" onclick="addEmopost('&#128556;')">&#128556;</b>
														<b id="emoji" onclick="addEmopost('&#128557;')">&#128557;</b>
														<b id="emoji" onclick="addEmopost('&#128558;')">&#128558;</b>
														<b id="emoji" onclick="addEmopost('&#128559;')">&#128559;</b>
														<b id="emoji" onclick="addEmopost('&#128560;')">&#128560;</b>
														<b id="emoji" onclick="addEmopost('&#128561;')">&#128561;</b>
														<b id="emoji" onclick="addEmopost('&#128562;')">&#128562;</b>
														<b id="emoji" onclick="addEmopost('&#128563;')">&#128563;</b>
														<b id="emoji" onclick="addEmopost('&#128564;')">&#128564;</b>
														<b id="emoji" onclick="addEmopost('&#128565;')">&#128565;</b>
														<b id="emoji" onclick="addEmopost('&#128566;')">&#128566;</b>
														<b id="emoji" onclick="addEmopost('&#128567;')">&#128567;</b>
														<b id="emoji" onclick="addEmopost('&#128580;')">&#128580;</b>
														<b id="emoji" onclick="addEmopost('&#128591;')">&#128591;</b>
														<b id="emoji" onclick="addEmopost('&#129303;')">&#129303;</b>
														<b id="emoji" onclick="addEmopost('&#129304;')">&#129304;</b>
														<b id="emoji" onclick="addEmopost('&#129305;')">&#129305;</b>
														<b id="emoji" onclick="addEmopost('&#129306;')">&#129306;</b>
														<b id="emoji" onclick="addEmopost('&#129309;')">&#129309;</b>
														<b id="emoji" onclick="addEmopost('&#129310;')">&#129310;</b>
														<b id="emoji" onclick="addEmopost('&#129311;')">&#129311;</b>
													</td>

												</tr>
											</tbody>
										</table>
									</div>

								</div>
							</div>

							<div class="modal-footer">
								<button type="button" class="btn btn-primary"
									data-dismiss="modal" id="test" onclick="edit() "
									style="width: 100px">OK</button>
								<button type="button" class="btn" data-dismiss="modal" id="test"
									style="width: 100px; background-color: #e35b5a; color: white">Close</button>


							</div>

						</div>
					</div>
				</div>


				<!------------------------------------------------------>
			</c:forEach>

		</div>

	</div>

</div>


<style>
<
style>.zoom {
	padding: 50px;
	background-color: green;
	transition: transform .2s; /* Animation */
	width: 200px;
	height: 200px;
	margin: 0 auto;
}

.zoom:hover {
	transform: scale(1.5);
	/* (150% zoom - Note: if the zoom is too large, it will go outside of the viewport) */
}
</style>




<!-- </div> -->
<script>

function setdisplayimage(id) {

        
  
	var u = $("#myFile"+id).val();

	
	
	if(u==""){
		console.log("null");
		$("#showImIn"+id).css("display", "none");
		$("#remove"+id).css("display", "none");
	}else{
		console.log("eiei");
		//var path = $("ImageIn"+id).getAttribute("src");
		
		//console.log(id);
		$("#showImIn"+id).css("display", "block");
		$("#remove"+id).css("display", "block");
		//var images=document.getElementById('ImageIn'+id).firstChild.getAttribute('src');
		
	
		
		
		/* html ="";
		html+='<div class="holder_wrap">';
		html+='		<div class="holder_wrap_img">';
		html+='			<img class="stkComment" src="'+images+'" >';
		html+='			<div class="inner_position_right text-right">';
		html+='				<i class="fa fa-close (alias)" style="font-size: 20px" onclick=""></i>';
		
	//	html+='<div class="fileinput fileinput-new" data-provides="fileinput" >';
		
		
		html+='<a onclick="remove('+id+')" href="javascript:;" class="btn red fileinput-exists" data-dismiss="fileinput"> Remove </a>';
		//html+='			</div>';
		html+='			</div>';
		html+='		</div>';
		html+='</div">';
		$('#JukGru'+id).html('');
		$('#JukGru'+id).append(html); */
		
	}

}



function emoShowComment(idFeed) {
	$("#emoComment"+idFeed).toggle("slow" );
}

function emoShow3 () { $("#emo3").toggle("slow" );

}
function addEmoComment(emo,idCommentFeed) {
	
	/* var x=document.getElementById(idCommentFeed).value+emo;
	document.getElementById(idCommentFeed).innerHTML = x; */
	
	var textEmo =  $("#"+idCommentFeed).val()+emo;
    $("#"+idCommentFeed).val(textEmo);

}

function addEmopost(emo) {
	
	var textEmo =  $("#messagePostModal").val()+emo;
    $("#messagePostModal").val(textEmo);
    console.log(textEmo);

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

    
    //เซทก่อนเข้า DB
    $("#detailsEditHidden").val(resultEmo);

    $("#buttonPost").prop("disabled", false);
    texteditPost=$("#detailsEditHidden").val();
}


$( document ).ready(function() {
	var preImg = document.querySelectorAll('.fileinput-preview');
	
	
	preImg.forEach((element) =>{
		element.addEventListener('click', function(){
			element.children.item(0).id='data-enlargeable'
			});
		});
	});
</script>



<script>
$( document ).ready(function() {
	console.log("ready! Detail");
	
	var newLinkATag = document.querySelectorAll("#linkifyJukgru");
	var newLinkATag2 = "";
	newLinkATag.forEach(element =>{
		/* console.log(element);
		console.log("this => "+element.innerHTML); */
		newLinkATag2 = linkify(element.innerHTML);
		element.innerHTML = newLinkATag2;
		newLinkATag2 = "";
		var resultPost = element.innerHTML.replaceAll("\n", "<br>");
		element.innerHTML = resultPost;

	});
	
	
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

var limittest = 0;
$(window).scroll(function() {

	 if($(document).height()==$(window).scrollTop()+$(window).height()){
			 var limit = 5;
		limittest += limit;
		var sTimeOut = setTimeout(function () {
			 $.ajax({
					url:'${pageContext.request.contextPath}/feedList_open_detail',
					method:'POST',
				data:{
					'limit' : limittest,
				},
				
			 }).done(function(data) {
				 $('.test').html(data)
				
			
				}).fail(function() {

				});
		}, 1000);
	}
	 jQuery(".showedit").hover(
			  function() {
			      jQuery(this).find(".editcomment").css("display","block");
			   },
	   function() {
	      jQuery(this).find(".editcomment").css("display","none");
	   }

	);
});


</script>

<script>
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

</script>

<script>
function linkify(inputText) {
    var replacedText, replacePattern1, replacePattern2, replacePattern3;
    //URLs starting with http://, https://, or ftp://
    replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim;
    replacedText = inputText.replace(replacePattern1, '<a href="$1" target="_blank">$1</a>');
    //URLs starting with "www." (without // before it, or it'd re-link the ones done above).
    replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim;
    replacedText = replacedText.replace(replacePattern2, '$1<a href="http://$2" target="_blank">$2</a>');
    //Change email addresses to mailto:: links.
    replacePattern3 = /(([a-zA-Z0-9\-\_\.])+@[a-zA-Z\_]+?(\.[a-zA-Z]{2,6})+)/gim;
    replacedText = replacedText.replace(replacePattern3, '<a href="mailto:$1">$1</a>');
    return replacedText;
}
</script>


