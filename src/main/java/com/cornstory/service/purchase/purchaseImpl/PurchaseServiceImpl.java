package com.cornstory.service.purchase.purchaseImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Product;
import com.cornstory.domain.Purchase;
import com.cornstory.service.purchase.PurchaseDao;
import com.cornstory.service.purchase.PurchaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PurchaseServiceImpl implements PurchaseService {

    @Autowired
    private PurchaseDao purchaseDao;

    @Override
    public int addPurchase(Purchase purchase) throws Exception {
        return purchaseDao.addPurchase(purchase);
    }

    @Override
    public Purchase getPurchase(int tranNo) throws Exception {
        return purchaseDao.getPurchase(tranNo);
    }

    @Override
    public int deletePurchase(int tranNo) throws Exception {
        return purchaseDao.deletePurchase(tranNo);
    }

    @Override
    public Map<String, Object> listPurchase(Search search, String userId, int role, int tranCategory) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        int totalCount = 0;
        List<Purchase> list = null;

        map.put("userId", userId);
        map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
        map.put("endRowNum", search.getCurrentPage() * search.getPageSize());
        map.put("role", role);
        map.put("tranCategory", tranCategory);

//        tranCategory - 0: 팝콘, 1: 작품 회차, 2: 저작권
        if (tranCategory == 1 || tranCategory == 2) {
            map.put("search", search);

            System.out.println("PurchaseServiceImpl :: listPurchase :: "+map);
            totalCount = purchaseDao.countPurchase(map);
            System.out.println("PurchaseServiceImpl :: countPurchase :: "+totalCount);

            list = purchaseDao.listPurchase(map);

        } else if (tranCategory == 0) {
            map.put("userId", userId);

            totalCount = purchaseDao.countPurchasePopcorn(map);
            System.out.println("PurchaseServiceImpl :: countPurchasePopcorn :: "+totalCount);

            list = purchaseDao.listPurchasePopcorn(map);
        }

        map.put("totalCount", totalCount);
        map.put("list", list);

        return map;
    }

    @Override
    public Map<String, Object> countWorkTotalPopcorn(String userId) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userId", userId);
        map.put("tranCategory", 1);
        List<Map> workSaleList = purchaseDao.countWorkTotalPopcorn(map);

        map.put("tranCategory", 2);
        List<Map> copyrightSaleList = purchaseDao.countWorkTotalPopcorn(map);

        List<Map> workList = new ArrayList<Map>();
        int size = (workSaleList.size() > copyrightSaleList.size()) ? workSaleList.size() : copyrightSaleList.size();
        for (int i=0; i<size; i++) {
            Map work = new HashMap();
            if (i < workSaleList.size()) {
                work.put("workNo", workSaleList.get(i).get("work_no"));
                work.put("category", workSaleList.get(i).get("category"));
                work.put("workPrice", workSaleList.get(i).get("prod_price"));
                work.put("workTotalPrice", workSaleList.get(i).get("total_price"));
            }
            if (i < copyrightSaleList.size()) {
                work.put("workNo", copyrightSaleList.get(i).get("work_no"));
                work.put("category", copyrightSaleList.get(i).get("category"));
                work.put("copyPrice", copyrightSaleList.get(i).get("prod_price"));
                work.put("copyTotalPrice", copyrightSaleList.get(i).get("total_price"));
            }
            workList.add(work);
        }
        map.put("workList", workList);
        map.put("totalCount", workList.size());
        return map;
    }

    @Override
    public Map<String, Object> listTotalSale(Date startDate, Date endDate) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("startDate", startDate);
        map.put("endDate", endDate);

        map.put("tranCategory", 0);
        List<Integer> purchaseCnt = purchaseDao.countTotalPurchase(map);
        map.put("purchaseCnt", purchaseCnt);

        map.put("tranCategory", 1);
        List<Integer> useCnt = purchaseDao.countTotalPurchase(map);
        map.put("useCnt", useCnt);

        return map;
    }
}
