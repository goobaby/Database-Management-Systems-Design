USE restaurant


DROP TABLE IF EXISTS Menu;
DROP TABLE IF EXISTS Expenses;
DROP TABLE IF EXISTS Sales;
DROP TABLE IF EXISTS Ingredients;
DROP TABLE IF EXISTS Inventory;
DROP TABLE IF EXISTS Recipe;
DROP TABLE IF EXISTS Chef;

create table Chef
    (
        ChefID      varchar(15),
        nameChef    varchar(45),
        typeChef    varchar(45),
        hourlyRate  numeric(13,2),
        primary key (ChefID)
    );

create table Recipe
	(
    RecipeID		varchar(15),
	Recipe_Name		varchar(45) UNIQUE,
    timeUsed   numeric(13,2),
    priceSold  numeric(13,2),
    class  varchar(25),
    ChefID     varchar(15),
	primary key (RecipeID),
    UNIQUE KEY `RecipeName_UNIQUE` (`Recipe_Name`),
    foreign key (ChefID) references Chef (ChefID) on delete cascade
	);

create table Menu
	(
    MenuID		    varchar(15),
	Menu_name		varchar(45),
	activeStatus	tinyint DEFAULT '0',
    RecipeID    varchar(15),
    foreign key (RecipeID) references Recipe (RecipeID) on delete cascade
	);

create table Inventory
    (
        InventoryID     varchar(15),
        nameIngredient  varchar(50) UNIQUE,
        amount          numeric(13,2),
        unit            varchar(20),
        costPerUnit     numeric(13,2),
        primary key  (InventoryID),
        UNIQUE KEY `nameIngredient_UNIQUE` (`nameIngredient`)
    );

create table Ingredients
    (
        InventoryID     varchar(15),
        RecipeID    varchar(15),
        quantity     numeric(13,2),
        unit    varchar(20),
        foreign key (InventoryID) references Inventory (InventoryID) on delete cascade,
        foreign key (RecipeID) references Recipe (RecipeID) on delete cascade
    );

create table Sales
    (
        SalesID     varchar(15),
        RecipeID    varchar(15),
        quantitySold   numeric(13,2),
        dateSold    date,
        primary key  (SalesID),
        foreign key (RecipeID) references Recipe (RecipeID) on delete cascade
    );

create table Expenses
    (
        ExpensesID      varchar(15),
        nameExpenses    varchar(50),
        catagory        varchar(50),
        amount          numeric(13,2),
        dateSpent       date,
        primary key (ExpensesID)
    );

delete from Menu;
delete from Recipe;
delete from Ingredients;
delete from Chef;
delete from Inventory;
delete from Sales;
delete from Expenses;

insert into Chef values ('83664', 'Gordon', 'Executive', 35.67);
insert into Chef values ('59906', 'Raj', 'Head', 31.41);
insert into Chef values ('78064', 'Bobby', 'Sous', 23.59);
insert into Chef values ('23589', 'Mario', 'Sous', 22.97);
insert into Chef values ('13571', 'Bourdain', 'Saucier', 16.81);
insert into Chef values ('70183', 'Guy', 'Poissonnier', 16.05);
insert into Chef values ('73791', 'Alton', 'Rotisseur', 16.25);
insert into Chef values ('36407', 'Ray', 'Entremetier', 17.19);
insert into Chef values ('75119', 'Giada', 'Legumier', 26.83);
insert into Chef values ('85541', 'Child', 'Potager', 16.36);
insert into Chef values ('91158', 'Wolfgang', 'Patissier', 16.13);
insert into Chef values ('80122', 'Lagasse', 'Boucher', 16.33);
insert into Chef values ('12381', 'Oliver', 'Friturier', 16.80);
insert into Chef values ('38192', 'Deen', 'Grillardin', 16.06);
insert into Chef values ('50213', 'David', 'Garde Manger', 15.28);
insert into Chef values ('29932', 'Marco', 'Tournant', 12.76);
insert into Chef values ('20000', 'Masaharu', 'Tournant', 12.98);
insert into Chef values ('83291', 'Cat', 'Tournant', 13.97);
insert into Chef values ('77777', 'Curtis', 'Commis',14.58);

insert into Recipe values ('000','Roast Chicken', '1.30', 10.22, 'Entree', '73791');
insert into Recipe values ('100','Eggs and Toast', '0.10', 8.22, 'Apps', '80122');
insert into Recipe values ('001','Smoked Salmon', '0.23', 18.27, 'Entree', '70183');
insert into Recipe values ('101','Deviled Eggs', '0.45', 13.42, 'Apps', '80122');
insert into Recipe values ('002','Roast Rack of Lamb', '0.45', 24.49, 'Entree', '73791');
insert into Recipe values ('102','Potato-Onion Soup', '0.25', 13.33, 'Apps', '85541');
insert into Recipe values ('003','Lucy Burger', '0.15', 11.31, 'Entree', '38192');
insert into Recipe values ('103','Yellow Bean Salad', '0.10', 17.80, 'Apps', '75119');
insert into Recipe values ('004','Cider-Glazed Turkey', '3.30', 17.85, 'Entree', '73791');
insert into Recipe values ('104','Encrusted Tempura Shrimp', '0.30', 24.89, 'Apps', '12381');
insert into Recipe values ('005','Tennessee Pork Ribs', '1.30', 14.50, 'Entree', '38192');
insert into Recipe values ('105','Blue-Cheese Potato Salad', '0.05', 11.96, 'Apps', '50213');
insert into Recipe values ('006','Free Form Basil Lasagna', '0.50', 20.60, 'Entree', '77777');
insert into Recipe values ('106','Ham and Bean Stew', '0.45', 19.82, 'Apps', '13571');
insert into Recipe values ('200','Spiced Brandy Truffles', '0.30', 11.52, 'Dessert', '91158');
insert into Recipe values ('201','Double-Chocolate Raspberry Creams', '0.15', 25.64, 'Dessert', '91158');
insert into Recipe values ('202','Coconut Cashew Pralines', '0.30', 18.28, 'Dessert', '91158');

insert into Menu values('001','Sunday Brunch', 0, '000');
insert into Menu values('001','Sunday Brunch', 0, '001');
insert into Menu values('001','Sunday Brunch', 0, '002');
insert into Menu values('001','Sunday Brunch', 0, '100');
insert into Menu values('001','Sunday Brunch', 0, '101');
insert into Menu values('001','Sunday Brunch', 0, '102');
insert into Menu values('001','Sunday Brunch', 0, '202');

insert into Menu values('002','Mid-Summer', 1, '003');
insert into Menu values('002','Mid-Summer', 1, '004');
insert into Menu values('002','Mid-Summer', 1, '006');
insert into Menu values('002','Mid-Summer', 1, '103');
insert into Menu values('002','Mid-Summer', 1, '104');
insert into Menu values('002','Mid-Summer', 1, '105');
insert into Menu values('002','Mid-Summer', 1, '200');

insert into Inventory values('0001', 'Chicken Beast', 19, 'lbs', 7.38);
insert into Inventory values('0002', 'Salmon', 17, 'lbs', 5.49);
insert into Inventory values('0003', 'Egg', 45, 'eggs', 6.04);
insert into Inventory values('0004', 'Bread', 30, 'loafs', 8.16);
insert into Inventory values('0005', 'Lamb', 25, 'lbs', 7.92);
insert into Inventory values('0006', 'Potato', 35, 'lbs', 7.70);
insert into Inventory values('0007', 'Onion', 23, 'lbs', 4.05);
insert into Inventory values('0008', 'Ground Beef', 13, 'lbs', 8.35);
insert into Inventory values('0009', 'Cheddar', 9, 'lbs', 6.36);
insert into Inventory values('0010', 'Yellow Bean', 40, 'lbs', 2.51);
insert into Inventory values('0011', 'Turkey', 21, 'lbs', 2.15);
insert into Inventory values('0012', 'Cider', 36, 'fl. oz.', 7.86);
insert into Inventory values('0013', 'Tempura Batter', 21, 'lbs', 2.51);
insert into Inventory values('0014', 'Shrimp', 41, 'lbs', 4.38);
insert into Inventory values('0015', 'Blue Cheese', 11, 'lbs', 8.22);
insert into Inventory values('0016', 'Lasagna Pasta', 21, 'lbs', 6.52);
insert into Inventory values('0017', 'Mozzarella', 26, 'lbs', 6.52);
insert into Inventory values('0018', 'Pork Belly', 14, 'lbs', 5.76);
insert into Inventory values('0019', 'Pork Ribs', 14, 'lbs', 6.68);
insert into Inventory values('0020', 'Black Bean', 41, 'lbs', 6.90);
insert into Inventory values('0021', 'Brandy', 23, 'fl. oz.', 8.94);
insert into Inventory values('0022', 'Truffles', 41, 'lbs', 4.12);
insert into Inventory values('0023', 'Chocolate', 21, 'lbs', 6.67);
insert into Inventory values('0024', 'Raspberry', 32, 'lbs', 6.36);
insert into Inventory values('0025', 'Heavy Cream', 13, 'fl. oz.', 1.50);
insert into Inventory values('0026', 'Coconut', 38, 'coconuts', 8.17);
insert into Inventory values('0027', 'Cashew', 41, 'lbs', 4.13);
insert into Inventory values('0028', 'Sugar', 39, 'lbs', 2.26);
insert into Inventory values('0029', 'Raw Rats', 200, 'rats', 0.00);

insert into Ingredients values('0001','000', 1.0, 'lbs');
insert into Ingredients values('0006','000', 0.3, 'lbs');
insert into Ingredients values('0007','000', 0.12, 'lbs');
insert into Ingredients values('0002','001', 1.0, 'lbs');
insert into Ingredients values('0005','002', 0.3, 'lbs');
insert into Ingredients values('0008','003', 0.25, 'lbs');
insert into Ingredients values('0009','003', 0.01, 'lbs');
insert into Ingredients values('0011','004', 0.10, 'lbs');
insert into Ingredients values('0012','004', 0.3, 'fl. oz.');
insert into Ingredients values('0019','005', 0.41, 'lbs');
insert into Ingredients values('0017','006', 0.31, 'lbs');
insert into Ingredients values('0016','006', 0.23, 'lbs');
insert into Ingredients values('0003','100', 2.0, 'eggs');
insert into Ingredients values('0004','100', 0.05, 'loafs');
insert into Ingredients values('0003','101', 6.0, 'eggs');
insert into Ingredients values('0006','102', 0.30, 'lbs');
insert into Ingredients values('0007','102', 0.30, 'lbs');
insert into Ingredients values('0010','103', 1.04, 'lbs');
insert into Ingredients values('0013','104', 0.2, 'lbs');
insert into Ingredients values('0014','104', 2.21, 'lbs');
insert into Ingredients values('0015','105', 0.21, 'lbs');
insert into Ingredients values('0006','105', 0.32, 'lbs');
insert into Ingredients values('0018','106', 0.31, 'lbs');
insert into Ingredients values('0020','106', 0.23, 'lbs');
insert into Ingredients values('0028','200', 1.09, 'lbs');
insert into Ingredients values('0021','200', 0.27, 'fl. oz.');
insert into Ingredients values('0022','200', 1.10, 'lbs');
insert into Ingredients values('0023','201', 0.34, 'lbs');
insert into Ingredients values('0024','201', 0.23, 'lbs');
insert into Ingredients values('0025','201', 0.11, 'fl. oz.');
insert into Ingredients values('0028','201', 0.91, 'lbs');
insert into Ingredients values('0026','202', 0.50, 'coconuts');
insert into Ingredients values('0027','202', 0.23, 'lbs');
insert into Ingredients values('0028','202', 0.31, 'lbs');

insert into Sales values('100000','000', 21, '2021-01-01');
insert into Sales values('100001','001', 9, '2021-01-02');
insert into Sales values('100002','105', 10, '2021-02-12');
insert into Sales values('100003','003', 22, '2021-02-20');
insert into Sales values('100004','106', 1, '2021-03-13');
insert into Sales values('100005','200', 7, '2021-03-30');
insert into Sales values('100006','102', 10, '2021-04-01');
insert into Sales values('100007','006', 24, '2021-06-07');
insert into Sales values('100008','104', 19, '2021-09-11');
insert into Sales values('100009','002', 11, '2021-10-21');
insert into Sales values('100010','201', 19, '2021-11-13');
insert into Sales values('100011','003', 22, '2021-12-09');

insert into Expenses values('200000', 'Electric', 'Utilites', 2000.99, '2021-03-08');
insert into Expenses values('200001', 'Electric', 'Utilites', 1092.79, '2021-04-08');
insert into Expenses values('200005', 'Food Tax', 'Taxes', 90.99, '2021-05-03');
insert into Expenses values('200002', 'Employees', 'Wages', 700.99, '2021-05-02');
insert into Expenses values('200006', 'Food Tax', 'Taxes', 90.99, '2021-10-03');
insert into Expenses values('200003', 'Lawsuit', 'Law', 90.99, '2021-07-28');
insert into Expenses values('200004', 'Food Tax', 'Taxes', 90.99, '2021-12-25');

DROP VIEW IF EXISTS unassignedChefs;
DROP FUNCTION IF EXISTS costOfRest;
DROp PROCEDURE IF EXISTS taxEvasion;

CREATE VIEW unassignedChefs AS
SELECT Chef.nameChef AS `Names`, Chef.typeChef AS `Jobs`, Chef.hourlyRate AS `Wage`
FROM Chef
LEFT JOIN Recipe
ON Chef.ChefID = Recipe.ChefID
WHERE Recipe.ChefID IS NULL;

DELIMITER //
CREATE FUNCTION costOfRest
(
    dateToLookAt    date
)
RETURNS DECIMAL(13,2) SIGNED
BEGIN
    DECLARE gains DECIMAL(13,2) SIGNED;
    DECLARE losses DECIMAL(13,2) SIGNED;
    DECLARE total DECIMAL(13,2) SIGNED;

    SELECT SUM(s.quantitySold * Recipe.priceSold)
    INTO gains
    FROM Sales s
    JOIN Recipe
    ON Recipe.RecipeID = s.RecipeID
    WHERE s.dateSold <= dateToLookAt;

    SELECT SUM(amount)
    INTO losses
    FROM Expenses
    WHERE dateSpent <= dateToLookAt;

    SET total = gains - losses;

    RETURN total;

END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE taxEvasion
(
    IN dateToCheck DATE,
    OUT output VARCHAR(200)
)
BEGIN
    DECLARE taxesPaid BOOLEAN DEFAULT FALSE;

    SET taxesPaid = (SELECT EXISTS (
        SELECT *
        FROM Expenses
        WHERE catagory = 'Taxes'
        AND dateSpent BETWEEN DATE_ADD(dateToCheck, Interval -1 MONTH) AND dateToCheck
    ));
  	
    IF taxesPaid THEN
    	SET output = CONCAT('Taxes Paid month previous to: ', dateToCheck);
    ELSEIF NOT taxesPaid THEN
    	SET output = CONCAT('Taxes NOT Paid month previous to: ', dateToCheck);    
  	END IF;
END //
DELIMITER ;
