
------- ABA GERAL ------

----  RECEITA TOTAL
---- QUANTIDADE VENDIDA
---- TOTAL DE CATEGORIAS DE PRODUTOS
---- QUANTIDADE DE CLIENTES
---- RECEITA TOTAL E LUCRO POR MES
---- MARGEM DE LUCRO
---- QUANTIDADE VENDIDA POR MES
---- LUCRO POR PAÍS


---------- ABA CLIENTES ------

---- VENDAS POR PAÍS
---- CLIENTES POR PAÍS
---- VENDAS POR GENERO
---- VENDAS POR CATEGORIA


---------VIEW 
-------SELECT * FROM RESULTADO_AWD

CREATE OR ALTER VIEW RESULTADO_AWD 

AS

SELECT 
	fis.SalesOrderNumber AS	'N° PEDIDO',
	fis.OrderDate AS 'DATA PEDIDO',
	dpc.EnglishProductCategoryName AS 'CATEGORIA EM INGLES',
	dc.CustomerKey AS 'ID CLIENTE',
	dc.FirstName + ' ' + LASTNAME AS 'NOME',
	dc.Gender AS 'GENERO',
	dg.EnglishCountryRegionName AS 'PAIS',
	fis.OrderQuantity AS 'QUANTIDADE PEDIDOS' ,
	fis.UnitPrice AS [PREÇO UNITARIO],
	fis.TotalProductCost AS 'CUSTO TOTAL PRODUTO',
	fis.SalesAmount AS 'PREÇO VENDA',
	fis.SalesAmount - TotalProductCost AS 'LUCRO VENDA'
FROM FactInternetSales fis
INNER JOIN DimProduct dp ON fis.[ProductKey] = dp.[ProductKey]
	INNER JOIN DimProductSubcategory dps ON dps.[ProductSubcategoryKey] = dp.[ProductSubcategoryKey] 
		INNER JOIN DimProductCategory dpc ON dpc.[ProductCategoryKey] = dps.[ProductCategoryKey]
INNER JOIN DimSalesTerritory dst ON fis.[SalesTerritoryKey] = dst.[SalesTerritoryKey]
	INNER JOIN DimGeography dg ON dst.[SalesTerritoryKey] = dg.[SalesTerritoryKey]
INNER JOIN DimCustomer dc ON fis.[CustomerKey] = dc.[CustomerKey]
--WHERE YEAR(OrderDate) = 2013




	--SELECT * FROM DimProduct
	--SELECT * FROM DimProductCategory
	--SELECT * FROM DimSalesTerritory
	--SELECT * FROM DimCustomer
	--SELECT * FROM FactInternetSales
	--SELECT * FROM DimGeography
	--select * from DimProductSubcategory

	----DimProduct E FactInternetSales = PRODUCTKEY
	--DimSalesTerritory E DimGeography = SalesTerritoryKey
	----DimProductSubcategory e DimProductCategory = ProductCategoryKey
	----DimProduct e DimProductSubcategory = ProductSubcategoryKey
	----FactInternetSales e DimSalesTerritory = SalesTerritoryKey

	--SELECT * FROM DimProductCategory
	--select * from DimProductSubcategory





