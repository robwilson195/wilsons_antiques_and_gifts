DROP TABLE IF EXISTS gifts;
DROP TABLE IF EXISTS antiques;
DROP TABLE IF EXISTS wholesalers;
DROP TABLE IF EXISTS auctions;


CREATE TABLE wholesalers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  contact_number INT8,
  logo_url TEXT
);

CREATE TABLE gifts(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  type VARCHAR(255),
  wholesaler_id INT8 REFERENCES wholesalers(id) ON DELETE CASCADE,
  purchase_price NUMERIC,
  sale_price NUMERIC,
  quantity INT4,
  image_url TEXT
);

CREATE TABLE auctions(
  id SERIAL8 PRIMARY KEY,
  venue VARCHAR(255),
  collection_date DATE
);

CREATE TABLE antiques(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  type VARCHAR(255),
  auction_id INT8 REFERENCES auctions(id) ON DELETE CASCADE,
  purchase_price NUMERIC,
  sale_price NUMERIC,
  image_url TEXT
);
