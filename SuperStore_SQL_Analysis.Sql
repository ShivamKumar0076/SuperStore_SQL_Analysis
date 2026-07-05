Create Table SuperStore(Category Varchar(150),
						City Varchar(100),
						Country Varchar(150),
						CustomerID Varchar (130),
						CustomerName Varchar(150),
						Discount Numeric(12,2),
						Market Varchar (120),
						Order_Date Date,
						OrderID Varchar (130),
						OrderPriority Varchar (130),
						ProductID Varchar (140),
						ProductName Varchar (140),
						Profit Numeric(12,2),
						Quantity Int,
						Region Varchar (130),
						RowID Int,
						Sales Numeric(12,2),
						Segment Varchar (130),
						Ship_Date Date,
						Ship_Mode Varchar(150),
						Shipping_Cost Numeric(12,2),
						State Varchar(140),
						SubCategory Varchar (150),
						Year Int,
						Market2 Varchar(150),
						weeknum Int
						)

Select * From Superstore

Copy Superstore
From 'C:\temp\ProjectSuperStore.csv'
With (
		Format Csv,
		Header True, 
		Delimiter ',' )

Select * From Superstore
Limit 1

Select Count(*) From SuperStore

Select * From SuperStore
Limit 10

Select Distinct Category from Superstore

--- Total Numbers OF Orders
Select Count(*) As Total_Order From Superstore 

--- Total Sales
Select Sum(Sales) As Total_Sales From Superstore 

--- Total Profit
Select Sum(Profit) AS Total_Profit From Superstore

---Avg Discount
Select Round(Avg(Discount),2) As Avg_Discount From Superstore

--- Unique Customer
Select Count(Distinct CustomerID) as Unique_Customer From SuperStore

--- Unique Product
Select  Count(Distinct ProductID) as Unique_Product from Superstore

--- Unique City
Select Count(Distinct City) as Unique_City From Superstore

--- Unique Country
Select Count(Distinct Country) as Unique_Country From Superstore

--- Unique Region
Select Count(Distinct Region) as Unique_Region From Superstore

--- Unique Markets
Select Count(Distinct Market) as Unique_Market From Superstore

--- Shipping Modes Used By Company
Select Distinct Ship_Mode AS Ship_Modes From Superstore

---Product Category
Select Distinct Category As Product_Category from Superstore

---Product Sub Categories
Select Distinct SubCategory as Sub_Categories From Superstore

---Higest Sales Value
Select Max(Sales) as Higest_Sales_Value from Superstore

---Category Wise Sales
Select Category,Sum(Sales) as Total_Sales 
From Superstore
Group By Category
Order By Sum(Sales) Desc

--- Category Wise Profit
Select Category,Sum(Profit) as Total_Profit
From Superstore
Group By Category
Order By Sum(Profit) Desc

--- TOP 10 Customers By Total_Sales
Select CustomerID,CustomerName,Sum(Sales) As Total_Sales
From Superstore
Group By CustomerID,CustomerName
Order By Sum(Sales) Desc
Limit 10

--- Top 10 Customers By Total Profit
Select CustomerID,CustomerName,Sum(Profit) as Total_Profit
From Superstore
Group By CustomerID,CustomerName
Order By Sum(Profit) Desc
Limit 10

--- Top 10 Products By Total Sales
Select ProductID,ProductName,Sum(Sales) as Total_Sales
From Superstore
Group By ProductiD,ProductName
Order By Sum(Sales) Desc
Limit 10

--- Top 10 Products By Total Profit
Select ProductID,ProductName,Sum(Profit) as Total_Profit
From Superstore
Group By ProductiD,ProductName
Order By Sum(Profit) Desc
Limit 10

---Top 10 Cities By Total Sales
Select City,Sum(Sales) as Total_Sales
From Superstore
Group By City
Order By Sum(Sales) Desc
Limit 10

--- Top 10 Cities By Profit
Select City,Sum(Profit) as Total_Profit
From Superstore
Group By City
Order By Sum(Profit) Desc
Limit 10

--- Top 10 Countries By Sales
Select Country,Sum(Sales) as Total_Sales
From Superstore
Group By Country
Order By Sum(Sales) Desc
Limit 10

---Top 10 Countries By Profit
Select Country,Sum(Profit) as Total_Profit
From Superstore
Group By Country
Order By Sum(Profit) Desc
Limit 10

--- Top 10 Customers By Total Orders
Select CustomerID,CustomerName,Count(Distinct OrderId) as Total_Order
From Superstore
Group By CustomerID,CustomerName
Order By Count(Distinct OrderID) Desc
Limit 10

--- Top 10 Products by Number Of Orders
Select ProductID,ProductName,Count(Distinct OrderId) as Total_Order
From Superstore
Group By ProductID,ProductName
Order By Count(Distinct OrderID) Desc
Limit 10

--- Top 10 Customers By Sales in Technology Category
Select CustomerID,CustomerName,Category,Sum(Sales) as Total_Sales
From Superstore
Where Category = 'Technology'
Group By CustomerID,CustomerName,Category
Order By Sum(Sales) Desc 
Limit 10

--- Top 10 Customers By Profit In Furniture Category
Select CustomerID,CustomerName,Category,Sum(Profit) as Total_Profit
From Superstore
Where Category = 'Furniture'
Group By CustomerID,CustomerName,Category
Order By Sum(Profit) Desc 
Limit 10

--- Top 10 Customers By Numbers Of Orders in Office Supplies
Select CustomerID,CustomerName,Category,Count(Distinct OrderID) as Total_Orders
From Superstore
Where Category = 'Office Supplies'
Group By CustomerID,CustomerName,Category
Order By Count(Distinct OrderId) Desc 
Limit 10

--- Top 10 Products By Sales in Office Supplies
Select ProductID,ProductName,Category,Sum(Sales) as Total_Sales
From Superstore
Where Category = 'Office Supplies'
Group By ProductID,ProductName,Category
Order By Sum(Sales) Desc
Limit 10

--- Top 10 Products By Profit in Office Supplies Category
Select ProductID,ProductName,Category,Sum(Profit) as Total_Profit
From Superstore
Where Category = 'Office Supplies'
Group By ProductID,ProductName,Category
Order By Sum(Profit) Desc
Limit 10

--- Top 10 Cities As Per Number Of Orders
Select City,Count(Distinct OrderID) as Total_Order
From Superstore
Group By City
Order By Count(Distinct OrderID) Desc
Limit 10

--- Top 10 Countries As Per Number Of Orders
Select Country,Count(Distinct OrderID) as Total_Order
From Superstore
Group By Country
Order By Count(Distinct OrderID) Desc
Limit 10

--- Top 10 Markets by Total Sales
Select Market, Sum(Sales) as Total_Sales
from SuperStore
Group By Market
Order By Sum(Sales) Desc
Limit 10

--- Top 10 Markets By Total Profit
Select Market, Sum(Profit) as Total_Profit
from SuperStore
Group By Market
Order By Sum(Profit) Desc
Limit 10

--- Top 10 Markets By Number OF Orders
Select Market, Count(Distinct OrderID) as Total_Orders
from SuperStore
Group By Market
Order By Count(Distinct OrderID) Desc
Limit 10

--- Top 10 Customers With The Higest Average Sales Per Order
Select CustomerID,CustomerName,Round(Avg(Sales),2) as AvgSales
from Superstore
Group By CustomerID,CustomerName
Order By Avg(Sales) Desc
Limit 10

--- Customers Whoes Total Sales Are Greater Than The Overall Average Total Sales Per Customer
Select CustomerName,Sales
From (Select CustomerName,Sales,Sum(Sales) as Total_Sales
	  From Superstore
	  Group By CustomerName,Sales
	  )
Where Total_Sales > (Select Avg(Total_Sales)
					 From (Select CustomerName,Sum(Sales) as Total_Sales
					 	   From SuperStore
							Group By CustomerName
							) 
							  )

--- Customers Whoes Total Sales Are In The Top 5 Amoung All Customers
Select  CustomerId,CustomerName,Sum(Sales) as Total_Sales
From SuperStore
Group By CustomerID,CustomerName
Order By Sum(Sales) Desc
Limit 5

---Customer Whoes Total Sales are Greater Then The Total Sales Of the CustomerID --- SM-203204
Select CustomerID,CustomerName,Sum(Sales) as Total_Sales
From SuperStore
Group By CustomerID,CustomerName
Having Sum(Sales) > (Select Sum(Sales)
					 From Superstore
					 Where CustomerID = 'SM-203204')
Order By Total_Sales Desc

---Find All Products Whose Total Sales are Greater Than The Aveage Total Sales of All Products
Select *
From (Select ProductName,Sum(Sales) as TotalSales
	  From Superstore
	  Group By ProductName
	  )
Where TotalSales > (Select Avg(TotalSales)
					From (Select ProductName,Sum(Sales) As TotalSales
						  From Superstore
						  Group By ProductName
						  ))
Order By TotalSales DESC

--- Customers Whoes Total Profit is Greater then the Average Total Profit of all Customers
Select *
From (Select CustomerID,CustomerName,Sum(Profit) as TotalProfit
      From SuperStore
	  Group By CustomerID,CustomerName
	  )
Where TotalProfit > (Select Avg(TotalProfit)
					 From(Select CustomerID,Customername,Sum(Profit) As TotalProfit
					      From Superstore
						  Group By CustomerID,CustomerName))
Order By TotalProfit Desc

--- All Category Whose Total Sales Are Greater Than the Highest Total Sales OF Any Market
Select *
From (Select Market,Sum(Sales) as TotalSales
      From SuperStore
      Group By Market) 

Where TotalSales = (Select Max(TotalSales) as HigestSales
				    From(Select Market,Sum(Sales) as TotalSales
                         From SuperStore
     				     Group By Market ))
Select *
From (Select Category,Sum(Sales) as Total_Sales
      From Superstore
      Group By Category)
Where Total_Sales > (Select Max(TotalSales) as HigestSales
				     From(Select Market,Sum(Sales) as TotalSales
                          From SuperStore
     				      Group By Market ))

--- All Region Whose Total Profit Is Less Than The Average Total Profit Of All Region
Select *
From (Select Region, Sum(Profit) as TotalProfit
	  From Superstore
	  Group By Region
	  ) as T
Where T.TotalProfit =  (Select Avg(TotalProfit) 
					 From (Select Region, Sum(Profit) as TotalProfit
					 		From Superstore
							 Group By Region
							 )) 

--- All Customers Whose Total Sales Are Greater Than THe Average Total Sales Of The Top 10 Customers
Select *
From (Select CustomerID,CustomerName,Sum(Sales) as TotalSales
	  From Superstore
	  Group By CustomerID,CustomerName
	  ) 
Where TotalSales > (Select Round(Avg(TotalSales),2)
                   From (Select CustomerID,CustomerName,Sum(Sales) as TotalSales
             		     From SuperStore
	 				     Group By CustomerID,CustomerName
	  					 Order By TotalSales Desc
	  					 Limit 10))

--- All Customers Whose Total sales are greater then 10000
With CustomerSales as
(Select CustomerID,CustomerName,Sum(Sales) as TotalSales
 From Superstore
 Group by CustomerID,CustomerName)
Select * From CustomerSales
Where TotalSales > 10000

--- Region Whose Total Profit is Greater then the Average of Toal Profit
With RegionProfit as
(Select Region,Sum(Profit) as TotalProfit
From Superstore
Group By Region),

AverageProfit As
(Select Avg(TotalProfit) as Avg_totalProfit
 from RegionProfit)

Select * From RegionProfit
Where TotalProfit > (Select Avg_TotalProfit
					 From AverageProfit
					 )

--- Top 3 Customrs Whose Total Sales are Greater Than The Average Total Sales Of All Customers
With CustomersSales as
(Select CustomerId,CustomerName,Sum(Sales) as TotalSales
From Superstore
Group By CustomerId,CustomerName ),

AverageSales as
(Select Avg(TotalSales) as Avg_TotalSales
From CustomersSales )

Select * From CustomersSales
Where TotalSales > (Select Avg_TotalSales
					From AverageSales)
Order By TotalSales DESC
Limit 3

--- Top 5 Customers Whose Total Profit is Greater Than The Average Profit Of The Top 20 Customer By Profit
With CustomerProfit as 
(Select CustomerID,CustomerName,Sum(Profit) as TotalProfit
 From Superstore
 Group By CustomerID,CustomerName ),

Top_20_Customer as 
(Select * From CustomerProfit
 Order By TotalProfit Desc
 Limit 20),

Avg20_Profit as
(Select Avg(TotalProfit) as AvgProfit20
From Top_20_Customer)

Select * From CustomerProfit
Where TotalProfit > (Select AvgProfit20
					  From Avg20_Profit)
Order By TotalProfit Desc
Limit 5

--- All Customers RowNumber
Select CustomerID,
	   CustomerName,
	   Sales,
	   Row_Number() Over(Order By Sales Desc) As RowNo
From Superstore

--- Customers Partition By Category
Select CustomerID,
	   CustomerName,
	   Category,
	   Sales,
	   Row_Number() Over(Partition By Category Order By Sales Desc) As RowNo
From Superstore

--- Top 3 customers With the highest total sales in each category
With CustomerRank as 
(Select Customerid,
	   CustomerName,
	   Category,
	   Sum(Sales) as TotalSales,
	   Dense_Rank() Over(Partition By Category Order By Sum(Sales) Desc) As Rank_No
From Superstore
Group By CustomerID,CustomerName,Category)
Select * From CustomerRank
Where Rank_No <=3
Order By Category ASC , Rank_No ASC

--- Top 2 Product Name with the highest profit in each market
With Rank as 
(Select ProductiD,
	    ProductName,
	    Market,
	    Sum(Profit) as TotalProfit,
	    Dense_Rank() Over(Partition By Market Order By Sum(Profit) Desc) As RankNo
From Superstore
Group By ProductId,ProductName,Market)
Select * From Rank
Where RankNo <= 2
Order By ProductName,Rankno

--- All Category Top 3 Customers Whoes Having a Highest Sales
With Rank As
(Select CustomerId,
	   CustomerName,
	   Category,
	   Sum(Sales) as TotalSales,
	   Dense_Rank() Over(Partition By Category Order By Sum(Sales) Desc) as RankNo
From Superstore
Group By CustomerID,CustomerName,Category)
Select * From Rank
Where RankNo <=3
Order By Category,RankNo

--- Show previous order sales 
Select Customerid,
	   CustomerName,
	   OrderID,
	   Order_Date,
	   Sales,
	   Lag(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) as Previous_Sales
From Superstore

--- Sales Difference From Previous Sales
Select Customerid,
	   CustomerName,
	   OrderID,
	   Order_Date,
	   Sales,
	   Lag(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) as Previous_Sales,
	   Sales - Lag(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) as Sales_Difference
From Superstore

--- Show the Next Sales OF The Customers
Select CustomerID,
	   CustomerName,
	   OrderID,
	   Order_Date,
	   Sales,
	   Lead(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) As Next_Sales
From SuperStore

--- Customers Current,Previous,Next Sales
Select CustomerId,
	   CustomerName,
	   OrderID,
	   Order_Date,
	   Sales,
	   Lag(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID ) as Previous_Sales,
	   Lead(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) As Next_Sales
From SuperStore

---Every Order Along With The First Sale Made By That Customer
Select CustomerID,
	   CustomerName,
	   Order_Date,
	   Sales,
	   First_Value(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID) as FirstSale
From Superstore

--- Every Order Along With The Last Sale Made By That Customer
Select CustomerID,
	   CustomerName,
	   Order_Date,
	   Sales,
	   Last_Value(Sales) Over(Partition By CustomerID Order By Order_Date,OrderID Rows between unbounded Preceding and Unbounded following) As LastSales
From Superstore

--- Top 5 Customer Who Generated Highest Profit in Each Market
With Customer As
(Select CustomerID,
	   CustomerName,
	   Market,
	   Sum(Profit) as Total_Profit,
	   Dense_Rank() Over(Partition BY Market Order By Sum(Profit) Desc) as RanKNo
From SuperStore
Group By CustomerID,CustomerName,Market)
Select * From Customer
Where RankNo <= 5
Order By Market,RankNo

--- Every Category Customer with the lowest total sales
With Customer as
(Select CustomerID,
	   CustomerName,
	   category,
	   Sum(Sales) as totalSales,
	   Dense_Rank() Over(Partition By Category order by Sum(Sales)) as RankNo
From Superstore
Group By CustomerID,CustomerName,Category)
Select * From Customer
Where RankNo = 1

--- Customers Whose Total Sales Above the Average Sales of Their Own Market
With Total_Sales as 
(Select customerID,
	   CustomerName,
	   Market,
	   Sum(Sales) as TotalSales
From Superstore TS
Group By CustomerID,CustomerName,Market) ,

Avg_TotalSales As 
(Select Market,Round(Avg(TotalSales),2) as AvgSales
From Total_Sales Ats
Group By Market) 

Select * From total_Sales TS
Join Avg_TotalSales ATS
On TS.Market = ATS.Market
Where TS.TotalSales > ATS.AvgSales

--- Top 3 Profitable Products in each Category
With Product as
(Select ProductID,
	   ProductName,
	   Category,
	   Sum(Sales) as TotalSales,
	   Dense_Rank() Over(Partition By Category Order By Sum(Sales) Desc) as RankNO
From SuperStore 
Group By ProductiD,ProductName,Category)
Select * From Product
Where RankNo <= 3

-------------------- Business Summary -----------------------------------------

------ Total Sales 
Select Sum(Sales) as Total_Sales From Superstore 

------- Total Profit
Select Sum(Profit) as Total_Profit From Superstore

------- Profit Margine
Select  Sum(Sales) as TotalSales,
		Sum(Profit) as TotalProfit,
		Round((Sum(Profit)/Sum(Sales))*100,2) as Profit_Margine
From Superstore

------- Best Performing Category
Select Category,
		Sum(Sales) as Total_Profit
From Superstore
Group By Category
Order By Total_Profit DESC
Limit 1

------- Lowest Performing Category
Select Category,
       Sum(Sales) as Total_Sales
From Superstore
Group By Category
Order By Total_Sales
Limit 1

------- Higest Sales Market
Select Market,
       Sum(Sales) as Total_Sales
From Superstore
Group By Market
Order By Total_Sales DESC
Limit 1

------- Lowest Sales Market
Select Market,
       Sum(Sales) as Total_Sales
From Superstore
Group By Market
Order By Total_Sales 
Limit 1

------- Most Profitable Product
Select ProductName,
	   Sum(Sales) as Total_Sales
From Superstore
Group By ProductName
Order By Total_Sales DESC
Limit 1

------- Highest Spending Cuatomer
Select CustomerName,
	   Sum(Sales) as Total_Sales
From Superstore
Group By CustomerName
Order By Total_Sales Desc
Limit 1

------- Top 5 Customers How Much % Contribution 
With Customer as
(Select CustomerID,
        Sum(Sales) as Total_Sales
From Superstore
Group By CustomerID
Order By Total_Sales DESC
Limit 5)

Select CustomerID,
	   Total_Sales,
	   Round(Total_Sales * 100/Sum(Total_Sales) over(),2) As Contribution_Per
From Customer

order by Total_Sales DESC
Limit 5







