CREATE TABLE "user" (
    id bigint primary key,
    name varchar,
    lastname varchar
);

INSERT INTO "user" VALUES (1, 'Иван', 'Иванов');
INSERT INTO "user" VALUES (2, 'Петр', NULL);
INSERT INTO "user" VALUES (3, NULL, 'Сидоров');

CREATE TABLE currency (
    id bigint NOT NULL,
    name varchar NOT NULL,
    rate_to_usd numeric,
    updated timestamp
);

INSERT INTO currency VALUES (100, 'EUR', 0.9, '2022-03-03 13:31');
INSERT INTO currency VALUES (100, 'EUR', 0.89, '2022-03-02 12:31');
INSERT INTO currency VALUES (100, 'EUR', 0.87, '2022-03-02 08:00');
INSERT INTO currency VALUES (100, 'EUR', 0.9, '2022-03-01 15:36');
INSERT INTO currency VALUES (200, 'USD', 1, '2022-03-03 13:31');
INSERT INTO currency VALUES (200, 'USD', 1, '2022-03-02 12:31');
INSERT INTO currency VALUES (300, 'JPY', 0.0087, '2022-03-03 13:31');
INSERT INTO currency VALUES (300, 'JPY', 0.0079, '2022-03-01 13:31');

CREATE TABLE balance (
    user_id bigint,
    money numeric,
    type integer,
    currency_id integer,
    updated timestamp
);

INSERT INTO balance VALUES (4, 120, 1, 200, '2022-01-01 01:31');
INSERT INTO balance VALUES (4, 120, 0, 300, '2022-01-01 01:31');
INSERT INTO balance VALUES (1, 20, 1, 100, '2022-01-01 13:31');
INSERT INTO balance VALUES (1, 200, 1, 100, '2022-01-09 13:31');
INSERT INTO balance VALUES (1, 190, 1, 100, '2022-01-10 13:31');
INSERT INTO balance VALUES (2, 100, 2, 210, '2022-01-09 13:31');
INSERT INTO balance VALUES (2, 103, 2, 210, '2022-01-10 13:31');
INSERT INTO balance VALUES (3, 50, 0, 100, '2022-01-09 13:31');
INSERT INTO balance VALUES (3, 500, 1, 200, '2022-01-09 13:31');
INSERT INTO balance VALUES (3, 500, 2, 300, '2022-01-09 13:31');