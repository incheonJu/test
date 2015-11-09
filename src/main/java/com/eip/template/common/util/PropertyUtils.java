package com.eip.template.common.util;

import org.apache.commons.lang.StringUtils;

public abstract class PropertyUtils {

	public static String PROPERTY_SEPARATOR = ".";
	
	public static String getPropertyName(String propertyPath) {
		if (propertyPath.contains(PROPERTY_SEPARATOR)) 
			return StringUtils.substringAfterLast(propertyPath, PROPERTY_SEPARATOR);
		
		return propertyPath;
	}
	
	public static String getPath(String propertyPath) {
		return StringUtils.substringBeforeLast(propertyPath, PROPERTY_SEPARATOR);
	}

	public static boolean isNested(String propertyPath) {
		return propertyPath.contains(PROPERTY_SEPARATOR);
	}
	
	public static String getFirstPropertyName(String propertyPath) {
		return isNested(propertyPath) ? 
				StringUtils.substringBefore(propertyPath, PROPERTY_SEPARATOR) : propertyPath;
	}
	
	public static String getNestedPath(String propertyPath) { 
		return StringUtils.substringAfter(propertyPath, PROPERTY_SEPARATOR);
	}
}