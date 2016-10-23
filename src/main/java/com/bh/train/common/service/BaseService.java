package com.bh.train.common.service;

import org.springframework.util.StringUtils;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/***
 *公共方法服务类
 * @author lp
 */
public class BaseService {

    /**
     *
     * @Title: setMap
     *
     * @Description: TODO(封装Map)
     *
     * @param @param keys
     * @param @param values
     * @param @return
     *
     * @return Map 返回类型
     *
     * @throws
     *
     */
    @SuppressWarnings({ "unchecked", "rawtypes" })
    protected   Map setMap(String keys, Object... values) {
        Map map = new HashMap();
        String[] ks = keys.split(",");
        for (int i = 0; i < ks.length; i++) {
            map.put(ks[i], values[i]);
        }
        return map;
    }

    /**
     * 将字符串插入% 间隔插入
     *
     * @param spell
     * @return
     */
    protected String formatString(String spell) {
        if (null != spell && !"".equals(spell)) {
            String result = "";
            for (int i = 0; i < spell.length(); i++) {
                result = result + "%" + spell.substring(i, i + 1);
            }
            return result + "%";
        }
        return null;
    }

    /**
     * 将字符串分割
     *
     * @param string
     * @return
     */
    protected List<String> splitString(String string) {
        if(StringUtils.isEmpty(string)){
            return null;
        }
        String[] split = string.split(",");
        List<String> asList = Arrays.asList(split);
        return asList;
    }

    /**
     *
     * @Title: returnResult
     *
     * @Description: TODO(根据操作数据库返回的个 判断是否操作成功)
     *
     * @param @param count
     * @param @return
     *
     * @return boolean 返回类型
     *
     * @throws
     *
     */
    protected boolean returnResult(int count) {
        if (count == 0) {
            return false;
        } else {
            return true;
        }
    }

    /**
     *
     * @Title: pageNumber
     *
     * @Description: TODO(分页参数)
     *
     * @param @param page 第几页
     * @param @param rows 每页多条记录
     * @param @return
     *
     * @return int[] 返回类型 每页的开始记录 第一页为1 第二页为number +1 ,每页显示条数
     *
     * @throws
     *
     */
    protected int[] pageNumber(String page, String rows) {

        // 当前页,page由分页工具负责传过来
        int intPage = Integer.parseInt((page == null || page == "0" || ""
                .equals(page)) ? "1" : page);
        // 每页显示条数
        int number = Integer.parseInt((rows == null || rows == "0" || ""
                .equals(rows)) ? "10" : rows);
        // 每页的开始记录 第一页为1 第二页为number +1
        int startNumber = (intPage - 1) * number;
        int[] num = { startNumber, number };
        return num;
    }



}
