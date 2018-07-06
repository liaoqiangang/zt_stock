package com.niuniu.ym.common.service;

import com.niuniu.ym.common.dao.BaseDao;
import com.niuniu.ym.common.filter.PageFilter;

public interface BaseService<T> extends BaseBaseService<T, Integer,PageFilter>{
	/**
	 * 查询记录条数
	 * @param filter
	 * @return
	 */
	public int countByFilter(PageFilter filter);
	
	
	/**
	 * 按条件插入 
	 * @param entity
	 */
	public T insertBySelective(T entity);
	
	
	/**
	 * 按条件修改
	 * @param entity
	 */
	public void updateBySelective(T entity);
	
	/**
	 * 插入
	 * @param entity
	 */
	public T insert(T entity);
	
	
	/**
	 * 修改
	 * @param entity
	 */
	public void update(T entity);
	public BaseDao<T> getDao();
}
