create database FoodDeliveryDB


CREATE TABLE users (
  user_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  phone VARCHAR(15) NOT NULL,
  password VARCHAR(100) NOT NULL,
);


CREATE TABLE restaurants (
  restaurant_id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE NOT NULL,
  phone VARCHAR(15) NOT NULL,
  address VARCHAR(100) NOT NULL,
);

CREATE TABLE menu_items (
  item_id INT PRIMARY KEY,
  restaurant_id INT NOT NULL,
  dish VARCHAR(50) NOT NULL,
  price DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);

CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  restaurant_id INT NOT NULL,
  total DECIMAL(8,2) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);


CREATE TABLE feedback (
  feedback_id INT PRIMARY KEY,
  user_id INT NOT NULL,
  restaurant_id INT NOT NULL,
  rating INT NOT NULL,
  comment VARCHAR(100) NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (restaurant_id) REFERENCES restaurants (restaurant_id)
);





