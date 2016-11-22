package com.bh.train.common.util;

import java.util.Map;

public class MapUtil {
	
	public static String getString(Map<String,Object> sourceMap,String key){
		
		if(sourceMap==null || key==null || sourceMap.get(key)==null){
			return null;
		}
		
		return sourceMap.get(key).toString();
	}
}
