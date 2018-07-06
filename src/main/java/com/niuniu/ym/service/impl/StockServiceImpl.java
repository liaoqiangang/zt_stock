package com.niuniu.ym.service.impl;

import com.niuniu.ym.common.service.impl.BaseServiceImpl;
import com.niuniu.ym.dao.BuyStockDao;
import com.niuniu.ym.dao.StockDao;
import com.niuniu.ym.entity.BuyStock;
import com.niuniu.ym.entity.Stock;
import com.niuniu.ym.filter.BuyStockFilter;
import com.niuniu.ym.filter.StockFilter;
import com.niuniu.ym.service.StockService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StockServiceImpl extends BaseServiceImpl<Stock> implements StockService{

	@Autowired
	private StockDao stockDao;

	@Autowired
	private BuyStockDao buyStockDao;

	public StockDao getDao() {
		return stockDao;
	}

	@Override
	public Stock selectNextStock(Integer stockId, String nextType) {
		Stock stock = null;
		if(nextType.equals("0")){
			 stock = getDao().selectUpStock(stockId,Integer.valueOf(nextType));
		}else if(nextType.equals("1")){
			 stock = getDao().selectNextStock(stockId,Integer.valueOf(nextType));
		}
		return stock;
	}

	@Override
	public void transferAllData() {
		/*迁移涨停股票数据*/
		StockFilter filter = new StockFilter();
		int total = getDao().countByFilter(filter);
		filter.setNumPerPage(total);
		List<Stock> list = getDao().searchByFilter(filter);
		for (Stock stock:list){
			getDao().insert_stock_bak(stock);
		}
		getDao().delete_stock();

		/*迁移回调	触发关注买入的股票*/
		BuyStockFilter buyStockFilter = new BuyStockFilter();
		int total1 = buyStockDao.countByFilter(buyStockFilter);
		buyStockFilter.setNumPerPage(total1);
		List<BuyStock> list1 = buyStockDao.searchByFilter(buyStockFilter);
		for (BuyStock stock:list1){
			buyStockDao.insert_stock_bak(stock);
		}
//		buyStockDao.delete_stock();
	}
}
