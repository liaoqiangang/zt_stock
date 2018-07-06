package com.niuniu.ym.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niuniu.ym.common.service.impl.BaseServiceImpl;
import com.niuniu.ym.dao.MarketDao;
import com.niuniu.ym.entity.Market;
import com.niuniu.ym.entity.Stock;
import com.niuniu.ym.service.MarketService;

@Service
public class MarketServiceImpl extends BaseServiceImpl<Market> implements MarketService{

	@Autowired
	private MarketDao marketDao;

	public MarketDao getDao() {
		return marketDao;
	}

	@Override
	public Market selectNextMarket(Integer marketId, String nextType) {
		Market market = null;
		if(nextType.equals("0")){
			market = getDao().selectUpMarket(marketId,Integer.valueOf(nextType));
		}else if(nextType.equals("1")){
			market = getDao().selectNextMarket(marketId,Integer.valueOf(nextType));
		}
		return market;
	}
}
