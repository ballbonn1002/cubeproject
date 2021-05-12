<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div>

ssssssssssssssssssssssssssss

</div>
<%--
<form action=timeline method="post">
<div class="col-lg-6 col-xs-6 col-sm-6">
			<div class="portlet light portlet-fit bordered">

				<div class="portlet-body flip-scroll text-center">

					<label class="control-label col-md-2">Year : </label> <select
						class="form-control col-md-2" name="yearSearch" id=yearSearch
						style="width: 100px">
						<c:choose>
							<c:when test="${yearSearch != null}">
								<c:forEach begin="0" end="4" var="i">
									<option value="${yearnow - i}" id="${yearnow - i}"
										<c:if test="${yearSearch == (yearnow - i)}"><c:out value="selected=selected"/></c:if>>${yearnow - i}</option>
								</c:forEach>
							</c:when>

							<c:otherwise>
								<c:forEach begin="0" end="4" var="i">
									<option value="${yearnow - i}" id="${yearnow - i}">${yearnow - i}</option>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</select> <label class="control-label col-md-2" for="form_control_1">Month
						: </label> <select class=" form-control col-md-2" name="month" id="month"
						style="width: 100px">

						<option value='01' id='01'
							<c:if test="${month == 01 }"><c:out value="selected=selected"/> </c:if>>Janaury</option>
						<option value='02' id='02'
							<c:if test="${month == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
						<option value='03' id='03'
							<c:if test="${month == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
						<option value='04' id='04'
							<c:if test="${month == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
						<option value='05' id='05'
							<c:if test="${month == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
						<option value='06' id='06'
							<c:if test="${month == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
						<option value='07' id='07'
							<c:if test="${month == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
						<option value='08' id='08'
							<c:if test="${month == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
						<option value='09' id='09'
							<c:if test="${month == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
						<option value='10' id='10'
							<c:if test="${month == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
						<option value='11' id='11'
							<c:if test="${month == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
						<option value='12' id='12'
							<c:if test="${month == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
					</select>

					<button type="submit" class="btn sbold blue-steel">
						<i class="fa fa-search"></i> Search
					</button>
				</div>
				<div class="portlet-title">
					<div class="caption">
						<i class="icon-directions font-green hide"></i> <span
							class="caption-subject bold font-dark uppercase ">
							Timeline User </span>
					</div>
				</div>
				<div class="portlet-body">
					<div class="cd-horizontal-timeline mt-timeline-horizontal"
						data-spacing="60">
						<div class="timeline">
							<div class="events-wrapper">
								<div class="events">
									<ol>
										<!--     <li>
                                                            <a href="#0" data-date="16/01/2014" class="border-after-red bg-after-red selected">16 Jan</a>
                                                        </li>  
                                                        <c:forEach var="tilmeline" items="${tilmeline}">
                                                          <li>
                                                            <a href="#0" data-date="${tilmeline.date}" class="border-after-red bg-after-red ">${tilmeline.shortdate}</a>
                                                        </li>
                                                  </c:forEach> -->
										<c:forEach var="tilmeline" items="${tilmelinefirst}">
											<li><a href="#0" data-date="${tilmeline.date} "
												class="border-after-red selected">${tilmeline.shortdate}
											</a></li>
										</c:forEach>
										<c:forEach var="tilmeline" items="${tilmeline}">


											<li><a href="#0" data-date="${tilmeline.date}"
												class="border-after-red  ">${tilmeline.shortdate} </a></li>

										</c:forEach>

									</ol>
									<span class="filling-line bg-red" aria-hidden="true"></span>
								</div>
								<!-- .events -->
							</div>
							<!-- .events-wrapper -->
							<ul class="cd-timeline-navigation mt-ht-nav-icon">
								<li><a href="#0"
									class="prev inactive btn btn-outline red md-skip"> <i
										class="fa fa-chevron-left"></i>
								</a></li>
								<li><a href="#0" class="next btn btn-outline red md-skip">
										<i class="fa fa-chevron-right"></i>
								</a></li>
							</ul>
							<!-- .cd-timeline-navigation -->
						</div>
						<div class="events-content">
							<ol>
								<c:forEach var="tilmeline" items="${tilmelinefirst}">
									<li data-date="${tilmeline.date} ">
										<div class="mt-title">
											<h2 class="mt-content-title">Cubesofttech</h2>
										</div>
										<div class="mt-author">
											<div class="mt-avatar">
												<img src="../assets/pages/media/users/avatar80_3.jpg" />
											</div>
											<div class="mt-author-name">
												<a href="javascript:;" class="font-blue-madison">${tilmeline.user_create }</a>
											</div>
											<div class="mt-author-datetime font-grey-mint">${tilmeline.fulldate }</div>
										</div>
									</li>
								</c:forEach>
								<c:forEach var="tilmeline" items="${tilmeline}">
									<li class="" data-date="${tilmeline.date }">
										<div class="mt-title">
											<h2 class="mt-content-title">Cubesofttech</h2>
										</div>
										<div class="mt-author">
											<div class="mt-avatar">
												<img src="../assets/pages/media/users/avatar80_3.jpg" />
											</div>
											<div class="mt-author-name">
												<a href="javascript:;" class="font-blue-madison">${tilmeline.user_create }</a>
											</div>
											<div class="mt-author-datetime font-grey-mint">${tilmeline.fulldate }</div>
										</div>
									</li>
								</c:forEach>
								<c:forEach var="tilmeline" items="${tilmelinefirst}">
									<li class="selected" data-date="${tilmeline.date }">
										<div class="mt-title">
											<h2 class="mt-content-title">Cubesofttech</h2>
										</div>
										<div class="mt-author">
											<div class="mt-avatar">
												<img src="../assets/pages/media/users/avatar80_3.jpg" />
											</div>
											<div class="mt-author-name">
												<a href="javascript:;" class="font-blue-madison">${tilmeline.user_create }</a>
											</div>
											<div class="mt-author-datetime font-grey-mint">${tilmeline.fulldate}</div>
										</div>
									</li>
								</c:forEach>
							</ol>
						</div>
		
					</div>
				</div>
			</div>
		</div>
</form>
--%>
</body>
</html>