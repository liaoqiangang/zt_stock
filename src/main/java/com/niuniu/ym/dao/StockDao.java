package com.niuniu.ym.dao;
import org.apache.ibatis.annotations.Param;

import com.niuniu.ym.common.dao.BaseDao;
import com.niuniu.ym.common.util.MyBatisRepository;
import com.niuniu.ym.entity.Stock;

@MyBatisRepository
public interface StockDao extends BaseDao<Stock>{

	Stock selectNextStock(@Param("stockId")int stockId,@Param("nextType")int nextType);

	Stock selectUpStock(@Param("stockId")int stockId,@Param("nextType")int nextType);

    void transferAllData();

	void insert_stock_bak(Stock stock);

	void delete_stock();
}
