<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<script src="../assets/ajax/jquery-1.10.2.js" type="text/javascript"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="../assets/global/plugins/bootstrap-sweetalert/sweetalert.min.js" type="text/javascript"></script>
<script src="../assets/pages/scripts/ui-sweetalert.min.js" type="text/javascript"></script>
<link href="../assets/global/plugins/bootstrap-sweetalert/sweetalert.css" rel="stylesheet" type="text/css"/>
<c:set var="now" value="<%=new java.util.Date()%>" />
<style>
@media only screen and (max-width: 1200px) {
    #search {
        margin-top: 15px;
    }
}
</style>
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
		
		</style>
				<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-layers font-red"></i> <span
				class="caption-subject font-red sbold uppercase">Leave
				application for ME</span>
		</div>
		<div class="actions">
            <button type="button" class="btn btn-sm green-meadow" id="addLeave"
				onclick="add()">
				<i class="fa fa-plus"></i>&nbsp;Add leave
			</button>
			<a class="btn  btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>
	</div>
	<div class="portlet-body">
		<div class="tools">
			<a href="javascript:;" class="collapse" data-original-title=""
				title=""> </a> <a href="#portlet-config" data-toggle="modal"
				class="config" data-original-title="" title=""> </a> <a
				href="javascript:;" class="reload" data-original-title="" title="">
			</a> <a href="javascript:;" class="remove" data-original-title=""
				title=""> </a>
		</div>

				<div class="row" style="padding-bottom: 15px; padding-top: 15px;">
				<div class="col-md-1 col-lg-1" style="width: 0;"></div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 blue">	
							<div class="visual">		
								<i class="fa fa-car"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${quotaThisYear != 0 }">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_1,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_1 % 1) * 8}" />
												<c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" />
												<c:set var="amoutquotaThisYearDay" value="${fn:substringBefore(quotaThisYear,'.')}" /> 
												<c:set var="amoutquotaThisYearHour" value="${(quotaThisYear % 1) * 8}" />
												<c:set var="amoutquotaThisYearHalfHour" value="${(amoutquotaThisYearHour % 1) * 60}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
															<c:if test="${amoutLeaveHalfHour == 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
															</c:if>
															<c:if test="${amoutLeaveHalfHour != 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
															</c:if>
													</c:if><!-- show day and hours -->
													
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- show day only -->
													
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<c:if test="${amoutLeaveHalfHour == 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
															</c:if>
															<c:if test="${amoutLeaveHalfHour != 0}">
																<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h/
															</c:if>
													</c:if> <!-- show hours -->
													
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- no leave -->
																										
													<!-- show quota -->
													<c:if test="${amoutquotaThisYearDay != 0  && amoutquotaThisYearHour != 0}">
														<c:if test="${amoutquotaThisYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaThisYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHalfHour}"/>h
														</c:if>
													</c:if>
																										
													<c:if test="${amoutquotaThisYearDay != 0  && amoutquotaThisYearHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearDay}"/>d
													</c:if>
													
													<c:if test="${amoutquotaThisYearDay == 0 && amoutquotaThisYearHour != 0}">
														<c:if test="${amoutquotaThisYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaThisYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisYearHalfHour}"/>h
														</c:if>
													</c:if>
																										
													<c:if test="${amoutquotaThisDay == 0 && amoutquotaThisHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisDay}"/>d
													</c:if>
												</span>
												<c:if test="${leaveWA_1 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_1,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_1 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
												<div class="desc">${type_1}</div>
											</c:when>
											<c:when test="${quotaThisYear == 0 }">
												<span data-counter="counterup" data-value="">
												0d</span>
												<c:if test="${leaveWA_1 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_1,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_1 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
												<div class="desc">${type_1}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 yellow-gold">
							<div class="visual">
								<i class="fa fa-suitcase"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${quotaLastYear != 0 }">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(Leave_6,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(Leave_6 % 1) * 8}" />
												<c:set var="amoutquotaLastYearDay" value="${fn:substringBefore(quotaLastYear,'.')}" /> 
												<c:set var="amoutquotaLastYearHour" value="${(quotaLastYear % 1) * 8}" />
												<%-- <c:set var="amoutquotaLastYearHalfHour" value="${(amoutquotaLastYearHour % 1) * 60}" /> --%>												
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d/
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h/
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														0d/
													</c:if> <!-- no leave -->
																										
													<!-- show quota -->
													<c:if test="${amoutquotaLastYearDay != 0  && amoutquotaLastYearHour != 0}">
														<c:if test="${amoutquotaLastYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaLastYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHalfHour}"/>h
														</c:if>
													</c:if>
																										
													<c:if test="${amoutquotaLastYearDay != 0  && amoutquotaLastYearHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearDay}"/>d
													</c:if>
													
													<c:if test="${amoutquotaLastYearDay == 0 && amoutquotaLastYearHour != 0}">
														<c:if test="${amoutquotaLastYearHalfHour == 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>h
														</c:if>
														<c:if test="${amoutquotaYearHalfHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutquotaLastYearHour}"/>:<fmt:formatNumber type="number" pattern="#" value="${amoutquotaThisLastHalfHour}"/>h
														</c:if>
													</c:if>
																										
													<c:if test="${amoutquotaLastYearDay == 0 && amoutquotaLastYearHour == 0}">
															0d
													</c:if>
												</span>
												<c:if test="${leaveWA_6 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_6,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_6 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
												<div class="desc" style="font-size: 13px;">${type_6}</div>
												</c:when>
												<c:when test="${LastYear == 0 }">
													<span data-counter="counterup" data-value="">
													0d</span>
													<c:if test="${leaveWA_6 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_6,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_6 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
													<div class="desc">${type_6}</div>
												</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 red">
							<div class="visual">
								<i class="fa fa-ambulance"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_3 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_3,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_3 % 1) * 8}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<c:if test="${leaveWA_3 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_3,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_3 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
												<div class="desc">${type_3}</div>
											</c:when>
											<c:when test="${leave_3 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<c:if test="${leaveWA_3 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
													<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_3,'.')}" /> 
													<c:set var="leaveHourWA" value="${(leaveWA_3 % 1) * 8}" />
													
													<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if> 												
													<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
													</c:if> 
													<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
														WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
													</c:if>
													<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
														<span>&nbsp;</span>
													</c:if>
													</div>
												</c:if>
												<div class="desc">${type_3}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 green-jungle">
							<div class="visual">
								<i class="fa fa-calendar"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_2 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_2,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_2 % 1) * 8}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<c:if test="${leaveWA_2 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
														<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_2,'.')}" /> 
														<c:set var="leaveHourWA" value="${(leaveWA_2 % 1) * 8}" />
														<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
																<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if> 
														<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
														</c:if> 
														<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if>
														<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
															<span>&nbsp;</span>
														</c:if>
													</div>
												</c:if>
												<div class="desc">${type_2}</div>
											</c:when>
											<c:when test="${leave_2 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<c:if test="${leaveWA_2 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
														<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_2,'.')}" /> 
														<c:set var="leaveHourWA" value="${(leaveWA_2 % 1) * 8}" />
														<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
																<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if> 
														<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
														</c:if> 
														<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if>
														<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
															<span>&nbsp;</span>
														</c:if>
													</div>
												</c:if>
												<div class="desc">${type_2}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
					</div>
					<div class="col-xs-12 col-sm-12 col-md-2 col-lg-2" style="width: 19%; padding: 5px;">
						<a class="dashboard-stat dashboard-stat-v2 green">
							<div class="visual">
								<i class="fa fa-battery-quarter"></i>
							</div>
							<div class="details">
								<form action="myleave_list" method="POST">
									<div class="number">
										<c:choose>
											<c:when test="${leave_5 != 0}">
												<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave_5,'.')}" /> 
												<c:set var="amoutLeaveHour" value="${(leave_5 % 1) * 8}" />
												<span data-counter="counterup" data-value="">
												<!--
													<fmt:formatNumber type="number" pattern="#.#" value="${amoutLeaveDay}" /> d 
													<fmt:formatNumber type="number" pattern="#.##" value="${amoutLeaveHour}" /> h
												-->
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show day and hours -->
															
													<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- show day only -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
															<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
													</c:if> <!-- show hours -->
															
													<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour == 0}">
														<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
													</c:if> <!-- no leave -->
												</span>
												<c:if test="${leaveWA_5 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
														<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_5,'.')}" /> 
														<c:set var="leaveHourWA" value="${(leaveWA_5 % 1) * 8}" />
														<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
																<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if> 
														<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
														</c:if> 
														<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if>
														<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
															<span>&nbsp;</span>
														</c:if>
													</div>
												</c:if>
												<div class="desc">${type_5}</div>
											</c:when>
											<c:when test="${leave_5 == 0}">
												<span data-counter="counterup" data-value="">0d</span>
												<c:if test="${leaveWA_5 != null}">
													<div class="desc" style="margin-top:-10px;margin-bottom:-10px;">
														<c:set var="leaveDayWA" value="${fn:substringBefore(leaveWA_5,'.')}" /> 
														<c:set var="leaveHourWA" value="${(leaveWA_5 % 1) * 8}" />
														<c:if test="${leaveDayWA != 0  && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
																<fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if> 
														<c:if test="${leaveDayWA != 0  && leaveHourWA == 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveDayWA}"/>d
														</c:if> 
														<c:if test="${leaveDayWA == 0 && leaveHourWA != 0}">
															WA: <fmt:formatNumber type="number" pattern="#" value="${leaveHourWA}"/>h
														</c:if>
														<c:if test="${leaveDayWA == 0 && leaveHourWA == 0}">
															<span>&nbsp;</span>
														</c:if>
													</div>
												</c:if>
												<div class="desc">${type_5}</div>
											</c:when>
										</c:choose>
									</div>
								</form>
							</div>
						</a>
				</div>
			</div>

			<form action="searchfromto" method="POST">
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<div class="col-md-5"></div>
							<div class="col-md-5 col-xs-12">
								<div class="form-group">
									<div class="input-group input-large date-picker input-daterange" data-date-format="dd-mm-yyyy"style="z-index:0">
										<input type="text" class="form-control" name="startdate" id="startdate" 
											<c:choose>
											<c:when test="${startdate == null}">
			                                    value="<fmt:formatDate type="date" value="${now}" pattern="01-01-yyyy"/>"
			                                </c:when>
			                                <c:when test="${startdate != null}">
			                                	value="<fmt:formatDate type="date" value="${startdate}" pattern="dd-MM-yyyy"/>"
			                                </c:when>
			                                </c:choose>>
										<span class="input-group-addon"> to </span> 
										<input type="text"class="form-control" id="enddate" name="enddate"
											<c:choose>
											<c:when test="${enddate == null}">
												value="<fmt:formatDate type="date" value="${now}" pattern="dd-MM-yyyy"/>"
			                                </c:when>
			                                <c:when test="${enddate != null}">
			                                    value="<fmt:formatDate type="date" value="${enddate}" pattern="dd-MM-yyyy"/>"
			                                </c:when>
			                        		</c:choose>>
									</div>
								</div>
							</div>
							<div class="col-md-2 col-xs-12" style="text-align: center">
								<button id="search" type="submit" class="btn btn-sm blue-steel">
									<i class="fa fa-search"></i> Search
								</button>
							</div>
						</div>
						<script>
							$(document).ready( function(){
										
								sessionStorage.removeItem("start");
								sessionStorage.removeItem("end");
								////////
								$( "#startdate" ).change(function() {
									var x =$(this).datepicker( 'getDate');
									$( '#enddate' ).datepicker( 'setDate', x );
									console.log($( '#startdate' ).val());
									console.log($( '#enddate' ).val())
									}
								);
								$("#search").click(function() {				
									var start = $("#startdate").val();
									var end = $("#enddate").val();
									sessionStorage.setItem("start", start);
									sessionStorage.setItem("end", end);
									}			
								);
							});
						</script>
					</div>
				</div>
			</form>

			<div class="portlet-body flip-scroll" style="text-align: center;">
				<table class="table table-striped table-condensed flip-content table-hover">
					<thead>
						<tr style="background-color:#eef1f5;color:#6e869d">
							<th height="41"><center>#</center></th>
							<th height="41"><center>Name</center></th>
							<th height="41"><center>Type of leave</center></th>
							<th height="41"><center>Start date (Since)</center></th>
							<th height="41"><center>End date (Until)</center></th>
							<th height="41"><center>Day</center></th>
							<th height="41"><center>Status</center></th>
							<th height="41"><center></center></th>
						</tr>
					</thead>
					
						<form action="myleave_list" method="POST">
						<c:forEach var="leave" items="${leavelist}" varStatus="status">
							<tr>
								<td style="vertical-align: middle; color: #3598dc;">${leave.leave_id}</td>
								<!-- <td style="vertical-align: middle;"><fmt:formatDate value="${leave.time_create}"
										pattern="dd-MM-yyyy HH:mm"></fmt:formatDate></td>
										-->
								<td>${leave.user_id}</td>
								<c:choose>
									<c:when test="${leave.leave_type_id.toString() == '1'}">
										<td style="text-align: left;">${type_1}<br>
										<small class="text-info">&emsp;Request Date: 
											<fmt:formatDate value="${leave.time_create}" 
											type="date" pattern="dd-MM-yyyy"></fmt:formatDate></small>
										</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '2'}">
										<td style="text-align: left;">${type_2}<br>
										<small class="text-info">&emsp;Request Date: 
											<fmt:formatDate value="${leave.time_create}" 
											type="date" pattern="dd-MM-yyyy"></fmt:formatDate></small>
										</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '3'}">
										<td style="text-align: left;">${type_3}<br>
										<small class="text-info">&emsp;Request Date: 
											<fmt:formatDate value="${leave.time_create}" 
											type="date" pattern="dd-MM-yyyy"></fmt:formatDate></small>
										</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '5'}">
										<td style="text-align: left;">${type_5}<br>
										<small class="text-info">&emsp;Request Date: 
											<fmt:formatDate value="${leave.time_create}" 
											type="date" pattern="dd-MM-yyyy"></fmt:formatDate></small>
										</td>
									</c:when>
									<c:when test="${leave.leave_type_id.toString() == '6'}">
										<td style="text-align: left;">${type_6}<br>
										<small class="text-info">&emsp;Request Date: 
											<fmt:formatDate value="${leave.time_create}" 
											type="date" pattern="dd-MM-yyyy"></fmt:formatDate></small>
										</td>
									</c:when>
								</c:choose>
								<td style="vertical-align: middle;">
									<fmt:formatDate value="${leave.start_date}" 
										type="date" pattern="d MMM yyyy"></fmt:formatDate>
										, ${leave.start_time}</td>
								<td style="vertical-align: middle;">
									<fmt:formatDate value="${leave.end_date}" 
										type="date" pattern="d MMM yyyy"></fmt:formatDate>
										, ${leave.end_time}</td>
										
								<td style="vertical-align: middle;">
									<c:set var="amoutLeaveDay" value="${fn:substringBefore(leave.no_day,'.')}" /> 
									<c:set var="amoutLeaveHour" value="${(leave.no_day % 1) * 8}" />
									<%-- <c:set var="amoutLeaveHalfHour" value="${(amoutLeaveHour % 1) * 60}" /> --%>

									<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour != 0}">
										<span style="color:white; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #3598dc;">
										<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/>d
										<%-- <c:if test="${amoutLeaveHalfHour == 0}"> --%>
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>h
										<%-- </c:if> --%>
										<%-- <c:if test="${amoutLeaveHalfHour != 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/>h
										</c:if> --%>
										</span>
									</c:if> <!-- show day and hours -->
															
									<c:if test="${amoutLeaveDay != 0  && amoutLeaveHour == 0}">
										<span style="color:#3598dc; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #f2f6f9;">
										<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveDay}"/> day
										</span>
									</c:if> <!-- show day only -->
															
									<c:if test="${amoutLeaveDay == 0 && amoutLeaveHour != 0}">
										<span style="color:white; width:80px; display:inline-block; border: 2px solid #3598dc; background-color: #3598dc;">
										<%-- <c:if test="${amoutLeaveHalfHour == 0}"> --%>
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/> hours
										<%-- </c:if> --%>
										<%-- <c:if test="${amoutLeaveHalfHour != 0}">
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHour}"/>:
											<fmt:formatNumber type="number" pattern="#" value="${amoutLeaveHalfHour}"/> h
										</c:if> --%>
										</span>
									</c:if> <!-- show hours -->					
								</td>
								
								<td style="vertical-align: middle;"><c:if test="${leave.leave_status_id.toString() == '0'}">
									<div class="wait-${leave.leave_id} btn-group dropup">
										<span class="btn yellow-crusta">Waiting for Approving</span>
										<button class="btn yellow-crusta dropdown-toggle" type="button" 
											data-delay="999" data-toggle="dropdown" data-close-others="true">
											<i class="fa fa-angle-up"></i></button>
										<ul class="dropdown-menu" role="menu" style="z-index:1000">
											<li class="list-group-item" style="background-color:#FAFAFA">
												<h5 class="title">You want to Approval?</h5></li>
											<li><h4 style="color: white; text-align: center;">
												<a class="btn green-jungle"
													onclick="leaveStatus(${leave.leave_id})">
													<i class="glyphicon glyphicon-ok"></i> Approve </a></h4>
												<h4 style="color: white; text-align: center;">
												<a id="reject_leave_call01" class="btn btn-danger"
													onclick="leaveStatus(${leave.leave_id});">
													<i class="glyphicon glyphicon-remove"></i> Reject </a></h4></li>
										</ul>
									</div>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '1'}">
										<span class="btn green-jungle">Approved</span>
									</c:if> <c:if test="${leave.leave_status_id.toString() == '2'}">
										<span class="btn red-mint" >Reject</span>
									</c:if></td>
									
								<td style="vertical-align: middle;">
								<c:if test="${leave.leave_status_id.toString() == '0'}">
								<a class="btn circle btn-outline btn-sm sbold blue"
										title="information of leave"
										onclick="leaveStatus(${leave.leave_id})">
										<i class="fa fa-clipboard"></i></a>
								<a class="btn circle btn-outline btn-sm sbold purple"
										href="LeaveEdit?id=${leave.leave_id}"
										title="leave edit">
										<i class="fa fa-pencil"></i></a>
								<a class="btn circle btn-outline btn-sm sbold red"
										onclick="delTimesheet(${leave.leave_id});"
										title="leave deleting">
										<i class="fa fa-trash-o"></i></a></c:if>
										
								<c:if test="${leave.leave_status_id.toString() != '0'}">
									<a class="btn circle btn-outline btn-sm sbold blue"
										title="information of leave"
										onclick="leaveStatus(${leave.leave_id})">
										<i class="fa fa-clipboard"></i></a>
								<a class="btn circle btn-outline btn-sm sbold default"
										href="LeaveEdit?id=${leave.leave_id}"
										title="leave edit" disabled>
										<i class="fa fa-pencil"></i></a>
								<a class="btn circle btn-outline btn-sm sbold default"
										onclick="delTimesheet(${leave.leave_id});"
										title="leave deleting" disabled>
										<i class="fa fa-trash-o"></i></a>
								</c:if>
								<script>
								
								function delTimesheet(id) {
									swal({
									      title: "Are you sure!",
									      text: "You will be deleting this id!",
									      type: "warning",
									      showCancelButton: true,
									      confirmButtonClass: 'btn-danger',
									      confirmButtonText: 'OK'
									    }, function (inputValue) {
									        if (inputValue == false){
									        	//console.log("canceled");
									        	return false;
									        	}
									        if (inputValue == true) {
									        	 $.ajax({
									 				    url : "delete_leave_id.action",
									 					data : "leave_id="+ id,
									 					type : "POST",
									 					success : function(response) {
									 						window.location.reload(true);
									 					}
									 			 });
									          return false
									        }
									      });
								}
								</script>
								</td>
							</tr>
						</c:forEach>
						<div class="modal fade" id="change_status" role="dialog" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content" style="text-align:left;">
									<div class="modal-header ui-draggable-handle">
										<button type="button" class="close" data-dismiss="modal"></button>
										<h4 class="modal-title sbold">Leave</h4>
									</div>
									<div class="modal-body">
										<div class="row" style="margin-bottom:10px;">
											<div class="col-lg-4"><small>Name</small><br>
												<small class="sbold" id="userid"></small></div>
											<div class="col-lg-4"><small>Request Date</small><br>
												<small class="sbold" id="timecreate"></small></div>
											<div class="col-lg-4"><small id="leaveid"></small><br>
												<small id="leavestatus"></small></div>
										</div>
										<div class="row" style="margin-bottom:10px;">
											<div class="col-lg-4"><small>ประเภทการลา</small><br>
												<small class="sbold" id="leavetype"></small>
											</div>
											<div class="col-lg-4"><small>Start Date</small><br>
												<small class="sbold" id="sdate"></small>
												<small class="sbold" id="stime"></small>
											</div>
											<div class="col-lg-4"><small>End Date</small><br>
												
												<small class="sbold" id="edate"></small>
												<small class="sbold" id="etime"></small>
											</div>
										</div>
										<div class="row" style="margin-bottom:10px;">
											<div class="col-lg-4">
												<small>จำนวน</small><br>
												<small class="sbold" id="noday"></small>
											</div>
											<div class="col-lg-4">
												<small>Description</small><br>
												<small class="sbold" id="desc"></small>
											</div>
											<div class="col-lg-4">
												<small>Attachment</small><br>
												<small class="sbold" id="leavefile"></small>
											</div>
										</div>
									</div>
									<div class="modal-footer" style="text-align:left;">
										<i class="font-red-sunglo fa fa-ellipsis-v" style="margin-right:8px;"></i><span 
											class="font-blue sbold" style="margin-bottom:15px;">Approver</span>
										<div id="reason_panel" class="col-lg-13" style="margin-top:10px;">
											<small>Reason</small>
											<small id="req" class="font-red-sunglo"> * require reason for reject</small>
											<textarea class="form-control" rows="3" id="reason"
												style="margin-bottom:10px;"></textarea>
										</div>
										<div id="status_detail" class="row" style="margin-bottom:10px;">
											<div class="col-lg-4">
												<small>Approver</small><br>
												<small class="sbold" id="approver"></small>
											</div>
											<div class="col-lg-4">
												<small>Approve Date</small><br>
												<small class="sbold" id="timeupdate"></small>
											</div>
											<div class="col-lg-4">
												<small>Reason</small><br>
												<small class="sbold" id="reason_s"></small>
											</div>
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn dark btn-outline" 
											data-dismiss="modal" onclick="leaveCancle()">Close</button>
										<a class="btn red-sunglo" data-dismiss="modal" title="leave rejecting" 
											style="color:white;" id="btn_reject" onclick="call_reject()">Reject</a>
										<a class="btn green-meadow" data-dismiss="modal" title="leave approved" 
											id="btn_approve" onclick="ajaxLoad()">Approve</a>
									</div>
								</div>
							</div>
						</div>
					</form>
				</table>
			</div>
			</div>
</div>
<script>
	function add() {
		document.location = "LeaveAdd";
	}
	
	function leaveEdit() {
		document.location = "LeaveEdit";
	}
	
	function leaveStatus(id) {
		$("#change_status").modal(); 
		document.getElementById("req").style.display = "none";
		console.log(id);
		$.ajax({
			url : "modalLeaveStatus.action",
			method : "POST",
	 		data : "leaveId="+ id,
	 		success : function(data) {
	 			var obj = JSON.parse(data);
				localStorage.setItem("data", data);
				console.log(obj);
				
				$('#leaveid').append(obj.leave_id).addClass("font-blue");
				$('#userid').append(obj.user_id);
				$('#timecreate').append(obj.time_create);
				$('#stime').append(obj.start_time);
				$('#etime').append(obj.end_time);
				$('#desc').append(obj.description);
				
		/* ----------------------- leave type ----------------------- */				
				if(obj.leave_type_id == 1){$('#leavetype').append("ลากิจ/ลาพักร้อน");}
				if(obj.leave_type_id == 2){$('#leavetype').append("ลาอื่นๆ");}
				if(obj.leave_type_id == 3){$('#leavetype').append("ลาป่วย");}
				if(obj.leave_type_id == 4){$('#leavetype').append("ขาดงาน");}
				if(obj.leave_type_id == 5){$('#leavetype').append("ลาโดยไม่รับค่าจ้าง");}
				if(obj.leave_type_id == 6){$('#leavetype').append("ลาพักร้อนที่เหลือจากปีก่อน");}
				if(obj.leave_type_id == 9){$('#leavetype').append("อื่นๆ");}
		
		/* ----------------------- set start date / end date ----------------------- */
				var sdate = (obj.start_date).split(",");
				$('#sdate').append(sdate[0] + ",");
				var edate = (obj.end_date).split(",");
				$('#edate').append(edate[0] + ",");	
				
		/* ----------------------- leave no day ----------------------- */
				var dayleave = (obj.no_day).toString().split(".");
				var day = dayleave[0];
				var hour = ((obj.no_day % 1)*8);
				
				if(day[0] != '0' && hour != 0){
					$('#noday').append(day[0] + " Day "+ hour +" Hour");
				}
				else if(day[0] != '0' && hour == 0){
					$('#noday').append(day[0] + " Day");
				}
				else if(day[0] == '0' && hour != 0){
					$('#noday').append(hour + " Hour");
				}	
				
				if(obj.leave_status_id == '0'){
					$('#leavestatus').append("Wait for Approving").addClass("sbold font-yellow-crusta");
					document.getElementById("status_detail").style.display = "none";
				}else if(obj.leave_status_id == 1){
					$('#leavestatus').append("Approved").addClass("sbold font-blue");
					document.getElementById("reason_panel").style.display = "none";
					document.getElementById("status_detail").style.display = "block";
					$('#approver').append(obj.appr_user_id);
					$('#timeupdate').append(obj.time_update);
					$('#reason_s').append(obj.reason);
					$('#btn_reject').hide();
					$('#btn_approve').hide(); 
				
				}else if(obj.leave_status_id == 2){
					$('#leavestatus').append("Reject").addClass("sbold font-red-mint");
					console.log("status 2");
					document.getElementById("reason_panel").style.display = "none";
					document.getElementById("status_detail").style.display = "block";
					$('#approver').append(obj.appr_user_id);
					$('#timeupdate').append(obj.time_update);
					$('#reason_s').append(obj.reason);
					$('#btn_reject').hide();
					$('#btn_approve').hide(); 
				}
	 		}
		});
	}
	
	function leaveCancle(){
		sessionStorage.clear();
		console.log("clear");
		window.location.reload(true);
	}
	
	function ajaxLoad() {
		var data = localStorage.getItem("data");
		var obj = JSON.parse(data);
		var leaveId = obj.leave_id;
		/* localStorage.setItem("leaveId", leaveId); */
		var reason = $('#reason').val();
		if(reason == "" || reason == null){
			reason = "";
			console.log(reason);
		}
 		 $.ajax({
	         url: 'Leave_inList',
	         type: 'POST',
	         data : {
	        	"leave_id" : leaveId,
	        	"reason" : reason
	         }, 
		 })
		 	.done(function() {
		 		location.reload();
		 		localStorage.removeItem("data");
		 	});
	}
	
	function call_reject() {
		var data = localStorage.getItem("data");
		var obj = JSON.parse(data);
		var leaveId = obj.leave_id;
		localStorage.setItem("leaveId", leaveId);
		var reason = $('#reason').val();
		console.log(reason);
		
		if(reason == "" || reason == null){
			document.getElementById("req").style.display = "block";
			document.getElementById("btn_reject").disabled = true;
		}
		else if(reason != "" || reason != null){
			document.getElementById("req").style.display = "none";
			document.getElementById("btn_reject").type = "submit";
	 		$.ajax({
				url: 'Leave_inListLeaveStatusToReject',
				type: 'POST',
				data : {
					"leave_id" : leaveId,
					"reason" : reason
				}, 
			})
			.done(function() {
				location.reload();
		 		localStorage.removeItem("data");
			});
	}
}
</script>
<script>
	$('.cannot').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});
</script>