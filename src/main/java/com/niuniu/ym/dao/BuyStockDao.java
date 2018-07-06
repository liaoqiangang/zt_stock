package com.niuniu.ym.dao;

import com.niuniu.ym.common.dao.BaseDao;
import com.niuniu.ym.common.util.MyBatisRepository;
import com.niuniu.ym.entity.BuyStock;

@MyBatisRepository
public interface BuyStockDao extends BaseDao<BuyStock> {

    void insert_stock_bak(BuyStock stock);

    void delete_stock();
}
