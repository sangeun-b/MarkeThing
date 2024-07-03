DROP TABLE IF EXISTS PAYMENT_CANCEL_DETAIL;
DROP TABLE IF EXISTS PAYMENT;
DROP TABLE IF EXISTS ACCOUNT;
DROP TABLE IF EXISTS MANNER;
DROP TABLE IF EXISTS NOTIFICATION;
DROP TABLE IF EXISTS REPLY_COMMENT;
DROP TABLE IF EXISTS COMMENT;
DROP TABLE IF EXISTS COMMUNITY;
DROP TABLE IF EXISTS CHAT_MESSAGE;
DROP TABLE IF EXISTS CHATROOM;
DROP TABLE IF EXISTS REQUEST_SUCCESS;
DROP TABLE IF EXISTS MARKET_PURCHASE_REQUEST;
DROP TABLE IF EXISTS MARKET;
DROP TABLE IF EXISTS SITE_USER;

CREATE TABLE `SITE_USER`
(
    `ID`           BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `EMAIL`        VARCHAR(255)  NOT NULL,
    `PASSWORD`     VARCHAR(50)   NOT NULL,
    `NAME`         VARCHAR(50)   NOT NULL,
    `NICKNAME`     VARCHAR(50)   NOT NULL,
    `PHONE_NUMBER` VARCHAR(50)   NOT NULL,
    `ADDRESS`      VARCHAR(50)   NOT NULL,
    `MY_LOCATION`  POINT         NOT NULL,
    `MANNER_SCORE` INT           NOT NULL DEFAULT 0,
    `PROFILE_IMG`  VARCHAR(1023) NULL,
    `STATUS`       BOOLEAN       NOT NULL DEFAULT TRUE,
    `AUTH_TYPE`    VARCHAR(50)   NOT NULL DEFAULT 'GENERAL' COMMENT 'GENERAL, KAKAO, GOOGLE',
    `CREATED_AT`   TIMESTAMP     NOT NULL,
    `UPDATED_AT`   TIMESTAMP     NULL
);

CREATE TABLE `MARKET`
(
    `ID`             BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ID_NUM`         INT          NOT NULL,
    `MARKET_NAME`    VARCHAR(255) NOT NULL,
    `MARKET_TYPE`    INT          NOT NULL,
    `ROAD_ADDRESS`   VARCHAR(255) NOT NULL,
    `STREET_ADDRESS` VARCHAR(255) NOT NULL,
    `LOCATION`       POINT        NOT NULL
);

CREATE TABLE `MARKET_PURCHASE_REQUEST`
(
    `ID`              BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`         BIGINT        NOT NULL,
    `MARKET_ID`       BIGINT        NOT NULL,
    `TITLE`           VARCHAR(50)   NOT NULL,
    `CONTENT`         VARCHAR(1023) NOT NULL,
    `POST_IMG`        VARCHAR(1023) NULL,
    `FEE`             INT           NOT NULL,
    `STATUS`          VARCHAR(50)   NOT NULL DEFAULT 'RECRUITING' COMMENT 'RECRUITING, IN_PROGRESS, COMPLETED',
    `MEETUP_TIME`     TIMESTAMP     NOT NULL,
    `MEETUP_DATE`     TIMESTAMP     NOT NULL,
    `MEETUP_ADDRESS`  VARCHAR(255)  NOT NULL,
    `MEETUP_LOCATION` POINT         NOT NULL,
    `CREATED_AT`      TIMESTAMP     NOT NULL,
    `UPDATED_AT`      TIMESTAMP     NULL
);

CREATE TABLE `REQUEST_SUCCESS`
(
    `ID`           BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `REQUEST_ID`   BIGINT    NOT NULL,
    `SITE_USER_ID` BIGINT    NOT NULL,
    `CREATED_AT`   TIMESTAMP NOT NULL
);

CREATE TABLE `CHATROOM`
(
    `ID`           BIGINT    NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `REQUEST_ID`   BIGINT    NOT NULL,
    `REQUESTER_ID` BIGINT    NOT NULL,
    `AGENT_ID`     BIGINT    NOT NULL,
    `CREATED_AT`   TIMESTAMP NOT NULL
);

CREATE TABLE `CHAT_MESSAGE`
(
    `ID`         BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ROOM_ID`    BIGINT        NOT NULL,
    `SENDER_ID`  BIGINT        NOT NULL,
    `CONTENT`    VARCHAR(1023) NOT NULL,
    `CREATED_AT` TIMESTAMP     NOT NULL
);

CREATE TABLE `COMMUNITY`
(
    `ID`         BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`    BIGINT        NOT NULL,
    `AREA`       VARCHAR(255)  NOT NULL,
    `TITLE`      VARCHAR(50)   NOT NULL,
    `CONTENT`    VARCHAR(1023) NOT NULL,
    `POST_IMG`   VARCHAR(1023) NULL,
    `CREATED_AT` TIMESTAMP     NOT NULL,
    `UPDATED_AT` TIMESTAMP     NULL
);

CREATE TABLE `COMMENT`
(
    `ID`         BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`    BIGINT        NOT NULL,
    `POST_ID`    BIGINT        NOT NULL,
    `CONTENT`    VARCHAR(1023) NOT NULL,
    `STATUS`     VARCHAR(50)   NOT NULL DEFAULT 'POST' COMMENT 'POST, MODIFY, DELETE',
    `CREATED_AT` TIMESTAMP     NOT NULL,
    `UPDATED_AT` TIMESTAMP     NULL
);

CREATE TABLE `REPLY_COMMENT`
(
    `ID`         BIGINT        NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`    BIGINT        NOT NULL,
    `COMMENT_ID` BIGINT        NOT NULL,
    `CONTENT`    VARCHAR(1023) NOT NULL,
    `STATUS`     VARCHAR(50)   NOT NULL DEFAULT 'POST' COMMENT 'POST, MODIFY, DELETE',
    `CREATED_AT` TIMESTAMP     NOT NULL,
    `UPDATED_AT` TIMESTAMP     NULL
);

CREATE TABLE `NOTIFICATION`
(
    `ID`              BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`         BIGINT       NOT NULL,
    `IS_READ`         INT          NOT NULL DEFAULT 0,
    `ALARM_PAGE_PATH` VARCHAR(255) NULL,
    `ALARM_TYPE`      VARCHAR(50)  NOT NULL
);

CREATE TABLE `MANNER`
(
    `ID`           BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `REQUESTER_ID` BIGINT      NOT NULL,
    `AGENT_ID`     BIGINT      NOT NULL,
    `RATE`         VARCHAR(50) NOT NULL COMMENT 'GOOD, NORMAL, BAD',
    `CREATED_AT`   TIMESTAMP   NOT NULL,
    `UPDATED_AT`   TIMESTAMP   NULL
);

CREATE TABLE `ACCOUNT`
(
    `ID`             BIGINT      NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `USER_ID`        BIGINT      NOT NULL,
    `BANK`           VARCHAR(50) NOT NULL,
    `ACCOUNT_NUMBER` VARCHAR(50) NOT NULL,
    `HOLDER`         VARCHAR(50) NOT NULL
);

CREATE TABLE `PAYMENT`
(
    `ID`                  BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ORDER_ID`            BIGINT       NOT NULL,
    `IMP_UID`             VARCHAR(255) NOT NULL,
    `PAYMENT_METHOD`      VARCHAR(255) NULL,
    `APPLY_NUM`           VARCHAR(255) NULL,
    `BANK_CODE`           VARCHAR(255) NULL,
    `BANK_NAME`           VARCHAR(255) NULL,
    `CARD_CODE`           VARCHAR(255) NOT NULL,
    `CARD_NAME`           VARCHAR(255) NULL,
    `CARD_NUMBER`         VARCHAR(255) NULL,
    `CARD_QUOTE`          BIGINT       NULL,
    `NAME`                VARCHAR(255) NULL,
    `AMOUNT`              BIGINT       NOT NULL,
    `BUYER_NAME`          VARCHAR(255) NULL,
    `BUYER_EMAIL`         VARCHAR(255) NULL,
    `BUYER_TEL`           VARCHAR(255) NULL,
    `STATUS`              VARCHAR(255) NOT NULL,
    `STARTED_AT`          TIMESTAMP    NULL,
    `PAID_AT`             TIMESTAMP    NULL,
    `FAILED_AT`           TIMESTAMP    NULL,
    `FAIL_REASON`         VARCHAR(255) NULL,
    `RECEIPT_URL`         VARCHAR(255) NULL,
    `CASH_RECEIPT_ISSUED` BOOLEAN      NULL,
    `CREATED_AT`          TIMESTAMP    NOT NULL,
    `UPDATED_AT`          TIMESTAMP    NULL,
    `BUYER_ADDR`          BIGINT       NOT NULL
);

CREATE TABLE `PAYMENT_CANCEL_DETAIL`
(
    `ID`          BIGINT       NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `PAYMENT_ID`  BIGINT       NOT NULL,
    `PG_TID`      BIGINT       NOT NULL,
    `AMOUNT`      BIGINT       NOT NULL,
    `CANCELED_AT` TIMESTAMP    NOT NULL,
    `REASON`      VARCHAR(255) NOT NULL,
    `RECEIPT_URL` VARCHAR(255) NULL
);

ALTER TABLE
    `CHATROOM`
    ADD CONSTRAINT `chatroom_requester_id_foreign`
        FOREIGN KEY (`REQUESTER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `REPLY_COMMENT`
    ADD CONSTRAINT `reply_comment_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `MARKET_PURCHASE_REQUEST`
    ADD CONSTRAINT `market_purchase_request_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `COMMUNITY`
    ADD CONSTRAINT `community_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `COMMENT`
    ADD CONSTRAINT `comment_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `CHAT_MESSAGE`
    ADD CONSTRAINT `chat_message_sender_id_foreign`
        FOREIGN KEY (`SENDER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `MANNER`
    ADD CONSTRAINT `manner_agent_id_foreign`
        FOREIGN KEY (`AGENT_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `CHATROOM`
    ADD CONSTRAINT `chatroom_agent_id_foreign`
        FOREIGN KEY (`AGENT_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `ACCOUNT`
    ADD CONSTRAINT `account_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `MANNER`
    ADD CONSTRAINT `manner_requester_id_foreign`
        FOREIGN KEY (`REQUESTER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `REQUEST_SUCCESS`
    ADD CONSTRAINT `request_success_site_user_id_foreign`
        FOREIGN KEY (`SITE_USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `NOTIFICATION`
    ADD CONSTRAINT `notification_user_id_foreign`
        FOREIGN KEY (`USER_ID`) REFERENCES `SITE_USER` (`ID`);

ALTER TABLE
    `PAYMENT`
    ADD CONSTRAINT `payment_order_id_foreign`
        FOREIGN KEY (`ORDER_ID`) REFERENCES `MARKET_PURCHASE_REQUEST` (`ID`);

ALTER TABLE
    `CHATROOM`
    ADD CONSTRAINT `chatroom_request_id_foreign`
        FOREIGN KEY (`REQUEST_ID`) REFERENCES `MARKET_PURCHASE_REQUEST` (`ID`);

ALTER TABLE
    `REQUEST_SUCCESS`
    ADD CONSTRAINT `request_success_request_id_foreign`
        FOREIGN KEY (`REQUEST_ID`) REFERENCES `MARKET_PURCHASE_REQUEST` (`ID`);

ALTER TABLE
    `REPLY_COMMENT`
    ADD CONSTRAINT `reply_comment_comment_id_foreign`
        FOREIGN KEY (`COMMENT_ID`) REFERENCES `COMMENT` (`ID`);

ALTER TABLE
    `PAYMENT_CANCEL_DETAIL`
    ADD CONSTRAINT `payment_cancel_detail_payment_id_foreign`
        FOREIGN KEY (`PAYMENT_ID`) REFERENCES `PAYMENT` (`ID`);

ALTER TABLE
    `CHAT_MESSAGE`
    ADD CONSTRAINT `chat_message_room_id_foreign`
        FOREIGN KEY (`ROOM_ID`) REFERENCES `CHATROOM` (`ID`);

ALTER TABLE
    `COMMENT`
    ADD CONSTRAINT `comment_post_id_foreign`
        FOREIGN KEY (`POST_ID`) REFERENCES `COMMUNITY` (`ID`);

ALTER TABLE
    `MARKET_PURCHASE_REQUEST`
    ADD CONSTRAINT `market_purchase_request_market_id_foreign`
        FOREIGN KEY (`MARKET_ID`) REFERENCES `MARKET` (`ID`);



-- commit --