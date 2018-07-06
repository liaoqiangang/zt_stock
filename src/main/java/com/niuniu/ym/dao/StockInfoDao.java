package com.niuniu.ym.dao;
import org.apache.ibatis.annotations.Param;

import com.niuniu.ym.common.dao.BaseDao;
import com.niuniu.ym.common.util.MyBatisRepository;
import com.niuniu.ym.entity.StockInfo;

@MyBatisRepository
public interface StockInfoDao extends BaseDao<StockInfo>{

	StockInfo selectByStockCode(@Param("stockCode")String stockCode);

}
