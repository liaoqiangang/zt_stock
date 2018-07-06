package com.niuniu.ym.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.niuniu.ym.common.service.impl.BaseServiceImpl;
import com.niuniu.ym.dao.StockInfoDao;
import com.niuniu.ym.entity.StockInfo;
import com.niuniu.ym.service.StockInfoService;

@Service
public class StockInfoServiceImpl extends BaseServiceImpl<StockInfo> implements StockInfoService{

	@Autowired
	private StockInfoDao stockInfoDao;

	public StockInfoDao getDao() {
		return stockInfoDao;
	}

	public StockInfo selectByStockCode(String stockCode) {
		StockInfo stockInfo = stockInfoDao.selectByStockCode(stockCode);
		return stockInfo;
	}
}
