package com.niuniu.ym.service;

import com.niuniu.ym.common.service.BaseService;
import com.niuniu.ym.entity.StockInfo;

public interface StockInfoService extends BaseService<StockInfo>{

	public StockInfo selectByStockCode(String stockCode);

}
