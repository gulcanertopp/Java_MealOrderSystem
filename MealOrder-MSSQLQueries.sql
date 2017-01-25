--YENIIII

--MEAL TABLE
CREATE TABLE meal (mealID int identity(100,1),
 mealName varchar(30) not null,
 catID int,
 mealSizeID int,
 mealContent varchar(100) not null,
 mealPrice int not null,
 constraint pk_mealID primary key (mealID));

 ALTER TABLE meal add constraint fkCatID
 foreign key (catID) references categoryOfMeal(catID);
  
 ALTER TABLE meal add constraint fkmealSizeID
 foreign key (mealsizeID) references size(sizeID);

----------------------------------------------------------------------------
 --CATEGORYOFMEAL TABLE

 CREATE TABLE categoryOfMeal(catID int identity(200,1),
 categoryName varchar(20) not null,
 categoryDesc varchar(50),
 constraint pk_catOfMael primary key (catID));
 ----------------------------------------------------------------------------
 --INGREDIENT TABLE
CREATE TABLE ingredient(ingID int identity(100,1),
ingName varchar(30) not null,
ingPrice varchar(10) not null,
constraint pk_ing primary key (ingID));

--QUERY 1 (aynı isimli malzeme 2kere girilemeyecek)----------
ALTER TABLE ingredient							
ADD UNIQUE (ingName)

-----------------------------------------------------------------------------
 --MEALOFINGREDIENT TABLE
 CREATE TABLE mealOfIngredient(mealOfIngID int identity(300,1) primary key,
 mealofIngIngID int,
 mealofIngMealID int);

 ALTER TABLE mealOfIngredient add constraint fkmealOfIngID
 foreign key (mealofIngIngID) references ingredient(ingID);

 ALTER TABLE mealOfIngredient add constraint fkmealOfMealID
 foreign key (mealofIngMealID) references meal(mealID);


--QUERY 2 Aynı meal için aynı ingredient yalnızca bir kere alınabilir------
ALTER TABLE mealOfIngredient							
ADD UNIQUE (mealofIngIngID,mealofIngMealID)
----------------------------------------------------------------------------
--SIZE TABLE
CREATE TABLE size (sizeID int IDENTITY(600,1),
 sizeName varchar(10) not null,
 sizePrice varchar(10) not null,
 );

ALTER TABLE size add constraint pksizeID primary key(sizeID);

---------------------------------------------------------------------------
 --SALE TABLE
 CREATE TABLE sale (saleID int identity(400,1),
 adressID int,
 orderDate smalldatetime not null,
 orderDescription varchar(100));

 
 ALTER TABLE sale add constraint pksale primary key(saleID);
 ALTER TABLE sale add constraint fksaleAdressID
 foreign key (adressID) references adress(adressID);


 --SALEITEM TABLE
 CREATE TABLE saleItem(saleItemID int identity(700,1),
 mealID int,
 mealOfIngID int,
 saleID int,
 quantitiy int not null,
 totalPrice decimal(10,2))
 
 ALTER TABLE saleItem add constraint pksaleItemID primary key(saleItemID);

ALTER TABLE saleItem add constraint fksaleMealID
 foreign key (mealID) references meal(mealID);

ALTER TABLE saleItem add constraint fkmealOfIngIngID
 foreign key (mealOfIngID) references mealOfIngredient(mealOfIngID);   --

ALTER TABLE saleItem add constraint fksaleID
 foreign key (saleID) references sale(saleID);
 
 --CUSTOMER TABLE
 CREATE TABLE customer(customerID int identity(500,1),
 customerName varchar(30) not null,
 customerSurname varchar(30) not null,
 customerPhone varchar(11));

ALTER TABLE customer add constraint pkCustomerID primary key (customerID);

 --ADRESS TABLE
 CREATE TABLE adress(adressID int identity(100,1),
 customerID int,
 streetNo varchar(6) not null,
 doorNo varchar(5) not null,
 township varchar(25) not null,
 county varchar(20) not null,
 adressDesc varchar(100));

ALTER TABLE adress add constraint pkAdressID primary key (adressID);

ALTER TABLE adress add constraint fkAdresscustomerID
 foreign key (customerID) references customer(customerID);

 -----------------------------------------------------------------------------------------------------------------------
--CATEGORY ADD
insert into categoryOfMeal(categoryName,categoryDesc)
values('Pizza','Made thin crust and chick marge');
insert into categoryOfMeal(categoryName)
values('Hamburger');
insert into categoryOfMeal(categoryName)
values('Chicken');
-----------------------------------------------------------------------------------------------------------------------
--INGREDIENT ADD
insert into ingredient(ingName,ingPrice)
values('Mozarella Chesee',3);

insert into ingredient(ingName,ingPrice)
values('Olive',5);

insert into ingredient(ingName,ingPrice)
values('Corn',3);

insert into ingredient(ingName,ingPrice)
values('Cheedar Chesee',5);

insert into ingredient(ingName,ingPrice)
values('Parmesan Chesee',8);

insert into ingredient(ingName,ingPrice)
values('Tomato',2);

insert into ingredient(ingName,ingPrice)
values('Green Peper',3);

insert into ingredient(ingName,ingPrice)
values('Onion',2);

------------------------------------------------------------------------------------------------------------------------
--MEALOFINGREDIENT ADD

insert into mealOfIngredient(mealofIngIngID,mealofIngMealID)    
values(101,100);

insert into mealOfIngredient(mealofIngIngID,mealofIngMealID)    
values(102,103);														

insert into mealOfIngredient(mealofIngIngID,mealofIngMealID)    
values(105,106);

insert into mealOfIngredient(mealofIngIngID,mealofIngMealID)    
values(107,105);


---------------------------------------------------------------------------------------------------------------------------
--SIZE ADD
insert into size(sizeName,sizePrice)
values('Small',0);

insert into size(sizeName,sizePrice)
values('Medium',5);

insert into size(sizeName,sizePrice)
values('Large',7);

--ADRESS ADD
insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(500,'1595/3','16','Karşıyaka','İzmir','Medikal Park sokağı, Gül eczanesinin üstü');

insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(501,'1595/3','16','Karşıyaka','İzmir','Medikal Park sokağı, Gül eczanesinin üstü');

insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(501,'1489','3','Balçova','İzmir','Telefelik yakınında');

insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(502,'1658','11','Konak','İzmir','Atatürk Kültür merkezinin arka tarafı');

insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(1504,'1245','02','Büyük Çekmece','İstanbul','Balıkçının yanı');

insert into adress(customerID,streetNo,doorNo,township,county)
values(1505,'2548','19','Çankaya','Ankara');

insert into adress(customerID,streetNo,doorNo,township,county,adressDesc)
values(1506,'1256','70','Küçükyalı','Balıkesir','Alışveriş merkezi çaprazı');
-------------------------------------------------------------------------------------------------------------------------------
--CUSTOMER ADD

insert into customer(customerName,customerSurname,customerPhone)
values('Gülcan','Ertop','05544788562');

insert into customer(customerName,customerSurname,customerPhone)
values('Emre','Ertop','05364588565')

insert into customer(customerName,customerSurname,customerPhone)
values('Ayla','Ertop','05399888556');

insert into customer(customerName,customerSurname,customerPhone)
values('Alper','Şalvız','05077899885');

insert into customer(customerName,customerSurname,customerPhone)
values('Sema','Ondalı','05422588778');

insert into customer(customerName,customerSurname,customerPhone)
values('Kaan','Tuna','05078854456');

insert into customer(customerName,customerSurname,customerPhone)
values('Anıl','Çetin','0554487785');

insert into customer (customerName,customerSurname,customerPhone)
values ('Nilay','Topçu','05422545454');

---------------------------------------------------------------------------------------------
--SALE ADD
insert into sale(adressID,orderDate,orderDescription)
values(100,'2016-05-10 01:55:10');

insert into sale(adressID,orderDate,orderDescription)
values(100,'2016-04-10 11:45:20');

insert into sale(adressID,orderDate,orderDescription)
values(101,'2016-05-07 15:17:10');

insert into sale(adressID,orderDate)
values(1101,'2016-03-08 14:07:15');
-------------------------------------------------------------------------------------------------
--SALEITEM ADD
insert into saleItem(mealID,mealOfIngID,saleID,quantitiy)
values(100,300,400,2)

insert into saleItem(mealID,mealOfIngID,saleID,quantitiy)
values(103,301,401,1)

insert into saleItem(mealID,mealOfIngID,saleID,quantitiy)
values(108,302,402,3)

insert into saleItem(mealID,mealOfIngID,saleID,quantitiy)
values(108,303,403,3)

insert into saleItem(mealID,mealOfIngID,saleID,quantitiy)
values(103,300,400,3)


insert into saleItem(mealID,saleID,quantitiy)
values(103,400,2)


insert into saleItem(mealID,saleID,quantitiy)
values(108,400,3)
------------------------------------------------------------------------------------------------
--MEAL ADD

--pizza

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(200,'Tuna Pizza',600,'Pizza Sauce, Mozzarella Cheese, Tuna, Corn, G.pepper, Onion',15);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(200,'Mexico Pizza',601,'Pizza Sauce,Tomato, Cheddar Cheese, Mustard, Pepper Mexico',17);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(200,'Margarita Pizza',602,'Pizza Sauce, Mozzarella Cheese, Tomato',13);


--hamburger

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(201,'Cheeseburger',600,' Turkish Bacon, Avocado,Mushroom,Onions,Cheese Sauce',17);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(201,'Chicken Burger',601,'Cajun Spiced, Crispy chicken,Lettuce, Pickles',16);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(201,'Mexican Burger',601,'Beef Patties, Pickles, Tomato, Cheddar Cheese, Mustard, Pepper Mexico',18);

--chicken

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(202,'Chicken Chips',600,'6 Pieces, Coated chicken with crispy spice',15);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(202,'Nuggets',601,'4 Pieces, Paneed chicken pieces with sesame',18);

insert into meal(catID,mealName,mealSizeID,mealContent,mealPrice)
values(202,'China Procedures Chicken',602,'6 Pieces, Sautéed vegetables with soy sauce chicken',20);






			   	