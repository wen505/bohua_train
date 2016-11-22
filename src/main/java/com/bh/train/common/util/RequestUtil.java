package com.bh.train.common.util;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * Created by chenz on 2016/3/21.
 */
public class RequestUtil {
    public static Map getRequestMap(HttpServletRequest request) {
        HashMap reqMap = new HashMap();
        Map tmp = request.getParameterMap();
        if(tmp != null) {
            Iterator i$ = tmp.keySet().iterator();

            while(i$.hasNext()) {
                String key = (String)i$.next();
                String[] values = (String[])tmp.get(key);
                if(key.endsWith("[]")) {
                    reqMap.put(key.substring(0, key.lastIndexOf("[")), values);
                } else {
                    reqMap.put(key, values[0].trim());
                }
            }
        }

        return reqMap;
    }
    public static Map getEntityMap(HttpServletRequest request) {
        return getRequestMap(request);
    }
}
