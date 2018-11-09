DROP TABLE IF EXISTS gifts;
DROP TABLE IF EXISTS antiques;
DROP TABLE IF EXISTS wholesalers;
DROP TABLE IF EXISTS auctions;


CREATE TABLE wholesalers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  logo_url TEXT
);

CREATE TABLE gifts(
  id SERIAL8 PRIMARY KEY,
  name TEXT,
  description VARCHAR(255),
  type VARCHAR(255),
  wholesaler_id INT8 REFERENCES wholesalers(id) ON DELETE CASCADE,
  purchase_price MONEY,
  sale_price MONEY,
  quantity INT4,
  image_url TEXT
);

CREATE TABLE auctions(
  id SERIAL8 PRIMARY KEY,
  venue VARCHAR(255),
  collected_on DATE
);

CREATE TABLE antiques(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description TEXT,
  type VARCHAR(255),
  auction_id INT8 REFERENCES auctions(id) ON DELETE CASCADE,
  purchase_price MONEY,
  sale_price MONEY,
  image_url TEXT
);
