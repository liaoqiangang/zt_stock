package com.niuniu.ym.common.dao;

import java.util.List;

import com.niuniu.ym.common.filter.PageFilter;
import com.niuniu.ym.common.util.MyBatisRepository;
@MyBatisRepository
public abstract interface BaseBaseDao<T,ID> {

	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	T selectById(ID id);

	/**
	 * 条件查询
	 * @param filter
	 * @return
	 */
	List<T> searchByFilter(PageFilter filter);

	/**
	 * 查询记录条数
	 * @param filter
	 * @return
	 */
	int countByFilter(PageFilter filter);
	
	/**
	 * 插入
	 * @param entity
	 */
	void insert(T entity);
	
	/**
	 * 按条件插入 
	 * @param entity
	 */
	void insertBySelective(T entity);
	
	/**
	 * 修改
	 * @param entity
	 */
	void update(T entity);
	
	/**
	 * 按条件修改
	 * @param entity
	 */
	void updateBySelective(T entity);
	
	/**
	 * 根据id删除记录
	 * @param id
	 */
	void deleteById(ID id);
}
