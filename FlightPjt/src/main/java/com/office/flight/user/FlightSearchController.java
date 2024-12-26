package com.office.flight.user;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.core.type.TypeReference;
import com.office.flight.amadeus.FlightSearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
public class FlightSearchController {

    @Autowired
    private FlightSearchService flightSearchService;

    @PostMapping("/searchFlights")
    public String searchFlights(HttpServletRequest request, Model model) {
        String origin = request.getParameter("origin");
        String destination = request.getParameter("destination");
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");

        int adults = 1;
        int children = 0;

        // 값 파싱 생략...

        String accessToken = "ag7js00RVMd0RAjKtSNmXlShuGdC";  // 실제 토큰
        if (accessToken == null || accessToken.trim().isEmpty()) {
            model.addAttribute("error", "액세스 토큰 오류");
            return "/user/home";
        }

        // 출발 항공편 조회
        String outboundFlightResultsJson = flightSearchService.searchFlights(
                origin, destination, departureDate, adults, children, accessToken);

        // JSON 데이터를 List<Map<String, Object>>로 변환
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            JsonNode rootNode = objectMapper.readTree(outboundFlightResultsJson);
            JsonNode dataNode = rootNode.get("data");
            if (dataNode != null && dataNode.isArray()) {
                List<Map<String, Object>> outboundFlightResults = objectMapper.convertValue(dataNode, new TypeReference<List<Map<String, Object>>>() {});
                model.addAttribute("outboundFlightResults", outboundFlightResults); // 출발 항공편 데이터를 JSP에 전달

                // 왕복일 경우 반환 항공편 조회
                if (returnDate != null && !returnDate.isEmpty()) {
                    String inboundFlightResultsJson = flightSearchService.searchFlights(
                            destination, origin, returnDate, adults, children, accessToken);

                    JsonNode inboundDataNode = objectMapper.readTree(inboundFlightResultsJson).get("data");
                    if (inboundDataNode != null && inboundDataNode.isArray()) {
                        List<Map<String, Object>> inboundFlightResults = objectMapper.convertValue(inboundDataNode, new TypeReference<List<Map<String, Object>>>() {});
                        model.addAttribute("inboundFlightResults", inboundFlightResults); // 반환 항공편 데이터를 JSP에 전달
                    }
                }
            } else {
                model.addAttribute("error", "항공편 데이터를 찾을 수 없습니다.");
                return "/user/home";
            }
        } catch (Exception e) {
            model.addAttribute("error", "항공편 검색 중 오류가 발생했습니다.");
            e.printStackTrace();
            return "/user/home";
        }

        return "user/flightResults";
    }

}
