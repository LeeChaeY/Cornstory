package com.cornstory.controller.work;

import com.cornstory.common.Search;
import com.cornstory.domain.Purchase;
import com.cornstory.domain.Work;
import com.cornstory.service.product.ProductService;
import com.cornstory.service.purchase.PurchaseService;
import com.cornstory.service.work.WorkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Map;

@Controller
@RequestMapping("/work")
public class WorkController {

    @Autowired
    @Qualifier("workServiceImpl")
    private WorkService workService;

    @Autowired
    @Qualifier("productServiceImpl")
    private ProductService productService;

    public WorkController(){
        System.out.println("WorkController 진입");
    }

    @GetMapping("/addWork")
    public String addWork(Model model) throws Exception {
        System.out.println("[ WorkController.index() start........]");
        //user의 세션을 가져와야함.
        model.addAttribute("list",productService.getCopylight("user001"));
        return "work/addWork";

    }
    @PostMapping("/addWork")
    public String addWorks(@ModelAttribute("work") Work work) throws Exception{
        System.out.println("[ WorkController.addWork() start........]");
        //user은 세션으로 가져오고


        System.out.print(work.toString());
        //workService.addWork(work);

        return "index";

    }

    @GetMapping("/updateWork")
    public String updateWork() throws Exception{
        System.out.println("[ WorkController.index() start........]");

        return "redirect:/work/updateWork";

    }
    @GetMapping("/deleteWork")
    public String deleteWork() throws Exception{
        System.out.println("[ WorkController.index() start........]");

        return "redirect:/work/deleteWork";

    }
    @RequestMapping ("/listWork")
    public String listWork(@ModelAttribute("search") Search search, Model model) throws Exception {
        System.out.println("[ WorkController.index() start........]");

        Map<String, Object> map=workService.listWork(search);

        model.addAttribute("list",map.get("list"));
        model.addAttribute("totalCount",map.get("totalCount"));
        model.addAttribute("search", search);
        return "work/listWork";

    }

}
