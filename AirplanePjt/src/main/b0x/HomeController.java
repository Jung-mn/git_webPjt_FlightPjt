package com.office.airplane;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String home() {
        // "home"은 src/main/webapp/WEB-INF/views/home.jsp를 의미
        return "home";
    }
}

