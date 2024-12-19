package com.office.flight.user;

import com.office.flight.amadeus.FlightSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
public class FlightSearchController {

    @Autowired
    private FlightSearchService flightSearchService;

    @PostMapping("/searchFlights")
    public String searchFlights(HttpServletRequest request, Model model) {
        // 폼 데이터 수집
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        int adults = Integer.parseInt(request.getParameter("adults"));
        int children = Integer.parseInt(request.getParameter("children"));

        // Access Token (Postman에서 받은 값을 하드코딩 또는 DB에서 읽기)
        String accessToken = "2iRAMiM9zOAk8VpHkRssiGCrvStS";

        // API 호출
        String flightResults = flightSearchService.searchFlights(origin, destination, departureDate, returnDate, adults, children, accessToken);

        // 결과 JSP에 전달
        model.addAttribute("flightResults", flightResults);
        return "user/flightResults"; // flightResults.jsp로 이동
    }
}
