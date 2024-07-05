package com.example.demo.marketpurchaserequest.repository;

import com.example.demo.marketpurchaserequest.entity.MarketPurchaseRequest;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MarketPurchaseRequestRepository extends JpaRepository<MarketPurchaseRequest,Long> {

}