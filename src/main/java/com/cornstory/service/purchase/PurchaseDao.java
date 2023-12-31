package com.cornstory.service.purchase;

import com.cornstory.common.Search;
import com.cornstory.domain.Product;
import com.cornstory.domain.Purchase;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface PurchaseDao {

    public int addPurchase(Purchase purchase) throws Exception;

    public Purchase getPurchase(int tranNo) throws Exception;

    public int deletePurchase(int tranNo) throws Exception;

    public int countPurchase(Map map) throws Exception;

    public List<Purchase> listPurchase(Map map) throws Exception;

    public List<Map> countWorkTotalPopcorn(Map map) throws Exception;

    public int countPurchasePopcorn(Map map) throws Exception;

    public List<Purchase> listPurchasePopcorn(Map map) throws Exception;

    public List<Map> countTotalPurchase(Map map) throws Exception;

    public int countPurchaseCheck(Map map) throws Exception;
}
