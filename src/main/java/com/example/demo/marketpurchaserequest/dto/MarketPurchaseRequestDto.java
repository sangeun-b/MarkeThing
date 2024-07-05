package com.example.demo.marketpurchaserequest.dto;

import com.example.demo.market.entity.Market;
import com.example.demo.marketpurchaserequest.entity.MarketPurchaseRequest;
import com.example.demo.siteuser.entity.SiteUser;
import com.example.demo.type.PurchaseRequestStatus;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.locationtech.jts.geom.Coordinate;
import org.locationtech.jts.geom.GeometryFactory;
import org.locationtech.jts.geom.Point;
import org.locationtech.jts.geom.PrecisionModel;

@Getter
public class MarketPurchaseRequestDto {

    @NotBlank
    private String title;

    @NotBlank
    private String content;

    private String postImg;

    @NotEmpty
    private int fee;

    @NotEmpty
    private PurchaseRequestStatus status;

    @NotEmpty
    private LocalDate meetupTime;

    @NotEmpty
    private LocalDate meetupDate;

    @NotBlank
    private String meetupAddress;

    private Double latitude;
    private Double longitude;

    private Long userId;

    private Long marketId;

    @Builder
    public MarketPurchaseRequestDto(String title, String content, String postImg, int fee, PurchaseRequestStatus status,
            LocalDate meetupTime, LocalDate meetupDate, String meetupAddress, double latitude, double longitude, Long userId, Long marketId) {
        this.title = title;
        this.content = content;
        this.postImg = postImg;
        this.fee = fee;
        this.status = status;
        this.meetupTime = meetupTime;
        this.meetupDate = meetupDate;
        this.meetupAddress = meetupAddress;
        this.latitude = latitude;
        this.longitude = longitude;
        this.userId = userId;
        this.marketId = marketId;


    }
    public Point getPoint(double latitude, double longitude) {
        GeometryFactory geometryFactory = new GeometryFactory(new PrecisionModel(), 4326);
        return geometryFactory.createPoint(new Coordinate(latitude, longitude));
    }

    public MarketPurchaseRequest toEntity(SiteUser siteUser, Market market) {
        return MarketPurchaseRequest.builder()
                .title(title)
                .content(content)
                .postImg(postImg)
                .fee(fee)
                .meetupTime(meetupTime)
                .meetupDate(meetupDate)
                .meetupAddress(meetupAddress)
                .meetupLocation(getPoint(longitude, longitude))
                .createdAt(LocalDateTime.now())
                .siteUser(siteUser)
                .market(market)
                .build();

    }

}