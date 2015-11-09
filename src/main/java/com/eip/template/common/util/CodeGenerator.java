package com.eip.template.common.util;

public class CodeGenerator {
		
	public String getMySQLGeneratorCode(String _prefix, String _table, String _primaryKey, String _createDt){
		String result = "";
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT 	DATE_FORMAT(NOW(),'%Y%m%d') AS T_DATE, ");
		sb.append("			COUNT("+_primaryKey+")+1 AS G_CODE ");
		sb.append("	 FROM 	"+_table);
		sb.append("	WHERE 	DATE_FORMAT("+_createDt+",'%Y-%m-%d') = DATE_FORMAT(NOW(),'%Y-%m-%d')");
		
		result += "_prefix+T_DATE+G_CODE"; 
		
		return result;
	}
	
	public String getMsSQLGeneratorCode(String _prefix, String _table, String _primaryKey, String _createDt){
		String result = "";
		StringBuffer sb = new StringBuffer();
		
		sb.append("SELECT 	CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112) AS T_DATE, ");
		sb.append("			COUNT("+_primaryKey+")+1 AS G_CODE ");
		sb.append("	 FROM 	"+_table);
		sb.append("	WHERE 	CONVERT(CHAR(8), "+_createDt+", 112) = CONVERT(CHAR(8), CURRENT_TIMESTAMP, 112)");
		
		result += "_prefix+T_DATE+G_CODE";
		
		return result;
	}
}