ALTER TABLE financial_instrument
ADD FOREIGN KEY (type_code) REFERENCES fi_type(fi_type_code);

ALTER TABLE stock
ADD FOREIGN KEY (fi_id) REFERENCES financial_instrument(fi_id);

ALTER TABLE `option`
ADD FOREIGN KEY (fi_id) REFERENCES financial_instrument(fi_id);
ALTER TABLE `option`
ADD FOREIGN KEY (underlying_stock) REFERENCES stock(fi_id);
ALTER TABLE `option`
ADD FOREIGN KEY (style_code) REFERENCES option_style(option_style_code);

ALTER TABLE trade
ADD FOREIGN KEY (emp_id) REFERENCES trader(emp_id);
ALTER TABLE trade
ADD FOREIGN KEY (fi_id) REFERENCES financial_instrument(fi_id);
ALTER TABLE trade
ADD FOREIGN KEY (counterparty_id) REFERENCES counterparty(counterparty_id);

-- Additional INDEX creation
CREATE INDEX option_underlying_index
ON `option` (underlying_stock);

CREATE INDEX trade_emp_id_index
ON trade (emp_id);

CREATE INDEX trade_fi_id_index
ON trade (fi_id);

CREATE INDEX trade_counterparty_id_index
ON trade (counterparty_id);

CREATE INDEX stock_ticker_index
ON stock (ticker);