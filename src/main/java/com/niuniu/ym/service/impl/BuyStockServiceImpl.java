package com.niuniu.ym.service.impl;

import com.niuniu.ym.common.service.impl.BaseServiceImpl;
import com.niuniu.ym.dao.BuyStockDao;
import com.niuniu.ym.entity.BuyStock;
import com.niuniu.ym.service.BuyStockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BuyStockServiceImpl extends BaseServiceImpl<BuyStock> implements BuyStockService {

	@Autowired
	private BuyStockDao buyStockDao;

	public BuyStockDao getDao() {
		return buyStockDao;
	}
}
