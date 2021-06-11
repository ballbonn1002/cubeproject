package com.cubesofttech.service;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.Timestamp;
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

import com.cubesofttech.dao.TimesheetDAO;
import com.cubesofttech.model.Timesheet;
import com.cubesofttech.model.User;
import com.cubesofttech.util.DateUtil;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
public class TimesheetService {
	   public static final String SAMPLE_XLSX_FILE_PATH = "./sample-xlsx-file.xlsx";
	Logger log = Logger.getLogger(getClass());
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response = ServletActionContext.getResponse();
	
	@Autowired
	public TimesheetDAO timesheetDAO;
	
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
			
	        Workbook workbook = WorkbookFactory.create(new File(fileServerPath + "upload/user/"+filepath3));

	        // Retrieving the number of sheets in the Workbook
	       // System.out.println("Workbook has " + workbook.getNumberOfSheets() + " Sheets : ");

	        /*
	           =============================================================
	           Iterating over all the sheets in the workbook (Multiple ways)
	           =============================================================
	        */

	        // 1. You can obtain a sheetIterator and iterate over it
	        Iterator<Sheet> sheetIterator = workbook.sheetIterator();
	       // System.out.println("Retrieving Sheets using Iterator");
	        while (sheetIterator.hasNext()) {
	            Sheet sheet = sheetIterator.next();
	        //    System.out.println("=> " + sheet.getSheetName());
	        }

	        // 2. Or you can use a for-each loop
	    //    System.out.println("Retrieving Sheets using for-each loop");
	        for(Sheet sheet: workbook) {
	         //   System.out.println("=> " + sheet.getSheetName());
	        }

	        // 3. Or you can use a Java 8 forEach with lambda
	     //   System.out.println("Retrieving Sheets using Java 8 forEach with lambda");
	        workbook.forEach(sheet -> {
	     //       System.out.println("=> " + sheet.getSheetName());
	        });

	        /*
	           ==================================================================
	           Iterating over all the rows and columns in a Sheet (Multiple ways)
	           ==================================================================
	        */

	        // Getting the Sheet at index zero
	        Sheet sheet = workbook.getSheetAt(0);

	        // Create a DataFormatter to format and get each cell's value as String
	        DataFormatter dataFormatter = new DataFormatter();

	        // 1. You can obtain a rowIterator and columnIterator and iterate over them
	     //   System.out.println("\n\nIterating over Rows and Columns using Iterator\n");
	        Iterator<Row> rowIterator = sheet.rowIterator();
	        while (rowIterator.hasNext()) {
	            Row row = rowIterator.next();

	            // Now let's iterate over the columns of the current row
	            Iterator<Cell> cellIterator = row.cellIterator();

	            while (cellIterator.hasNext()) {
	                Cell cell = cellIterator.next();
	                String cellValue = dataFormatter.formatCellValue(cell);
	                //System.out.print(cellValue + "\t");
	            }
	            //System.out.println();
	        }

	        // 2. Or you can use a for-each loop to iterate over the rows and columns
	    //    System.out.println("\n\nIterating over Rows and Columns using for-each loop\n");
	        int i=0;
	        String a = null ;
	        String b = null ;
	        String c = null ;
	        String d = null ;
	        String e = null ;
	        String f = null ;
	        String g = null ;
	        for (Row row: sheet) {
	            for(Cell cell: row) {
	                String cellValue = dataFormatter.formatCellValue(cell);
	           //     System.out.print(cellValue + "\t");
	                
	               if(i==0) {
	            	   a = a + "," + cellValue;
	               }
	               else if(i==1) {
	            	   b = b + "," + cellValue;
	               }else if(i==2) {
	            	   c = c + "," + cellValue;
	               }
	               else if(i==3) {
	            	   d = d + "," + cellValue;
	               }
	               else if(i==4) {
	            	   e = e + "," + cellValue;
	               }
	               else if(i==5) {
	            	   f = f + "," + cellValue;
	               }
	               else if(i==6) {
	            	   g = g + "," + cellValue;
	               }
	                i++;	             
	            }
	      //      System.out.println();
	            i = 0;
	        }
	        System.out.println(a);
	        System.out.println(b);
	        System.out.println(c);
	        System.out.println(d);
	        System.out.println(e);
	        System.out.println(f);
	        
	        String[] date = a.split(",");
	        String[] tchi = b.split(",");
	        String[] tcho = c.split(",");
	        String[] detail = d.split(",");
	        String[] team = e.split(",");
	        String[] project = f.split(",");
	        String[] user = g.split(",");
	        
			for (i = 0; i < date.length; i++) {
				if(i>1) {
				String datedb;	
				String tchidb;
				String tchodb;
				String detaildb;
				String teamdb;
				String projectdb;
				String userdb;
				String timecheckin,timecheckout;
				String ind,inm,iny,outd,outm,outy;
				
				datedb = (date[i]);				
				tchidb = (tchi[i]);			
				tchodb = (tcho[i]);				
				detaildb = (detail[i]);				
				teamdb = (team[i]);				
				projectdb = (project[i]);
				userdb = (user[i]);
				
				ind = datedb.substring(0);
				
				timecheckin = datedb +" "+ tchidb+":00";
				timecheckout = datedb +" "+ tchodb+":00";
				Timestamp startDate = Timestamp.valueOf(timecheckin);
				Timestamp endDate = Timestamp.valueOf(timecheckout);
				
				System.out.println(datedb);
				System.out.println(timecheckin);
				System.out.println(timecheckout);
				System.out.println(detaildb);
				System.out.println(teamdb);
				System.out.println(projectdb);
				System.out.println(userdb);
							
				System.out.println("------------------------------------");
				
				
				Timesheet timesheet = new Timesheet();
		        Integer l = timesheetDAO.getMaxId() + 1;
		        timesheet.setId(l);
		        
				timesheet.setDescription(detaildb);
				List<Map<String, Object>> whereproject= timesheetDAO.whereproject(projectdb);
				for (int z = 0; z < whereproject.size(); z++) {
					

					BigInteger nameproject = ((BigInteger) whereproject.get(z).get("project_id"));
					 int nameproject2 = nameproject.intValue();
					timesheet.setProject_id(nameproject2);
					System.out.println(nameproject);
				}

				timesheet.setStatus("W");
				timesheet.setTimeCheckIn(startDate);
				timesheet.setTimeCheckOut(endDate);
				timesheet.setTimeCreate(DateUtil.getCurrentTime());
				timesheet.setTimeUpdate(DateUtil.getCurrentTime());
				timesheet.setTeam(teamdb);
				List<Map<String, Object>> wherename = timesheetDAO.wherename(userdb);
				for (int z = 0; z < wherename.size(); z++) {
			

					String name = ((String) wherename.get(z).get("id"));
					timesheet.setUserCreate(name);
					timesheet.setUserUpdate(name);
					System.out.println(name);
				}
				
				timesheetDAO.save(timesheet); 
				
				}	
				
				
			}
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
