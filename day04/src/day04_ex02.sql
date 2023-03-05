CREATE VIEW v_generated_dates AS
    SELECT date(generated_dates)
    FROM generate_series(date '2022-01-01', date '2022-01-31', '1 day') AS generated_date;