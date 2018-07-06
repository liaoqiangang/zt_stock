package com.niuniu.ym.common.service;

import java.util.List;

public interface BaseBaseService<T,ID,F> {
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public T selectById(ID id);

	/**
	 * 条件查询
	 * @param filter
	 * @return
	 */
	public List<T> searchByFilter(F filter);

	
	
	/**
	 * 根据id删除记录
	 * @param id
	 */
	public void deleteById(ID id);
	
}
