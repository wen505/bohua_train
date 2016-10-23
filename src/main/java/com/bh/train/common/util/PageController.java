package com.bh.train.common.util;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

/**
 * 分页封装对象
 * @author gs
 *
 * @param <T>
 */
public class PageController<T>  implements Serializable{

	
	
	private static final long serialVersionUID = 1L;
	
	// 当前页中存放的记录,类型一般为List
	private Collection<? extends Object> rows;
	
	private Map mapData;

	// 总记录数
	private int total;
	
	public PageController() {
		this(new ArrayList<T>(),0);
	}
	
	public PageController(Collection<? extends Object> rows,int total) {
		super();
		this.setRows(rows);
		this.setTotal(total);
	}
	
	public PageController(Map data,int total) {
		super();
		this.setMapData(data);
		this.setTotal(total);
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public Collection<? extends Object> getRows() {
		return rows;
	}

	public void setRows(Collection<? extends Object> rows) {
		this.rows = rows;
	}

	public Map getMapData() {
		return mapData;
	}

	public void setMapData(Map mapData) {
		this.mapData = mapData;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
}
