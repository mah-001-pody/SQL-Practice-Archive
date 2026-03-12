-- Phần 1: Khám Khá & Lọc Thông Tin Sản Phẩm

-- Bài tập 1: Liệt kê tất cả sản phẩm đang có
select *
from DimProduct
-- End

-- Bài tập 2: Liệt kê tên sản phẩm và màu sắc
select EnglishProductName
, Color
from dbo.DimProduct
-- End

-- Bài tập 3: Tìm các sản phẩm màu đỏ
select *
from dbo.DimProduct
where Color = 'Red'
-- End

-- Bài tập 4: Tìm các sản phẩm có giá niêm yết lớn hơn 1000
select EnglishProductName
, StandardCost
, ListPrice
from dbo.DimProduct
where ListPrice > 1000
-- End

-- Bài tập 5: Tìm các sản phẩm bắt đầu bằng chữ 'Mountain' và giá niêm yết dưới 500
select EnglishProductName
, ModelName 
, ListPrice 
from dbo.DimProduct
where ModelName LIKE 'Mountain%'
and ListPrice < 500
-- End

-- Bài tập 6: Liệt kê các sản phẩm có trạng thái là 'Current' hoặc 'Reseller'
select EnglishProductName
, ProductLine
, Status
from dbo.DimProduct
where Status = 'Current'
or Status = 'Reseller'
-- End

-- Phần 2: Sắp xếp & Giới Hạn

-- Bài tập 7: Sắp xếp sản phẩm theo giá niêm yết giảm dần
select EnglishProductName
, ListPrice 
from dbo.DimProduct
order by ListPrice DESC
-- End

-- Bài tập 8: Sắp xếp các sản phẩm theo màu sắc tăng dần và sau đó theo giá niêm yết giảm dần
select EnglishProductName
, Color
, ListPrice
from dbo.DimProduct
order by Color
, ListPrice DESC
-- End

-- Bài tập 9: Liệt kê 5 sản phẩm đắt nhất
select top 5 ListPrice
, EnglishProductName
from dbo.DimProduct
order by ListPrice DESC
-- End

-- Phần 3: Tổng Hợp Dữ Liệu

-- Bài tập 10: Tính giá niêm yết trung bình của tất cả sản phẩm
select AVG(ListPrice) as AverageofListPrice
from dbo.DimProduct
-- End

-- Bài tập 11: Tìm giá niêm yết cao nhất và thấp nhất
select Max(ListPrice) as MaxofListPrice
, Min(ListPrice) as MinofListPrice
from dbo.DimProduct 
-- End 

-- Bài tập 12: Đếm tổng số lượng sản phẩm
select Count(ProductKey) as TotalProduct
from dbo.DimProduct 
-- End

-- Phần 4: Nhóm Dữ Liệu & Lọc Nhóm

-- Bài tập 13:
select Count(ProductKey) as ProductbyColor
from dbo.DimProduct 
group by Color 
-- End

-- Bài tập 14:
select Sum(StandardCost) as SumofStandardCostbyColor
from dbo.DimProduct
group by Color 
-- End

-- Bài tập 15: 
select color
, Count(ProductKey) as TotalProductbyColor
from dbo.DimProduct 
group by Color
having Sum(ProductKey) >= 10
-- End

-- Bài tập 16:
select Color
, AVG(ListPrice) as AVGofListPrice
from dbo.DimProduct
group by Color 
having AVG(ListPrice) > 500
--End
