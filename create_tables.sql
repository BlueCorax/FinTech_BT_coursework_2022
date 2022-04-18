-- drop existing tables. Danger: dataloss if skript run after tables are filled
-- DROP TABLE IF EXISTS trade;
-- DROP TABLE IF EXISTS allowed_fi;
-- DROP TABLE IF EXISTS `option`;
-- DROP TABLE IF EXISTS stock;
-- DROP TABLE IF EXISTS financial_instrument;
-- DROP TABLE IF EXISTS counterparty;
-- DROP TABLE IF EXISTS trader;
-- DROP TABLE IF EXISTS option_style;
-- DROP TABLE IF EXISTS fi_type;


-- Set encoding to allow special characters in nicknames and other freetext fields
ALTER DATABASE UW1844524
CHARACTER SET utf8
COLLATE utf8_unicode_ci;

CREATE TABLE trader (
	emp_id CHAR(8),
    nickname VARCHAR(100) NOT NULL,
    PRIMARY KEY (emp_id)
);

CREATE TABLE option_style (
	option_style_code INT,
    mnemonic VARCHAR(100) NOT NULL,
    PRIMARY KEY (option_style_code)
);


CREATE TABLE fi_type (
	fi_type_code INT,
    mnemonic VARCHAR(100) NOT NULL,
    PRIMARY KEY (fi_type_code)
);

CREATE TABLE counterparty (
	counterparty_id CHAR(36),
	cp_type CHAR(10) NOT NULL,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (counterparty_id)
);

CREATE TABLE financial_instrument (
	fi_id CHAR(36),
    type_code INT NOT NULL,
	current_value DECIMAL(16,4) NOT NULL,
	currency_iso CHAR(3) NOT NULL,
	exchange VARCHAR(100) NOT NULL,
    PRIMARY KEY (fi_id)
);

CREATE TABLE stock (
	fi_id CHAR(36),
	name VARCHAR(100) NOT NULL,
    ticker CHAR(20) NOT NULL,
    PRIMARY KEY (fi_id)
);

CREATE TABLE `option` (
	fi_id CHAR(36),
    underlying_stock CHAR(36) NOT NULL,
	option_type CHAR(1) NOT NULL,
	style_code INT NOT NULL,
	strike_price DECIMAL(16,4) NOT NULL,
	maturity TIMESTAMP NOT NULL,
    PRIMARY KEY (fi_id)
);

CREATE TABLE trade (
	trade_id CHAR(36),
	emp_id CHAR(8) NOT NULL,
	fi_id CHAR(36) NOT NULL,
	counterparty_id CHAR(36) NOT NULL,
    trade_dt DATETIME NOT NULL,
	`action` CHAR(1) NOT NULL,
	quantity DECIMAL(16) NOT NULL,
	leverage DECIMAL(16,4) NOT NULL,
	price DECIMAL(16,4) NOT NULL,
	currency_iso CHAR(3) NOT NULL,
	margin DECIMAL(16,4) NOT NULL,
	fees DECIMAL(16,4) NOT NULL,
	insert_dt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	amended_dt DATETIME,
    PRIMARY KEY (trade_id)
);
