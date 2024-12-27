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
import java.time.Duration;
import java.time.format.DateTimeParseException;

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

        String accessToken = "iswD1Kili6N4BGRF2aqe9RKsIXXF";  // 실제 토큰
        if (accessToken == null || accessToken.trim().isEmpty()) {
            model.addAttribute("error", "액세스 토큰 오류");
            return "/user/home";
        }

        // 출발 항공편 조회
        String outboundFlightResultsJson = flightSearchService.searchFlights(
                origin, destination, departureDate, adults, children, accessToken);

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            JsonNode rootNode = objectMapper.readTree(outboundFlightResultsJson);
            JsonNode dataNode = rootNode.get("data");
            if (dataNode != null && dataNode.isArray()) {
                List<Map<String, Object>> outboundFlightResults = objectMapper.convertValue(dataNode, new TypeReference<List<Map<String, Object>>>() {});
                
                // Duration 변환 추가
                for (Map<String, Object> flight : outboundFlightResults) {
                    // "itineraries"가 List<Map<String, Object>>이므로 List로 캐스팅
                    List<Map<String, Object>> itineraries = (List<Map<String, Object>>) flight.get("itineraries");

                    if (itineraries != null && !itineraries.isEmpty()) {
                        Map<String, Object> firstItinerary = itineraries.get(0);
                        String duration = (String) firstItinerary.get("duration");

                        if (duration != null && !duration.isEmpty()) {
                            // PT1H5M 같은 duration을 "1시간 5분" 형태로 변환
                            String readableDuration = convertDuration(duration);
                            flight.put("readableDuration", readableDuration); // 변환된 duration을 "readableDuration"에 저장
                        }
                    }
                }

                model.addAttribute("outboundFlightResults", outboundFlightResults); // 출발 항공편 데이터를 JSP에 전달

                // 왕복일 경우 반환 항공편 조회
                if (returnDate != null && !returnDate.isEmpty()) {
                    String inboundFlightResultsJson = flightSearchService.searchFlights(
                            destination, origin, returnDate, adults, children, accessToken);

                    JsonNode inboundDataNode = objectMapper.readTree(inboundFlightResultsJson).get("data");
                    if (inboundDataNode != null && inboundDataNode.isArray()) {
                        List<Map<String, Object>> inboundFlightResults = objectMapper.convertValue(inboundDataNode, new TypeReference<List<Map<String, Object>>>() {});
                        
                        // Duration 변환 추가
                        for (Map<String, Object> flight : inboundFlightResults) {
                            // "itineraries"가 List<Map<String, Object>>이므로 List로 캐스팅
                            List<Map<String, Object>> itineraries = (List<Map<String, Object>>) flight.get("itineraries");

                            if (itineraries != null && !itineraries.isEmpty()) {
                                Map<String, Object> firstItinerary = itineraries.get(0);
                                String duration = (String) firstItinerary.get("duration");

                                if (duration != null && !duration.isEmpty()) {
                                    // PT1H5M 같은 duration을 "1시간 5분" 형태로 변환
                                    String readableDuration = convertDuration(duration);
                                    flight.put("readableDuration", readableDuration); // 변환된 duration을 "readableDuration"에 저장
                                }
                            }
                        }
                        
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

    // Duration을 "1시간 5분" 형태로 변환하는 메소드
    private String convertDuration(String duration) {
        try {
            // Duration 객체로 파싱
            Duration dur = Duration.parse(duration);
            long hours = dur.toHours();
            long minutes = dur.toMinutes() % 60;

            // 결과 형식 지정
            StringBuilder sb = new StringBuilder();
            if (hours > 0) {
                sb.append(hours).append("시간 ");
            }
            if (minutes > 0) {
                sb.append(minutes).append("분");
            }
            return sb.toString();
        } catch (DateTimeParseException e) {
            return duration; // 형식 오류 시 원본 반환
        }
    }
}
