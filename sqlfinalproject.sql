CREATE DATABASE ECommerce_DB8;
USE ECommerce_DB8;


-- Categories Table
CREATE TABLE Categories (
    cat_ID INT PRIMARY KEY,
    cat_Name VARCHAR(100) NOT NULL
);


-- Products Table
CREATE TABLE Products (
    prd_ID INT  PRIMARY KEY,
    prd_Name VARCHAR(100) NOT NULL,
    prd_Price DECIMAL(10,2) NOT NULL,
    prd_StockQuantity INT NOT NULL,
    cat_ID INT,
    FOREIGN KEY (cat_ID) REFERENCES Categories(cat_ID)
);


-- Customers Table
CREATE TABLE Customers (
    cst_ID INT PRIMARY KEY,
    cst_Name VARCHAR(100) NOT NULL,
    cst_Email VARCHAR(100) UNIQUE NOT NULL
);


-- Orders Table
CREATE TABLE Orders (
    ord_ID INT PRIMARY KEY,
    cst_ID INT,
    ord_Date DATE,
    FOREIGN KEY (cst_ID) REFERENCES Customers(cst_ID)
);


-- OrderDetails Table
CREATE TABLE OrderDetails (
    od_ID INT PRIMARY KEY,
    ord_ID INT,
    prd_ID INT,
    od_Quantity INT NOT NULL,
    FOREIGN KEY (ord_ID) REFERENCES Orders(ord_ID),
    FOREIGN KEY (prd_ID) REFERENCES Products(prd_ID)
);


-- Reviews Table
CREATE TABLE Reviews (
    rev_ID INT PRIMARY KEY,
    prd_ID INT,
    cst_ID INT,
    rev_Rating INT,
    rev_Comment TEXT,
    FOREIGN KEY (prd_ID) REFERENCES Products(prd_ID),
    FOREIGN KEY (cst_ID) REFERENCES Customers(cst_ID)
);


-- Shipping Table
CREATE TABLE Shipping (
    shp_ID INT PRIMARY KEY,
    ord_ID INT,
    shp_ShipDate DATE,
    shp_DeliveryDate DATE,
    FOREIGN KEY (ord_ID) REFERENCES Orders(ord_ID)
);


-- Discounts Table
CREATE TABLE Discounts (
    dis_ID INT PRIMARY KEY,
    prd_ID INT,
    dis_Amount DECIMAL(10,2),
    FOREIGN KEY (prd_ID) REFERENCES Products(prd_ID)
);


-- Coupons Table
CREATE TABLE Coupons (
    cpn_ID INT PRIMARY KEY,
    cpn_DiscountAmount DECIMAL(10,2)
);

INSERT INTO Categories VALUES
(1,'Smartphones'),
(2,'Laptops'),
(3,'Tablets'),
(4,'Books'),
(5,'Men Clothing'),
(6,'Women Clothing'),
(7,'Furniture'),
(8,'Gaming'),
(9,'Cameras'),
(10,'Audio Devices'),
(11,'Kitchen Appliances'),
(12,'Fitness Equipment'),
(13,'Automotive'),
(14,'Office Supplies'),
(15,'Beauty Products'),
(16,'Toys'),
(17,'Pet Supplies'),
(18,'Travel Accessories'),
(19,'Jewelry'),
(20,'Smart Home'),
(21,'Networking Devices'),
(22,'Computer Accessories'),
(23,'Storage Devices'),
(24,'Smart Watches'),
(25,'Shoes'),
(26,'Sports Equipment'),
(27,'Garden Tools'),
(28,'Home Decor'),
(29,'Lighting'),
(30,'Healthcare'),
(31,'Printers'),
(32,'Monitors'),
(33,'Keyboards'),
(34,'Mice'),
(35,'Headphones'),
(36,'Speakers'),
(37,'Gaming Consoles'),
(38,'VR Devices'),
(39,'Power Banks'),
(40,'Chargers'),
(41,'Cables'),
(42,'Drones'),
(43,'Security Devices'),
(44,'Bags'),
(45,'Watches'),
(46,'Eyewear'),
(47,'Stationery'),
(48,'Musical Instruments'),
(49,'Food Items'),
(50,'Beverages'),
(51,'Cleaning Supplies'),
(52,'Baby Products'),
(53,'Craft Supplies'),
(54,'Art Supplies'),
(55,'Software'),
(56,'Computer Parts'),
(57,'Mobile Accessories'),
(58,'Wearable Technology'),
(59,'Home Appliances'),
(60,'Garden Equipment'),
(61,'Luxury Items'),
(62,'Gift Items'),
(63,'Seasonal Products'),
(64,'Outdoor Products'),
(65,'Camping Gear'),
(66,'Swimming Gear'),
(67,'Bicycles'),
(68,'Formal Wear'),
(69,'Traditional Wear'),
(70,'Hand Tools'),
(71,'Medical Equipment'),
(72,'Music Accessories'),
(73,'Photography Equipment'),
(74,'Video Equipment'),
(75,'Office Furniture'),
(76,'School Supplies'),
(77,'Personal Care'),
(78,'Baby Care'),
(79,'Pet Accessories'),
(80,'Miscellaneous');

-- INSERTING INTO PRODUCTS

INSERT INTO Products VALUES
(1,'Google Pixel 10',85000,35,1),
(2,'OnePlus 13 Pro',72000,40,1),
(3,'Samsung Galaxy Z Fold',140000,15,1),
(4,'Dell XPS 15 Laptop',125000,10,2),
(5,'HP Spectre Laptop',110000,18,2),
(6,'Lenovo ThinkPad',90000,25,2),
(7,'iPad Pro M4',120000,12,3),
(8,'Samsung Galaxy Tab S10',65000,20,3),
(9,'Database Management Book',1800,100,4),
(10,'Python Programming Book',1500,90,4),
(11,'Men Formal Shirt',2500,80,5),
(12,'Men Leather Jacket',7000,35,5),
(13,'Women Summer Dress',4500,60,6),
(14,'Women Hand Bag',6000,45,6),
(15,'Modern Sofa Set',85000,8,7),
(16,'Office Wooden Table',20000,20,7),
(17,'PlayStation 5',55000,12,8),
(18,'Xbox Series X',60000,10,8),
(19,'Gaming Headset',8000,60,8),
(20,'Canon DSLR Camera',95000,12,9),
(21,'Sony Mirrorless Camera',120000,8,9),
(22,'Sony Wireless Headphones',15000,70,10),
(23,'JBL Bluetooth Speaker',9000,55,10),
(24,'Microwave Oven',22000,25,11),
(25,'Electric Blender',6000,40,11),
(26,'Smart Fitness Band',5000,90,12),
(27,'Automatic Treadmill',65000,6,12),
(28,'Car Dash Camera',9000,30,13),
(29,'Car Mobile Holder',1800,100,13),
(30,'HP Laser Printer',30000,18,14),
(31,'Office Scanner',22000,15,14),
(32,'Face Cream',900,100,15),
(33,'Hair Conditioner',700,120,15),
(34,'Remote Control Car',3000,70,16),
(35,'Learning Robot Toy',10000,25,16),
(36,'Premium Dog Food',3500,50,17),
(37,'Cat Playing Toy',1500,80,17),
(38,'Travel Backpack',5000,90,18),
(39,'Camping Tent',15000,20,18),
(40,'Gold Necklace',300000,3,19),
(41,'Silver Bracelet',9000,25,19),
(42,'Smart Door Lock',18000,20,20),
(43,'Smart LED Bulb',1200,120,20),
(44,'WiFi Router',7000,50,21),
(45,'Network Switch',10000,35,21),
(46,'Mechanical Keyboard',9000,45,22),
(47,'Wireless Mouse',3000,100,22),
(48,'External SSD 2TB',18000,30,23),
(49,'Memory Card 512GB',5000,80,23),
(50,'Apple Smart Watch',50000,15,24),
(51,'Fitness Smart Watch',9000,50,24),
(52,'Running Shoes',7000,90,25),
(53,'Sports Shoes',8500,70,25),
(54,'Cricket Bat',6000,40,26),
(55,'Football',2500,100,26),
(56,'Garden Cutter',2500,35,27),
(57,'Water Sprinkler',3000,30,27),
(58,'Wall Painting',8000,25,28),
(59,'Decorative Vase',4000,60,28),
(60,'LED Ceiling Light',7000,40,29),
(61,'Study Lamp',2500,80,29),
(62,'Blood Pressure Monitor',5000,35,30),
(63,'Digital Thermometer',1200,100,30),
(64,'Wireless Printer',35000,15,31),
(65,'Gaming Monitor',45000,20,32),
(66,'RGB Keyboard',10000,50,33),
(67,'Ergonomic Mouse',4000,75,34),
(68,'Noise Cancelling Headphones',20000,30,35),
(69,'Home Speaker System',30000,15,36),
(70,'VR Gaming Headset',60000,10,38),
(71,'Drone Camera',70000,12,42),
(72,'Security Camera',15000,35,43),
(73,'Laptop Bag',4000,90,44),
(74,'Luxury Watch',80000,10,45),
(75,'Sunglasses',5000,60,46),
(76,'School Notebook Set',1000,150,76),
(77,'Software License',15000,40,55),
(78,'Unused Smart Refrigerator',95000,10,59),
(79,'Unused Fitness Gloves',1200,70,12),
(80,'Unused Travel Pillow',1800,50,18);

-- INSERTING INTO CUSTOMERS

INSERT INTO Customers VALUES
(1,'Ahmed Raza','ahmed.raza@gmail.com'),
(2,'Fatima Noor','fatima.noor@gmail.com'),
(3,'Michael Johnson','michael.johnson@gmail.com'),
(4,'Emily Brown','emily.brown@gmail.com'),
(5,'Daniel Wilson','daniel.wilson@gmail.com'),
(6,'Sophia Davis','sophia.davis@gmail.com'),
(7,'James Anderson','james.anderson@gmail.com'),
(8,'Olivia Thomas','olivia.thomas@gmail.com'),
(9,'William Taylor','william.taylor@gmail.com'),
(10,'Ava Martinez','ava.martinez@gmail.com'),
(11,'Robert Clark','robert.clark@gmail.com'),
(12,'Mia Rodriguez','mia.rodriguez@gmail.com'),
(13,'David Lewis','david.lewis@gmail.com'),
(14,'Isabella Walker','isabella.walker@gmail.com'),
(15,'Joseph Hall','joseph.hall@gmail.com'),
(16,'Charlotte Allen','charlotte.allen@gmail.com'),
(17,'Thomas Young','thomas.young@gmail.com'),
(18,'Amelia King','amelia.king@gmail.com'),
(19,'Christopher Wright','christopher.wright@gmail.com'),
(20,'Harper Scott','harper.scott@gmail.com'),
(21,'Matthew Green','matthew.green@gmail.com'),
(22,'Evelyn Adams','evelyn.adams@gmail.com'),
(23,'Andrew Baker','andrew.baker@gmail.com'),
(24,'Ella Nelson','ella.nelson@gmail.com'),
(25,'Joshua Carter','joshua.carter@gmail.com'),
(26,'Sofia Mitchell','sofia.mitchell@gmail.com'),
(27,'Ryan Perez','ryan.perez@gmail.com'),
(28,'Zoe Roberts','zoe.roberts@gmail.com'),
(29,'Kevin Turner','kevin.turner@gmail.com'),
(30,'Grace Phillips','grace.phillips@gmail.com'),
(31,'Brian Campbell','brian.campbell@gmail.com'),
(32,'Chloe Parker','chloe.parker@gmail.com'),
(33,'Steven Evans','steven.evans@gmail.com'),
(34,'Lily Edwards','lily.edwards@gmail.com'),
(35,'Edward Collins','edward.collins@gmail.com'),
(36,'Hannah Stewart','hannah.stewart@gmail.com'),
(37,'Anthony Sanchez','anthony.sanchez@gmail.com'),
(38,'Layla Morris','layla.morris@gmail.com'),
(39,'Charles Rogers','charles.rogers@gmail.com'),
(40,'Victoria Reed','victoria.reed@gmail.com'),
(41,'Henry Cook','henry.cook@gmail.com'),
(42,'Scarlett Morgan','scarlett.morgan@gmail.com'),
(43,'Jack Bell','jack.bell@gmail.com'),
(44,'Riley Murphy','riley.murphy@gmail.com'),
(45,'Samuel Bailey','samuel.bailey@gmail.com'),
(46,'Aria Rivera','aria.rivera@gmail.com'),
(47,'Benjamin Cooper','benjamin.cooper@gmail.com'),
(48,'Samantha Richardson','samantha.richardson@gmail.com'),
(49,'Logan Cox','logan.cox@gmail.com'),
(50,'Natalie Howard','natalie.howard@gmail.com'),
(51,'Mason Ward','mason.ward@gmail.com'),
(52,'Lucy Torres','lucy.torres@gmail.com'),
(53,'Alexander Peterson','alexander.peterson@gmail.com'),
(54,'Ellie Gray','ellie.gray@gmail.com'),
(55,'Lucas Ramirez','lucas.ramirez@gmail.com'),
(56,'Avery James','avery.james@gmail.com'),
(57,'Benjamin Watson','benjamin.watson@gmail.com'),
(58,'Ruby Jenkins','ruby.jenkins@gmail.com'),
(59,'Leo Perry','leo.perry@gmail.com'),
(60,'Maya Powell','maya.powell@gmail.com'),
(61,'Ethan Ward','ethan.ward@gmail.com'),
(62,'Madison Torres','madison.torres@gmail.com'),
(63,'Jacob Peterson','jacob.peterson@gmail.com'),
(64,'Noah Cox','noah.cox@gmail.com'),
(65,'Anna Henderson','anna.henderson@gmail.com'),
(66,'Daniel Coleman','daniel.coleman@gmail.com'),
(67,'Penelope Morgan','penelope.morgan@gmail.com'),
(68,'Jackson Bell','jackson.bell@gmail.com'),
(69,'Nora Morris','nora.morris@gmail.com'),
(70,'George Rogers','george.rogers@gmail.com'),
(71,'Camila Reed','camila.reed@gmail.com'),
(72,'Henry Ross','henry.ross@gmail.com'),
(73,'Ruby Hall','ruby.hall@gmail.com'),
(74,'Leo Brooks','leo.brooks@gmail.com'),
(75,'Maya Bennett','maya.bennett@gmail.com'),
(76,'Anna Wood','anna.wood@gmail.com'),
(77,'Daniel Stone','daniel.stone@gmail.com'),
(78,'Scarlett Rose','scarlett.rose@gmail.com'),
(79,'No Order Customer','no.order@gmail.com'),
(80,'New Customer','new.customer@gmail.com');

-- INSERTING INTO ORDERS

INSERT INTO Orders VALUES
(1,1,'2026-01-02'),
(2,1,'2026-01-15'),
(3,2,'2026-01-05'),
(4,2,'2026-01-20'),
(5,2,'2026-02-10'),
(6,3,'2026-02-01'),
(7,4,'2026-02-15'),
(8,5,'2026-03-01'),
(9,5,'2026-03-18'),
(10,6,'2026-03-05'),
(11,7,'2026-03-12'),
(12,8,'2026-03-20'),
(13,9,'2026-04-01'),
(14,10,'2026-04-10'),
(15,11,'2026-04-15'),
(16,12,'2026-04-20'),
(17,13,'2026-05-01'),
(18,14,'2026-05-05'),
(19,15,'2026-05-12'),
(20,16,'2026-05-20'),
(21,17,'2026-06-01'),
(22,18,'2026-06-05'),
(23,19,'2026-06-10'),
(24,20,'2026-06-15'),
(25,21,'2026-06-20'),
(26,22,'2026-07-01'),
(27,23,'2026-07-05'),
(28,24,'2026-07-10'),
(29,25,'2026-07-15'),
(30,26,'2026-07-20'),
(31,27,'2026-08-01'),
(32,28,'2026-08-05'),
(33,29,'2026-08-10'),
(34,30,'2026-08-15'),
(35,31,'2026-08-20'),
(36,32,'2026-09-01'),
(37,33,'2026-09-05'),
(38,34,'2026-09-10'),
(39,35,'2026-09-15'),
(40,36,'2026-09-20'),
(41,37,'2026-10-01'),
(42,38,'2026-10-05'),
(43,39,'2026-10-10'),
(44,40,'2026-10-15'),
(45,41,'2026-10-20'),
(46,42,'2026-11-01'),
(47,43,'2026-11-05'),
(48,44,'2026-11-10'),
(49,45,'2026-11-15'),
(50,46,'2026-11-20'),
(51,47,'2026-12-01'),
(52,48,'2026-12-05'),
(53,49,'2026-12-10'),
(54,50,'2026-12-15'),
(55,51,'2027-01-01'),
(56,52,'2027-01-05'),
(57,53,'2027-01-10'),
(58,54,'2027-01-15'),
(59,55,'2027-01-20'),
(60,56,'2027-02-01'),
(61,57,'2027-02-05'),
(62,58,'2027-02-10'),
(63,59,'2027-02-15'),
(64,60,'2027-02-20'),
(65,61,'2027-03-01'),
(66,62,'2027-03-05'),
(67,63,'2027-03-10'),
(68,64,'2027-03-15'),
(69,65,'2027-03-20'),
(70,66,'2027-04-01'),
(71,67,'2027-04-05'),
(72,68,'2027-04-10'),
(73,69,'2027-04-15'),
(74,70,'2027-04-20'),
(75,71,'2027-05-01'),
(76,72,'2027-05-05'),
(77,73,'2027-05-10'),
(78,74,'2027-05-15'),
(79,75,'2027-05-20'),
(80,76,'2027-06-01');

-- INSERTING INTO ORDER DETAILS

INSERT INTO OrderDetails VALUES
(1,1,1,1),
(2,1,22,2),
(3,2,4,1),
(4,2,46,1),
(5,3,2,2),
(6,3,9,3),
(7,4,7,1),
(8,4,23,2),
(9,5,8,1),
(10,5,17,1),
(11,6,20,1),
(12,6,21,2),
(13,7,24,1),
(14,7,25,2),
(15,8,11,3),
(16,8,12,1),
(17,9,13,2),
(18,9,14,1),
(19,10,26,2),
(20,10,27,1),
(21,11,52,1),
(22,11,55,2),
(23,12,38,1),
(24,12,39,1),
(25,13,30,1),
(26,13,31,2),
(27,14,32,3),
(28,14,33,1),
(29,15,34,2),
(30,15,35,1),
(31,16,36,1),
(32,16,37,2),
(33,17,40,1),
(34,17,41,1),
(35,18,42,2),
(36,18,43,3),
(37,19,44,1),
(38,19,45,2),
(39,20,48,1),
(40,20,49,2),
(41,21,50,1),
(42,21,51,2),
(43,22,53,3),
(44,22,54,1),
(45,23,56,2),
(46,23,57,1),
(47,24,58,1),
(48,24,59,2),
(49,25,60,3),
(50,25,61,1),
(51,26,62,2),
(52,26,63,1),
(53,27,64,1),
(54,27,65,2),
(55,28,66,1),
(56,28,67,2),
(57,29,68,3),
(58,29,69,1),
(59,30,70,1),
(60,30,71,2),
(61,31,72,1),
(62,31,73,2),
(63,32,74,1),
(64,32,75,2),
(65,33,76,3),
(66,34,3,1),
(67,35,5,2),
(68,36,10,1),
(69,37,15,2),
(70,38,18,1),
(71,39,28,3),
(72,40,29,2),
(73,41,47,1),
(74,42,12,2),
(75,43,19,1),
(76,44,35,2),
(77,45,51,1),
(78,46,6,2),
(79,47,16,1),
(80,48,45,3);

-- INSERTING INTO REVIEWS

INSERT INTO Reviews VALUES
(1,1,1,5,'Excellent smartphone performance'),
(2,2,2,4,'Battery life is very good'),
(3,3,3,5,'Amazing folding design'),
(4,4,4,4,'Powerful laptop'),
(5,5,5,5,'Very useful for office work'),
(6,6,6,3,'Average laptop'),
(7,7,7,5,'Great tablet experience'),
(8,8,8,4,'Good display quality'),
(9,9,9,5,'Helpful programming book'),
(10,10,10,4,'Easy to understand'),
(11,11,11,4,'Good shirt quality'),
(12,12,12,5,'Leather quality is excellent'),
(13,13,13,4,'Beautiful dress'),
(14,14,14,5,'Stylish handbag'),
(15,15,15,5,'Very comfortable sofa'),
(16,16,16,4,'Strong wooden table'),
(17,17,17,5,'Amazing gaming console'),
(18,18,18,4,'Good gaming performance'),
(19,19,19,5,'Clear gaming sound'),
(20,20,20,5,'Professional camera quality'),
(21,21,21,4,'Excellent pictures'),
(22,22,22,5,'Amazing sound quality'),
(23,23,23,4,'Speaker works well'),
(24,24,24,4,'Fast heating'),
(25,25,25,5,'Useful kitchen product'),
(26,26,26,5,'Fitness tracking is accurate'),
(27,27,27,4,'Good exercise machine'),
(28,28,28,5,'Car camera is useful'),
(29,29,29,3,'Average product'),
(30,30,30,5,'Printer quality is excellent'),
(31,31,31,4,'Scanner works fine'),
(32,32,32,5,'Skin feels better'),
(33,33,33,4,'Good beauty product'),
(34,34,34,5,'Kids love this toy'),
(35,35,35,4,'Educational and fun'),
(36,36,36,5,'Pet likes this food'),
(37,37,37,4,'Good pet accessory'),
(38,38,38,5,'Large travel bag'),
(39,39,39,4,'Strong camping tent'),
(40,40,40,5,'Premium jewelry'),
(41,41,41,4,'Nice bracelet'),
(42,42,42,5,'Security is improved'),
(43,43,43,4,'Bright smart bulb'),
(44,44,44,5,'Fast internet device'),
(45,45,45,4,'Good network performance'),
(46,46,46,5,'Excellent keyboard'),
(47,47,47,4,'Smooth mouse'),
(48,48,48,5,'Fast storage'),
(49,49,49,4,'Good memory card'),
(50,50,50,5,'Amazing smartwatch'),
(51,51,51,4,'Fitness features are good'),
(52,52,52,5,'Comfortable shoes'),
(53,53,53,4,'Good sports shoes'),
(54,54,54,5,'Strong cricket bat'),
(55,55,55,4,'Good football'),
(56,56,56,5,'Useful garden tool'),
(57,57,57,3,'Average quality'),
(58,58,58,5,'Beautiful decoration'),
(59,59,59,4,'Nice home decor'),
(60,60,60,5,'Bright lighting'),
(61,61,61,4,'Good lamp'),
(62,62,62,5,'Accurate health device'),
(63,63,63,4,'Works properly'),
(64,64,1,5,'Printer is reliable'),
(65,65,2,4,'Monitor display is clear'),
(66,66,3,5,'Keyboard looks great'),
(67,67,4,3,'Mouse quality is average'),
(68,68,5,5,'Headphones are excellent'),
(69,69,6,4,'Speaker quality is good'),
(70,70,7,5,'VR experience is amazing'),
(71,71,8,4,'Drone camera is good'),
(72,72,9,5,'Security camera works well'),
(73,73,10,4,'Bag is comfortable'),
(74,74,11,5,'Luxury watch looks great'),
(75,75,12,4,'Stylish glasses'),
(76,76,13,5,'Useful notebook'),
(77,77,14,4,'Software works properly'),
(78,1,15,5,'Second review for smartphone'),
(79,4,16,4,'Laptop review'),
(80,17,17,5,'Gaming product review');

-- INSERTING INTO SHIPPING

INSERT INTO Shipping VALUES
(1,1,'2026-01-03','2026-01-07'),
(2,2,'2026-01-16','2026-01-20'),
(3,3,'2026-01-06','2026-01-10'),
(4,4,'2026-01-21','2026-01-25'),
(5,5,'2026-02-11','2026-02-15'),
(6,6,'2026-02-02','2026-02-06'),
(7,7,'2026-02-16','2026-02-20'),
(8,8,'2026-03-02','2026-03-06'),
(9,9,'2026-03-19','2026-03-23'),
(10,10,'2026-03-06','2026-03-10'),
(11,11,'2026-03-13','2026-03-17'),
(12,12,'2026-03-21','2026-03-25'),
(13,13,'2026-04-02','2026-04-06'),
(14,14,'2026-04-11','2026-04-15'),
(15,15,'2026-04-16','2026-04-20'),
(16,16,'2026-04-21','2026-04-25'),
(17,17,'2026-05-02','2026-05-06'),
(18,18,'2026-05-06','2026-05-10'),
(19,19,'2026-05-13','2026-05-17'),
(20,20,'2026-05-21','2026-05-25'),
(21,21,'2026-06-02','2026-06-06'),
(22,22,'2026-06-06','2026-06-10'),
(23,23,'2026-06-11','2026-06-15'),
(24,24,'2026-06-16','2026-06-20'),
(25,25,'2026-06-21','2026-06-25'),
(26,26,'2026-07-02','2026-07-06'),
(27,27,'2026-07-06','2026-07-10'),
(28,28,'2026-07-11','2026-07-15'),
(29,29,'2026-07-16','2026-07-20'),
(30,30,'2026-07-21','2026-07-25'),
(31,31,'2026-08-02','2026-08-06'),
(32,32,'2026-08-06','2026-08-10'),
(33,33,'2026-08-11','2026-08-15'),
(34,34,'2026-08-16','2026-08-20'),
(35,35,'2026-08-21','2026-08-25'),
(36,36,'2026-09-02','2026-09-06'),
(37,37,'2026-09-06','2026-09-10'),
(38,38,'2026-09-11','2026-09-15'),
(39,39,'2026-09-16','2026-09-20'),
(40,40,'2026-09-21','2026-09-25'),
(41,41,'2026-10-02','2026-10-06'),
(42,42,'2026-10-06','2026-10-10'),
(43,43,'2026-10-11','2026-10-15'),
(44,44,'2026-10-16','2026-10-20'),
(45,45,'2026-10-21','2026-10-25'),
(46,46,'2026-11-02','2026-11-06'),
(47,47,'2026-11-06','2026-11-10'),
(48,48,'2026-11-11','2026-11-15'),
(49,49,'2026-11-16','2026-11-20'),
(50,50,'2026-11-21','2026-11-25'),
(51,51,'2026-12-02','2026-12-06'),
(52,52,'2026-12-06','2026-12-10'),
(53,53,'2026-12-11','2026-12-15'),
(54,54,'2026-12-16','2026-12-20'),
(55,55,'2026-12-21','2026-12-25'),
(56,56,'2027-01-02','2027-01-06'),
(57,57,'2027-01-06','2027-01-10'),
(58,58,'2027-01-11','2027-01-15'),
(59,59,'2027-01-16','2027-01-20'),
(60,60,'2027-01-21','2027-01-25'),
(61,61,'2027-02-02','2027-02-06'),
(62,62,'2027-02-06','2027-02-10'),
(63,63,'2027-02-11','2027-02-15'),
(64,64,'2027-02-16','2027-02-20'),
(65,65,'2027-02-21','2027-02-25'),
(66,66,'2027-03-02','2027-03-06'),
(67,67,'2027-03-06','2027-03-10'),
(68,68,'2027-03-11','2027-03-15'),
(69,69,'2027-03-16','2027-03-20'),
(70,70,'2027-03-21','2027-03-25'),
(71,71,'2027-04-02','2027-04-06'),
(72,72,'2027-04-06','2027-04-10'),
(73,73,'2027-04-11','2027-04-15'),
(74,74,'2027-04-16','2027-04-20'),
(75,75,'2027-04-21','2027-04-25'),
(76,76,'2027-05-02','2027-05-06'),
(77,77,'2027-05-06','2027-05-10'),
(78,78,'2027-05-11','2027-05-15'),
(79,79,'2027-05-16','2027-05-20'),
(80,80,'2027-05-21','2027-05-25');

-- INSERTING INTO DISCOUNTS

INSERT INTO Discounts VALUES
(1,1,45.00),
(2,2,60.00),
(3,3,35.00),
(4,4,80.00),
(5,5,25.00),
(6,6,15.00),
(7,7,50.00),
(8,8,90.00),
(9,9,20.00),
(10,10,30.00),
(11,11,12.00),
(12,12,18.00),
(13,13,75.00),
(14,14,55.00),
(15,15,150.00),
(16,16,40.00),
(17,17,22.00),
(18,18,10.00),
(19,19,8.00),
(20,20,35.00),
(21,21,14.00),
(22,22,45.00),
(23,23,30.00),
(24,24,65.00),
(25,25,100.00),
(26,26,25.00),
(27,27,40.00),
(28,28,20.00),
(29,29,18.00),
(30,30,50.00),
(31,31,15.00),
(32,32,10.00),
(33,33,35.00),
(34,34,200.00),
(35,35,120.00),
(36,36,28.00),
(37,37,18.00),
(38,38,25.00),
(39,39,12.00),
(40,40,9.00),
(41,41,11.00),
(42,42,16.00),
(43,43,70.00),
(44,44,85.00),
(45,45,40.00),
(46,46,15.00),
(47,47,55.00),
(48,48,35.00),
(49,49,45.00),
(50,50,25.00),
(51,51,90.00),
(52,52,65.00),
(53,53,7.00),
(54,54,20.00),
(55,55,50.00),
(56,56,75.00),
(57,57,30.00),
(58,58,110.00),
(59,59,40.00),
(60,60,18.00),
(61,61,12.00),
(62,62,60.00),
(63,63,15.00),
(64,64,22.00),
(65,65,6.00),
(66,66,35.00),
(67,67,95.00),
(68,68,70.00),
(69,69,45.00),
(70,70,30.00),
(71,71,55.00),
(72,72,15.00),
(73,73,20.00),
(74,74,25.00),
(75,75,10.00),
(76,76,35.00),
(77,77,80.00),
(78,78,50.00),
(79,79,40.00),
(80,80,20.00);

-- INSERTING INTO COUPONS

INSERT INTO Coupons VALUES
(1,7.00),
(2,12.00),
(3,18.00),
(4,25.00),
(5,30.00),
(6,35.00),
(7,40.00),
(8,45.00),
(9,50.00),
(10,60.00),
(11,5.00),
(12,15.00),
(13,22.00),
(14,28.00),
(15,32.00),
(16,38.00),
(17,44.00),
(18,55.00),
(19,65.00),
(20,75.00),
(21,10.00),
(22,20.00),
(23,30.00),
(24,40.00),
(25,50.00),
(26,60.00),
(27,70.00),
(28,80.00),
(29,90.00),
(30,100.00),
(31,8.00),
(32,16.00),
(33,24.00),
(34,36.00),
(35,48.00),
(36,56.00),
(37,68.00),
(38,78.00),
(39,88.00),
(40,98.00),
(41,11.00),
(42,21.00),
(43,31.00),
(44,41.00),
(45,51.00),
(46,61.00),
(47,71.00),
(48,81.00),
(49,91.00),
(50,110.00),
(51,13.00),
(52,23.00),
(53,33.00),
(54,43.00),
(55,53.00),
(56,63.00),
(57,73.00),
(58,83.00),
(59,93.00),
(60,120.00),
(61,14.00),
(62,26.00),
(63,39.00),
(64,49.00),
(65,59.00),
(66,69.00),
(67,79.00),
(68,89.00),
(69,99.00),
(70,130.00),
(71,17.00),
(72,27.00),
(73,37.00),
(74,47.00),
(75,57.00),
(76,67.00),
(77,77.00),
(78,87.00),
(79,97.00),
(80,150.00);

-- Q1 Display all customers with their orders ( used full join )

select 
c.cst_name ,
c.cst_email,
o.ord_id,
o.ord_date 
from Customers c
left join Orders o
on c.cst_id = o.cst_id 
 
 UNION 
 
 select 
c.cst_name ,
c.cst_email,
o.ord_id,
o.ord_Date 
from Customers c
right join Orders o
on c.cst_id = o.cst_id ;

-- Q2  Display all products with the categories name ( used inner join )

select 
c.cat_Name,
p.prd_ID,
p.prd_Name,
p.prd_Price,
p.prd_StockQuantity
from products p 
inner join  Categories c
on c.cat_ID = p.cat_ID ;

-- Q3 Display all order details with product names ( used inner join )

select 
o.od_ID ,
o.ord_ID,
o.od_Quantity ,
p.prd_Name
from Products p 
inner join  OrderDetails o 
on p.prd_ID = o.prd_ID ; 

-- Q4 Display all reviews with customer names ( used inner join )

select 
r.rev_ID ,
r.prd_ID ,
r.rev_Rating ,
r.rev_Comment ,
c.cst_Name ,
c.cst_Email 
from Customers c
inner join Reviews r
on r.cst_ID = c.cst_ID ;

-- Q5 Find total number of orders placed by each customer ( used inner join,aggregate func, group by ) 

SELECT 
    c.cst_ID,
    c.cst_Name,
    COUNT(o.ord_ID) AS Total_Orders
FROM Customers c
INNER JOIN Orders o
ON c.cst_ID = o.cst_ID
GROUP BY c.cst_ID, c.cst_Name;

-- Q6 Find customers who have placed more than 2 orders  ( used inner join , aggregate func , group by , having ) 

select 
c.cst_ID ,
c.cst_Name ,
count(o.ord_ID) as morethan_2orders
from Customers c
inner join  Orders o 
on c.cst_ID = o.cst_ID
group by c.cst_ID , c.cst_Name  
having count(o.ord_ID) > 2;
 
 -- Q7 Display customer names with their latest order date
 select 
 c.cst_ID,
 c.cst_Name,
 max( o.ord_Date) as latest_date 
 from Customers c
 inner join Orders o 
 on c.cst_ID = o.cst_ID
group by c.cst_ID , c.cst_Name  ;

-- Q8 List products along with their average review rating ( used left join , group by , avg() ) 
select 
p.prd_Name,
p.prd_Price,
avg(r.rev_Rating) as avg_rating 
from Products p
left join Reviews r
on p.prd_ID = r.prd_ID 
group by p.prd_Name , p.prd_Price;

-- Q9 Find the total quantity sold for each product. 
select 
p.prd_Name,
p.prd_Price, 
sum( o.od_Quantity) as total_quantity 
from Products p 
inner join  OrderDetails o 
on p.prd_ID = o.prd_ID 
group by p.prd_Name , p.prd_Price;

-- Q10 Show customers who purchased more than one product 
SELECT
    c.cst_ID,
    c.cst_Name,
    COUNT(od.prd_ID) as total_products
from Customers c
inner join Orders o
    ON c.cst_ID = o.cst_ID
inner join OrderDetails od
    ON o.ord_ID = od.ord_ID
GROUP BY
    c.cst_ID,
    c.cst_Name
having COUNT(od.prd_ID) > 1;
 -- Q11 Display the top 10 most sold products. ( used inner join, group by , limit , desc) 
 select 
 p.prd_Name,
 p.prd_Price,
 sum(o.od_Quantity) as total_sold 
 from Products p 
 inner join OrderDetails o 
 on p.prd_ID = o.prd_ID 
 group by p.prd_Name , p.prd_Price 
 order by total_sold desc 
 limit 10 ;
 
-- Q12  Display all orders along with shipping details and ordered product names. ( joined 3 tables by inner join ( probelm was connecting all three together using diff coeff)
select 
o.ord_ID,
o.ord_Date,
s.shp_ShipDate,
s.shp_DeliveryDate,
p.prd_Name,
od.od_Quantity
from Orders o 
inner join Shipping s 
on o.ord_ID = s.ord_ID 
inner join OrderDetails od
on s.ord_ID = od.ord_ID 
inner join Products p 
on od.prd_ID = p.prd_ID ;

-- Q13  Find products having ratings above average rating ( subquery ) 

select 
rev_ID ,
prd_ID 
from Reviews e1
where rev_Rating > 
(    select avg(rev_Rating)
     from Reviews e2
     where e1.prd_ID = e2.prd_ID 
	) ;
    
-- Q14  Find the most expensive product. (subquery) 

select * from Products 
where prd_Price =
(      select max(prd_Price ) 
        from Products
	);
    
-- Q14 Find the most cheapest product 
select * from Products 
where prd_Price =
(      select min(prd_Price ) 
        from Products
	);
    
-- Q15  Find products with stock greater than the average stock.

select * from Products 
where prd_StockQuantity > 
(     select avg(prd_StockQuantity)
      from Products
	);
    
-- Q16 Showiing all laptop products 

select 
p.prd_Name, 
p.prd_ID ,
c.cat_Name
from Products p 
inner join Categories c 
on p.cat_ID = c.cat_ID 
where c.cat_Name = 'Laptops'; 

-- Q17 Show customers who purchased products above ₹10000.

select 
c.cst_Name,
c.cst_ID ,
o.ord_ID,
p.prd_Name,
p.prd_Price 
from Customers c 
inner join Orders o 
on c.cst_ID = o.cst_ID 
inner join OrderDetails od 
on o.ord_ID = od.ord_ID 
inner join products p 
on od.prd_ID = p.prd_ID 
where p.prd_Price > 10000 ;
 
 -- Q18 Show products with ratings equal to 5.
 
 select 
p.prd_Name ,
p.prd_Price ,
r.rev_Rating ,
r.rev_Comment,
min(r.rev_Rating) as  lowest_Rating
from Products p 
inner join Reviews r 
ON p.prd_ID = r.prd_ID
group by 
p.prd_Name ,
p.prd_Price ,
r.rev_Rating ,
r.rev_Comment
order by lowest_Rating asc
limit 3
;

 
 -- Q19 Find customers who reviewed a product with rating 5. ( subQuerries ) 
 
SELECT 
    cst_ID,
    cst_Name
FROM Customers
WHERE cst_ID IN
(
    SELECT cst_ID
    FROM Reviews
    WHERE rev_Rating = 5
);
 
 -- Q20 List every product with its category and discount amount. (Inner join ) 
 
 select 
 p.prd_Name,
 p.prd_Price,
 c.cat_Name,
 d.dis_Amount 
 from Products p 
 inner join Categories c 
 on p.cat_ID = c.cat_ID 
 inner join Discounts d 
 on d.prd_ID = p.prd_ID ;
 
 -- Q21 Find customers who purchased products from the "Smartphones" category. 
 
 select 
    c.cst_ID,
    c.cst_Name,
    p.prd_Name,
    cat.cat_Name
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
INNER JOIN Categories cat
    ON p.cat_ID = cat.cat_ID
WHERE cat.cat_Name = 'Smartphones';

-- Q22 Display products along with their average review ratings. 
select  
p.prd_Name,
p.prd_Price,
avg(r.rev_Rating) as avg_Rating 
from Products p 
left join  Reviews r 
on r.prd_ID = p.prd_ID 
group by p.prd_Name,p.prd_Price ;

-- Q23 Find products whose price is greater than the average product price. 

select
prd_ID , 
prd_Name
from Products p1
where prd_Price > 
(         select avg(prd_Price) 
          from Products p2 
          );
          
-- Q24  Find customers who purchased the most expensive product.
select 
c.cst_Name,
c.cst_Email,
o.ord_ID,
od.od_ID,
p.prd_ID,
p.prd_Name,
p.prd_Price
from Customers c
inner join Orders o 
on c.cst_ID = o.cst_ID
inner join OrderDetails od
on  o.ord_ID = od.od_ID
inner join Products p 
on od.prd_ID = p.prd_ID 
where prd_Price = 
(       select max(prd_Price ) 
        from Products );
        
-- Q25  Find customers who purchased the most cheapest product  joins + subquerry 

select 
c.cst_Name,
c.cst_Email,
o.ord_ID,
od.od_ID,
p.prd_ID,
p.prd_Name,
p.prd_Price
from Customers c
inner join Orders o 
on c.cst_ID = o.cst_ID
inner join OrderDetails od
on o.ord_ID = od.ord_ID 
inner join Products p 
on od.prd_ID = p.prd_ID 
where prd_Price = 
(       select min(prd_Price ) 
        from Products );

-- Q26 Find the top 5 customers who spent the most money.  ( Sara Ahmed,Ali Khan,Lily Nelson,David Martin,Ava Thompson ) 
select 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
ORDER BY Total_Spent DESC
LIMIT 5;

-- Q27 Display all products that have never been ordered. ( used subquerry  not in ) 

select prd_ID,prd_Name
from Products 
where prd_ID not in 
( 
      select prd_ID 
      from OrderDetails 
	);

-- Q28 Display customers who have not placed any orders.
SELECT 
c.cst_ID,
c.cst_Name
FROM Customers c 
LEFT JOIN Orders o 
ON c.cst_ID = o.cst_ID
WHERE o.ord_ID IS NULL;

-- Q29 Find customers who purchased products above ₹30000.
select 
c.cst_ID,
c.cst_Name,
p.prd_ID,
p.prd_Name,
prd_Price,
r.rev_Rating
from Customers c 
inner join  Reviews r
on c.cst_ID = r.cst_ID
inner join Products p 
on r.prd_ID = p.prd_ID 
where prd_Price > 30000;

-- Q30 Find products whose stock quantity is above average stock 

select 
prd_Name,prd_StockQuantity
from Products p1
where prd_StockQuantity > 
(   
   select avg(prd_StockQuantity)
   from Products p2
);
   
-- Q31 Display products with discounts greater than ₹100.
select 
p.prd_ID,
p.prd_Name,
p.prd_Price,
d.dis_Amount
from Products p 
inner join Discounts d
on p.prd_ID = d.prd_ID 
where d.dis_Amount > 100 ;

-- Q32 Display total spending of each customer. 
select 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name;

-- Q33-- weekday revenue 
select 
year(o.ord_date) as year ,
weekday(o.ord_Date) as totaklk_Week ,
sum(od.od_Quantity * p.prd_Price ) as total_revenue 
from Orders o 
inner join OrderDetails od
on o.ord_ID = od.ord_ID 
inner join Products p 
on od.prd_ID = p.prd_ID 
group by year(o.ord_date)  ,
weekday(o.ord_Date) ;

-- Q34 Display  spending of each customer who spent above 100k 
select 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
having Total_Spent > 100000;

-- Q35 Display customer who spent the most 
select 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
order by Total_Spent desc
limit 1;

-- Q36 Display customer who spent the lowest 
select 
    c.cst_ID,
    c.cst_Name,
    SUM(od.od_Quantity * p.prd_Price) AS Total_Spent
FROM Customers c
INNER JOIN Orders o
    ON c.cst_ID = o.cst_ID
INNER JOIN OrderDetails od
    ON o.ord_ID = od.ord_ID
INNER JOIN Products p
    ON od.prd_ID = p.prd_ID
GROUP BY c.cst_ID, c.cst_Name
order by Total_Spent asc
limit 1;

-- Q37  Display the most sold product. ( used inner join, group by , limit , desc) 
 select 
 p.prd_Name,
 p.prd_Price,
 sum(o.od_Quantity) as total_sold 
 from Products p 
 inner join OrderDetails o 
 on p.prd_ID = o.prd_ID 
 group by p.prd_Name , p.prd_Price 
 order by total_sold desc 
 limit 1 ;
 
 -- Q38  Display the least sold product. ( used inner join, group by , limit , asc) 
 select 
 p.prd_Name,
 p.prd_Price,
 sum(o.od_Quantity) as total_sold 
 from Products p 
 inner join OrderDetails o 
 on p.prd_ID = o.prd_ID 
 group by p.prd_Name , p.prd_Price 
 order by total_sold asc
 limit 1 ;
 
-- Q39 Display categories with the total number of products in each category.
select 
c.cat_ID,
c.cat_Name,
count(p.prd_ID) as total_products
from Categories c
left join Products p
on c.cat_ID = p.cat_ID
group by c.cat_ID, c.cat_Name;
 

-- Q40 Display orders with customer names and total quantity of products ordered.
select 
o.ord_ID,
c.cst_Name,
sum(od.od_Quantity) as total_quantity
from Orders o
inner join Customers c
on o.cst_ID = c.cst_ID
inner join OrderDetails od
on o.ord_ID = od.ord_ID
group by o.ord_ID, c.cst_Name;

-- Q41 Find products that have never received any reviews.

select 
prd_ID,
prd_Name
from Products  
where prd_ID not in 
( 
      select prd_ID 
      from Reviews 
);
 
-- Q42 Display product names and create a stock status:
select 
prd_ID,
prd_Name,
prd_StockQuantity,
case 
	when  prd_StockQuantity > 50 then "Available"
    when  prd_StockQuantity <= 50 and  prd_StockQuantity > 10 then "Low Stock"
    when  prd_StockQuantity <10 then "Out of Stock"
    end as stock_status
from Products ;

-- Q43 Display products and apply discount category: 
select 
prd_ID,
prd_Name,
prd_Price,
case
    when prd_Price > 5000 then 'High Price Product'
    when prd_Price between 2000 and 5000 then 'Medium Price Product'
    else 'Budget Product'
end as price_category
from Products;

-- Q44 Find the average price of all products. 
select 
avg(prd_Price) as avg_Price 
from Products ;

-- Q45  Find the total quantity of all products sold.
select 
sum(od_Quantity) as total_Quantity 
from OrderDetails ;

-- Q46 Find the average stock quantity of all products. 
select 
    avg(prd_StockQuantity) as avg_stock_quantity
from Products ;

-- Q47  Display the highest product price 
select 
max(prd_Price) as Highest_Price
from Products ;

-- Q48  Display the lowest product price 
select 
min(prd_Price) as Highest_Price
from Products ;

-- Q49 Display the total stock quantity of all products.
select 
sum(prd_StockQuantity) as total_stock_quantity
from Products ;

-- Q50  Display the total number of reviews given by customers. 
select 
count(rev_ID) as total_no_reviews 
from Reviews ;






