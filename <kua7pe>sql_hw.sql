SELECT name FROM country WHERE Continent = "South America";

SELECT population FROM country where name = "Germany";

SELECT city.Name FROM city JOIN country on city.CountryCode = country.Code WHERE country.Name = "Japan";

SELECT name from country WHERE Region = "Eastern Africa" ORDER BY population DESC LIMIT 3;

SELECT name, lifeexpectancy from country where population >= 1000000 AND population <= 5000000;

select name from country JOIN countrylanguage ON country.code = countrylanguage.CountryCode WHERE countrylanguage.Language = "French" AND countrylanguage.IsOfficial = "T";

SELECT title from Album JOIN Artist on Album.ArtistId = Artist.ArtistId WHERE Artist.Name = "AC/DC";

SELECT FirstName, LastName, Email FROM Customer WHERE Country = "Brazil";

SELECT name from Playlist;

SELECT COUNT(*) FROM Track JOIN Genre ON Track.GenreId = Genre.GenreId WHERE Genre.Name = "Rock";

SELECT FirstName, LastName FROM Employee WHERE ReportsTo = (SELECT EmployeeId FROM Employee WHERE LastName = "Edwards" AND FirstName = "Nancy");

SELECT Customer.FirstName, Customer.LastName, Sum(Invoice.Total) AS TotalSales from Customer JOIN Invoice ON Customer.CustomerId = Invoice.CustomerId GROUP BY Customer.FirstName, Customer.LastName; 

CREATE TABLE products(
    ProductID int NOT NULL PRIMARY KEY, 
    Name varchar(100),
    Price float
);

CREATE TABLE customers(
    CustomerID int NOT NULL PRIMARY KEY, 
    FirstName varchar(100),
    LastName varchar(100)
);

CREATE TABLE sales (
    SaleID int NOT NULL PRIMARY KEY, 
    SaleMonth int,
    SaleDay int, 
    SaleYear int,
    CustomerID int,
    ProductID int,
    CONSTRAINT foreignKeyCustomerID FOREIGN KEY (CustomerID) REFERENCES customers(CustomerID),
    CONSTRAINT foreignKeyProductID FOREIGN KEY (ProductID) REFERENCES products(ProductID)
);

INSERT INTO customers values (1, "Paige", "O'Neil");
INSERT INTO customers values (2, "Sara", "Smith");
INSERT INTO customers values (3, "John", "Daniels");
INSERT INTO customers values (4, "James", "Doe");
INSERT INTO customers values (5, "Steven", "Andrews");

INSERT INTO products values (1, "Perfume", 59.99);
INSERT INTO products values (2, "Candle", 24.99);
INSERT INTO products values (3, "Greeting Card", 4.99);
INSERT INTO products values (4, "Necklace", 84.99);
INSERT INTO products values (5, "Bracelet", 44.99);
INSERT INTO products values (6, "Flowers", 19.99);

INSERT INTO sales VALUES(1,1, 1, 2024, 2,4);
INSERT INTO sales VALUES(2,1, 2, 2024, 1,2);
INSERT INTO sales VALUES(3,2, 14, 2024, 3,6);
INSERT INTO sales VALUES(4,3, 18, 2024, 4,1);
INSERT INTO sales VALUES(5,6, 25, 2024, 3,3);

SELECT Name from products JOIN sales on products.ProductID = sales.ProductID WHERE sales.SaleMonth = 1;

SELECT Price FROM products JOIN sales ON products.ProductID = sales.ProductID WHERE sales.CustomerID = (SELECT CustomerID from customers WHERE FirstName = "Paige" AND LastName = "O'Neil");

SELECT FirstName, LastName FROM customers JOIN sales on customers.CustomerID = sales.SaleID WHERE sales.ProductID = (SELECT ProductID from products WHERE name = "Greeting Card");