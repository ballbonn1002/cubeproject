<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tlds/permission.tld" prefix="perm"%>
<link href="http://code.jquery.com/ui/1.9.2/themes/base/jquery-ui.css"
	rel="stylesheet" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.9.2/jquery-ui.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"
	type="text/javascript"></script>

<link
	href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"
	rel="stylesheet" type="text/css" />

<style>
.alert {
	width: 20%;
	height: 10px;
	padding: 0px;
	display: inline-block;
}

.form-inline {
	width: 5%;
	height: 10px;
	display: inline;
}
</style>

<fmt:formatDate value="${bean.date}" pattern="dd-MM-yyyy" />
<%--   ${roleList} ${departmentList} ${user}
<c:if test="${user.id  == 'akaradej.j'}"> tataa </c:if>  --%>

<div class="portlet light bordered">
	<div class="portlet-title">
		<div class="caption">
			<i class="icon-user font-red"></i> <span
				class="caption-subject font-red sbold uppercase">&nbsp;ADMIN
				EDIT USER </span> <span class="caption-helper font-red">${selectUser.name}</span>
		</div>
		<div class="actions right">
			&nbsp; <a class="btn btn-circle btn-icon-only btn-default fullscreen"
				href="javascript:;" data-original-title="" title="">&nbsp;</a>&nbsp;
			&nbsp;
			<button class="btn btn-danger"
				style="float: left; border-radius: 8px !important;"
				onclick="deleteFunc()">
				<i class="fa fa-trash"></i> Delete User
			</button>

			<script type="text/javascript">
				function deleteFunc() {
					var r=confirm("ยืนยันการลบข้อมูลพนักงาน");
					if (r==true){
					document.location = "user-flag?id=${selectUser.id}";
					}else{
					}
				}
			</script>
		</div>

	</div>

	<!-- BEGIN FORM-->
	<form action="admin-perform-edit-test" class="form-horizontal" method="post"
		enctype="multipart/form-data">
		<div>
			<div class="note note-info">
				<p class="block">Account Information</p>
			</div>
			<center style="margin-top: 5%; margin-bottom: 5%;">
				<div class="fileinput fileinput-new" data-provides="fileinput">
					<div class="fileinput-new thumbnail"
						style="width: 200px; height: 150px;">
						<a href="${selectUser.path}"> <c:if
								test="${selectUser.path == null}">
								<img
									src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image"
									alt="cc">
							</c:if> <c:if test="${selectUser.path != null}">
								<img src="${selectUser.path}" alt=""
									style="text-align: center; width: 200px; height: 150px;">
							</c:if>
					</div>
					<div class="fileinput-preview fileinput-exists thumbnail"
						style="max-width: 200px; max-height: 150px; line-height: 10px;"></div>
					<div>
						<span class="btn default btn-file"> <span
							class="fileinput-new"><i class="fa fa-picture-o"></i>
								Select File</span> <span class="fileinput-exists"> Change </span> <input
							type="hidden" value="" name="..."> <input type="file"
							name="fileUpload" id="myFile" value=""
							accept="image/x-png,image/gif,image/jpeg">
						</span> <a href="javascript:;" class="btn red fileinput-exists"
							data-dismiss="fileinput"> Remove </a>
					</div>
				</div>
			</center>
			<div class="portlet-body form"
				style="margin-right: 2%; margin-left: 2%;">
				<div class="form-group form-lg-line-input  ">

					<div class="caption caption col-md-2">
						Login :<br>
					</div>
					<div class="caption col-md-4">
						<input id="user" type="text" class="form-control" placeholder=""
							value="${selectUser.id}" name="user.id" readonly>
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Role :<br>
					</div>
					<div class="caption col-md-4">
						<select class="bs-select form-control" name="user.roleId">
							<c:forEach var="role" items="${roleList}">
								<option value="${role.id}"
									<c:if test="${selectUser.roleId eq role.id}"> selected </c:if>>${role.id}
									- ${role.name}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="form-group form-lg-line-input">
					<div class="caption caption col-md-2">
						Name :<br>
					</div>
					<div class="caption col-md-4">
						<input type="text" class="form-control" placeholder=""
							maxlength="200" value="${selectUser.name}" name="user.name">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Enabled:<br>
					</div>
					<div class="caption col-md-4">
						<div class="md-radio-inline">
							<div class="md-radio has-success">
								<input type="radio" id="radio14" name="user.enable"
									class="md-radiobtn"
									<c:if test="${selectUser.enable eq '1' }">
                                          checked
                                     </c:if>
									value="1"> <label for="radio14" style="color: #333;">
									<span class="inc"></span> <span class="check"
									style="background: #26C281;"></span> <span class="box"
									style="border-color: #26C281;"></span> enabled
								</label>
							</div>
							<div class="md-radio has-error">
								<input type="radio" id="radio15" name="user.enable"
									class="md-radiobtn"
									<c:if test="${selectUser.enable eq '0' }">
                                          checked
                                   </c:if>
									value="0"> <label for="radio15" style="color: #333;">
									<span class="inc"></span> <span class="check"></span> <span
									class="box"></span> disabled
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input  ">
					<div class="caption caption col-md-2">
						Nick Name :<br>
					</div>
					<div class="caption col-md-4">
						<input type="text" class="form-control" placeholder=""
							maxlength="32" value="${selectUser.nickName}"
							name="user.nickName">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Send E-Mail :<br>
					</div>
					<div class="caption col-md-4">
						<div class="md-radio-inline">
							<div class="md-radio has-success">
								<input type="radio" id="radio19" class="md-radiobtn"
									name="user.emailEnable"
									<c:if test="${selectUser.emailEnable eq '1' }">
                                          checked
                                     </c:if>
									value="1"> <label for="radio19" style="color: #333;">
									<span class="inc"></span> <span class="check"
									style="background: #26C281;"></span> <span class="box"
									style="border-color: #26C281;"></span> enabled
								</label>
							</div>
							<div class="md-radio has-error">
								<input type="radio" id="radio17" class="md-radiobtn"
									name="user.emailEnable"
									<c:if test="${selectUser.emailEnable eq '0' }">
                                          checked
                                   </c:if>
									value="0"> <label for="radio17" style="color: #333;">
									<span class="inc"></span> <span class="check"></span> <span
									class="box"></span> disabled
								</label>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input  ">
					<div class="caption caption col-md-2">
						Password :<br>
					</div>
					<div class="caption col-md-4">
						<input type="password" class="form-control" placeholder=""
							maxlength="32" value="${selectUser.password}" name="password"
							id="password">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">E-Mail :</div>
					<div class="caption col-md-4">
						<input type="email" class="form-control" placeholder=""
							maxlength="50" value="${selectUser.email}" name="user_email">

					</div>
				</div>
				<div class="form-group form-lg-line-input  ">
					<div class="caption caption col-md-2">
						Confirm Password :<br>
					</div>
					<div class="caption col-md-4">
						<input type="password" class="form-control" placeholder=""
							maxlength="32" value="${selectUser.password}"
							name="confirmpassword" id="confirm_password"> <span
							id='message'></span>
					</div>
					<%-- 	<div class="caption caption col-md-2">
						Email Password :<br>
					</div>
					<div class="caption col-md-4">
						<input type="password" class="form-control" placeholder=""
							maxlength="32" value="${selectUser.emailPassword}"
							name="user_emailPassword">
						<div class="form-control-focus"></div>
					</div> --%>
					<div class="caption caption col-md-2" style="margin-top: 3px;">Phone
						Number :</div>
					<div class="caption col-md-4" style="margin-top: 3px;">
						<input type="text" name="user.phonenum" id="phone" maxlength="10"
							class="form-control" value="${selectUser.phonenum}">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2" style="margin-top: 3px;">
						Gender :<br>
					</div>
					<div class="caption col-md-4">
						<div class="md-radio-inline">
							<div class="md-radio has-success">
								<input type="radio" id="radio20" class="md-radiobtn"
									name="user.gender"
									<c:if test="${selectUser.gender eq 'M' }">
                                          checked
                                     </c:if>
									value="M"> <label for="radio20" style="color: #333;">
									<span class="inc"></span> <span class="check"
									style="background: #26C281;"></span> <span class="box"
									style="border-color: #26C281;"></span> Male
								</label>
							</div>
							<div class="md-radio has-error">
								<input type="radio" id="radio21" class="md-radiobtn"
									name="user.gender"
									<c:if test="${selectUser.gender eq 'F' }">
                                          checked
                                   </c:if>
									value="F"> <label for="radio21" style="color: #333;">
									<span class="inc"></span> <span class="check"></span> <span
									class="box"></span> Female
								</label>
							</div>
						</div>
					</div>
				</div>

				<%-- <div class="form-group form-md-line-input  ">
					<div class="caption caption col-md-2">
						Role :<br>	
					</div>
					<div class="caption col-md-4" style="margin-top: -6px;">
						<select class="bs-select form-control" name="role.id">
							<c:forEach var="role" items="${roleList}">
								<option value="${role.id}"
									<c:if test="${user.roleId eq role.id }"> selected </c:if>>${role.name}</option>
							</c:forEach>
						</select>
						<div class="form-control-focus"></div>
					</div>
				</div> --%>
				<br> <br>
				<div class="note note-info">
					<p class="block">Employee Information</p>
				</div>
				<div class="form-group form-lg-line-input">
					<div class="caption caption col-md-2">
						Employee Code :<br>
					</div>
					<div class="caption col-md-4">
						<input type="text" class="form-control" placeholder=""
							maxlength="8" value="${selectUser.employeeId}"
							name="user.employeeId">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Birth Date :<br>
					</div>
					<div class="caption col-md-3">
						<div>
							<%-- <input class="form-control form-control-inline date-picker test"
								type="text" data-date-format="dd-mm-yyyy" 
								value="<fmt:formatDate value="${user.birthDate}" pattern=" dd-MM-yyyy" />"
								name="birthDate" onkeypress='return false'> --%>


							<input name="birthDate"
								value="<fmt:formatDate value="${selectUser.birthDate}" pattern=" dd-MM-yyyy" />"
								class="form-control form-control-inline date-picker test"
								size="9" type="text" data-date-format="dd-mm-yyyy"
								onkeypress='return false'>

							<div class="form-control-focus"></div>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input">
					<div class="caption caption col-md-2">
						Position :<br>
					</div>
					<div class="caption col-md-4">
						<select class="bs-select form-control" name="position_id">

							<option value="NONE">None</option>

							<c:forEach var="position" items="${positionList}">
								<option value="${position.position_id}"
									<c:if test="${selectUser.positionId eq position.position_id }"> selected </c:if>>${position.name}</option>
							</c:forEach>
						</select>
						<div class="form-control-focus"></div>
					</div>




					<div class="caption caption col-md-2">
						Start Working Date :<br>
					</div>
					<div class="caption col-md-3">
						<div>
							<%-- <input class="form-control form-control-inline date-picker test"
								type="text" data-date-format="dd-mm-yyyy" 
								value="<fmt:formatDate value="${user.startDate}" pattern=" dd-MM-yyyy" />"
								name="startDate" onkeypress='return false'> --%>

							<input name="startDate"
								value="<fmt:formatDate value="${selectUser.startDate}" pattern=" dd-MM-yyyy" />"
								class="form-control form-control-inline date-picker test"
								size="9" type="text" data-date-format="dd-mm-yyyy"
								onkeypress='return false'>

							<div class="form-control-focus"></div>
						</div>
					</div>
				</div>


				<div class="form-group form-lg-line-input">

					<div class="caption caption col-md-2">
						Department :<br>
					</div>
					<div class="caption col-md-4">
						<select class="bs-select form-control" name="department_id">
							<c:forEach var="department" items="${departmentList}">
								<option value="${department.id}"
									<c:if test="${selectUser.departmentId eq department.id }"> selected </c:if>>${department.id}</option>
							</c:forEach>
						</select>
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Last Working Date :<br>
					</div>
					<div class="caption col-md-3">
						<div>
							<%-- <input class="form-control form-control-inline  date-picker test"
								type="text" data-date-format="dd-mm-yyyy"
								value="<fmt:formatDate value="${user.endDate}" pattern=" dd-MM-yyyy" />"
								name="endDate"> --%>

							<input name="endDate"
								value="<fmt:formatDate value="${selectUser.endDate}" pattern=" dd-MM-yyyy" />"
								class="form-control form-control-inline date-picker test"
								size="9" type="text" data-date-format="dd-mm-yyyy"
								onkeypress='return false'>


							<div class="form-control-focus"></div>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input">

					<div class="caption caption col-md-2">
						Manager :<br>
					</div>
					<div class="caption col-md-4">
						<select class="bs-select form-control select2me"
							name="user.managerId">
							<c:forEach var="manager" items="${userList}">
								<option value="${manager.id}" name="manager.id"
									<c:if test="${selectUser.managerId eq manager.id }"> selected </c:if>>${manager.department_id}
									- ${manager.id}</option>
							</c:forEach>
						</select>
						<div class="form-control-focus"></div>
					</div>
					<div class="caption caption col-md-2">
						Address :<br>
					</div>
					<div class="caption col-md-3">
						<textarea class="form-control" rows="2" maxlength="255"
							placeholder="Please add your address" name="user.address">${selectUser.address}</textarea>
						<div class="form-control-focus"></div>
					</div>
				</div>
				<div class="form-group form-lg-line-input">

					<div class="caption caption col-md-2">
						Working HourOur :<br>
					</div>
					<div class="caption col-md-10">
						<div class="caption col-md-2">
							<select class="bs-select form-control"
								style="text-align: center;" value="${selectUser.workDayStart}"
								name="user.workDayStart">
								<option value="1"
									<c:if test="${selectUser.workDayStart == 1}"> selected </c:if>>Mon</option>
								<option value="2"
									<c:if test="${selectUser.workDayStart == 2}"> selected </c:if>>Tue</option>
								<option value="3"
									<c:if test="${selectUser.workDayStart == 3}"> selected </c:if>>Wed</option>
								<option value="4"
									<c:if test="${selectUser.workDayStart == 4}"> selected </c:if>>Thu</option>
								<option value="5"
									<c:if test="${selectUser.workDayStart == 5}"> selected </c:if>>Fri</option>
								<option value="6"
									<c:if test="${selectUser.workDayStart == 6}"> selected </c:if>>Sat</option>
								<option value="7"
									<c:if test="${selectUser.workDayStart == 7}"> selected </c:if>>Sun</option>
							</select>
							<div class="form-control-focus"></div>
						</div>
						<div class="caption col-md-1">ถึง</div>
						<div class="caption col-md-2">
							<select class="bs-select form-control"
								value="${selectUser.workDayEnd}" style="text-align: center;"
								name="user.workDayEnd">
								<option value="1"
									<c:if test="${selectUser.workDayEnd == 1}"> selected </c:if>>Mon</option>
								<option value="2"
									<c:if test="${selectUser.workDayEnd == 2}"> selected </c:if>>Tue</option>
								<option value="3"
									<c:if test="${selectUser.workDayEnd == 3}"> selected </c:if>>Wed</option>
								<option value="4"
									<c:if test="${selectUser.workDayEnd == 4}"> selected </c:if>>Thu</option>
								<option value="5"
									<c:if test="${selectUser.workDayEnd == 5}"> selected </c:if>>Fri</option>
								<option value="6"
									<c:if test="${selectUser.workDayEnd == 6}"> selected </c:if>>Sat</option>
								<option value="7"
									<c:if test="${selectUser.workDayEnd == 7}"> selected </c:if>>Sun</option>
							</select>
							<div class="form-control-focus"></div>
						</div>
						<div class="caption col-md-1">เวลา :</div>
						<div class="caption col-md-2">
							<%-- <input type="text" class="form-control" placeholder="" value="${user.workTimeStart}" name="user.workTimeStart"> --%>
							<input type="text" class="form-control timepicker timepicker-24"
								style="text-align: center;"
								value="<c:choose><c:when test="${selectUser.workTimeStart == '' or selectUser.workTimeStart == null}"> '' </c:when>
								<c:otherwise>${selectUser.workTimeStart}</c:otherwise> </c:choose>"
								name="user.workTimeStart">
							<div class="form-control-focus"></div>
						</div>
						<div class="caption col-md-1" style="text-align: center;">~</div>
						<div class="caption col-md-2">
							<%-- <input type="text" class="form-control" placeholder="" value="${user.workTimeEnd}" name="user.workTimeEnd"> --%>
							<input type="text" class="form-control timepicker timepicker-24"
								style="text-align: center;"
								value="<c:choose><c:when test="${selectUser.workTimeEnd == '' or selectUser.workTimeEnd == null}"> '' </c:when>
								<c:otherwise>${selectUser.workTimeEnd}</c:otherwise> </c:choose>"
								name="user.workTimeEnd">
							<div class="form-control-focus"></div>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input">
					<div class="caption caption col-md-2">
						Education :<br>
					</div>
					<div class="caption col-md-10">
						<!-- <div class="portlet-body flip-scroll" style="text-align: center;"> -->
						<div class="portlet-body flip-scroll">
							<table
								class="table table-bordered table-striped table-condensed flip-content table-hover">
								<thead class="flip-content">
									<tr>
										<th><div style="text-align: left;">No</div></th>
										<th>
											<div style="text-align: left;">Level of Education</div>
										</th>
										<th>
											<div class="visible-xs" style="text-align: left;">
												<div class="portlet-body form">
													<div class="form-control-focus col-md-12"
														style="margin-top: 11%; text-align: left; padding-left: 0px;">Name
														of Institute</div>

												</div>
											</div>
											<div class="hidden-xs" style="text-align: left;">
												<div class="portlet-body form">
													<div class="form-control-focus col-md-12"
														style="text-align: left; padding-left: 0px;">Name of
														Institute</div>
												</div>
											</div>
										</th>
										<th>
											<div class="visible-xs" style="text-align: left;">
												<div class="portlet-body form">
													<div style="margin-top: 25%;"></div>
													<div>Duration (Year)</div>
													<div style="margin-top: 24%;"></div>
												</div>
											</div>
											<div class="hidden-xs">
												<div class="portlet-body form">
													<div>Duration (Year)</div>
												</div>
											</div>
										</th>
										<th>
											<div style="margin-top: 8%; text-align: left;"
												class="visible-xs">Degree/Certificate</div>
											<div style="" class="hidden-xs">Degree/Certificate</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>High School</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													value="${selectUser.eduInstitute1}" size="50"
													maxlength="200" name="user.eduInstitute1">
											</div>
										</td>
										<td>
											<div class="portlet-body form">
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" min="0" value="${selectUser.eduDurStart1}"
														name="user.eduDurStart1">
												</div>
												<div class="col-md-2">~</div>
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" min="0" value="${selectUser.eduDurEnd1}"
														name="user.eduDurEnd1">
												</div>
											</div>
										</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduDegree1}"
													name="user.eduDegree1" size="50">
											</div>
										</td>
									</tr>
									<tr>
										<td>2</td>
										<td>Technical/Commecial</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduInstitute2}"
													size="50" name="user.eduInstitute2">
											</div>
										</td>
										<td>
											<div class="portlet-body form">
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurStart2}"
														name="user.eduDurStart2">
												</div>
												<div class="col-md-2">~</div>
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurEnd2}"
														name="user.eduDurEnd2">
												</div>
											</div>
										</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduDegree2}"
													name="user.eduDegree2" size="50">
											</div>
										</td>
									</tr>
									<tr>
										<td>3</td>
										<td>University</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduInstitute3}"
													size="50" name="user.eduInstitute3">
											</div>
										</td>
										<td>
											<div class="portlet-body form">
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurStart3}"
														name="user.eduDurStart3">
												</div>
												<div class="col-md-2">~</div>
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurEnd3}"
														name="user.eduDurEnd3">
												</div>
											</div>
										</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduDegree3}"
													name="user.eduDegree3" size="50">
											</div>
										</td>
									</tr>
									<tr>
										<td>4</td>
										<td>Graduate School</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduInstitute4}"
													size="50" name="user.eduInstitute4">
											</div>
										</td>
										<td>
											<div class="portlet-body form">
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurStart4}"
														name="user.eduDurStart4">
												</div>
												<div class="col-md-2">~</div>
												<div class="form-control-focus col-md-5">
													<input type="number" class="form-control" placeholder=""
														maxlength="4" value="${selectUser.eduDurEnd4}"
														name="user.eduDurEnd4">
												</div>
											</div>
										</td>
										<td>
											<div class="form-control-focus">
												<input type="text" class="form-control" placeholder=""
													maxlength="200" value="${selectUser.eduDegree4}" size="50"
													name="user.eduDegree4">
											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="form-group form-lg-line-input">

					<div class="caption caption col-md-2">
						Leave Quota :<br>
					</div>
					<div class="caption col-md-1" style="padding-right: 0.2%;">
						ลาพักร้อน :</div>
					<div class="caption col-md-1">
						<input type="text" class="form-control" min="0" maxlength="4"
							value="${selectUser.leaveQuota1}" name="user.leaveQuota1"
							onkeypress="return fun_AllowOnlyAmountAndDot(this.id);">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption col-md-1">วัน</div>
					<div class="caption col-md-2" style="padding-right: 0.2%;">ลาพักร้อนที่เหลือจากปีที่แล้ว
						:</div>
					<div class="caption col-md-1">
						<input type="text" class="form-control" min="0" maxlength="4"
							value="${selectUser.leaveQuota4}" name="user.leaveQuota4"
							onkeypress="return fun_AllowOnlyAmountAndDot(this.id);">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption col-md-1">วัน</div>
					<div class="caption col-md-1" style="padding-right: 0.2%;">ลาป่วย
						:</div>
					<div class="caption col-md-1">
						<input type="text" class="form-control" min="0" maxlength="4"
							value="${selectUser.leaveQuota3}" name="user.leaveQuota3"
							onkeypress="return fun_AllowOnlyAmountAndDot(this.id);">
						<div class="form-control-focus"></div>
					</div>
					<div class="caption col-md-1">วัน</div>
				</div>
			</div>
			<input type="hidden" name="page" value="2">



			<!-- approve -->

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
									<button type="button" name = "test" class="btn btn-sm red"
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
											<!-- <input class="form-control" type="hidden" name="ii" value="ii" required> -->
										<%-- <input type="text" class="form-control" placeholder=""
										maxlength="200" value="${selectUser.managerId}" name="approver.apprId">  --%>

									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		   
			<!-- <div id="temp"></div> -->
			<!-- end approve -->


			<div class="form-actions action right">
				<div class="row ">
					<div class="col-md-12" style="text-align: center;">

						<perm:permission object="user.edit">
							<button type="submit" class="btn blue">
								<i class="fa fa-save"></i>&nbsp;Save
							</button>
							<button type="reset" class="btn red">
								<i class="fa fa-close"></i> Cancel
							</button>
						</perm:permission>

					</div>
				</div>
			</div>
		 <input type="hidden" id ="temp" name="approver.apprId" >	
		<!--  <input type="hidden" id ="temp1" name="approver.apprId" > -->
	</form>
	
	<!-- END FORM-->
</div>
</div>
<div class="portlet light bordered" style="margin-top: 50px;">
	<div class="portlet-title">

		<div class="caption">
			<i class="fa fa-history font-blue"></i> <span
				class="caption-subject font-red sbold ">Borrow History</span>
		</div>
	</div>

	<div class="portlet-body">

		<div class="table-responsive">
			<table
				class="table table-bordered table-striped table-condensed flip-content table-hover ">
				<thead>
					<tr>
						<th><center>ID Borrow</center></th>
						<th><center>ITEM NO.</center></th>
						<th><center>Borrow By</center></th>
						<th><center>From</center></th>
						<th><center>To</center></th>
						<th><center>Location</center></th>
						<th><center>Status</center></th>
						<th><center>Time Create</center></th>

					</tr>
				</thead>
				<tbody>
					<c:forEach var="borrow_history" items="${borrow_history}">
						<tr>
							<td><center>
									<a href="approve_id?borrowid=${borrow_history.borrow_id}">${borrow_history.borrow_id}</a>
								</center></td>
							<td><center>${borrow_history.item_no}</center></td>
							<td><center>${borrow_history.user_borrowid}</center></td>
							<td><center>
									<fmt:formatDate value="${borrow_history.date_start}"
										pattern="dd-MM-yyyy"></fmt:formatDate>
								</center></td>

							<td><center>
									<fmt:formatDate value="${borrow_history.date_end}"
										pattern="dd-MM-yyyy"></fmt:formatDate>
								</center></td>
							<td><center>${borrow_history.location}</center></td>
							<c:if test="${borrow_history.statusborrow == 'W'  }">
								<td style="text-align: center;"><span
									class="label label-sm label-info">Waiting for Approved </span></td>
							</c:if>

							<c:if test="${borrow_history.statusborrow == 'B'  }">
								<td style="text-align: center;"><span
									class="label label-sm label-warning">Borrowing </span></td>
							</c:if>

							<c:if test="${borrow_history.statusborrow == 'R' }">
								<td style="text-align: center;"><span
									class="label label-sm label-default"> Request for Return
								</span></td>
							</c:if>

							<c:if test="${borrow_history.statusborrow == 'F' }">
								<td style="text-align: center;"><span
									class="label label-sm label-primary"> Finish </span></td>
							</c:if>

							<c:if test="${borrow_history.statusborrow == 'C' }">
								<td style="text-align: center;"><span
									class="label label-sm label-danger"> Cancel </span></td>
							</c:if>
							<c:if
								test="${borrow_history.statusborrow == 'U' || borrow_history.statusborrow == 'X'  }">
								<td style="text-align: center;"><span
									class="label label-sm label-danger"> Unapproved </span></td>
							</c:if>

							<td><center>
									<fmt:formatDate value="${borrow_history.time_create}"
										pattern="dd-MM-yyyy HH:mm:ss"></fmt:formatDate>
								</center></td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>


<script>
	$('.test').keydown(function(e) {
		// trap the return key being pressed
		if (e.keyCode === 13 || e.keyCode === 8) {
			return false;
		}
	});

	function isNumberKey(evt) {
		var charCode = (evt.which) ? evt.which : event.keyCode;
		return !((charCode > 31 && charCode < 48) || (charCode > 57));
	}
</script>
<script type="text/javascript">
	$('#password, #confirm_password').on(
			'keyup',
			function() {
				if ($('#password').val() == $('#confirm_password').val()) {
					$('#message').html('รหัสผ่านตรงกัน').css('color', 'green');
				} else
					$('#message').html(
							'รหัสผ่านไม่ตรงกัน โปรดกรอกรหัสผ่านใหม่อีกครั้ง')
							.css('color', 'red');
			});
</script>
<script type="text/javascript">
	function fun_AllowOnlyAmountAndDot(txt) {
		if (event.keyCode > 47 && event.keyCode < 58 || event.keyCode == 46) {
			var txtbx = document.getElementById(txt);
			var amount = document.getElementById(txt).value;
			var present = 0;
			var count = 0;

			if (amount.indexOf(".", present)
					|| amount.indexOf(".", present + 1))
				;
			{
				// alert('0');
			}

			/*if(amount.length==2)
			{
			  if(event.keyCode != 46)
			  return false;
			}*/
			do {
				present = amount.indexOf(".", present);
				if (present != -1) {
					count++;
					present++;
				}
			} while (present != -1);
			if (present == -1 && amount.length == 0 && event.keyCode == 46) {
				event.keyCode = 0;
				//alert("Wrong position of decimal point not  allowed !!");
				return false;
			}

			if (count >= 1 && event.keyCode == 46) {

				event.keyCode = 0;
				//alert("Only one decimal point is allowed !!");
				return false;
			}
			if (count == 1) {
				var lastdigits = amount.substring(amount.indexOf(".") + 1,
						amount.length);
				if (lastdigits.length >= 2) {
					//alert("Two decimal places only allowed");
					event.keyCode = 0;
					return false;
				}
			}
			return true;
		} else {
			event.keyCode = 0;
			//alert("Only Numbers with dot allowed !!");
			return false;
		}

	}
</script>

<!-- เพิ่ม Approver -->
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
                	var opt = document.createElement('option');
                	var test ="<tr><td id='Row"+num+"'>"+
                	"<button type='button' onclick='deleteRow(this)' class='btn btn-circle btn-sm sbold red'><i class='icon-trash'></i></button>"+
                	"&nbsp;<button type='button' onclick='Add_Column(this,parentNode.id)' class='btn btn-circle btn-sm sbold blue'><i class='fa fa-plus'></i></button>"+
                		"<div class='alert'>"+
              
                			"<button type='button' onclick='deleteThis("+num+','+1+")' class='close' data-dismiss='alert'></button>"+
                				"<select id= 'Row"+num+"-1"+"' class='form-control select2me'>"
								  
    	            showData(test,select);     
                    numcol++;         
                    num+=1;
                    
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
            			 "<button type='button' onclick='deleteThis("+i+','+j1+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j1+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);
                	   
                	   
                   }
                   
                   else if(i == 2 ){
                	   j2++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' onclick='deleteThis("+i+','+j2+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j2+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);
                	  
                   }
                   else if(i==3 ){
                	   j3++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' onclick='deleteThis("+i+','+j3+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j3+"' class='form-control select2 select2me'>";
                	   showDataCol(test,id);	
                	   
                   }
                   else if(i == 4 ){
                	   j4++;
                	   var test ="<div id='col_"+i+"' class='alert'>"+
            			 "<button type='button' onclick='deleteThis("+i+','+j4+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
             					"<select id= '"+id+"-"+j4+"' class='form-control select2 select2me'>";
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
                console.log("iii"+i)
               // $("#temp").val(i+"deleteRow:");
               
                var row = i
                console.log("row"+row)
                while(true){
                	var col = 1;
                	var changeRow = document.getElementById('Row'+(row+1)+'-'+(col));
				    if(changeRow!=null){
				    	while(true){
	    				    var changeCol = document.getElementById('Row'+(row+1)+'-'+col);
	    				    if(changeCol!=null){
	    				          document.getElementById('Row'+(row+1)+'-'+col).id = 'Row'+row+'-'+col
	    				          console.log("row:col "+(row+1)+":"+col)
	    					}else{
	    						//up(row,k+1);
	    						//drop col 7
	    						console.log("break:")
	    						row++;
	    						break;
	    					}
	    				    col++;
	    				}

				    }
				    
				    else{
				    	console.log("finite loop")
				    	deleteRowBack(i,row);	
				    	break;
				    }
				   
                }
         
            }
			//deleteAll
            function deleteAll(){
                document.getElementById("tableTest").innerHTML = "";
                num=1;
                $("#temp").val("deleteAll/");
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
                user = user.toLowerCase();
                manager = manager.toLowerCase();
        		//console.log("hhhhh")
            		for(let i=0; i<userLists.length; i++){
            			let id = userLists[i].id.toLowerCase();
                        let name = userLists[i].name;   
                        let status = userLists[i].enable;
                        if(status == '1'){
                        	 test3 = temp + '<option value="'+id+'">'+name+'</option>'; //temp
                             temp=test3;
                        	 //console.log("ififi")

                        }
                    }
            	 var t  = test+test3+test2;
            	 $("#tableTest").append(t);  
            	
            }
            //select
            function showDataCol(test,id) {
            	var test2 = "</select></div>";
            	var userLists = ${userLists};
            	var temp = "<option>Select Person</option>";
            	var test3;
            	var manager = "${selectUser.managerId}";
            		for(let i=0; i<userLists.length; i++){
            			let id = userLists[i].id.toLowerCase();
                        let name = userLists[i].name;   
                        let status = userLists[i].enable;
                
                        if(status == '1'){
                        	test3 = temp + '<option value="'+id+'">'+name+'</option>'; //temp
                            temp=test3;
                         
                        }
                    }
            	var t  = test+test3+test2;     	
            	$("#"+id).append(t);
            	
            }
            
                $('body').on('change','#Row1-4', function() {
                     $('#temp1').val(this.value+":");
                });
          

</script>

<!-- //onclick= -->


<script>
$( document ).ready(function() {
    var approverLists = ${approverLists};
    console.log("length: "+approverLists.length);
    //Add_rowApprove();
    for(let i=0; i<approverLists.length; i++){
    	let apprId = approverLists[i].apprId;
    	//console.log("apprName : "+apprId);
    	let apprNo = approverLists[i].apprNo;
    	let row = approverLists[i].row;
    	if(apprNo==0){
    		row++;
    		Add_rowApprove();
    		$('#Row'+row+'-1').val(apprId);
        	$('#Row'+row+'-1').trigger('change');
        	
    	}
    	else{      
             row++;
             var id = "Row"+row
             if(row == 1 ){
          	   j1++;
          	   var test ="<div id='col_"+row+"' class='alert'>"+
      			 "<button type='button' onclick='deleteThis("+row+','+j1+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
       					"<select id= '"+id+"-"+j1+"' class='form-control select2 select2me'>";
       		   
       		   
          	   show(test,id);
          	   
          	 $('#'+id+'-'+j1).val(apprId);
         	 $('#'+id+'-'+j1).trigger('change');
          	   
             }
             
             else if(row == 2 ){
          	   j2++;
          	   var test ="<div id='col_"+row+"' class='alert'>"+
      			 "<button type='button' onclick='deleteThis("+row+','+j2+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
       					"<select id= '"+id+"-"+j2+"' class='form-control select2 select2me'>";
       				
          	   show(test,id);
          	 $('#'+id+'-'+j2).val(apprId);
         	 $('#'+id+'-'+j2).trigger('change');
             }
             else if(row == 3 ){
          	   j3++;
          	   var test ="<div id='col_"+row+"' class='alert'>"+
      			 "<button type='button' onclick='deleteThis("+row+','+j3+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
       					"<select id= '"+id+"-"+j3+"' class='form-control select2 select2me'>";
       				
          	   show(test,id);	
          	 $('#'+id+'-'+j3).val(apprId);
         	 $('#'+id+'-'+j3).trigger('change');
             }
             else if(row == 4 ){
          	   j4++;
          	   var test ="<div id='col_"+row+"' class='alert'>"+
      			 "<button type='button' onclick='deleteThis("+row+','+j4+")' class='close' data-dismiss='alert' aria-label='Close'></button>"+
       					"<select id= '"+id+"-"+j4+"' class='form-control select2 select2me'>";
       				
          	   show(test,id);	
          	 $('#'+id+'-'+j4).val(apprId);
         	 $('#'+id+'-'+j4).trigger('change');
             } 

    	}
    	
    	function show(test,id) {
    	
        	var test2 = "</select></div>";
        	var userLists = ${userLists};
        	var manager = "${selectUser.managerId}";
        	var temp = "<option>Select Person</option>";
        	var test3;
        		for(let i=0; i<userLists.length; i++){
        			let id = userLists[i].id.toLowerCase();
                    let name = userLists[i].name;   
                    let status = userLists[i].enable;
            
                    if(status == '1'){
                    	test3 = temp + '<option value="'+id+'">'+name+'</option>'; //temp
                        temp=test3;
                      
                    }
                }
        	var t  = test+test3+test2;     	
        	$("#"+id).append(t);

        }
    	
    }
    
});
var namee=[];
function addData(row,col){
	var i=1;
	namee = [];
	while(true){
		var change = document.getElementById('Row'+row+'-'+i);
		if(change!=null){
			if(i!=col){	
			namee.push(String(document.getElementById('Row'+row+'-'+i).value));
			}
		}else{
			break;
		}
		i++;
	}
}
function deleteThis(row,col) {
			var k = col;
			addData(row,col);
				while(true){
				    var change = document.getElementById('Row'+row+'-'+(k+1));
				    if(change!=null){
				          document.getElementById('Row'+row+'-'+(k+1)).id = 'Row'+row+'-'+k
					}else{
						console.log("row:col "+row+":"+k+1)
						update(row,k+1);
						break;
					}
				    k++;
				}
    	}


</script>

<script>
$(document).ready(function(){
	 var x = document.getElementById("tableTest").rows.length;
	 var approverLists = ${approverLists};
	console.log("row length: "+x)
	var selectedAppr="";
	for(let row = 1 ;row< x;row++){
		for(let col = 1 ;col< approverLists.length ;col++){
			  $("#Row"+row+"-"+col).change(function(){
				 // selectedAppr +=i+""+j+$(this).children("option:selected").val()+":";
			     // $("#temp").val(selectedAppr);
			      var countRow = 1;
			      var text ="";
			      while(true){
			    	  var count = 1;
			    	  var textCheckRow = document.getElementById("Row"+countRow+"-"+count);
				    	 if(textCheckRow!=null){
				    		 while(true){
						    	 var textCheck = document.getElementById("Row"+countRow+"-"+count);
						    	 if(textCheck!=null){
						    		
						    			 var  textShow = document.getElementById("Row"+countRow+"-"+count).value;
								    		text+= textShow+"/" ;					    			
						    	 }else{ 
						    		 break;				    		 
						    	 }
						    	 count++;
						      } 
				    	 }
				    	 else{
				    		 $("#temp").val(text);
				    		 console.log("Show text : "+text);
				    		 break;
				    	 }	    	 
			    	  countRow++;
			      }
			     
			     
			    }); 
		}
	}
	
})
</script>

<script>
	function update(row,col) {
		console.log("Show text : "+col+'__'+(row-1));	
		namee= namee.join(", "); 
		var user = $("#user").val();
		console.log('TESETTT :: '+namee);
		console.log('user :: '+user);
		$
			.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/edit-other",
				data : {
					"appr_id" : namee,
					"row" : row,
					"userId" : user
					
				},
			})
			.done(
					/* function(isConfirm) {
						if (isConfirm) {
							document.location = "travelexp_form?userId=${onlineUser.id}";
						}
					} */)
	}
	function deleteRowBack(rowStart,rowStop) {	
		var user = $("#user").val();
		/* console.log('user :: '+user);
		console.log('rowStart :: '+rowStart);
		console.log('rowStop :: '+rowStop); */
		$
			.ajax({
				type : 'POST',
				url : "${pageContext.request.contextPath}/delete-row",
				data : {
					"rowStart" : rowStart,
					"rowStop" : rowStop,
					"userId" : user
					
				},
			})
			.done(
					/* function(isConfirm) {
						if (isConfirm) {
							document.location = "travelexp_form?userId=${onlineUser.id}";
						}
					} */)
	}


</script>

