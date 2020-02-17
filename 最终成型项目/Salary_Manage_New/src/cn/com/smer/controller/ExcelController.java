package cn.com.smer.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.com.smer.service.FixedSalarysService;
import cn.com.smer.service.ImportProjectsService;
import cn.com.smer.service.SalarySettlementService;
import cn.com.smer.utils.ExcelUtils;
/*
 * 	Excel表格信息导入
 * 		1.固定工资通过Excel导入
 * 		2.导入信息通过Excel导入
 */
@Controller
@RequestMapping(value = "/excel")
public class ExcelController {
	@Autowired//自动注入
	private FixedSalarysService fixedSalaryService;
	@Autowired//自动注入
	private ImportProjectsService importProjectsService;
	
	@RequestMapping(value = "/importProjects")
	public @ResponseBody String importProjectsExcel(@RequestParam("file") MultipartFile file) {
		boolean result = false;
		try {
			// 读取Excel，并保存数据
			XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
			XSSFSheet sheet = null;
			sheet = workbook.getSheetAt(0);
			// 读取表头信息
			Map<Integer, Object> map0 = new HashMap<>();
			List<Map> listMap = new ArrayList<Map>();
			XSSFRow rowName = sheet.getRow(0);
			if (rowName != null) {
				int count = 0;
				while ((String) ExcelUtils.getValue(rowName.getCell(count), "String") != null) {
					map0.put(count, (String) ExcelUtils.getValue(rowName.getCell(count), "String"));
					count++;
				}
				listMap.add(map0);
			}
			// j表示行号，从零开始
			for (int j = 1; j <= 78; j++) {
				XSSFRow row = sheet.getRow(j);
				if (null != row) {
					int count = 0;
					// 生成要写入的数据
					Map<Integer, Object> map = new HashMap<>();
					while ((String) ExcelUtils.getValue(row.getCell(count), "String") != null) {
						//System.out.print(row.getCell(count).getCellStyle().toString()+"  ");
						if(row.getCell(count).getCellStyle().toString().equals("org.apache.poi.xssf.usermodel.XSSFCellStyle@6981e1ef")) {
							////System.out.println(row.getCell(count).getDateCellValue().toString());
							map.put(count, row.getCell(count).getDateCellValue());
							//System.out.println(map.get(count));
						}else{
							map.put(count, (String) ExcelUtils.getValue(row.getCell(count), "String"));// 读取每一个单元格
						}
						count++;
						;
					}
					//System.out.println();
					listMap.add(map);
				}
			}
			workbook.close();
			result = importProjectsService.insertImportProjects(listMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(result==true) {
			return "01";
		}
		return null;
	}
	//sxb
	@RequestMapping(value = "/fixedSalary")
	public @ResponseBody String fixedSalaryExcel(@RequestParam("file") MultipartFile file) {
		boolean a = false;
		try {
			// 读取Excel，并保存数据
			XSSFWorkbook workbook = new XSSFWorkbook(file.getInputStream());
			XSSFSheet sheet = null;
			sheet = workbook.getSheetAt(0);
			// 读取表头信息
			Map<Integer, Object> map0 = new HashMap<>();
			List<Map> listMap = new ArrayList<Map>();
			XSSFRow rowName = sheet.getRow(0);
			if (rowName != null) {
				int count = 0;
				while ((String) ExcelUtils.getValue(rowName.getCell(count), "String") != null) {
					map0.put(count, (String) ExcelUtils.getValue(rowName.getCell(count), "String"));
					//System.out.print(map0.get(count) + " ");
					count++;
				}
				listMap.add(map0);
			}
			// j表示行号，从零开始
			for (int j = 1; j <= 78; j++) {
				XSSFRow row = sheet.getRow(j);
				if (null != row) {
					int count = 0;
					// 生成要写入的数据
					Map<Integer, Object> map = new HashMap<>();
					while ((String) ExcelUtils.getValue(row.getCell(count), "String") != null) {
						map.put(count, (String) ExcelUtils.getValue(row.getCell(count), "String"));// 读取每一个单元格
						count++;
						//System.out.print(map.get(count - 1) + "  ");
						;
					}
					//System.out.println(j);
					listMap.add(map);
				}
			}
			workbook.close();
			a = fixedSalaryService.updateByExcelAll(listMap);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(a == false) {
			return "02";
		}else {
			return "01";
		}
	}
}
