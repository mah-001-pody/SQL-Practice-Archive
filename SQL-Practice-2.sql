-- Phần 1: Khám Phá & Lọc Giao Dịch Bán Hàng

-- Bài tập 1: Xem tất cả các cột của một giao dịch bán hàng cụ thể
select SalesOrderNumber
from FactInternetSales
-- End

-- Bài tập 2: Liệt kê các giao dịch bán hàng từ một ngày cụ thể
select OrderDate
, SalesOrderNumber
, SalesAmount
, OrderQuantity
from FactInternetSales
where OrderDate = '2013-01-01'
-- End

-- Bài tập 3: Tìm các giao dịch có tổng doanh số vượt quá một ngưỡng nhất định
select SalesOrderNumber
, OrderDate
, SUM(SalesAmount) as TotalSalesAmount
, SUM(OrderQuantity) as TotalOrderQuantity
from FactInternetSales
group by SalesOrderNumber
, OrderDate
having SUM(SalesAmount) > 5000
-- End

-- Bài tập 4: Lọc các giao dịch trong một khoảng thời gian nhất định
select OrderDate
, SalesOrderNumber
, SalesAmount
from FactInternetSales
where OrderDate >= '2013-01-01'
and OrderDate <= '2013-03-31'
-- End

-- Bài tập 5: Tìm các giao dịch có PromotionKey cụ thể và số lượng đặt hàng lớn
select SalesOrderNumber
, PromotionKey
, OrderQuantity
, SalesAmount
from FactInternetSales
where PromotionKey = 1
and OrderQuantity > 2
-- End

-- Phần 2: Sắp xếp & Giới Hạn Kết Quả

-- Bài tập 6: Sắp xếp các giao dịch theo số lượng đặt hàng giảm dần
select OrderDate
, SalesOrderNumber
, OrderQuantity
, SalesAmount
from FactInternetSales
order by OrderQuantity DESC
-- End

-- Bài tập 7: Sắp xếp các giao dịch theo ngày đặt hàng và sau đó theo tổng doanh số
select OrderDate
, SalesOrderNumber
, SalesAmount
from FactInternetSales
order by OrderDate 
, SalesAmount DESC
-- End

-- Bài tập 8: Liệt kê 15 giao dịch bán hàng có doanh số cao nhất
select Top 15 SalesOrderNumber
, OrderDate
, SalesAmount
from FactInternetSales
order by SalesAmount DESC
-- End

-- Phần 3: Tổng Hợp Dữ Liệu

-- Bài tập 9: Tính tổng doanh số và tổng số lượng sản phẩm bán được
select Sum(SalesAmount) as TotalRevenue
, Sum(OrderQuantity) as TotalProductsSold
from FactInternetSales
-- End

-- Bài tập 10: Tính giá trị trung bình của mỗi đơn hàng
select AVG(SalesAmount) as AverageOrdẻValue
from FactInternetSales
-- End

-- Bài tập 11: Tìm ngày giao dịch sớm nhất và muộn nhất
select Min(OrderDate) as EarliestOrderDate
, Max(OrderDate) as LatestOrderDate
from FactInternetSales
-- End

-- Phần 4: Nhóm Dữ Liệu & Lọc Nhóm

-- Bài tập 12: Tính tổng doanh thu theo số ngày đặt hàng
select OrderDate 
, Sum(SalesAmount) as DailySales
from FactInternetSales
group by OrderDate
-- End

-- Bài tập 13: Đếm số lượng đơn hàng theo khách hàng
select CustomerKey
, Count(SalesOrderNumber) as NumberofOrders
from FactInternetSales 
group by CustomerKey
-- End 

-- Bài tập 14: Tìm các ngày có tổng doanh số vượt quá 100.000 USD
select sum(SalesAmount) as DailySales
, OrderDate
from FactInternetSales
group by OrderDate
having sum(SalesAmount) > 100000
order by DailySales DESC
-- End

-- Bài tập 15: Tính doanh số trung bình cho các ProductKey có hơn 50 đơn hàng
select Avg(SalesAmount) as AverageSalesperProduct
, count(SalesOrderNumber) as NumberofOrders
, ProductKey
from FactInternetSales
group by ProductKey
having count(SalesOrderNumber) > 50
order by Avg(SalesAmount) DESC
-- End

-- Bài tập 16: Đếm số lượng sản phẩm khác nhau được bán trong mỗi tháng của năm 2013
select count(distinct(ProductKey)) as NumberofUniqueProducts
, Month(OrderDate) as OrderMonth
from FactInternetSales
where OrderDate > '2012-12-31'
and OrderDate < '2014-01-01'
group by Month(OrderDate)
-- End

-- Bài tập 17:Liệt kê các ProductKey có tổng số lượng bán được ít hơn 100 trong năm 2014
select ProductKey
, Sum(OrderQuantity) as TotalQuantity
from FactInternetSales 
where OrderDate > '2013-12-31'
and OrderDate < '2015-01-01'
group by ProductKey
having count(SalesOrderNumber) < 100 
order by Sum(OrderQuantity) 
-- End

-- Bài tập 18: Tính tổng doanh thu theo tháng và năm cho các đơn hàng có giá trị cao
select sum(SalesAmount) as TotalSales
, month(OrderDate) as OrderMonth
, year(OrderDate) as OrderYear
from FactInternetSales 
where SalesAmount >= 500
group by month(OrderDate)
, year(OrderDate)
-- End

-- Bài tập 19: Tính tổng doanh số theo quý trong từng năm
select Year(OrderDate) as OrderYear
, DatePart(Quarter, OrderDate) as OrderQuarter
, sum(SalesAmount) as TotalSale
from FactInternetSales 
group by DatePart(Quarter, OrderDate)
, Year(OrderDate)
-- End

-- Bài tập 20: Tính tổng doanh số và số lượng đơn hàng theo PromotionKey
select Sum(SalesAmount) as TotalSales
, Count(SalesOrderNumber) as NumberofOrders
, PromotionKey
from FactInternetSales
group by PromotionKey
-- End




