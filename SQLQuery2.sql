-- Ejercicio 1 --
select FirstName, LastName
from Person.Person
where FirstName = 'Mark';

-- Ejercicio 2 --
select COUNT (BusinessEntityID) as NumberOfRows --Esta línea cuenta el número de filas que tienen un valor en la columna BusinessEntityID y lo muestra con el alias NumberOfRows.--
from Person.Person;

-- Ejercicio 3 --
select TOP 100 * --Esta instrucción SQL selecciona las primeras 100 filas de la tabla o consulta especificada, sin ningún orden definido.--
from Production.Product
where ListPrice <> 0; --Esta condición SQL filtra las filas que tienen un valor distinto de cero en la columna ListPrice.--

-- Ejercicio 4 --
select *
from HumanResources.vEmployee
where LastName < 'D' OR LastName LIKE 'D%'; -- Esta condición SQL filtra las filas que tienen un apellido que empieza por una letra anterior a la D o que empieza por la D. --

select * 
from Production.Product;

-- Ejercicio 5 --
select Name, AVG(StandardCost) as AverageCost -- selecciona el nombre y el costo promedio de los productos de la tabla o consulta especificada, y lo muestra con el alias AverageCost. --
from Production.Product
where StandardCost > 0 -- filtra las filas que tienen un valor mayor que cero en la columna StandardCost. --
Group BY Name; -- agrupa las filas que tienen el mismo valor en la columna Name --

-- Ejercicio 6 --
SELECT PersonType, COUNT(*) AS NumberOfPeople -- selecciona el tipo de persona y el número de personas que tienen ese tipo de la tabla o consulta especificada, y lo muestra con los alias PersonType y NumberOfPeople.--
FROM Person.Person
GROUP BY PersonType; -- Agrupa las filas que tienen el mismo valor en la columna PersonType --

-- Ejercicio 7 --
SELECT *
FROM Person.StateProvince
WHERE CountryRegionCode = 'CA';

-- Ejercicio 8 --
SELECT Color, COUNT(*) AS NumberOfProducts
FROM Production.Product
WHERE Color = 'Red' OR Color = 'Black'
GROUP BY Color;

-- Ejercicio 9 --
SELECT AVG(Freight) AS AverageFreight -- selecciona el promedio del costo de envío de los pedidos de la tabla o consulta especificada, y lo muestra con el alias AverageFreight.--
FROM Sales.SalesOrderHeader
WHERE TerritoryID = 4;

-- Ejercicio 10 --
SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName IN ('Lopez', 'Martin', 'Wood')
AND FirstName LIKE '[C-L]%'; -- filtra las filas que tienen un apellido que está en la lista (‘Lopez’, ‘Martin’, ‘Wood’) y un nombre que empieza por una letra entre la C y la L.--

-- Ejercicio 11 --
SELECT FirstName AS Nombre, LastName AS Apellido
FROM Sales.vIndividualCustomer
WHERE LastName = 'Smith';


-- Ejercicio 12 --
SELECT *
FROM Sales.vIndividualCustomer
WHERE CountryRegionName = 'Australia' OR (PhoneNumberType = 'Cell' AND EmailPromotion = 0);

-- Ejercicio 13 --
SELECT MAX(ListPrice) AS MaxPrice
FROM Production.Product;

-- Ejercicio 14 --
SELECT TerritoryID, SUM(TotalDue) AS TotalSales
FROM Sales.SalesOrderHeader
GROUP BY TerritoryID
HAVING SUM(TotalDue) > 10000000; --  agrupa las filas que tienen el mismo valor en la columna TerritoryID, y permite aplicar funciones de agregado como SUM, AVG, COUNT, etc. a cada grupo. Además, la cláusula HAVING se usa para filtrar los grupos que cumplen una condición.--


--Ejercicio 15 --
SELECT ST.Name AS TerritoryName, SUM(SOH.TotalDue) AS TotalSales -- selecciona el nombre del territorio y el total de ventas de los pedidos de la tabla o consulta especificada, y lo muestra con los alias TerritoryName y TotalSales.--
FROM Sales.SalesOrderHeader AS SOH
JOIN Sales.SalesTerritory AS ST ON SOH.TerritoryID = ST.TerritoryID --  une la tabla Sales.SalesOrderHeader con la tabla Sales.SalesTerritory por el ID del territorio, usando el alias ST para la segunda tabla.--
GROUP BY ST.Name
HAVING SUM(SOH.TotalDue) > 10000000;

-- Ejercicio 16 --
-- Forma 1 --

SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department IN ('Executive', 'Tool Design', 'Engineering');

-- Forma 2 --
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE Department = 'Executive' OR Department = 'Tool Design' OR Department = 'Engineering';

-- Ejercicio 17 --
-- Forma 1 --
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate BETWEEN '2000-07-01' AND '2002-06-30';

-- Forma 2 --
SELECT *
FROM HumanResources.vEmployeeDepartment
WHERE StartDate >= '2000-07-01' AND StartDate <= '2002-06-30';

-- Ejercicio 18 --
SELECT *
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL;

-- Ejercicio 19 --
SELECT COUNT(*) AS NonNullMiddleName
FROM Person.Person
WHERE MiddleName IS NOT NULL;

-- Ejercicio 20 --
SELECT SalesPersonID, TotalDue
FROM Sales.SalesOrderHeader
WHERE SalesPersonID IS NOT NULL AND TotalDue > 70000;

-- Ejercicio 21 --
SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName LIKE 'R%';

-- Ejercicio 22 --
SELECT *
FROM Sales.vIndividualCustomer
WHERE LastName LIKE '%R';

-- Ejercicio 23 --
SELECT Color, COUNT(*) AS NumberOfProducts
FROM Production.Product
WHERE Color IS NOT NULL
GROUP BY Color
HAVING COUNT(*) >= 20;

-- Ejercicio 24 --
SELECT *
FROM Production.Product
INNER JOIN Production.ProductInventory
ON Production.Product.ProductID = Production.ProductInventory.ProductID;

-- Ejercicio 25 --
SELECT FirstName, LastName,
CASE EmailPromotion
  WHEN 0 THEN 'Promo 1'
  WHEN 1 THEN 'Promo 2'
  WHEN 2 THEN 'Promo 3'
END AS Promotion
FROM Person.Person;

-- Ejercicio 26 --
SELECT SP.BusinessEntityID, SP.SalesYTD, ST.Name AS TerritoryName
FROM Sales.SalesPerson AS SP
LEFT JOIN Sales.SalesTerritory AS ST ON SP.TerritoryID = ST.TerritoryID;

-- Ejercicio 27 --
SELECT SP.BusinessEntityID, SP.SalesYTD, ST.Name AS TerritoryName, P.FirstName, P.LastName
FROM Sales.SalesPerson AS SP
JOIN Sales.SalesTerritory AS ST ON SP.TerritoryID = ST.TerritoryID
JOIN Person.Person AS P ON SP.BusinessEntityID = P.BusinessEntityID
WHERE ST.Name = 'Northeast' OR ST.Name = 'Central';

-- Ejercicio 28 --
SELECT FirstName, LastName, PasswordHash 
FROM Person.Person p INNER JOIN Person.Password pw ON p.BusinessEntityID = pw.BusinessEntityID;

-- Ejercicio 29 --
SELECT ISNULL(Title, 'No hay título') AS 'Título' 
FROM Person.Person;

-- Ejercicio 30 --
SELECT FirstName + ' ' + COALESCE(MiddleName, '') + ' ' + LastName AS 'Nombre completo' 
FROM Person.Person;

