
CREATE TABLE IF NOT EXIST "users" (
  "UserAccountID" SERIAL PRIMARY KEY,
  "Username" varchar(255) NOT NULL,
  "Password" varchar(255) NOT NULL,
  "CustomerID" integer,
  "enabled" smallint DEFAULT '1',
  CONSTRAINT "unique_username" UNIQUE ("Username")
);
INSERT INTO "users" ("Username", "Password", "CustomerID", "enabled") VALUES
('john.doe@example.com', '$2a$10$JXoEVcNopNsKHCBa2KGQgOKr0onI9HL3DM3tCHWT1KsPSUqQo2eKC', 1, 1),
('admin', '$2a$10$FRni.zsYYsAUmnShyksucOpl5KKiy6qAcaCaoEYE7Cz.yePhnVMpu', NULL, 1),
('lov3u4ev3r97@gmail.com', '$2a$10$dbPJE6iB9w82vZnldAVSduGp8KuOSzNhBzVXMlm5oPrOCGW4pjXmi', 4, 1),
('Hungnguyen@gmail.com', '$2a$10$9zsV0xjgQQ37eiLhD2pA3ufwXjcvMxZJQyYRpzUNjrcKjzY1plXSK', 17, 1),
('test@gmail.com', '$2a$10$XFjPrrVtZ330VxyfTUpTfuZ8ocuzhqgiWwh0EPvfE9k40xCamjgUC', 18, 1),
('jane.smith@example.com', '$2a$10$mQITU3/WVnuy6RwA5J8GS.HWvE9539Wv.fDfM3yw.D5xNzQXHbJru', 2, 1),
('bob.johnson@example.com', '$2a$10$mQITU3/WVnuy6RwA5J8GS.HWvE9539Wv.fDfM3yw.D5xNzQXHbJru', 3, 1),
('lovenevertolate97@gmail.com', '$2a$10$6DVR1O2I2m0us6zAi8KM6ODnDB4ClMTH7zgTjNqJEmeg1Vu3fRGCS', 5, 1),
('HoangNam@gmail.com', '$2a$10$DtsWOgQmWvx/RwysYRvhqus/VFufFVglIOWpDoY2tgeY3o8bZMq1W', 6, 1),
('emily.williams@example.com', '$2a$10$QCBbTRzMaLWZRQpJTbaoeeItXA.QlWk6UaYsuQSBSWPS0XHgwJ1rO', 2, 1),
('michael.johnson@example.com', '$2a$10$ZKqP86Vk2RFIWvbJlPmgbOYnOAcOLxLLVQ1yOw5sOVh5E0z4MOmla', 1, 1),
('david.smith@example.com', '$2a$10$0lg2.W.gcwIw9LevQ5tSyefPbA4YCEpm.yzv36gTVORzir99TwFdu', 3, 1),
('theanhnguyen@gmail.com', '$2a$10$QOyjiKDgVCGuGMJ47f4/M.h3JswTGolynjlkUnACo5dkrJ5cyoCbC', 19, 1),
('huynhnguyen@gmail.com', '$2a$10$eosLA/PgOYh757s6ZP37buTwuj8YXGwgHCqIew9bEZFRRdZOOt6KG', 8, 1),
('NgiemHoangTuan@example.com', '$2a$10$YPNX9lSE8Zp/kCWb/IsyEeWfJx.4LT45ngT3UGjDEdQfS8/U5Nj22', 4, 1),
('Nguyennam1999@gmail.com', '$2a$10$7UyhDKyqtJQrBUsG5BouneVbqYSTY0DU.9ns//hRGaRMQj0vgwDGi', 20, 1),
('vuthuy270896@gmail.com', '$2a$10$7lAfr0AMmYjXo/P5aAdcEeXXOiRBV3zpMb5zsARdfkfB5k8ZFS9qG', 22, 1);

CREATE TABLE IF NOT EXIST "authorities" (
  "id" serial PRIMARY KEY,
  "username" varchar(50) NOT NULL,
  "authority" varchar(50) NOT NULL,
  CONSTRAINT "fk_authorities_users" FOREIGN KEY ("username") REFERENCES "users" ("Username")
);

INSERT INTO "authorities" ("username", "authority") VALUES
('admin', 'ROLE_ADMIN'),
('john.doe@example.com', 'ROLE_CUSTOMER'),
('lov3u4ev3r97@gmail.com', 'ROLE_CUSTOMER'),
('Hungnguyen@gmail.com', 'ROLE_CUSTOMER'),
('test@gmail.com', 'ROLE_CUSTOMER'),
('jane.smith@example.com', 'ROLE_CUSTOMER'),
('bob.johnson@example.com', 'ROLE_CUSTOMER'),
('lovenevertolate97@gmail.com', 'ROLE_CUSTOMER'),
('HoangNam@gmail.com', 'ROLE_CUSTOMER'),
('emily.williams@example.com', 'ROLE_EMPLOYEE'),
('michael.johnson@example.com', 'ROLE_EMPLOYEE'),
('david.smith@example.com', 'ROLE_EMPLOYEE'),
('theanhnguyen@gmail.com', 'ROLE_CUSTOMER'),
('huynhnguyen@gmail.com', 'ROLE_EMPLOYEE'),
('NgiemHoangTuan@example.com', 'ROLE_EMPLOYEE'),
('Nguyennam1999@gmail.com', 'ROLE_CUSTOMER'),
('vuthuy270896@gmail.com', 'ROLE_CUSTOMER');


-- Table structure for table `brands`

CREATE TABLE IF NOT EXIST "brands" (
  "BrandID" serial PRIMARY KEY,
  "BrandName" varchar(255) NOT NULL
);

INSERT INTO "brands" ("BrandID", "BrandName") VALUES
(1, 'Samsung'),
(2, 'Apple'),
(3, 'Huawei'),
(4, 'Google Pixel'),
(5, 'OnePlus'),
(13, 'Nokia');

-- Table structure for table `categories`

CREATE TABLE IF NOT EXIST "categories" (
  "CategoryID" serial PRIMARY KEY,
  "CategoryName" varchar(255) NOT NULL
);

INSERT INTO "categories" ("CategoryID","CategoryName") VALUES
(1, 'Smartphones'),
(2, 'Tablets'),
(3, 'Accessories'),
(4, 'Laptop'),
(6, 'PC');


-- Table structure for table `phones`

CREATE TABLE IF NOT EXIST "phones" (
  "PhoneID" serial PRIMARY KEY,
  "BrandID" int,
  "CategoryID" int,
  "PhoneName" varchar(255),
  "Model" varchar(255),
  "ReleaseYear" int,
  "ScreenSize" numeric(4,2),
  "StorageCapacity" int,
  "RAM" int,
  "OperatingSystem" varchar(50),
  "Price" numeric(10,2),
  "Color" varchar(50),
  "ImageName" varchar(255),
  "quantity" int,
  "seri" varchar(10000),
  CONSTRAINT "FK_Phones_Brands" FOREIGN KEY ("BrandID") REFERENCES "brands" ("BrandID"),
  CONSTRAINT "FK_Phones_Categories" FOREIGN KEY ("CategoryID") REFERENCES "categories" ("CategoryID")
);
INSERT INTO phones ("PhoneID", "BrandID", "CategoryID", "Model", "PhoneName", "ReleaseYear", "ScreenSize", "StorageCapacity", "RAM", "OperatingSystem", "Price", "Color", "ImageName", "quantity", "seri") VALUES
(126, 2, 1, 'iphone 14', 'iphone 14-2022-128-8-Black', 2022, 6.30, 128, 8, 'IOS', 799.00, 'Black', 'iphone 14 black.png', 0, '[]'),
(127, 1, 2, 'Samsung Galaxy S20', 'Samsung Galaxy S20-2020-256-8-Blue', 2020, 6.20, 256, 8, 'Android', 699.00, 'Blue', 'Samsung Galaxy Note 20 Mystic Bronze.png', 1, '[112569965]'),
(128, 3, 1, 'OnePlus 9', 'OnePlus 9-2021-128-8-White', 2021, 6.50, 128, 8, 'Android', 699.00, 'White', 'oneplus 9-white.png', 0, '[]'),
(129, 2, 2, 'iphone 13', 'iphone 13-2021-256-8-Red', 2021, 6.10, 256, 8, 'IOS', 899.00, 'Red', 'iPhone 13.jpg', 4, '[753190628, 410987365, 187654329, 210987654]'),
(130, 1, 1, 'Samsung Galaxy S21', 'Samsung Galaxy S21-2021-128-8-Purple', 2021, 6.40, 128, 8, 'Android', 799.00, 'Purple', 'Samsung Galaxy S21 black.jpg', 0, '[]'),
(131, 3, 1, 'OnePlus Nord', 'OnePlus Nord-2020-128-6-Gray', 2020, 6.40, 128, 6, 'Android', 499.00, 'Gray', 'OnePlus Nord Gray.PNG', 5, '[284619799, 572937801, 329174856, 654728913, 864209799]'),
(132, 2, 3, 'iphone 12', 'iphone 12-2020-64-4-Black\r\n', 2020, 6.10, 64, 4, 'IOS', 699.00, 'Black', 'iphone-12-white.jpg', 3, '[493175628, 871539264, 527346198]'),
(133, 1, 1, 'Samsung Galaxy Note 20', 'Samsung Galaxy Note 20-2020-256-8-Bronze', 2020, 6.70, 256, 8, 'Android', 799.00, 'Bronze', 'Samsung Galaxy Note 20 Mystic Bronze.png', 2, '[157482937, 428671935]'),
(134, 3, 2, 'OnePlus 8T', 'OnePlus 8T-2020-128-8-Silver', 2020, 6.50, 128, 8, 'Android', 599.00, 'Silver', 'Google Pixel 3 black.jpg', 4, '[619753284, 578349162, 293746185, 462891357]'),
(135, 2, 1, 'iphone 11', 'iphone 11-2019-128-4-White', 2019, 6.10, 128, 4, 'IOS', 599.00, 'White', 'se-2016-black.png', 1, '[182736495]'),
(136, 1, 1, 'Samsung Galaxy S10', 'Samsung Galaxy S10-2019-128-8-Green', 2019, 6.10, 128, 8, 'Android', 499.00, 'Green', 'samsung galaxy s10 green.png', 3, '[375281964, 426198735, 987654321]'),
(137, 3, 1, 'OnePlus 7 Pro', 'OnePlus 7 Pro-2019-256-12-Blue', 2019, 6.60, 256, 12, 'Android', 699.00, 'Blue', 'Google Pixel 4 Orange.png', 2, '[193746582, 574839216]'),
(138, 2, 1, 'iphone X', 'iphone X-2018-256-3-Black', 2018, 5.80, 256, 3, 'IOS', 599.00, 'Black', 'iPhone_XR_white.png', 5, '[295836471, 614729835, 571849236, 124637598, 352816479]'),
(139, 1, 1, 'Samsung Galaxy Note 10', 'Samsung Galaxy Note 10-2018-256-8-Silver', 2018, 6.30, 256, 8, 'Android', 699.00, 'Silver', 'rog.png', 2, '[193846572, 485629713]'),
(140, 3, 1, 'OnePlus 6T', 'OnePlus 6T-2018-128-8-Red', 2018, 6.40, 128, 8, 'Android', 499.00, 'Red', 'Google Pixel 5.png', 3, '[627195384, 591384762, 746219538]'),
(141, 2, 1, 'iphone 8', 'iphone 8-2017-64-2-Gray', 2017, 4.70, 64, 2, 'IOS', 399.00, 'Gray', 'se-2016-black.png', 4, '[183749265, 572639184, 628473195, 475923618]'),
(142, 1, 1, 'Samsung Galaxy S9', 'Samsung Galaxy S9-2018-64-4-Blue', 2018, 5.80, 64, 4, 'Android', 399.00, 'Blue', 'Google-Pixel-6-Black_600x.jpg', 3, '[395817264, 496731582, 817246395]'),
(143, 3, 1, 'OnePlus 6', 'OnePlus 6-2018-128-6-Black', 2018, 6.20, 128, 6, 'Android', 499.00, 'Black', 'Huawei M.png', 2, '[618472935, 215847639]'),
(144, 2, 1, 'iphone 7', 'iphone 7-2016-128-2-Silver', 2016, 4.70, 128, 2, 'IOS', 299.00, 'Silver', 'header_iphone_7_plus_black_large_2x.png', 5, '[294857163, 528716394, 187539642, 863951247, 952743816]'),
(145, 1, 1, 'Samsung Galaxy Note 9', 'Samsung Galaxy Note 9-2018-128-6-Blue', 2018, 6.40, 128, 6, 'Android', 599.00, 'Blue', 'Samsung_Galaxy_A52_Blue.png', 3, '[725183946, 915628347, 862741935]'),
(146, 3, 1, 'OnePlus 5T', 'OnePlus 5T-2017-64-6-Red', 2017, 6.00, 64, 6, 'Android', 399.00, 'Red', 'vn-galaxy-s23-ultra.PNG', 2, '[165493728, 485721936]'),
(147, 2, 1, 'iphone 6S', 'iphone 6S-2015-32-2-Gray', 2015, 4.70, 32, 2, 'IOS', 199.00, 'Gray', 'header_iphone_8_silver_small_2x.png', 4, '[285716394, 654729183, 745928163, 429871365]'),
(148, 1, 1, 'Samsung Galaxy S8', 'Samsung Galaxy S8-2017-64-4-Gold', 2017, 5.80, 64, 4, 'Android', 399.00, 'Gold', 'samsung galaxy s10 green.png', 3, '[391872654, 752836941, 648371925]'),
(149, 3, 1, 'OnePlus 5', 'OnePlus 5-2017-64-6-Black', 2017, 5.50, 64, 6, 'Android', 399.00, 'Black', 'rog.png', 2, '[194867253, 837429165]'),
(150, 2, 1, 'iphone 6', 'iphone 6-2014-32-2-Silver', 2014, 4.70, 32, 2, 'IOS', 149.00, 'Silver', '0000600_iphone-se-2022_240.png', 5, '[295847163, 751982634, 819374652, 210398765, 317965824]'),
(151, 3, 1, 'Huawei Note 8', 'Huawei Note 8-2017-64-6-Blue', 2017, 6.30, 64, 6, 'Android', 499.00, 'Blue', 'Huawei M.png', 3, '[193475826, 518297364, 861937245]'),
(152, 3, 1, 'iphone 15 pro', 'iphone 15 pro-2016-64-6-Black', 2016, 5.50, 64, 6, 'IOS', 299.00, 'Black', 'iphone 15 pro 512GB VNA.png', 2, '[794613528, 218946375]'),
(153, 2, 1, 'iphone SE', 'iphone SE-2016-32-2-Rose Gold', 2016, 4.00, 32, 2, 'IOS', 199.00, 'Rose Gold', 'iPhone SE (2nd Gen).png', 4, '[481957362, 317965824, 429178365, 538219647]'),
(154, 2, 1, 'iphone 11 pro', 'iphone 11 pro-2016-32-4-Black', 2016, 5.10, 32, 4, 'IOS', 299.00, 'Black', '11pro-Gray.png', 3, '[579432816, 218946357, 648271935]'),
(155, 3, 1, 'OnePlus 3', 'OnePlus 3-2016-64-6-Silver', 2016, 5.50, 64, 6, 'Android', 299.00, 'Silver', 'Google Pixel 4a Black.png', 2, '[179463825, 538219674]'),
(157, 2, 1, 'iPhone 15', 'iPhone 15-1890-64-3-Pink', 1890, 6.30, 64, 3, 'IOS', 799.00, 'Pink', 'iphone-15-pink.png', 2, '[555555555, 555555556]'),
(173, 3, 1, 'Huawie nova i5', 'Huawie nova i5-2021-256-8-Blue', 2021, 6.40, 256, 8, 'Android', 1299.00, 'Blue', '1248279-copy.jpg', 1, '[459997002]');

-- INSERT INTO "phones" ("BrandID", "CategoryID", "PhoneName", "Model", "ReleaseYear", "ScreenSize", "StorageCapacity", "RAM", "OperatingSystem", "Price", "Color", "ImageName", "quantity", "seri") VALUES
-- (2, 1, 'iphone 14', 'iphone 14-2022-128-8-Black', 2022, 6.30, 128, 8, 'IOS', 799.00, 'Black', 'iphone 14 black.png', 0, '[]'),
-- (1, 2, 'Samsung Galaxy S20', 'Samsung Galaxy S20-2020-256-8-Blue', 2020, 6.20, 256, 8, 'Android', 699.00, 'Blue', 'Samsung Galaxy Note 20 Mystic Bronze.png', 1, '[112569965]'),
-- (3, 1, 'OnePlus 9', 'OnePlus 9-2021-128-8-White', 2021, 6.50, 128, 8, 'Android', 699.00, 'White', 'oneplus 9-white.png', 0, '[]'),
-- (2, 2, 'iphone 13', 'iphone 13-2021-256-8-Red', 2021, 6.10, 256, 8, 'IOS', 899.00, 'Red', 'iPhone 13.jpg', 4, '[753190628, 410987365, 187654329, 210987654]'),
-- (1, 1, 'Samsung Galaxy S21', 'Samsung Galaxy S21-2021-128-8-Purple', 2021, 6.40, 128, 8, 'Android', 799.00, 'Purple', 'Samsung Galaxy S21 black.jpg', 0, '[]'),
-- (3, 1, 'OnePlus Nord', 'OnePlus Nord-2020-128-6-Gray', 2020, 6.40, 128, 6, 'Android', 499.00, 'Gray', 'OnePlus Nord Gray.PNG', 5, '[284619799, 572937801, 329174856, 654728913, 864209799]'),
-- (2, 3, 'iphone 12', 'iphone 12-2020-64-4-Black', 2020, 6.10, 64, 4, 'IOS', 699.00, 'Black', 'iphone-12-white.jpg', 3, '[493175628, 871539264, 527346198]'),
-- (1, 1, 'Samsung Galaxy Note 20', 'Samsung Galaxy Note 20-2020-256-8-Bronze', 2020, 6.70, 256, 8, 'Android', 799.00, 'Bronze', 'Samsung Galaxy Note 20 Mystic Bronze.png', 2, '[157482937, 428671935]'),
-- (3, 2, 'OnePlus 8T', 'OnePlus 8T-2020-128-8-Silver', 2020, 6.50, 128, 8, 'Android', 599.00, 'Silver', 'Google Pixel 3 black.jpg', 4, '[619753284, 578349162, 293746185, 462891357]'),
-- (2, 1, 'iphone 11', 'iphone 11-2019-128-4-White', 2019, 6.10, 128, 4, 'IOS', 599.00, 'White', 'se-2016-black.png', 1, '[182736495]'),
-- (1, 1, 'Samsung Galaxy S10', 'Samsung Galaxy S10-2019-128-8-Green', 2019, 6.10, 128, 8, 'Android', 499.00, 'Green', 'samsung galaxy s10 green.png', 3, '[375281964, 426198735, 987654321]'),
-- (3, 1, 'OnePlus 7 Pro', 'OnePlus 7 Pro-2019-256-12-Blue', 2019, 6.60, 256, 12, 'Android', 699.00, 'Blue', 'Google Pixel 4 Orange.png', 2, '[193746582, 574839216]'),
-- (2, 1, 'iphone X', 'iphone X-2018-256-3-Black', 2018, 5.80, 256, 3, 'IOS', 599.00, 'Black', 'iPhone_XR_white.png', 5, '[295836471, 614729835, 571849236, 124637598, 352816479]'),
-- (1, 1, 'Samsung Galaxy Note 10', 'Samsung Galaxy Note 10-2018-256-8-Silver', 2018, 6.30, 256, 8, 'Android', 699.00, 'Silver', 'rog.png', 2, '[193846572, 485629713]'),
-- (3, 1, 'OnePlus 6T', 'OnePlus 6T-2018-128-8-Red', 2018, 6.40, 128, 8, 'Android', 499.00, 'Red', 'Google Pixel 5.png', 3, '[627195384, 591384762, 746219538]'),
-- (2, 1, 'iphone 8', 'iphone 8-2017-64-2-Gray', 2017, 4.70, 64, 2, 'IOS', 399.00, 'Gray', 'se-2016-black.png', 4, '[183749265, 572639184, 628473195, 475923618]'),
-- (1, 1, 'Samsung Galaxy S9', 'Samsung Galaxy S9-2018-64-4-Blue', 2018, 5.80, 64, 4, 'Android', 399.00, 'Blue', 'Google-Pixel-6-Black_600x.jpg', 3, '[395817264, 496731582, 817246395]'),
-- (3, 1, 'OnePlus 6', 'OnePlus 6-2018-128-6-Black', 2018, 6.20, 128, 6, 'Android', 499.00, 'Black', 'Huawei M.png', 2, '[618472935, 215847639]'),
-- (2, 1, 'iphone 7', 'iphone 7-2016-128-2-Silver', 2016, 4.70, 128, 2, 'IOS', 299.00, 'Silver', 'header_iphone_7_plus_black_large_2x.png', 5, '[294857163, 528716394, 187539642, 863951247, 952743816]'),
-- (1, 1, 'Samsung Galaxy Note 9', 'Samsung Galaxy Note 9-2018-128-6-Blue', 2018, 6.40, 128, 6, 'Android', 599.00, 'Blue', 'Samsung_Galaxy_A52_Blue.png', 3, '[725183946, 915628347, 862741935]'),
-- (3, 1, 'OnePlus 5T', 'OnePlus 5T-2017-64-6-Red', 2017, 6.00, 64, 6, 'Android', 399.00, 'Red', 'vn-galaxy-s23-ultra.PNG', 2, '[165493728, 485721936]'),
-- (2, 1, 'iphone 6S', 'iphone 6S-2015-32-2-Gray', 2015, 4.70, 32, 2, 'IOS', 199.00, 'Gray', 'header_iphone_8_silver_small_2x.png', 4, '[285716394, 654729183, 745928163, 429871365]'),
-- (1, 1, 'Samsung Galaxy S8', 'Samsung Galaxy S8-2017-64-4-Gold', 2017, 5.80, 64, 4, 'Android', 399.00, 'Gold', 'samsung galaxy s10 green.png', 3, '[391872654, 752836941, 648371925]'),
-- (3, 1, 'OnePlus 5', 'OnePlus 5-2017-64-6-Black', 2017, 5.50, 64, 6, 'Android', 399.00, 'Black', 'rog.png', 2, '[194867253, 837429165]'),
-- (2, 1, 'iphone 6', 'iphone 6-2014-32-2-Silver', 2014, 4.70, 32, 2, 'IOS', 149.00, 'Silver', '0000600_iphone-se-2022_240.png', 5, '[295847163, 751982634, 819374652, 210398765, 317965824]'),
-- (3, 1, 'Huawei Note 8', 'Huawei Note 8-2017-64-6-Blue', 2017, 6.30, 64, 6, 'Android', 499.00, 'Blue', 'Huawei M.png', 3, '[193475826, 518297364, 861937245]'),
-- (3, 1, 'iphone 15 pro', 'iphone 15 pro-2016-64-6-Black', 2016, 5.50, 64, 6, 'IOS', 299.00, 'Black', 'iphone 15 pro 512GB VNA.png', 2, '[794613528, 218946375]'),
-- (2, 1, 'iphone SE', 'iphone SE-2016-32-2-Rose Gold', 2016, 4.00, 32, 2, 'IOS', 199.00, 'Rose Gold', 'iPhone SE (2nd Gen).png', 4, '[481957362, 317965824, 429178365, 538219647]'),
-- (2, 1, 'iphone 11 pro', 'iphone 11 pro-2016-32-4-Black', 2016, 5.10, 32, 4, 'IOS', 299.00, 'Black', '11pro-Gray.png', 3, '[579432816, 218946357, 648271935]'),
-- (3, 1, 'OnePlus 3', 'OnePlus 3-2016-64-6-Silver', 2016, 5.50, 64, 6, 'Android', 299.00, 'Silver', 'Google Pixel 4a Black.png', 2, '[179463825, 538219674]'),
-- (2, 1, 'iPhone 15', 'iPhone 15-1890-64-3-Pink', 1890, 6.30, 64, 3, 'IOS', 799.00, 'Pink', 'iphone-15-pink.png', 2, '[555555555, 555555556]'),
-- (3, 1, 'Huawie nova i5', 'Huawie nova i5-2021-256-8-Blue', 2021, 6.40, 256, 8, 'Android', 1299.00, 'Blue', '', 1, '[459997002]'),
-- (2, 1, ' iPhone X', 'iPhone X-2020-64-4-Black', 2020, 6.10, 64, 4, 'IOS', 999.00, ' Black ', ' iphone.jpg', 1, '[459687412]');


-- Table structure for table `customers`
CREATE TABLE IF NOT EXIST "customers" (
  "CustomerID" serial PRIMARY KEY,
  "FirstName" varchar(255),
  "LastName" varchar(255),
  "Email" varchar(255) NOT NULL,
  "Phone" varchar(20) NOT NULL,
  "Pass" varchar(50) NOT NULL,
  "Address" varchar(500) NOT NULL,
  "registration_date" timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO "customers" ("CustomerID", "FirstName", "LastName", "Email", "Phone", "Pass", "Address", "registration_date") VALUES
(1, 'Johny', 'Doe', 'john.doe@example.com', '888-444-210-791', '123456', '123 Main St', '2023-09-27 09:13:51'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '123456', '456 Elm St', '2023-09-27 09:13:56'),
(3, 'Bob', 'Johnson', 'bob.johnson@example.com', '555-555-5555', '123456', '789 Oak St', '2023-09-27 09:13:57'),
(4, 'HONAG', 'NGOC', 'lov3u4ev3r97@gmail.com', '0084399036791', '123456', 'diệt pháp, thiện phiến, tiên lữ', '2023-09-27 01:27:41'),
(5, 'Hong', 'Quan', 'lovenevertolate97@gmail.com', '0356911600', '123', 'diệt pháp, thiện phiến, tiên lữ', '2023-09-27 10:54:36'),
(6, 'Nam', 'Hoang', 'HoangNam@gmail.com', '+843990363333', '123', 'diệt pháp, thiện phiến, tiên lữ', '2023-09-29 01:07:30'),
(17, 'Hung', 'Nguyen', 'Hungnguyen@gmail.com', '+8439903633791', '0123', 'số 12, hồ tùng mậu, hà nội', '2023-09-29 04:57:15'),
(18, 'Test', 'test', 'test@gmail.com', '123456789', '123', 'Số 1, Tôn Thất Tùng, Hà Nội, Việt Nam', '2023-10-05 01:20:48'),
(19, 'Nguyen', 'The Anh', 'theanhnguyen@gmail.com', '026935691', '123', 'Vĩnh Yên, Vĩnh Phúc, Việt Nam', '2023-10-18 01:26:44'),
(20, 'Nguyen Nam', NULL, 'Nguyennam1999@gmail.com', '+84399036791', '0399036791', 'số 42, phan chu trinh, TP Vĩnh Yên, Vĩnh Phúc', '2023-10-25 02:58:25'),
(22, 'Vu Thuy', NULL, 'vuthuy270896@gmail.com', '096635694', '123', 'minh khai, khai quang, tp vinh yen, vinh phuc', '2023-11-02 13:27:50');

-- Table structure for table `employees`
CREATE TABLE IF NOT EXIST "employees" (
  "EmployeeID" serial PRIMARY KEY,
  "FirstName" varchar(255),
  "LastName" varchar(255),
  "Email" varchar(255) NOT NULL,
  "Phone" varchar(20),
  "Pass" varchar(50) NOT NULL,
  "HireDate" timestamp
);

INSERT INTO "employees" ("EmployeeID", "FirstName", "LastName", "Email", "Phone", "Pass", "HireDate") VALUES
(1, 'Michael', 'Johnson', 'michael.johnson@example.com', '111-111-1112', '123', '2020-01-14 17:00:00'),
(2, 'Emily', 'Williams', 'emily.williams@example.com', '222-222-2222', '123', '2021-03-19 17:00:00'),
(3, 'David', 'Smith', 'david.smith@example.com', '333-333-3333', '123', '2022-05-09 17:00:00'),
(4, 'Hoàng Tuấn', 'Nghiêm', 'NgiemHoangTuan@example.com', '889-234-192', '123', '2020-04-10 17:00:00'),
(8, 'huynh', 'nguyen', 'huynhnguyen@gmail.com', '063695456', '123', '2023-10-18 01:36:23'),
(9, 'Quan', 'Tran', 'admin', NULL, '123', NULL);

-- Table structure for table `paymentmethods`
CREATE TABLE IF NOT EXIST "paymentmethods" (
  "PaymentMethodID" serial PRIMARY KEY,
  "MethodName" varchar(255) NOT NULL
);

INSERT INTO "paymentmethods" ("PaymentMethodID","MethodName") VALUES
(1, 'Cash'),
(2, 'Credit'),
(3, 'Debit'),
(4, 'PayPal'),
(5, 'MoMo'),
(6, 'ZaloPay'),
(7, 'Shopee'),
(8, 'ApplePay'),
(9, 'SamsungPay');

-- Table structure for table `productreviews`
CREATE TABLE IF NOT EXIST "productreviews" (
  "ReviewID" serial PRIMARY KEY,
  "PhoneID" int,
  "CustomerID" int,
  "Rating" int NOT NULL,
  "Comment" varchar(1000),
  "ReviewDate" timestamp NOT NULL,
  CONSTRAINT "fk_productreviews_phones" FOREIGN KEY ("PhoneID") REFERENCES "phones" ("PhoneID"),
  CONSTRAINT "fk_productreviews_customers" FOREIGN KEY ("CustomerID") REFERENCES "customers" ("CustomerID")
);

INSERT INTO "productreviews" ("ReviewID","PhoneID", "CustomerID", "Rating", "Comment", "ReviewDate") VALUES
(2, 127, 17, 5, 'helooo test', '2023-11-29 15:06:38'),
(3, 127, 5, 5, 'test tiếp', '2023-11-29 15:31:22'),
(7, 142, 18, 5, 'Điện thoại đẹp lắm! ủng hộ shop', '2023-11-29 16:07:57'),
(8, 135, 18, 5, 'Điện thoại cổ nhưng mà dùng khá tốt! cơ bản đáp ứng được', '2023-11-29 16:37:00'),
(9, 135, 5, 3, 'Tạm ổn', '2023-11-29 17:00:35'),
(10, 127, 17, 5, 'điện thoại đẹp, dùng tốt', '2023-11-29 19:23:52'),
(11, 130, 17, 5, 'đẹp, có ở Long An ko?', '2023-11-29 19:24:44'),
(12, 136, 17, 4, 'Màu này đẹp quá', '2023-11-29 19:25:34'),
(13, 136, 17, 4, 'rất phù hợp giá tiền', '2023-11-29 19:25:43'),
(14, 128, 20, 5, 'bản này màu đẹp quá', '2023-11-29 19:26:06'),
(15, 137, 20, 5, 'Sai ảnh rồi', '2023-11-29 19:26:28'),
(16, 142, 6, 5, 'Để sai hình ảnh r shop', '2023-12-12 10:43:19');

-- Table structure for table `wish`
CREATE TABLE IF NOT EXIST "wish" (
  "WhisID" serial NOT NULL,
  "CustomerID" int NOT NULL,
  "PhoneID" int NOT NULL,
  "Quantity" int NOT NULL,
  PRIMARY KEY ("WhisID"),
  CONSTRAINT "fk_wish_customers" FOREIGN KEY ("CustomerID") REFERENCES "customers" ("CustomerID")
);

-- No data provided for the "wish" table.


-- Table structure for table orders
CREATE TABLE IF NOT EXIST IF NOT EXISTS orders (
  "OrderID" SERIAL PRIMARY KEY,
  "CustomerID" INT,
  "OrderDate" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "dateprocessed" TIMESTAMPTZ,
  "PaymentMethodID" INT NOT NULL,
  "Amount" DECIMAL(10,2) NOT NULL,
  "NumberOrAddressPayment" VARCHAR(255) NOT NULL,
  "CVV" VARCHAR(10),
  "ExpirationDate" VARCHAR(10),
  "EmployeeID" INT,
  FOREIGN KEY ("EmployeeID") REFERENCES employees ("EmployeeID"),
  FOREIGN KEY ("PaymentMethodID") REFERENCES paymentmethods ("PaymentMethodID"),
  FOREIGN KEY ("CustomerID") REFERENCES customers ("CustomerID")
);

-- Inserting data for table orders
INSERT INTO orders ("OrderID", "CustomerID", "OrderDate", "dateprocessed", "PaymentMethodID", "Amount", "NumberOrAddressPayment", "CVV", "ExpirationDate", "EmployeeID")
VALUES
  (43, 17, '2023-10-18 23:50:05'::TIMESTAMPTZ, '2023-10-19 09:43:16'::TIMESTAMPTZ, 1, 2996.00, '', '', '', 9),
  (44, 5, '2023-10-19 02:04:05'::TIMESTAMPTZ, '2023-10-20 06:55:51'::TIMESTAMPTZ, 1, 1398.00, '', '', '', 9),
  (45, 20, '2023-10-25 02:58:25'::TIMESTAMPTZ, NULL, 1, 699.00, '', '', '', NULL),
  (50, 22, '2023-11-02 13:27:50'::TIMESTAMPTZ, NULL, 1, 799.00, '', '', '', NULL);

-- Table structure for table ordersimport
CREATE TABLE IF NOT EXIST IF NOT EXISTS ordersimport (
  "OrderImportID" SERIAL PRIMARY KEY,
  "EmployeeID" INT,
  "OrderDateImport" TIMESTAMPTZ DEFAULT CURRENT_TIMESTAMP,
  "Amount" DECIMAL(10,2) NOT NULL,
  FOREIGN KEY ("EmployeeID") REFERENCES employees ("EmployeeID")
);

-- Inserting data for table ordersimport
INSERT INTO ordersimport ("OrderImportID", "EmployeeID", "OrderDateImport", "Amount")
VALUES
  (43, 9, '2023-10-18 23:50:05'::TIMESTAMPTZ, 2996.00),
  (44, 9, '2023-10-19 02:04:05'::TIMESTAMPTZ, 1398.00),
  (45, NULL, '2023-10-25 02:58:25'::TIMESTAMPTZ, 699.00),
  (50, NULL, '2023-11-02 13:27:50'::TIMESTAMPTZ, 799.00);

-- Table structure for table orderitems
CREATE TABLE IF NOT EXIST IF NOT EXISTS orderitems (
  "OrderItemID" SERIAL PRIMARY KEY,
  "OrderID" INT,
  "PhoneID" INT,
  "Quantity" INT,
  "seri" VARCHAR(255),
  "price" DECIMAL(10,2),
  "missing" INT,
  FOREIGN KEY ("OrderID") REFERENCES orders ("OrderID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("PhoneID") REFERENCES phones ("PhoneID") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Inserting data for table orderitems
INSERT INTO orderitems ("OrderItemID", "OrderID", "PhoneID", "Quantity", "seri", "price", "missing")
VALUES
  (77, 43, 128, 2, '[864209753, 112233445]', 699.00, 0),
  (78, 43, 126, 2, '[157482936, 294785613]', 799.00, 0),
  (79, 44, 128, 2, '[864209756, 112233446]', 699.00, 0),
  (80, 45, 127, 3, '[753190642, 421087365, 975310864]', 699.00, 0),
  (85, 50, 130, 2, '[519873264, 872643091]', 799.00, 0);

-- Table structure for table orderitemsimport
CREATE TABLE IF NOT EXIST IF NOT EXISTS orderitemsimport (
  "OrderItemImportID" SERIAL PRIMARY KEY,
  "OrderImportID" INT,
  "PhoneID" INT,
  "Quantity" INT,
  "seri" VARCHAR(255),
  "priceImport" DECIMAL(10,2),
  FOREIGN KEY ("OrderImportID") REFERENCES ordersimport ("OrderImportID") ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY ("PhoneID") REFERENCES phones ("PhoneID") ON DELETE NO ACTION ON UPDATE NO ACTION
);

-- Inserting data for table orderitemsimport
INSERT INTO orderitemsimport ("OrderItemImportID", "OrderImportID", "PhoneID", "Quantity", "seri", "priceImport")
VALUES
  (77, 43, 128, 2, '[864209753, 112233445]', 699.00),
  (78, 43, 126, 2, '[157482936, 294785613]', 799.00),
  (79, 44, 128, 2, '[864209756, 112233446]', 699.00),
  (80, 45, 127, 3, '[753190642, 421087365, 975310864]', 699.00),
  (85, 50, 130, 2, '[519873264, 872643091]', 799.00);
