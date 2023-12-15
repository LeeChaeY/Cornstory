package com.cornstory.service.purchase;

import com.cornstory.common.Search;
import com.cornstory.domain.Purchase;

import java.sql.Date;
import java.util.List;
import java.util.Map;

public interface PurchaseService {

    public int addPurchase(Purchase purchase) throws Exception;

    public Purchase getPurchase(int tranNo) throws Exception;

    public int deletePurchase(int tranNo) throws Exception;

    public Map<String, Object> listPurchase(Search search, String userId, int role, int tranCategory) throws Exception;

    public Map<String, Object> countWorkTotalPopcorn(Search search, String userId, int role) throws Exception;

    public Map<String, Object> listTotalSale(int condition) throws Exception;
}
