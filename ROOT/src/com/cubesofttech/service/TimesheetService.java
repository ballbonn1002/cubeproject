package com.cubesofttech.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import com.cubesofttech.dao.ProjectDAO;
import com.cubesofttech.dao.ProjectFunctionDAO;
import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.model.Project;
import com.cubesofttech.model.ProjectFunction;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;
import com.ibm.icu.text.SimpleDateFormat;
import com.ibm.icu.util.Calendar;
import com.opensymphony.xwork2.ActionSupport;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class TimesheetService extends ActionSupport {
	public static final String SAMPLE_XLSX_FILE_PATH = "./sample-xlsx-file.xlsx";
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();

	@Autowired
	public TimesheetDAO timesheetDAO;

	@Autowired
	public ProjectDAO projectDAO;

	@Autowired
	public ProjectFunctionDAO projectFunctionDAO;

	public String importexceltimesheet() {
		try {
			// Creating a Workbook from an Excel file (.xls or .xlsx)
			String filepath = request.getParameter("file");
			String[] filepath2 = filepath.split("/");
			String filepath3 = filepath2[3];
			ServletContext context = request.getServletContext();
			String fileServerPath = context.getRealPath("/");
//			File myFile = new File(fileServerPath + "upload/template/test.xlsx");
//			FileInputStream fileInputStream = new FileInputStream(myFile);

			Workbook workbook = WorkbookFactory.create(new File(fileServerPath + "upload/user/" + filepath3));

			// Retrieving the number of sheets in the Workbook
			// System.out.println("Workbook has " + workbook.getNumberOfSheets() + " Sheets
			// : ");

			/*
			 * ============================================================= Iterating over
			 * all the sheets in the workbook (Multiple ways)
			 * =============================================================
			 */

			// 1. You can obtain a sheetIterator and iterate over it
			Iterator<Sheet> sheetIterator = workbook.sheetIterator();
			// System.out.println("Retrieving Sheets using Iterator");
			while (sheetIterator.hasNext()) {
				Sheet sheet = sheetIterator.next();
				// System.out.println("=> " + sheet.getSheetName());
			}

			// 2. Or you can use a for-each loop
			// System.out.println("Retrieving Sheets using for-each loop");
			for (Sheet sheet : workbook) {
				// System.out.println("=> " + sheet.getSheetName());
			}

			// 3. Or you can use a Java 8 forEach with lambda
			// System.out.println("Retrieving Sheets using Java 8 forEach with lambda");
			workbook.forEach(sheet -> {
				// System.out.println("=> " + sheet.getSheetName());
			});

			/*
			 * ================================================================== Iterating
			 * over all the rows and columns in a Sheet (Multiple ways)
			 * ==================================================================
			 */

			// Getting the Sheet at index zero
			Sheet sheet = workbook.getSheetAt(0);

			// Create a DataFormatter to format and get each cell's value as String
			DataFormatter dataFormatter = new DataFormatter();

			// 1. You can obtain a rowIterator and columnIterator and iterate over them
			// System.out.println("\n\nIterating over Rows and Columns using Iterator\n");
			Iterator<Row> rowIterator = sheet.rowIterator();
			while (rowIterator.hasNext()) {
				Row row = rowIterator.next();

				// Now let's iterate over the columns of the current row
				Iterator<Cell> cellIterator = row.cellIterator();

				while (cellIterator.hasNext()) {
					Cell cell = cellIterator.next();
					String cellValue = dataFormatter.formatCellValue(cell);
					// System.out.print(cellValue + "\t");
				}
				// System.out.println();
			}

			// 2. Or you can use a for-each loop to iterate over the rows and columns
			// System.out.println("\n\nIterating over Rows and Columns using for-each
			// loop\n");
			int i = 0, y = 0;
			String a = null;
			String b = null;
			String c = null;
			String d = null;
			String e = null;
			String f = null;
			String g = null;
			for (Row row : sheet) {
				for (Cell cell : row) {
					String cellValue = dataFormatter.formatCellValue(cell);
					// System.out.print(cellValue + "\t");

					if (i == 0) {
						a = a + "!" + cellValue;
					} else if (i == 1) {
						b = b + "!" + cellValue;
					} else if (i == 2) {
						c = c + "!" + cellValue;
					} else if (i == 3) {
						d = d + "!" + cellValue;
					} else if (i == 4) {
						e = e + "!" + cellValue;
					} else if (i == 5) {
						f = f + "!" + cellValue;
					} else if (i == 6) {
						g = g + "!" + cellValue;
					}
					i++;
				}
				// System.out.println();
				i = 0;
			}
			System.out.println(a);
			System.out.println(b);
			System.out.println(c);
			System.out.println(d);
			System.out.println(e);
			System.out.println(f);
			System.out.println("---------------------------------------------------------------------");
			String[] date = b.split("!");
//	        String[] tchi = b.split(",");
//	        String[] tcho = c.split(",");
			String[] detail = e.split("!");
			String[] team = f.split("!");
			String[] project = c.split("!");
			String[] user = a.split("!");
			String[] function = d.split("!");

			Calendar c2 = Calendar.getInstance(); // this takes current date
			c2.set(Calendar.DAY_OF_MONTH, 1);
			Date date3 = c2.getTime();
			SimpleDateFormat format1 = new SimpleDateFormat("dd/MM/yyyy");

			String date4 = format1.format(date3);
			System.out.println("testtt " + date[2]);
			String date1 = date[2];
			String incDate;
			String datenow = null;

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			Calendar c1 = Calendar.getInstance();

			c1.setTime(sdf.parse(date1));

			int maxDay = c1.getActualMaximum(Calendar.DAY_OF_MONTH);
			for (int co = 0; co < maxDay; co++) {

				incDate = sdf.format(c1.getTime());
				datenow = datenow + "!" + incDate;
				c1.add(Calendar.DATE, 1);
			}
			String[] datenowna = datenow.split("!");
			System.out.println(datenow);

			String tchidb;
			String tchodb;
			String detaildb;
			String teamdb;
			String projectdb;
			String functiondb;
			String userdb;
			String timecheckin, timecheckout;
			String ind, inm, iny, outd, outm, outy;
			String searchyear, searchmonth, searchday;
			int k = 0;

			List<String> pj = new ArrayList<>();
			List<String> fpj = new ArrayList<>();

			String datedb = "aa", datedb2;
			String detailsum = null, tchisum, tchosum, teamsum = null, projectsum = null, functionsum = null,
					usersum = null, datesum2 = null;
			String pjsum = null, fpjsum = null;

//			List<String> cityList = new ArrayList<>();
//			 cityList.add("Delhi");
//			 cityList.add("Mumbai");
//			 cityList.add("Bangalore");
//			 cityList.add("Chennai");
//			 cityList.add("Kolkata");
//			 cityList.add("Mumbai");
//
//			 cityList = cityList.stream().distinct().collect(Collectors.toList());
//			 System.out.println("cityList"+cityList);
			for (i = 0; i < datenowna.length; i++) {
				for (y = 0; y < date.length; y++) {
					if (y > 1) {

						datedb2 = datedb;
						datedb = (date[y]);

//							tchidb = (tchi[i]);			
//							tchodb = (tcho[i]);				
						detaildb = (detail[y]);
						teamdb = (team[y]);
						projectdb = (project[y]);
						functiondb = (function[y]);
						userdb = (user[y]);

						if (datenowna[i].equals(date[y])) {
							if (detailsum == null) {
								datesum2 = datedb;
								detailsum = detaildb;
								teamsum = teamdb;
								projectsum = projectdb;
								functionsum = functiondb;
								usersum = userdb;
								pj.add(projectdb);
								fpj.add(functiondb);

							} else {
								datesum2 = datedb;
								detailsum = detailsum + " " + detaildb;
								projectsum = projectsum + "!" + projectdb;
								functionsum = functionsum + "!" + functiondb;
								teamsum = teamdb;
								usersum = userdb;
								pj.add(projectdb);
								fpj.add(functiondb);
								String[] projectsum1 = projectsum.split("!");
								String[] functionsum1 = functionsum.split("!");
//								System.out.println("pro1 : "+projectsum1);
//								System.out.println("pro2 : "+pj);
//									for(int h=0;h<projectsum1.length;h++) {
//										for(int w=0;w<pj.size();w++) {
//											if(pj.get(w).equals(projectsum1[h])) {
//												System.out.println("repeat");
//											}else {
//												System.out.println("no repeat");
//												pj.add(projectdb);
//											}
//										}
//									}
							}

						} else {
							if (detailsum == null) {

							} else {

								System.out.println("pj1 : " + pj);
								pj = pj.stream().distinct().collect(Collectors.toList());
								System.out.println("pj2 : " + pj);
								for (int o = 0; o < pj.size(); o++) {
									if (o == 0) {
										pjsum = pj.get(o);
									} else {
										pjsum = pjsum + " and " + pj.get(o);
									}
								}
								System.out.println("pjsum : " + pjsum);

								System.out.println("fpj1 : " + fpj);
								fpj = fpj.stream().distinct().collect(Collectors.toList());
								System.out.println("fpj2 : " + fpj);
								for (int o = 0; o < fpj.size(); o++) {
									if (o == 0) {
										fpjsum = fpj.get(o);
									} else {
										fpjsum = fpjsum + " and " + fpj.get(o);
									}
								}
								System.out.println("fpjsum : " + fpjsum);

								ind = datesum2.substring(0);

								searchyear = datesum2.substring(6, 10);
								searchmonth = datesum2.substring(3, 5);
								searchday = datesum2.substring(0, 2);
								String datesum = searchyear + "-" + searchmonth + "-" + searchday;

								System.out.println(datesum2);
								System.out.println(detailsum);
//									System.out.println("project = "+projectsum1);
//									System.out.println("function = "+functionsum1);

								List<Map<String, Object>> whereproject = timesheetDAO.whereproject(pjsum);
								if (whereproject.isEmpty()) {
									System.out.println("Nullproject");

									Project project1 = new Project();
									project1.setProject_name(pjsum);
									project1.setDescription(" ");

									List<Map<String, Object>> wherename1 = timesheetDAO.wherename(userdb);
									for (int z = 0; z < wherename1.size(); z++) {
										String name = ((String) wherename1.get(z).get("id"));
										project1.setUser_create(name);
									}

									project1.setTime_create(DateUtil.getCurrentTime());
									projectDAO.save(project1);

									////////////////////////////////////////////////////////////////////////////////////////////////////////////////

									ProjectFunction projectFunction = new ProjectFunction();
									projectFunction.setFunction_name(fpjsum);
									projectFunction.setStatus("1");

									List<Map<String, Object>> whereproject1 = timesheetDAO.whereproject(pjsum);
									for (int z = 0; z < whereproject1.size(); z++) {
										BigInteger nameproject = ((BigInteger) whereproject1.get(z).get("project_id"));
										int nameproject2 = nameproject.intValue();
										projectFunction.setProject_id(nameproject2);
									}

									List<Map<String, Object>> wherename2 = timesheetDAO.wherename(userdb);
									for (int z = 0; z < wherename2.size(); z++) {
										String name = ((String) wherename2.get(z).get("id"));
										projectFunction.setUser_create(name);
									}

									projectFunction.setTime_create(DateUtil.getCurrentTime());
									projectFunctionDAO.save(projectFunction);

								} else {
									List<Map<String, Object>> wherefunction = timesheetDAO.wherefunction(fpjsum);
									if (wherefunction.isEmpty()) {
										ProjectFunction projectFunction = new ProjectFunction();
										projectFunction.setFunction_name(fpjsum);
										projectFunction.setStatus("1");

										List<Map<String, Object>> whereproject1 = timesheetDAO.whereproject(pjsum);
										for (int z = 0; z < whereproject1.size(); z++) {
											BigInteger nameproject = ((BigInteger) whereproject1.get(z)
													.get("project_id"));
											int nameproject2 = nameproject.intValue();
											projectFunction.setProject_id(nameproject2);
										}

										List<Map<String, Object>> wherename2 = timesheetDAO.wherename(userdb);
										for (int z = 0; z < wherename2.size(); z++) {
											String name = ((String) wherename2.get(z).get("id"));
											projectFunction.setUser_create(name);
										}

										projectFunction.setTime_create(DateUtil.getCurrentTime());
										projectFunctionDAO.save(projectFunction);
									}

									List<Map<String, Object>> whereproject3 = timesheetDAO.whereproject(pjsum);
									for (int z = 0; z < whereproject.size(); z++) {
										BigInteger nameproject = ((BigInteger) whereproject3.get(z).get("project_id"));
										int nameproject2 = nameproject.intValue();

										System.out.println(nameproject);
									}

									List<Map<String, Object>> wherefunction1 = timesheetDAO.wherefunction(fpjsum);
									for (int z = 0; z < wherefunction1.size(); z++) {
										BigInteger namefunction = ((BigInteger) wherefunction1.get(z).get("function_id"));
										int namefunction2 = namefunction.intValue();

										System.out.println(namefunction);
									}
								}
								/////////////////////////////////////////

								detailsum = null;
								pj.clear();
								fpj.clear();
							}

						}
					}
				}
				System.out.println("------------------------------------");
			}

			for (i = 0; i < datenowna.length; i++) {
				for (y = 0; y < date.length; y++) {
					if (y > 1) {

						datedb2 = datedb;
						datedb = (date[y]);

//							tchidb = (tchi[i]);			
//							tchodb = (tcho[i]);				
						detaildb = (detail[y]);
						teamdb = (team[y]);
						projectdb = (project[y]);
						functiondb = (function[y]);
						userdb = (user[y]);

						if (datenowna[i].equals(date[y])) {
							if (detailsum == null) {
								datesum2 = datedb;
								detailsum = detaildb;
								teamsum = teamdb;
								projectsum = projectdb;
								functionsum = functiondb;
								usersum = userdb;
								pj.add(projectdb);
								fpj.add(functiondb);

							} else {
								datesum2 = datedb;
								detailsum = detailsum + " " + detaildb;
								projectsum = projectsum + "!" + projectdb;
								functionsum = functionsum + "!" + functiondb;
								teamsum = teamdb;
								usersum = userdb;
								pj.add(projectdb);
								fpj.add(functiondb);
								String[] projectsum1 = projectsum.split("!");
								String[] functionsum1 = functionsum.split("!");
//								System.out.println("pro1 : "+projectsum1);
//								System.out.println("pro2 : "+pj);
//									for(int h=0;h<projectsum1.length;h++) {
//										for(int w=0;w<pj.size();w++) {
//											if(pj.get(w).equals(projectsum1[h])) {
//												System.out.println("repeat");
//											}else {
//												System.out.println("no repeat");
//												pj.add(projectdb);
//											}
//										}
//									}
							}

						} else {
							if (detailsum == null) {

							} else {

								System.out.println("pj1 : " + pj);
								pj = pj.stream().distinct().collect(Collectors.toList());
								System.out.println("pj2 : " + pj);
								for (int o = 0; o < pj.size(); o++) {
									if (o == 0) {
										pjsum = pj.get(o);
									} else {
										pjsum = pjsum + " and " + pj.get(o);
									}
								}
								System.out.println("pjsum : " + pjsum);

								System.out.println("fpj1 : " + fpj);
								fpj = fpj.stream().distinct().collect(Collectors.toList());
								System.out.println("fpj2 : " + fpj);
								for (int o = 0; o < fpj.size(); o++) {
									if (o == 0) {
										fpjsum = fpj.get(o);
									} else {
										fpjsum = fpjsum + " and " + fpj.get(o);
									}
								}
								System.out.println("fpjsum : " + fpjsum);

								ind = datesum2.substring(0);

								searchyear = datesum2.substring(6, 10);
								searchmonth = datesum2.substring(3, 5);
								searchday = datesum2.substring(0, 2);
								String datesum = searchyear + "-" + searchmonth + "-" + searchday;

								System.out.println(datesum2);
								System.out.println(detailsum);
//									System.out.println("project = "+projectsum1);
//									System.out.println("function = "+functionsum1);
								Timesheet timesheet = new Timesheet();
								Integer l = timesheetDAO.getMaxId() + 1;
								timesheet.setId(l);

								timesheet.setDescription(detailsum);

								List<Map<String, Object>> whereproject = timesheetDAO.whereproject(pjsum);
								if (whereproject.isEmpty()) {
									System.out.println("Nullproject");

									Project project1 = new Project();
									project1.setProject_name(pjsum);
									project1.setDescription(" ");

									List<Map<String, Object>> wherename1 = timesheetDAO.wherename(userdb);
									for (int z = 0; z < wherename1.size(); z++) {
										String name = ((String) wherename1.get(z).get("id"));
										project1.setUser_create(name);
									}

									project1.setTime_create(DateUtil.getCurrentTime());
									projectDAO.save(project1);

									////////////////////////////////////////////////////////////////////////////////////////////////////////////////

									ProjectFunction projectFunction = new ProjectFunction();
									projectFunction.setFunction_name(fpjsum);
									projectFunction.setStatus("1");

									List<Map<String, Object>> whereproject1 = timesheetDAO.whereproject(pjsum);
									for (int z = 0; z < whereproject1.size(); z++) {
										BigInteger nameproject = ((BigInteger) whereproject1.get(z).get("project_id"));
										int nameproject2 = nameproject.intValue();
										projectFunction.setProject_id(nameproject2);
									}

									List<Map<String, Object>> wherename2 = timesheetDAO.wherename(userdb);
									for (int z = 0; z < wherename2.size(); z++) {
										String name = ((String) wherename2.get(z).get("id"));
										projectFunction.setUser_create(name);
									}

									projectFunction.setTime_create(DateUtil.getCurrentTime());
									projectFunctionDAO.save(projectFunction);

								} else {
									List<Map<String, Object>> whereproject3 = timesheetDAO.whereproject(pjsum);
									for (int z = 0; z < whereproject.size(); z++) {
										BigInteger nameproject = ((BigInteger) whereproject3.get(z).get("project_id"));
										int nameproject2 = nameproject.intValue();
										timesheet.setProject_id(nameproject2);
										System.out.println(nameproject);
									}

									List<Map<String, Object>> wherefunction = timesheetDAO.wherefunction(fpjsum);
									for (int z = 0; z < wherefunction.size(); z++) {
										BigInteger namefunction = ((BigInteger) wherefunction.get(z)
												.get("function_id"));
										int namefunction2 = namefunction.intValue();
										timesheet.setFunction_id(namefunction2);
										System.out.println(namefunction);
									}
								}
								/////////////////////////////////////////
								List<Map<String, Object>> whereproject3 = timesheetDAO.whereproject(pjsum);
								for (int z = 0; z < whereproject.size(); z++) {
									BigInteger nameproject = ((BigInteger) whereproject3.get(z).get("project_id"));
									int nameproject2 = nameproject.intValue();
									timesheet.setProject_id(nameproject2);
									System.out.println(nameproject);
								}

								List<Map<String, Object>> wherefunction = timesheetDAO.wherefunction(fpjsum);
								for (int z = 0; z < wherefunction.size(); z++) {
									BigInteger namefunction = ((BigInteger) wherefunction.get(z).get("function_id"));
									int namefunction2 = namefunction.intValue();
									timesheet.setFunction_id(namefunction2);
									System.out.println(namefunction);
								}

								timesheet.setStatus("W");
								String name = null;
								
								List<Map<String, Object>> wherename = timesheetDAO.wherename(usersum);
								for (int z = 0; z < wherename.size(); z++) {
									 name = ((String) wherename.get(z).get("id"));
									

									System.out.println(name);
								}
								List<Map<String, Object>> whereworkhour = timesheetDAO.whereworkhour(searchyear,
										searchmonth, searchday, name);
								// System.out.println(whereworkhour);
								if (whereworkhour.isEmpty()) {
									String sdate = searchyear + "-" + searchmonth + "-" + searchday + " 08:30:01";
									String edate = searchyear + "-" + searchmonth + "-" + searchday + " 17:30:59";
									Timestamp startDate = Timestamp.valueOf(sdate);
									Timestamp endDate = Timestamp.valueOf(edate);
									timesheet.setTimeCheckIn(startDate);
									timesheet.setTimeCheckOut(endDate);
									// System.out.println(startDate);
									// System.out.println(endDate);
								} else {
									for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {

										char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
										if (work_hours_type == '1') {
											Timestamp startDate = ((Timestamp) whereworkhour.get(wwh)
													.get("work_hours_time_work"));
											timesheet.setTimeCheckIn(startDate);
											// System.out.println(startDate);
										} else if (work_hours_type == '2') {
											Timestamp endDate = ((Timestamp) whereworkhour.get(wwh)
													.get("work_hours_time_work"));
											timesheet.setTimeCheckOut(endDate);
											// System.out.println(endDate);
										}

									}
								}
								timesheet.setTimeCreate(DateUtil.getCurrentTime());
								timesheet.setTeam(teamsum);
								List<Map<String, Object>> wherename1 = timesheetDAO.wherename(usersum);
								for (int z = 0; z < wherename1.size(); z++) {
									String name1 = ((String) wherename1.get(z).get("id"));
									timesheet.setUserCreate(name1);

									System.out.println(name1);
								}

								timesheetDAO.save(timesheet);
								detailsum = null;
								pj.clear();
								fpj.clear();
							}

						}
					}
				}
				System.out.println("------------------------------------");
			}

//			for (i = 0; i < date.length; i++) {
//				if (i > 1) {
//
//					String tchidb;
//					String tchodb;
//					String detaildb;
//					String teamdb;
//					String projectdb;
//					String functiondb;
//					String userdb;
//					String timecheckin, timecheckout;
//					String ind, inm, iny, outd, outm, outy;
//					String searchyear, searchmonth, searchday;
//
//					datedb2 = datedb;
//					datedb = (date[i]);
//
////					tchidb = (tchi[i]);			
////					tchodb = (tcho[i]);				
//					detaildb = (detail[i]);
//					teamdb = (team[i]);
//					projectdb = (project[i]);
//					functiondb = (function[i]);
//					userdb = (user[i]);
//
//					ind = datedb.substring(0);
//
//					searchyear = datedb.substring(6, 10);
//					searchmonth = datedb.substring(3, 5);
//					searchday = datedb.substring(0, 2);
//					String datesum = searchyear + "-" + searchmonth + "-" + searchday;
//
//					System.out.println("datedb2 : " + datedb2);
//					System.out.println("datedb : " + datedb);
//
//					if (datedb.equals(datedb2)) {
//						projectsum = projectdb;
//						functionsum = functiondb;
//						teamsum = teamdb;
//						usersum = userdb;
//						System.out.println("date��ӡѹ������������������������");
//						if (detailsum == null) {
//							detailsum = detaildb;
//							System.out.println("detailsum : " + detailsum);
//							System.out.println("projectsum : " + projectsum);
//							System.out.println("functionsum : " + functionsum);
//							System.out.println("teamsum : " + teamsum);
//							System.out.println("usersum" + usersum);
//						} else {
//							detailsum = detailsum + " " + detaildb;
//							System.out.println("detailsum : " + detailsum);
//							
//							
//							Timesheet timesheet = new Timesheet();
//					        Integer l = timesheetDAO.getMaxId() + 1;
//					        timesheet.setId(l);
//					        
//							timesheet.setDescription(detailsum);
//							
//							
//							List<Map<String, Object>> whereproject = timesheetDAO.whereproject(projectdb);
//							if (whereproject.isEmpty()) {
//								System.out.println("Nullproject");
//
//								Project project1 = new Project();
//								project1.setProject_name(projectdb);
//								project1.setDescription("");
//								
//								List<Map<String, Object>> wherename1 = timesheetDAO.wherename(userdb);
//								for (int z = 0; z < wherename1.size(); z++) {
//									String name = ((String) wherename1.get(z).get("id"));
//									project1.setUser_create(name);
//								}
//											
//								project1.setTime_create(DateUtil.getCurrentTime());
//								projectDAO.save(project1);
//
//								ProjectFunction projectFunction = new ProjectFunction();
//								projectFunction.setFunction_name(functiondb);
//								projectFunction.setStatus("1");
//								
//								List<Map<String, Object>> whereproject1 = timesheetDAO.whereproject(projectdb);
//								for (int z = 0; z < whereproject1.size(); z++) {
//									BigInteger nameproject = ((BigInteger) whereproject1.get(z).get("project_id"));
//									int nameproject2 = nameproject.intValue();
//									projectFunction.setProject_id(nameproject2);
//								}
//								
//								List<Map<String, Object>> wherename2 = timesheetDAO.wherename(userdb);
//								for (int z = 0; z < wherename2.size(); z++) {
//									String name = ((String) wherename2.get(z).get("id"));
//									projectFunction.setUser_create(name);
//								}
//								
//								projectFunction.setTime_create(DateUtil.getCurrentTime());
//								projectFunctionDAO.save(projectFunction);
//
//							} else {
//								List<Map<String, Object>> whereproject3= timesheetDAO.whereproject(projectdb);
//								for (int z = 0; z < whereproject.size(); z++) {
//									BigInteger nameproject = ((BigInteger) whereproject3.get(z).get("project_id"));
//									 int nameproject2 = nameproject.intValue();
//									timesheet.setProject_id(nameproject2);
//									System.out.println(nameproject);
//								}
//								
//								List<Map<String, Object>> wherefunction= timesheetDAO.wherefunction(functiondb);
//								for (int z = 0; z < wherefunction.size(); z++) {
//									BigInteger namefunction = ((BigInteger) wherefunction.get(z).get("function_id"));
//									 int namefunction2 = namefunction.intValue();
//									timesheet.setFunction_id(namefunction2);
//									System.out.println(namefunction);
//								}
//							}
//							
//							
//							
//
//							timesheet.setStatus("W");
//							
//							List<Map<String, Object>> whereworkhour = timesheetDAO.whereworkhour(searchyear, searchmonth,
//									searchday);
//							// System.out.println(whereworkhour);
//							if (whereworkhour.isEmpty()) {
//								String sdate = searchyear + "-" + searchmonth + "-" + searchday + " 08:30:00";
//								String edate = searchyear + "-" + searchmonth + "-" + searchday + " 17:30:00";
//								Timestamp startDate = Timestamp.valueOf(sdate);
//								Timestamp endDate = Timestamp.valueOf(edate);
//								timesheet.setTimeCheckIn(startDate);
//								timesheet.setTimeCheckOut(endDate);
//								// System.out.println(startDate);
//								// System.out.println(endDate);
//							} else {
//								for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {
//
//									char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
//									if (work_hours_type == '1') {
//										Timestamp startDate = ((Timestamp) whereworkhour.get(wwh).get("work_hours_time_work"));
//										timesheet.setTimeCheckIn(startDate);
//										// System.out.println(startDate);
//									} else if (work_hours_type == '2') {
//										Timestamp endDate = ((Timestamp) whereworkhour.get(wwh).get("work_hours_time_work"));
//										timesheet.setTimeCheckOut(endDate);
//										// System.out.println(endDate);
//									}
//
//								}
//							}
//							timesheet.setTimeCreate(DateUtil.getCurrentTime());
//							timesheet.setTeam(teamdb);
//							List<Map<String, Object>> wherename = timesheetDAO.wherename(userdb);
//							for (int z = 0; z < wherename.size(); z++) {
//								String name = ((String) wherename.get(z).get("id"));
//								timesheet.setUserCreate(name);
//								
//								System.out.println(name);
//							}
//							
//							//timesheetDAO.save(timesheet); 
//						}
//						
//						
//					} else {
//						detailsum = null;
//						projectsum = null;
//						functionsum = null;
//						teamsum = null;
//						usersum = null;
//						System.out.println("detail : " + detaildb);
//						
//						
//						Timesheet timesheet = new Timesheet();
//				        Integer l = timesheetDAO.getMaxId() + 1;
//				        timesheet.setId(l);
//				        
//						timesheet.setDescription(detaildb);
//						
//						
//						List<Map<String, Object>> whereproject = timesheetDAO.whereproject(projectdb);
//						if (whereproject.isEmpty()) {
//							System.out.println("Nullproject");
//
//							Project project1 = new Project();
//							project1.setProject_name(projectdb);
//							project1.setDescription("");
//							
//							List<Map<String, Object>> wherename1 = timesheetDAO.wherename(userdb);
//							for (int z = 0; z < wherename1.size(); z++) {
//								String name = ((String) wherename1.get(z).get("id"));
//								project1.setUser_create(name);
//							}
//										
//							project1.setTime_create(DateUtil.getCurrentTime());
//							projectDAO.save(project1);
//
//							ProjectFunction projectFunction = new ProjectFunction();
//							projectFunction.setFunction_name(functiondb);
//							projectFunction.setStatus("1");
//							
//							List<Map<String, Object>> whereproject1 = timesheetDAO.whereproject(projectdb);
//							for (int z = 0; z < whereproject1.size(); z++) {
//								BigInteger nameproject = ((BigInteger) whereproject1.get(z).get("project_id"));
//								int nameproject2 = nameproject.intValue();
//								projectFunction.setProject_id(nameproject2);
//							}
//							
//							List<Map<String, Object>> wherename2 = timesheetDAO.wherename(userdb);
//							for (int z = 0; z < wherename2.size(); z++) {
//								String name = ((String) wherename2.get(z).get("id"));
//								projectFunction.setUser_create(name);
//							}
//							
//							projectFunction.setTime_create(DateUtil.getCurrentTime());
//							projectFunctionDAO.save(projectFunction);
//
//						} else {
//							List<Map<String, Object>> whereproject3= timesheetDAO.whereproject(projectdb);
//							for (int z = 0; z < whereproject.size(); z++) {
//								BigInteger nameproject = ((BigInteger) whereproject3.get(z).get("project_id"));
//								 int nameproject2 = nameproject.intValue();
//								timesheet.setProject_id(nameproject2);
//								System.out.println(nameproject);
//							}
//							List<Map<String, Object>> wherefunction= timesheetDAO.wherefunction(functiondb);
//							for (int z = 0; z < wherefunction.size(); z++) {
//								BigInteger namefunction = ((BigInteger) wherefunction.get(z).get("function_id"));
//								 int namefunction2 = namefunction.intValue();
//								timesheet.setFunction_id(namefunction2);
//								System.out.println(namefunction);
//							}
//						}
//						
//						
//						
//
//						timesheet.setStatus("W");
//						
//						List<Map<String, Object>> whereworkhour = timesheetDAO.whereworkhour(searchyear, searchmonth,
//								searchday);
//						
//						// System.out.println(whereworkhour);
//						if (whereworkhour.isEmpty()) {
//							String sdate = searchyear + "-" + searchmonth + "-" + searchday + " 08:30:00";
//							String edate = searchyear + "-" + searchmonth + "-" + searchday + " 17:30:00";
//							Timestamp startDate = Timestamp.valueOf(sdate);
//							Timestamp endDate = Timestamp.valueOf(edate);
//							timesheet.setTimeCheckIn(startDate);
//							timesheet.setTimeCheckOut(endDate);
//							// System.out.println(startDate);
//							// System.out.println(endDate);
//						} else if (whereworkhour.size()==1){
//							char work_hours_type = ((char) whereworkhour.get(0).get("work_hours_type"));
//							 //System.out.println("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
//							if (work_hours_type == '1') {
//								Timestamp startDate = ((Timestamp) whereworkhour.get(0).get("work_hours_time_work"));
//								String edate = searchyear + "-" + searchmonth + "-" + searchday + " 17:30:00";
//								Timestamp endDate = Timestamp.valueOf(edate);
//								timesheet.setTimeCheckIn(startDate);
//								timesheet.setTimeCheckOut(endDate);
//								// System.out.println(startDate);
//							} else if (work_hours_type == '2') {
//								Timestamp endDate = ((Timestamp) whereworkhour.get(0).get("work_hours_time_work"));
//								String sdate = searchyear + "-" + searchmonth + "-" + searchday + " 08:30:00";
//								Timestamp startDate = Timestamp.valueOf(sdate);
//								timesheet.setTimeCheckIn(startDate);
//								timesheet.setTimeCheckOut(endDate);
//								// System.out.println(endDate);
//							}
//						}else {
//							for (int wwh = 0; wwh < whereworkhour.size(); wwh++) {
//
//								char work_hours_type = ((char) whereworkhour.get(wwh).get("work_hours_type"));
//								if (work_hours_type == '1') {
//									Timestamp startDate = ((Timestamp) whereworkhour.get(wwh).get("work_hours_time_work"));
//									timesheet.setTimeCheckIn(startDate);
//									// System.out.println(startDate);
//								} else if (work_hours_type == '2') {
//									Timestamp endDate = ((Timestamp) whereworkhour.get(wwh).get("work_hours_time_work"));
//									timesheet.setTimeCheckOut(endDate);
//									// System.out.println(endDate);
//								}
//
//							}
//						}
//						timesheet.setTimeCreate(DateUtil.getCurrentTime());
//						timesheet.setTeam(teamdb);
//						List<Map<String, Object>> wherename = timesheetDAO.wherename(userdb);
//						for (int z = 0; z < wherename.size(); z++) {
//							String name = ((String) wherename.get(z).get("id"));
//							timesheet.setUserCreate(name);
//							
//							System.out.println(name);
//						}
//						
//						//timesheetDAO.save(timesheet); 
//					}
//
////				timecheckin = datedb +" "+ tchidb+":00";
////				timecheckout = datedb +" "+ tchodb+":00";
//
////				System.out.println(datedb);
////				System.out.println(timecheckin);
////				System.out.println(timecheckout);
////				System.out.println(detaildb);
////				System.out.println(teamdb);
////				System.out.println(projectdb);
////				System.out.println(userdb);
//
//					System.out.println("------------------------------------");
//
//				
//
//				}
//
//			}
			// 3. Or you can use Java 8 forEach loop with lambda
//	        System.out.println("\n\nIterating over Rows and Columns using Java 8 forEach with lambda\n");
//	      
//	        sheet.forEach(row -> {
//	        	
//	            row.forEach(cell -> {
//	            	
//		            
//	                String cellValue = dataFormatter.formatCellValue(cell);
//	                System.out.print(cellValue + " ");
//    
//	            });
//	            System.out.println(); 
//	        });

			// Closing the workbook
			workbook.close();

//			//FileInputStream fileInputStream = new FileInputStream("D:\\demo\\poi-test.xls");
//			ServletContext context = request.getServletContext();
//			String fileServerPath = context.getRealPath("/");
//			File myFile = new File(fileServerPath + "upload/template/test22.xls");
//			FileInputStream fileInputStream = new FileInputStream(myFile);
//			
//			
//		//	FileInputStream fileInputStream = new FileInputStream("/upload/template/poi-test.xls");
//			XSSFWorkbook workbook = new XSSFWorkbook(fileInputStream);
//			XSSFSheet worksheet = workbook.getSheet("POI Worksheet");
//		
//			
//				XSSFRow row1 = worksheet.getRow(1);
//				XSSFCell cellA1 = row1.getCell((short) 0);
//				Date a1Val = cellA1.getDateCellValue();
//				XSSFCell cellB1 = row1.getCell((short) 1);
//				double b1Val = cellB1.getNumericCellValue();
//				XSSFCell cellC1 = row1.getCell((short) 2);
//				double c1Val = cellC1.getNumericCellValue();
//				XSSFCell cellD1 = row1.getCell((short) 3);
//				String d1Val = cellD1.getStringCellValue();
//				XSSFCell cellE1 = row1.getCell((short) 3);
//				String e1Val = cellE1.getStringCellValue();
//				XSSFCell cellF1 = row1.getCell((short) 3);
//				String f1Val = cellF1.getStringCellValue();
//				XSSFCell cellG1 = row1.getCell((short) 3);
//				String g1Val = cellG1.getStringCellValue();
//				
//				System.out.println("A1: " + a1Val);
//				System.out.println("B1: " + b1Val);
//				System.out.println("C1: " + c1Val);
//				System.out.println("D1: " + d1Val);
//				System.out.println("B1: " + e1Val);
//				System.out.println("C1: " + f1Val);
//				System.out.println("D1: " + g1Val);

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
		return null;
	}
}
