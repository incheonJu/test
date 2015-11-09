package com.eip.template.controller.kor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 이주환 on 2015-09-15.
 */
@Controller

public class RootController {

    @RequestMapping("/")
    public String loginView(){
        System.out.println("ddddddd");
        return "admin/login/login";
    }


}
