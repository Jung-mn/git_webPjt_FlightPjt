package com.office.flight;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
    	System.out.println(
    			"[HomeController] home()");	
        
        return "redirect:/user/";
    }
}

