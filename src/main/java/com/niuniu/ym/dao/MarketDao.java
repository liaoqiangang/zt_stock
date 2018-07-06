package com.niuniu.ym.dao;
import org.apache.ibatis.annotations.Param;

import com.niuniu.ym.common.dao.BaseDao;
import com.niuniu.ym.common.util.MyBatisRepository;
import com.niuniu.ym.entity.Market;

@MyBatisRepository
public interface MarketDao extends BaseDao<Market>{

	Market selectNextMarket(@Param("marketId")int marketId,@Param("nextType")int nextType);

	Market selectUpMarket(@Param("marketId")int marketId,@Param("nextType")int nextType);
}
