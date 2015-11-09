package com.eip.template.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 이주환 on 2015-09-15.
 */
@Controller
public class RootController {

    @RequestMapping("/home")
    public String loginView(){


        return "admin/login/login";
    }


}
