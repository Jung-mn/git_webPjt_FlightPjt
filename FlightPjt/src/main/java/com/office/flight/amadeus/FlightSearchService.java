package com.office.flight.amadeus;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.reactive.function.client.WebClient;
import reactor.core.publisher.Mono;

@Service
public class FlightSearchService {

    @Autowired
    private WebClient webClient;

    public String searchFlights(String origin, String destination, String departureDate, String returnDate, int adults, int children, String accessToken) {
        // API 호출
        Mono<String> response = webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/v2/shopping/flight-offers")
                        .queryParam("originLocationCode", origin)
                        .queryParam("destinationLocationCode", destination)
                        .queryParam("departureDate", departureDate)
                        .queryParam("returnDate", returnDate)
                        .queryParam("adults", adults)
                        .queryParam("children", children)
                        .build())
                .header("Authorization", "Bearer " + accessToken)
                .retrieve()
                .bodyToMono(String.class);

        return response.block(); // 동기식으로 결과 반환
    }
}
