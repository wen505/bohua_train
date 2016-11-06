package com.bh.train.common.util;

import java.lang.reflect.Field;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
/**
 * 
 * @ClassName: ServiceUtil;
 *
 * @Description: 服务类工具;
 *
 * @date : 2010-7-30 下午5:23:24;
 *
 * @author:Administrator
 */
public class ServiceUtil {
	/**
	 *
	 * @Title: getidByUUID
	 *
	 * @Description: TODO(用于生成主键ID)
	 *
	 * @param @return
	 *
	 * @return String    返回类型
	 *
	 * @throws
	 *
	 */
	public static String  getidByUUID(){
		String id =UUID.randomUUID().toString();
		id=id.replaceAll("-", "");
		return id;
	}
}
