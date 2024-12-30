-- aggregator.sql

-- Установить расширение postgres_fdw
CREATE EXTENSION IF NOT EXISTS postgres_fdw;

-- Подключение к шарду 1 (пользователи)
CREATE SERVER shard1_users_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host '172.17.0.1', port '5432', dbname 'shard1_db');

CREATE USER MAPPING FOR aggregator_user
  SERVER shard1_users_server
  OPTIONS (user 'shard1_user', password 'pass1');

IMPORT FOREIGN SCHEMA public
  FROM SERVER shard1_users_server
  INTO public;

-- Подключение к шарду 2 (книги)
CREATE SERVER shard2_books_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host '172.17.0.1', port '5433', dbname 'shard2_db');

CREATE USER MAPPING FOR aggregator_user
  SERVER shard2_books_server
  OPTIONS (user 'shard2_user', password 'pass2');

IMPORT FOREIGN SCHEMA public
  FROM SERVER shard2_books_server
  INTO public;

-- Подключение к шарду 3 (магазины)
CREATE SERVER shard3_stores_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host '172.17.0.1', port '5434', dbname 'shard3_db');

CREATE USER MAPPING FOR aggregator_user
  SERVER shard3_stores_server
  OPTIONS (user 'shard3_user', password 'pass3');

IMPORT FOREIGN SCHEMA public
  FROM SERVER shard3_stores_server
  INTO public;

-- Подключение к шарду 4 (пароли)
CREATE SERVER shard4_credentials_server
  FOREIGN DATA WRAPPER postgres_fdw
  OPTIONS (host '172.17.0.1', port '5435', dbname 'shard4_db');

CREATE USER MAPPING FOR aggregator_user
  SERVER shard4_credentials_server
  OPTIONS (user 'shard4_user', password 'pass4');

IMPORT FOREIGN SCHEMA public
  FROM SERVER shard4_credentials_server
  INTO public;

-- Создание представлений для объединения данных
CREATE VIEW all_users AS
SELECT * FROM users;

CREATE VIEW all_books AS
SELECT * FROM books;

CREATE VIEW all_stores AS
SELECT * FROM stores;

CREATE VIEW all_credentials AS
SELECT * FROM user_credentials;
