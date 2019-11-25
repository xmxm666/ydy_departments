package com.ydy.application.util;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

public class ExcelUtil {


    /**
     * 读取.xlsx 内容
     * @param file
     * @return
     * @throws
     */
    public static List<ArrayList<String>> readXlsx (MultipartFile file) {
        List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();
        InputStream input = null;
        XSSFWorkbook wb = null;
        try {
            input = file.getInputStream();
            //创建文档
            wb = new XSSFWorkbook(input);
            ArrayList<String> rowList = null;
            int totoalRows = 0;//总行数
            int totalCells = 0;//总列数
            //读取sheet(页)
            for (int sheetIndex = 0 ; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
                XSSFSheet xssfSheet = wb.getSheetAt(sheetIndex);

                if (xssfSheet == null) {
                    continue;
                }
                totoalRows = xssfSheet.getLastRowNum();
                //读取row
                for (int rowIndex = 0; rowIndex <= totoalRows; rowIndex++) {
                    XSSFRow xssfRow = xssfSheet.getRow(rowIndex);

                    if (xssfRow == null) {
                        continue;
                    }
                    rowList = new ArrayList<String>();
                    totalCells = xssfRow.getLastCellNum();

                    //读取列
                    for (int cellIndex = 0; cellIndex < totalCells; cellIndex++) {
                        XSSFCell xssfCell = xssfRow.getCell(cellIndex);
                        if (xssfCell == null) {
                            rowList.add("");
                        } else {
                        	xssfCell.setCellType(CellType.STRING);
                            rowList.add(String.valueOf(xssfCell.getStringCellValue()));
                        }
                    }

                    list.add(rowList);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if ( wb != null) {
                    input.close();
                }
                if (input != null) {
                    input.close();
                }
            } catch (Exception e) {
            }
        }

        return list;
    }

    /**
     * 读取 .xls内容
     * @param file
     * @return
     * @throws
     */
    public static List<ArrayList<String>> readXls (MultipartFile file , Map<String ,Set<Integer>> map)  {
        List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();


        Set<Integer> set = new HashSet<Integer>();
        //创建输入流
        InputStream input = null;
        //创建文档
        HSSFWorkbook wb = null;

        try {
            input = file.getInputStream();
            //创建文档
            wb = new HSSFWorkbook(input);

            ArrayList<String> rowList = null;
            int totoalRows = 0;//总行数
            int totalCells = 0;//总列数
            //读取sheet(页)
            for (int sheetIndex = 0 ; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
                HSSFSheet hssfSheet = wb.getSheetAt(sheetIndex);

                if (hssfSheet == null) {
                    continue;
                }

                totoalRows = hssfSheet.getLastRowNum();
                //读取row
                for (int rowIndex =1; rowIndex <= totoalRows; rowIndex++) {
                    HSSFRow hssfRow = hssfSheet.getRow(rowIndex);

                    if (hssfRow == null) {
                        continue;
                    }
                    rowList = new ArrayList<String>();
                    totalCells = hssfRow.getLastCellNum();

                    //读取列
                    for (int cellIndex = 0; cellIndex < totalCells; cellIndex++) {
                        HSSFCell hssfCell = hssfRow.getCell(cellIndex);
                        if(cellIndex==0){
                            String typeId =String.valueOf(hssfCell.getStringCellValue());
                            if(typeId.equalsIgnoreCase("DBCK")){
                                set =map.get("DBCK");
                            }else if(typeId.equalsIgnoreCase("QTRK")||typeId.equalsIgnoreCase("THHRK")||typeId.equalsIgnoreCase("SPRK")){
                                set =map.get("QTRK");
                            }else{
                                set =map.get("QTCK");
                            }
                        }
                        boolean contains = set.contains(cellIndex);
                        if (hssfCell == null) {
                            rowList.add("");
                        } else {
                            if(contains){
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Date date = HSSFDateUtil.getJavaDate(hssfCell.getNumericCellValue());
                                rowList.add(sdf.format(date));
                            }else{
                                hssfCell.setCellType(CellType.STRING);
                                rowList.add(String.valueOf(hssfCell.getStringCellValue()));
                            }

                        }
                    }

                    list.add(rowList);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if ( wb != null) {
                    input.close();
                }
                if (input != null) {
                    input.close();
                }
            } catch (Exception e) {
            }
        }
        return list;
    }


    public static List<ArrayList<String>> readXlsMy (MultipartFile file , Set<Integer> set )  {
        List<ArrayList<String>> list = new ArrayList<ArrayList<String>>();

        //创建输入流
        InputStream input = null;
        //创建文档
        HSSFWorkbook wb = null;

        try {
            input = file.getInputStream();
            //创建文档
            wb = new HSSFWorkbook(input);

            ArrayList<String> rowList = null;
            int totoalRows = 0;//总行数
            int totalCells = 0;//总列数
            //读取sheet(页)
            for (int sheetIndex = 0 ; sheetIndex < wb.getNumberOfSheets(); sheetIndex++) {
                HSSFSheet hssfSheet = wb.getSheetAt(sheetIndex);

                if (hssfSheet == null) {
                    continue;
                }

                totoalRows = hssfSheet.getLastRowNum();
                //读取row
                for (int rowIndex =1; rowIndex <= totoalRows; rowIndex++) {
                    HSSFRow hssfRow = hssfSheet.getRow(rowIndex);

                    if (hssfRow == null) {
                        continue;
                    }
                    rowList = new ArrayList<String>();
                    totalCells = hssfRow.getLastCellNum();

                    //读取列
                    for (int cellIndex = 0; cellIndex < totalCells; cellIndex++) {
                        HSSFCell hssfCell = hssfRow.getCell(cellIndex);
                        boolean contains = set.contains(cellIndex);
                        if (hssfCell == null) {
                            rowList.add("");
                        } else {
                            if(contains){
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                Date date = HSSFDateUtil.getJavaDate(hssfCell.getNumericCellValue());
                                rowList.add(sdf.format(date));
                            }else{
                                hssfCell.setCellType(CellType.STRING);
                                rowList.add(String.valueOf(hssfCell.getStringCellValue()));
                            }

                        }
                    }

                    list.add(rowList);

                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            try {
                if ( wb != null) {
                    input.close();
                }
                if (input != null) {
                    input.close();
                }
            } catch (Exception e) {
            }
        }
        return list;
    }










    /**
     * 获取文件类型
     * @param path
     * @return
     */
    public static String getPostfix (String path) {
        if (StringUtils.isBlank(path) || !path.contains(".")) {
            return null;
        }
        return path.substring(path.lastIndexOf(".") + 1, path.length()).trim();
    }


}
