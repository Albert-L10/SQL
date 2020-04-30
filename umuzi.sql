CEATE database umuzi;

CREATE TABLE `umuzi`.`customer` (
  `CustomerID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Gender` varchar(45) DEFAULT NULL,
  `Address` varchar(200) DEFAULT NULL,
  `Phone` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `City` varchar(20) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `Address_UNIQUE` (`Address`)
) ;


INSERT INTO  `umuzi`.`customer` VALUES ('John','Hibert','Male','244 chaucer st','84789657','john@gmail.com','Johannesburg','South Africa'),
('Thando',' Sithole','Female','240 Sect 1','0794445584','thando@gmail.com','Cape Town','South Africa'),
('Leon','Glen','Male','81 Everton Rd,Gillits','820832830','Leon@gmail.com','Durban','South Africa'),
('Charl','Muller','Male','290A Dorset Ecke','+44856872553','Charl.muller@yahoo.com','Berlin','Germany'),
('Julia','Stein','Female','2 Wernerring','+4485672445058','Js234@yahoo.com','Frankfurt','Germany');


CREATE TABLE  `umuzi`.`employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `JobTittle` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
);



INSERT INTO   `umuzi`.`employees` VALUES ('Kani','Matthew','mat@gmail.com','Manager'),
('Lesly','Cronje','LesC@gmail.com','Clerk'),
('Gideon','maduku','m@gmail.com','Accountant');



CREATE TABLE  `umuzi`.`orders` (
  `OrderID` int NOT NULL AUTO_INCREMENT,
  `ProductID` int NOT NULL,
  `PaymentID` int NOT NULL,
  `FulFilledByEmployeeID` int NOT NULL,
  `DateRequired` date DEFAULT NULL,
  `DateShipped` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `_idx` (`FulFilledByEmployeeID`),
  CONSTRAINT `FulFilledByEmployeeID` FOREIGN KEY (`FulFilledByEmployeeID`) REFERENCES `employees` (`EmployeeID`)
); 


INSERT INTO  `umuzi`.`orders` VALUES (1,1,2,'2018-09-05',NULL,'Not shipped'),
(1,2,2,'2018-09-04','2018-09-03','Shipped'),
(3,3,3,'2018-09-06',NULL,'Not shipped');

CREATE TABLE  `umuzi`.`payments` (
  `CustomerID` int NOT NULL,
  `PaymentsID` int NOT NULL AUTO_INCREMENT,
  `PaymentDate` date DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`PaymentsID`),
  KEY `CustomerID_idx` (`CustomerID`),
  CONSTRAINT `CustomerID` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
);


INSERT INTO  `umuzi`.`payments` VALUES (1,'2018-09-01',150.75),
(5,'2018-09-03',150.75),
(4,'2018-09-03',700.60);


CREATE TABLE  `umuzi`.`products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) DEFAULT NULL,
  `Description` varchar(300) DEFAULT NULL,
  `BuyPrice` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`productID`),
  CONSTRAINT `productID` FOREIGN KEY (`productID`) REFERENCES `orders` (`OrderID`)
); 

INSERT INTO  `umuzi`.`products` VALUES ('Harly Davidson Chopper','This replica features working kickstand, front suspension, gear-shift lever',150.75),
('Classic Car','Turnable front wheels, steering function',550.75),
('Sports car','Turnable front wheels, steering function',700.60);

