package com.javaweb.clothingstore.controller.superadmin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/superadmin")
public class SuperadminOperationController {

    @RequestMapping("/to_mainpage")
    public String toMainPgae() {
        return "superadmin/operation";
    }


}
