package com.niuniu.ym.common.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.niuniu.ym.common.filter.PageFilter;
import com.niuniu.ym.common.service.BaseService;
@Service
public abstract class BaseServiceImpl<T> implements BaseService<T>{

	@Override
	public T selectById(Integer id) {
		return getDao().selectById(id);
	}

	@Override
	public List<T> searchByFilter(PageFilter filter) {
		List<T> list = getDao().searchByFilter(filter);
		return list;
	}

	@Override
	public int countByFilter(PageFilter filter) {
		return getDao().countByFilter(filter);
	}

	@Override
	public T insert(T entity) {
		getDao().insert(entity);
		return entity;
	}

	@Override
	public T insertBySelective(T entity) {
		getDao().insertBySelective(entity);
		return entity;
	}

	@Override
	public void update(T entity) {
		getDao().update(entity);
		
	}

	@Override
	public void updateBySelective(T entity) {
		getDao().updateBySelective(entity);
		
	}

	@Override
	public void deleteById(Integer id) {
		getDao().deleteById(id);
		
	}


}
