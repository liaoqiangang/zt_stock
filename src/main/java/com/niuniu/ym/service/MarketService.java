package com.niuniu.ym.service;

import com.niuniu.ym.common.service.BaseService;
import com.niuniu.ym.entity.Market;
import com.niuniu.ym.entity.Stock;

public interface MarketService extends BaseService<Market>{

	/**
	 * 上一条:select * from 表 where 数据id<@当前显示数据id order by 数据_id asc) limit 1
//		下一条:select * from 表 where 数据id>@当前显示数据id order by 数据_id desc) limit 1 
	 * @param id
	 * @param nextType
	 * @return
	 */
	public Market selectNextMarket(Integer marketId, String nextType);

}
