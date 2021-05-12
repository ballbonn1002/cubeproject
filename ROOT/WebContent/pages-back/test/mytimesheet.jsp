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
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js">



</script>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="Dayinmonth" value="${0}"/>
<c:set var="holidays" value="${0}"/>
<c:set var="weekendSA" value="${0}"/>
<c:set var="weekendSU" value="${0}"/>
<c:set var="totaltimein" value="${0}"/>
<c:set var="totaltimeinm" value="${0}"/>
<c:set var="totalotin" value="${0}"/>
<c:set var="totalotinm" value="${0}"/>
<c:set var="lateTimeStart" value="${0}"/>
<c:set var="lateTimeEnd" value="${0}"/>
<c:set var="Holi2" value="${0}"/>


 <fmt:formatDate pattern = "yyyy"  value = "${now}" var="year_now" />

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

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="fa fa-edit font-red"></i> <span
				class="caption-subject font-red sbold uppercase">&nbsp;
				My timesheet REPORT</span>
		</div>
		
		<div class="actions right ">
			<a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title=""> </a>
		</div>

	</div>
		<form action="SearchMyTimeSheet" method="post" name="form">
				<div class="col-md-2"></div>
				<label class="col-md-1 control-label">Month :</label>
					<div class="col-md-2">
					<select class="form-control select2me" name="monthSearch" id=monthSearch required="required">
					<!-- qwerqwerqw -->
					<c:choose>
						<c:when test="${monthSearch != null}">
							<option value='01' id='01'
								<c:if test="${monthSearch == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${monthSearch == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${monthSearch == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${monthSearch == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${monthSearch == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${monthSearch == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${monthSearch == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${monthSearch == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${monthSearch == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${monthSearch == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${monthSearch == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${monthSearch == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:when>

						<c:otherwise>
							<option value='01' id='01'
								<c:if test="${month_now == 01 }"><c:out value="selected=selected"/> </c:if>>January</option>
							<option value='02' id='02'
								<c:if test="${month_now == 02 }"><c:out value="selected=selected"/> </c:if>>February</option>
							<option value='03' id='03'
								<c:if test="${month_now == 03 }"><c:out value="selected=selected"/> </c:if>>March</option>
							<option value='04' id='04'
								<c:if test="${month_now == 04 }"><c:out value="selected=selected"/> </c:if>>April</option>
							<option value='05' id='05'
								<c:if test="${month_now == 05 }"><c:out value="selected=selected"/> </c:if>>May</option>
							<option value='06' id='06'
								<c:if test="${month_now == 06 }"><c:out value="selected=selected"/> </c:if>>June</option>
							<option value='07' id='07'
								<c:if test="${month_now == 07 }"><c:out value="selected=selected"/> </c:if>>July</option>
							<option value='08' id='08'
								<c:if test="${month_now == 08 }"><c:out value="selected=selected"/> </c:if>>August</option>
							<option value='09' id='09'
								<c:if test="${month_now == 09 }"><c:out value="selected=selected"/> </c:if>>September</option>
							<option value='10' id='10'
								<c:if test="${month_now == 10 }"><c:out value="selected=selected"/> </c:if>>October</option>
							<option value='11' id='11'
								<c:if test="${month_now == 11 }"><c:out value="selected=selected"/> </c:if>>November</option>
							<option value='12' id='12'
								<c:if test="${month_now == 12 }"><c:out value="selected=selected"/> </c:if>>December</option>
						</c:otherwise>
					</c:choose>

				</select>
				</div>
				
				<label class="col-md-1 control-label">Year :</label>
				<div class="col-sm-2">
					<select
					class="form-control select2me" name="yearSearch" id=yearSearch required="required">
					<c:choose>
						<c:when test="${yearSearch != null}">
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}"
									<c:if test="${yearSearch == (year_now - i)}"><c:out value="selected=selected"/></c:if>>${year_now - i}</option>
							</c:forEach>
						</c:when>

						<c:otherwise>
							<c:forEach begin="0" end="4" var="i">
								<option value="${year_now - i}" id="${year_now - i}">${year_now - i}</option>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</select>
				</div>	
				
					<div class="col-md-2 text-center">
					<button type="submit" class="btn btn-sm blue-steel" id="searchbutton"
						onclick="search()">
						<i class="fa fa-search"></i>&nbsp;Search
					</button>
					<a class="btn btn-sm green-dark"
						href="TimeInReportExcelExport?year=${yearSearch}&month=${monthSearch}&user=${userId}"
						title="Print" style="color: white;"><i class="fa fa-print"></i>&nbsp;Excel</a>
						
				</div>
				
				<br> <br> <br>
				
				<div class="portlet-body" style="text-align: center;">
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead class="flip-content">
					<tr class = "text-center" style="background-color:rgb(59, 63, 81); color:white">
						<th height="41"><center>วันทำงาน</center></th>
						<th height="41" colspan="4"><center>ช่วงที่1</center></th>
						<th height="41" colspan="4"><center>ช่วงที่2</center></th>
						<th height="41" colspan="2"><center>รวมเวลา</center></th>
						<th height="41"><center>Remark</center></th>
					</tr>
					<tr style="background-color:#f2f2f2; color:black">
					<td>วันที่</td>
					<td colspan="2">เข้า</td>
					<td colspan="2">ออก</td>
					<td colspan="2">เข้า</td>
					<td colspan="2">ออก</td>
					<td>รวม</td>
					<td>OT</td>
					<td></td>
					</tr>
				</thead>
				<tbody style="vertical-align: middle;">
				<c:set var="oparators" value="${false}" />
				<c:forEach var ="allday" items="${daylist}">
				<c:set var="alldaynewformat" value="${allday.toString().replace('/', '')}" />
						<c:set var="Dayinmonth" value="${Dayinmonth + 1}" />
						
					<fmt:parseDate var="Weekend" value="${allday}" pattern="dd/MM/yyyy"/>
					<fmt:formatDate var="Weekendd" value="${Weekend}" pattern="E"/>
					
					<c:forEach var="TimeInlist" items="${TimeInlist}">
					
						<fmt:formatDate var="day_check_in" value="${TimeInlist.time_check_in}" pattern="dd/MM/yyyy" />
						<fmt:formatDate var="checkin" value="${TimeInlist.time_check_in}" pattern="HH:mm" />
						<fmt:formatDate var="checkout" value="${TimeInlist.time_check_out}" pattern="HH:mm" />
						<fmt:formatDate var="otin" value="${TimeInlist.OT_time_start}" pattern="HH:mm" />
						<fmt:formatDate var="otout" value="${TimeInlist.OT_time_end}" pattern="HH:mm" />
						<c:set var="WorkTimeStart" value="${TimeInlist.work_time_start.toString().replace(':', '')}" />
						<c:set var="WorkTimeEnd" value="${TimeInlist.work_time_end.toString().replace(':', '')}" />
						<fmt:parseNumber var="WorkTimeStartH" value="${WorkTimeStart}" />
						<fmt:parseNumber var="WorkTimeEndH" value="${WorkTimeEnd}" />
						<fmt:formatNumber var="WorkTimeStartHnewformat" value="${WorkTimeStartH}" pattern="0000" />
						<fmt:formatNumber var="WorkTimeEndHnewformat" value="${WorkTimeEndH}" pattern="0000" />
						
						<c:set var="checkinH" value="${checkin.toString().replace(':', '')}" />
						<c:set var="checkoutH" value="${checkout.toString().replace(':', '')}" />
						<fmt:formatNumber var="checkinnewformat" value="${checkinH}" pattern="0000" />
						<fmt:formatNumber var="checkoutnewformat" value="${checkoutH}" pattern="0000" />
						
							<c:choose>
								<c:when test="${day_check_in == allday}">
										<fmt:parseNumber var="Timeout" value="${checkout.toString().substring(0,2)}" />
										<fmt:parseNumber var="Timein" value="${checkin.toString().substring(0,2)}" />								
										<fmt:parseNumber var="otouts" value="${otout.toString().substring(0,2)}" />
										<fmt:parseNumber var="otins" value="${otin.toString().substring(0,2)}"/>
										<fmt:parseNumber var="Timeoutm" value="${checkout.toString().substring(3,5)}"  />
										<fmt:parseNumber var="Timeinm" value="${checkin.toString().substring(3,5)}" />
										<fmt:parseNumber var="otoutsm" value="${otout.toString().substring(3,5)}" />
										<fmt:parseNumber var="otinsm" value="${otin.toString().substring(3,5)}"/>
										
										<fmt:formatDate var="dayotin" value="${TimeInlist.OT_time_start}" pattern="dd" />
										<fmt:formatDate var="dayotout" value="${TimeInlist.OT_time_end}" pattern="dd" />
						
									<c:choose>
										<c:when test="${Timeinm <= Timeoutm}">
											<c:set var="TimeCompare" value="${(Timeout)-(Timein)}"/>
											<c:set var="TimeminCompare" value="${(Timeoutm)-(Timeinm)}"/>
										</c:when>
										<c:when test="${Timeinm > Timeoutm}">
											<c:set var="TimeCompare" value="${((Timeout-1)-(Timein))}"/>
											<c:set var="TimeminCompare" value="${(Timeoutm)-(Timeinm)+60}"/>
										</c:when>
									</c:choose>
										
								<c:choose>
										<c:when test="${dayotin != dayotout && otinsm <= otoutsm}">
											<c:set var="OtCompare" value="${((otouts)+((24-otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin != dayotout && otinsm > otoutsm}">
											<c:set var="OtCompare" value="${((otouts-1)+((24-otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)+(60-(otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin == dayotout && otinsm <= otoutsm}">
											<c:set var="OtCompare" value="${((otouts)-((otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
										<c:when test="${dayotin == dayotout && otinsm > otoutsm}">
											<c:set var="OtCompare" value="${((otouts)-((otins)))}"/>
											<c:set var="OtminCompare" value="${((otoutsm)-((otinsm)))}"/>
										</c:when>
								</c:choose>
								
								
										<fmt:formatNumber var="TimeCompareM" value="${TimeminCompare}" pattern="00" />	
										<fmt:formatNumber var="OtCompareM" value="${OtminCompare}" pattern="00" />	
										
										<c:set var="totaltimein" value="${totaltimein + TimeCompare}"/>
										<c:set var="totaltimeinm" value="${totaltimeinm + TimeCompareM}"/>
										<c:set var="totalotin" value="${totalotin + OtCompare}"/>
										<c:set var="totalotinm" value="${totalotinm + OtCompareM}"/>
																		
										<c:set var="WorkingDays" value="${WorkingDays+1}"/>
									<c:choose>
										<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat || checkoutnewformat < WorkTimeEndHnewformat}">
											<c:set var="LateDay" value="${LateDay+1}"/>
										</c:when>
									</c:choose>	
									<c:choose>
										<c:when test="${OtCompare > 0}">
											<c:set var="OTDay" value="${OTDay+1}"/>
										</c:when>
									</c:choose>	
									
									<c:choose>
										<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat }"> 
											<c:set var="lateTimeStart" value="${checkinnewformat - WorkTimeStartHnewformat}"/>
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${WorkTimeEndHnewformat != 0000 && checkoutnewformat < WorkTimeEndHnewformat }"> 
											<c:set var="lateTimeEnd" value="${WorkTimeEndHnewformat - checkoutnewformat}"/>
										</c:when>
									</c:choose>
																
										<fmt:formatNumber var="dd" value="${checkin.toString().replace(':', '')}" />
									<tr>
										<td style="vertical-align: middle;">
											<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;<fmt:formatDate value="${TimeInlist.time_check_in}" pattern="dd/MM/yyyy" />
										</td>
										<td style="vertical-align: middle;"><fmt:formatDate 
													value="${TimeInlist.time_check_in}" pattern="HH:mm" /></td>
										<td style="vertical-align: middle;">
										<c:choose>
											<c:when test="${WorkTimeStartHnewformat == 0000 }"> 
												<i class="fa fa-genderless text-danger icon-xl"></i>
											</c:when>
											<c:when test="${WorkTimeStartHnewformat != 0000 && checkinnewformat > WorkTimeStartHnewformat }">
												<i class="fa fa-arrow-circle-right text-danger icon-xl"></i>
											</c:when>
										</c:choose></td>
										<td style="vertical-align: middle;"><fmt:formatDate
													value="${TimeInlist.time_check_out}" pattern="HH:mm" /><td style="vertical-align: middle;">
										<c:choose>
										<c:when test="${WorkTimeEndHnewformat == 0000}">
												<i class="fa fa-genderless text-danger icon-xl"></i>
											</c:when>
											<c:when test="${WorkTimeEndHnewformat != 0000 && checkoutnewformat < WorkTimeEndHnewformat }">
												<i class="fa fa-arrow-circle-left text-danger icon-xl"></i>
											</c:when>
										</c:choose></td>
										<td style="vertical-align: middle;"><fmt:formatDate
													value="${TimeInlist.OT_time_start}" pattern="HH:mm" /></td>
										<td style="vertical-align: middle;"><c:choose><c:when test="${OtCompare > 0 }"><i class="fa fa-clock-o text-muted icon-xl"></i></c:when></c:choose></td>
										<td style="vertical-align: middle;"><fmt:formatDate
													value="${TimeInlist.OT_time_end}" pattern="HH:mm" /></td>	
										<td style="vertical-align: middle;"><c:choose><c:when test="${OtCompare > 0 }"><i class="fa fa-clock-o text-muted icon-xl"></i></c:when></c:choose> </td>
										<td style="vertical-align: middle;">
										
										<!-- aa -->
											<c:choose>
												<c:when test="${TimeCompare >= 8}"> 
													<div  class="btn-sm btn-info" >
														<i class="fa fa-check"></i> 
															
													8:00  hrs.
													
													</div>
												</c:when>
												<c:when test="${TimeCompare < 8}">
													<div  class="btn-sm btn-danger" >
														<i class="fa fa-fire"></i>
													${TimeCompare}:${TimeCompareM}  hrs.
													</div>
												</c:when>
												
											</c:choose>
										
										</td>
										</td>

									<td style="vertical-align: middle;">
									
									<c:choose>
												<c:when test="${OtCompare > 0}">
													<div  class="btn-sm btn-warning" >
													<i class="fa fa-star"></i>

													${OtCompare}:${OtCompareM}  hrs.
													
												</div>
												</c:when>
												
											</c:choose>
																				
																			
									</td>
										<td width="35%" style="word-break:break-all">${TimeInlist.OT_description}</td>
									
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
								
							</c:choose>
							
							
					</c:forEach>
					<c:forEach var="Holidayls" items="${Holidayls}">
					<fmt:formatDate var="holidayy" value="${Holidayls.start_date}" pattern="dd/MM/yyyy" />
					<fmt:formatDate var="holidaye" value="${Holidayls.end_date}" pattern="dd/MM/yyyy" />
					<fmt:parseNumber var="startholidaym" value="${holidayy.toString().substring(3,5)}" />
					<fmt:parseNumber var="endholidaym" value="${holidaye.toString().substring(3,5)}" />
					<fmt:parseNumber var="startholiday" value="${holidayy.toString().substring(0,2)}" />
					<fmt:parseNumber var="endholiday" value="${holidaye.toString().substring(0,2)}" />
					<fmt:parseNumber var="Ystartholiday" value="${holidayy.toString().substring(6,10)}" />
					<fmt:parseNumber var="Yendholiday" value="${holidaye.toString().substring(6,10)}" />
					<fmt:formatNumber var="startholidaym" value="${startholidaym}" pattern="00" />
					<fmt:formatNumber var="endholidaym" value="${endholidaym}" pattern="00" />
					
					<c:forEach var="x" begin="${startholiday}" end="${endholiday}" step="1" >
					
						<c:set var="Holiday" value="${startholiday + x}" />
						<c:choose>
							<c:when test="${x == Dayinmonth}">
							
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
							
								
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all">${Holidayls.head}</td>
												</c:when>
											</c:choose>
										
										
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
								
							<c:choose>
							<c:when test="${startholidaym < endholidaym}">
							<c:forEach var="x" begin="${startholiday}" end="${Dayinmonth}" step="1" >
								<c:set var="Holiday" value="${startholiday + x}" />
								<c:set var="HOLIDAY" value="${x}${startholidaym}${Ystartholiday}" />
							<c:choose>
							<c:when test="${HOLIDAY == alldaynewformat}">
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
									
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
										 		<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all">${Holidayls.head}</td>
												</c:when>
											</c:choose>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							<c:choose>
							<c:when test="${endholidaym > startholidaym}">
							<c:forEach var="a" begin="${Dayinmonth}" end="${endholiday}" step="1" >
								<c:set var="Holiday" value="${Dayinmonth + a}" />
								<fmt:formatNumber var="x" value="${a}" pattern="00" />
								<c:set var="HOLIDAYY" value="${x}${endholidaym}${Yendholiday}" />
							<c:choose>
							<c:when test="${HOLIDAYY == alldaynewformat}">
							
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
											<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
												<c:set var="Holi2" value="${Holi2 + 1}"></c:set>
													<td width="35%" style="word-break:break-all">${Holidayls.head}</td>
												</c:when>
											</c:choose>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
					</c:forEach>
					
					<c:forEach var="leavelistsddd" items="${leavelists}">
						<fmt:formatDate var="startdateformat" value="${leavelistsddd.start_date}" pattern="dd/MM/yyyy" />
						<fmt:formatDate var="enddateformat" value="${leavelistsddd.end_date}" pattern="dd/MM/yyyy" />
						<fmt:parseNumber var="startleaveformat" value="${startdateformat.toString().substring(0,2)}" />
						<fmt:parseNumber var="endleaveformat" value="${enddateformat.toString().substring(0,2)}" />
						<fmt:parseNumber var="Mstartleaveday" value="${startdateformat.toString().substring(3,5)}" />
						<fmt:parseNumber var="Mendleaveday" value="${enddateformat.toString().substring(3,5)}" />
						<fmt:parseNumber var="Ystartleaveday" value="${startdateformat.toString().substring(6,10)}" />
						<fmt:parseNumber var="Yendleaveday" value="${enddateformat.toString().substring(6,10)}" />
						<fmt:formatNumber var="MStartleaveday" value="${Mstartleaveday}" pattern="00" />
						<fmt:formatNumber var="MEndleaveday" value="${Mendleaveday}" pattern="00" />
						<fmt:parseNumber var="leavestatus" value="${leavelistsddd.leave_status_id}" pattern="00"/>
						<c:choose>
							<c:when test="${Mstartleaveday == Mendleaveday}">						
						<c:forEach var="i" begin="${startleaveformat}" end="${endleaveformat}" step="1" >
							<c:set var="leave" value="${startleaveformat + i}" />
							
						
						<c:choose>
							<c:when test="${leavestatus == '1' && i == Dayinmonth}">
									<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
						</c:forEach>
						</c:when>
						</c:choose>
						
						<c:choose>
							<c:when test="${Mstartleaveday < Mendleaveday}">
							<c:forEach var="x" begin="${startleaveformat}" end="${Dayinmonth}" step="1" >
								<c:set var="leave" value="${startleaveformat + x}" />
								<fmt:formatNumber var="a" value="${x}" pattern="00" />
								<c:set var="LEAVE" value="${a}${MStartleaveday}${Ystartleaveday}" />
							<c:choose>
							<c:when test="${leavestatus == '1' && LEAVE == alldaynewformat}">
							
									<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							
							<c:choose>
							<c:when test="${Mendleaveday > Mstartleaveday}">
							
							<c:forEach var="a" begin="${Dayinmonth}" end="${endleaveformat}" step="1" >
								<c:set var="leavee" value="${Dayinmonth + a}" />
								<fmt:formatNumber var="x" value="${a}" pattern="00" />
								<c:set var="LEAVEE" value="${x}${MEndleaveday}${Yendleaveday}" />
							<c:choose>
							<c:when test="${leavestatus == '1' && LEAVEE == alldaynewformat}">
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<tr style="background-color:#E1E5EC">
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<tr style="background-color:#eef4fb">
												</c:when>
											</c:choose>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<td width="35%" style="word-break:break-all"></td>
												</c:when>
												<c:when test="${Weekendd != 'Sat' && Weekendd != 'Sun'}">
													<td width="35%" style="word-break:break-all">${leavelistsddd.description}</td>
												</c:when>
											</c:choose>
									</tr>
									<c:set var="oparators" value="${true}" />
								</c:when>
							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							
					</c:forEach>
											<c:choose>
												<c:when test="${Weekendd == 'Sat'}">
													<c:set var="weekendSA" value="${weekendSA+1}"/>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<c:set var="weekendSU" value="${weekendSU+1}"/>
												</c:when>
											</c:choose>	
						<c:set var="weekend" value="${weekendSA+weekendSU}"></c:set>
						<c:if test="${oparators == false}">
							<c:choose>
								<c:when test="${Weekendd == 'Sat' || Weekendd == 'Sun'}">
									<tr style="background-color:#E1E5EC">
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td width="35%" style="word-break:break-all"></td>
									</tr>
								</c:when>
								<c:otherwise>
									<tr>
										<td style="vertical-align: middle;">
										<c:choose>
												<c:when test="${Weekendd == 'Mon'}"> 
													<i class="fa fa-circle-o font-yellow-crusta icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Tue'}">
													<i class="fa fa-circle-o font-red-pink icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Wed'}">
													<i class="fa fa-circle-o font-green-jungle icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Thu'}">
													<i class="fa fa-circle-o font-yellow-gold icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Fri'}">
													<i class="fa fa-circle-o font-blue icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sat'}">
													<i class="fa fa-circle-o font-purple-seance icon-xl"></i>
												</c:when>
												<c:when test="${Weekendd == 'Sun'}">
													<i class="fa fa-circle-o font-red-thunderbird icon-xl"></i>
												</c:when>
											</c:choose>
											&nbsp;${allday}</td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td style="vertical-align: middle;"></td>
										<td width="35%" style="word-break:break-all"></td>
								</tr>
								</c:otherwise>
							</c:choose>			
						
						</c:if>
					<c:set var="oparators" value="${false}" />
				</c:forEach>
										
				</tbody>
				</table>
				</div>
					<div class="portlet-body" style="text-align: center;">
					<c:set var="absent" value="${Dayinmonth-(TimeCalList.work_day_count+TimeCalList.leave_day_count+weekend+Holi2)}"></c:set>	
			<table class="table table-bordered table-striped table-condensed table-hover">
				<thead class="flip-content">
					<tr class = "text-center">
						<th style="vertical-align: middle; background-color:#E9EDEF; color:black;" height="41">สรุปเวลา</th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ทำงานทั้งหมด</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>(สาย + ออกก่อน) หัก 60 นาที</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ขาดงาน</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ลางาน</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>ล่วงเวลาทั้งหมด</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x1</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x1.5</center></th>
						<th style="background-color:#E9EDEF; color:black;" height="41"><center>จำนวนชั่วโมงการบริการส่วนเพิ่ม x3</center></th>
					</tr>
				</thead>
				<tbody style="vertical-align: middle;">
					<tr>
					<th style="background-color:#E9EDEF; color:black;">วัน</th>
					<td><center><c:out value="${TimeCalList.work_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.late_early_day_count}"/></center></td>
					<td><center><c:out value="${absent}"/></center></td>
					<td><center><c:out value="${TimeCalList.leave_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x1_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x15_day_count}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x3_day_count}"/></center></td>
					</tr>

					<tr>
					<th style="background-color:#E9EDEF; color:black;">ชั่วโมง(นาที/60*100)</th>
					<td><center><c:out value="${TimeCalList.work_day_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.late_early_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.absent_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.leave_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x1_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x15_hour}"/></center></td>
					<td><center><c:out value="${TimeCalList.ot_x3_hour}"/></center></td>
					</tr>				
				</tbody>
				</table>
				</div>
				
							
				<script>
				
				$("tr:not(:first)").each(function (index ) {
					   $(this).css('animation-delay',index *0.01 +'s');
					}); 
								
				</script>
				
