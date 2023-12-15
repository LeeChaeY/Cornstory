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
    public Map<String, Object> countWorkTotalPopcorn(Search search, String userId, int role) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("userId", userId);
        map.put("role", role);
        map.put("search", search);

        map.put("tranCategory", 1);
        List<Map> workSaleList = purchaseDao.countWorkTotalPopcorn(map);
        System.out.println("PurchaseServiceImpl :: countWorkTotalPopcorn :: workSaleList :: "+workSaleList);

        map.put("tranCategory", 2);
        List<Map> copyrightSaleList = purchaseDao.countWorkTotalPopcorn(map);
        System.out.println("PurchaseServiceImpl :: countWorkTotalPopcorn :: copySaleList :: "+copyrightSaleList);

        List<Map> workList = new ArrayList<Map>();
        for (int i=0; i<workSaleList.size(); i++) {
            Map work = new HashMap();
            work.put("workNo", workSaleList.get(i).get("work_no"));
            work.put("category", workSaleList.get(i).get("category"));
            work.put("workName", workSaleList.get(i).get("work_name"));
            work.put("nickname", workSaleList.get(i).get("nickname"));
            work.put("workPrice", workSaleList.get(i).get("prod_price"));
            work.put("workTotalPrice", workSaleList.get(i).get("total_price"));
            work.put("workUserCount", workSaleList.get(i).get("user_count"));

            if (i < copyrightSaleList.size()) {
                work.put("copyPrice", copyrightSaleList.get(i).get("prod_price"));
                work.put("copyTotalPrice", copyrightSaleList.get(i).get("total_price"));
                work.put("copyUserCount", copyrightSaleList.get(i).get("user_count"));
            } else {
                work.put("copyPrice", -1);
                work.put("copyTotalPrice", 0);
                work.put("copyUserCount", 0);
            }
            workList.add(work);
        }
        map.put("workList", workList);
        map.put("totalCount", workList.size());
        return map;
    }

    @Override
    public Map<String, Object> listTotalSale(int condition) throws Exception {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("condition", condition);

        map.put("tranCategory", 0);
        List<Map> purchaseCnt = purchaseDao.countTotalPurchase(map);

        map.put("tranCategory", 1);
        List<Map> usePopcornCnt = purchaseDao.countTotalPurchase(map);

        List<Map> list = new ArrayList<Map>();
        for (int i=0; i<purchaseCnt.size(); i++) {
            Map map01 = new HashMap();
            map01.put("purchasePopcornCnt", purchaseCnt.get(i).get("popcorn_cnt"));
            map01.put("purchasePrice", purchaseCnt.get(i).get("prod_price_sum"));
            map01.put("usePopcornCnt", usePopcornCnt.get(i).get("prod_price_sum"));
            if (condition != 0) map01.put("date", usePopcornCnt.get(i).get("date"));
            else map01.put("date", "");
            list.add(map01);
        }

        System.out.println("PurchaseServiceImpl :: listTotalSale :: "+map);
        map.put("list", list);
        map.put("totalCount", list.size());
        return map;
    }
}
