CREATE DATABASE eshop;

USE eshop;

ALTER DATABASE eshop
    DEFAULT CHARACTER SET utf8 COLLATE utf8_vietnamese_ci;

CREATE TABLE products (
                          id int AUTO_INCREMENT,
                          sku varchar(12) NOT NULL UNIQUE,
                          name varchar(100) NOT NULL,
                          description varchar(200),
                          price int,
                          stock int,
                          product_type_id int,
                          image varchar(255),
                          status boolean DEFAULT 1 NOT NULL,
                          PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE product_types (
                               id int AUTO_INCREMENT,
                               name varchar(100) NOT NULL,
                               status boolean DEFAULT 1 NOT NULL,
                               PRIMARY KEY (Id)
) ENGINE = INNODB;

CREATE TABLE accounts (
                          id int AUTO_INCREMENT,
                          username varchar(30) NOT NULL UNIQUE,
                          password varchar(30) NOT NULL,
                          email varchar(100),
                          phone varchar(20),
                          address varchar(255),
                          full_name varchar(100),
                          is_admin boolean DEFAULT 0 NOT NULL,
                          avatar varchar(255),
                          status boolean DEFAULT 1 NOT NULL,
                          PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE carts (
                       id int AUTO_INCREMENT,
                       account_id int,
                       product_id int,
                       quantity int DEFAULT 1 NOT NULL,
                       PRIMARY KEY (Id),
                       CONSTRAINT UC_carts UNIQUE (account_id, product_id)
) ENGINE = INNODB;

CREATE TABLE invoices (
                          id int AUTO_INCREMENT,
                          code varchar(12) NOT NULL UNIQUE,
                          account_id int NOT NULL,
                          issued_date datetime NOT NULL,
                          shipping_address varchar(255),
                          shipping_phone varchar(20),
                          total int DEFAULT 0 NOT NULL,
                          status boolean DEFAULT 1 NOT NULL,
                          PRIMARY KEY (id)
) ENGINE = INNODB;

CREATE TABLE invoice_details (
                                 id int AUTO_INCREMENT,
                                 invoice_id int NOT NULL,
                                 product_id int NOT NULL,
                                 quantity int,
                                 unit_price int,
                                 PRIMARY KEY (id),
                                 CONSTRAINT UC_invoice_details UNIQUE (invoice_id, product_id)
) ENGINE = INNODB;

ALTER TABLE products
    ADD FOREIGN KEY (product_type_id) REFERENCES product_types(id);

ALTER TABLE carts
    ADD FOREIGN KEY (product_id) REFERENCES products(id);

ALTER TABLE carts
    ADD FOREIGN KEY (account_id) REFERENCES accounts(id);

ALTER TABLE invoices
    ADD FOREIGN KEY (account_id) REFERENCES accounts(id);

ALTER TABLE invoice_details
    ADD FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE invoice_details
    ADD FOREIGN KEY (product_id) REFERENCES products(id);

INSERT INTO accounts (username, password, email, phone, address, full_name, is_admin, avatar, status) VALUES ('admin', 'admin', 'admin@Eshop.com', '01234567890', 'Tp.Hồ Chí Minh', 'Nguyễn Văn Ad Min', 1, 'admin.jpg', 1);
INSERT INTO accounts (username, password, email, phone, address, full_name, is_admin, avatar, status) VALUES ('john', '123456', 'john@gmail.com', '0905486957', 'Đà Nẵng', 'John Henry', 0, 'john.jpg', 1);
INSERT INTO accounts (username, password, email, phone, address, full_name, is_admin, avatar, status) VALUES ('dhphuoc', '123456', 'dhphuoc@gmail.com', '0904863125', 'Tp.Hồ Chí Minh', 'Dương Hữu Phước', 0, 'dhphuoc.jpg', 1);
INSERT INTO accounts (username, password, email, phone, address, full_name, is_admin, avatar, status) VALUES ('longvic', '123456', 'longvic@gmail.com', '0459123845', 'Nha Trang', 'Long Vic', 0, 'longvic.jpg', 1);
INSERT INTO accounts (username, password, email, phone, address, full_name, is_admin, avatar, status) VALUES ('customer', '123456', 'customer@gmail.com', '0987654321', 'Huế', 'Trần Thị B', 0, 'customer.jpg', 1);

INSERT INTO product_types(name, status) VALUES ('Sách giáo khoa', 1);
INSERT INTO product_types(name, status) VALUES ('Sách tham khảo', 1);
INSERT INTO product_types(name, status) VALUES ('Sách nước ngoài', 1);
INSERT INTO product_types(name, status) VALUES ('Báo & Tạp chí', 1);
INSERT INTO product_types(name, status) VALUES ('Tiểu thuyết & Tự truyện', 1);
INSERT INTO product_types(name, status) VALUES ('Khác', 1);

INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('WT3WPGZ9BTWB', 'Tuổi trẻ đáng giá bao nhiêu', 'Rosie Nguyễn', 45000, 40, 5, '1.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('98IOWWXWYVQ4', 'Bứt phá điểm thi THPT Quốc gia môn Hóa học', 'Nguyễn Đức Dũng', 51000, 15, 2, '2.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('21RH48HRFXX8', 'Khéo ăn khéo nói sẽ có được thiên hạ', 'Trác Nhã', 59000, 29, 6, '3.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('QOXYSDE605P5', 'Nhà giả kim', 'Paulo Coelho', 53000, 1, 3, '4.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('6YI6TZ3JPO1L', 'Để yên cho bác sĩ "Hiền"', 'BS. Ngô Đức Hùng', 52000, 36, 4, '5.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('YHB5JTSVRF8E', 'Mình là cá, việc của mình là bơi ', 'Takeshi Furukawa', 57000, 9, 3, '6.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('LXL64LZAR5M2', 'Đời ngắn đừng ngủ dài', 'Robin Sharma', 42000, 7, 3, '7.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('C5V645HVP91W', 'Bứt phá điểm thi THPT Quốc gia môn Toán', 'ThS. Đỗ Đường Hiếu', 51000, 0, 2, '8.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('4KLYT2UF7VB9', 'Cà phê cùng Tony ', 'Tony Buổi Sáng', 62000, 18, 6, '9.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('KBD67VI81M80', 'Em sẽ đến cùng cơn mưa', 'Ichikawa Takuji', 56000, 64, 5, '10.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('3RISEFVDWYVF', 'Quẳng gánh lo đi mà vui sống', 'Dale Carnegie', 45000, 120, 6, '11.jpg', 1);
INSERT INTO products (sku, name, description, price, stock, product_type_id, image, status) VALUES ('VIAZXR3Y24IY', 'Mình nói gì khi nói về hạnh phúc?', 'Rosie Nguyễn', 36000, 46, 5, '12.jpg', 1);

INSERT INTO carts (account_id, product_id, quantity) VALUES (1, 1, 2);
INSERT INTO carts (account_id, product_id, quantity) VALUES (2, 1, 4);
INSERT INTO carts (account_id, product_id, quantity) VALUES (5, 2, 2);
INSERT INTO carts (account_id, product_id, quantity) VALUES (5, 6, 1);
INSERT INTO carts (account_id, product_id, quantity) VALUES (5, 9, 3);
INSERT INTO carts (account_id, product_id, quantity) VALUES (5, 12, 5);
INSERT INTO carts (account_id, product_id, quantity) VALUES (2, 5, 7);
INSERT INTO carts (account_id, product_id, quantity) VALUES (2, 10, 2);
INSERT INTO carts (account_id, product_id, quantity) VALUES (2, 11, 4);
INSERT INTO carts (account_id, product_id, quantity) VALUES (4, 2, 1);
INSERT INTO carts (account_id, product_id, quantity) VALUES (4, 3, 1);
INSERT INTO carts (account_id, product_id, quantity) VALUES (4, 7, 2);

INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('299541176755', 5, '2020-01-15 15:06:12', 'Quận 3, Tp.HCM', '0987654321', 618000, 1);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('527777447269', 2, '2020-01-16 10:30:19', 'Quận 1, Tp.HCM', '0983564782', 167000, 1);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('228448970415', 2, '2020-01-18 18:02:07', 'Quận 5, Tp.HCM', '0983564782', 570000, 1);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('827349270900', 2, '2020-01-20 20:35:53', 'Quận 1, Tp.HCM', '0983564782', 480000, 0);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('127745305853', 3, '2020-01-24 08:20:17', 'Quận 7, Tp.HCM', '0905785346', 829000, 1);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('074407650817', 4, '2020-01-24 09:00:52', 'Nha Trang', '0459123845', 478000, 0);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('611108375524', 3, '2020-01-28 14:20:54', 'Quận 7, Tp.HCM', '0905785346', 642000, 1);
INSERT INTO invoices (code, account_id, issued_date, shipping_address, shipping_phone, total, status) VALUES ('178291648473', 4, '2020-01-24 18:29:07', 'Nha Trang', '0459123845', 327000, 1);

INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (1, 1, 2, 45000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (1, 3, 5, 59000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (1, 4, 1, 53000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (1, 9, 3, 60000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (2, 7, 1, 40000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (2, 8, 1, 55000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (2, 12, 2, 36000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (3, 6, 10, 57000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (4, 10, 4, 50000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (4, 11, 7, 40000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (5, 2, 4, 50000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (5, 3, 3, 59000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (5, 7, 6, 57000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (5, 10, 2, 55000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (6, 5, 7, 52000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (6, 6, 2, 57000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (7, 6, 2, 36000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (7, 12, 10, 57000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (8, 4, 1, 53000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (8, 9, 3, 60000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (8, 10, 1, 56000);
INSERT INTO invoice_details (invoice_id, product_id, quantity, unit_price) VALUES (8, 12, 1, 38000);