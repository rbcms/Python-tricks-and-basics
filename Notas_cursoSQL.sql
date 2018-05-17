
-- -- /*--La consulta muestra todas las tablas de la base de datos*/ 


-- SELECT * FROM INFORMATION_SCHEMA.TABLES 
-- WHERE table_type='BASE TABLE' 
-- ORDER BY table_name

-- -- NOTAS PROPIAS
-- -- Seleccion las 5 primeras columnas.
-- SELECT TOP(5) * FROM SalesLT.Product;

-- -- Ordena Los productos de la tabla en funcion del precio:
-- SELECT ProductNumber, ListPrice FROM SalesLT.Product ORDER BY ListPrice; 

-- SELECT ProductID, ProductNumber, Name, ListPrice FROM SalesLT.Product ORDER BY ListPrice;

-- -- Selecciona las columnas en funcion de un precio
-- SELECT * FROM SalesLT.Customer;
-- SELECT DISTINCT Title FROM SalesLT.Customer;


-- -- Selecciono todas las columnas de la tabla.
-- SELECT * FROM SalesLT.Product;

-- --Selcceciono esta columna de la tabla.
-- SELECT ProductID FROM SalesLT.Product;

-- SELECT * FROM SalesLT.Customer;

-- --Selecciono dos columanas de la tabla.
-- SELECT Title, FirstName FROM SalesLT.Customer;



-- -- EMPIEZA CURSO:
--  -- CAST Funtion convierte un tipo de dato a otro formato
--  -- Hemos convertido la columna Product ID a un tipo de dato 
--  -- VARCHAR
-- SELECT CAST(ProductID AS varchar (5)) + ': ' + Name AS ProductName
-- FROM SalesLT.Product;

-- -- En este caso utilizamos la funcion convert, que tambien modifica 
-- -- el tipo de dato  
-- SELECT SellStartDate, 
--         CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate, 
--     CONVERT(nvarchar(30),SellStartDate, 126) AS ISO8601FormatDate
-- FROM SalesLT.Product;

-- --Esta funcion nos devuelve un null (evitando tener un error ) cuando tratamos de cambiar un fo rmato
-- -- y el tipo no da permiso.

-- SELECT Name,TRY_CAST (Size AS Integer) AS NumericSize
-- FROM SalesLT.Product;

-- --Hago lo mismo, pero en este caso en lugar de devolver el valor como NULL
-- --lo que hace es convertirlo a cero
-- SELECT Name, ISNULL(TRY_CAST (Size AS Integer), 0) AS NumericSize
-- FROM SalesLT.Product;

-- -- Selecciona la columna ProductNumber y luego en la segunda columna
-- -- mirar si color o talla no son Null y los metes en una nueva llamada Product Details, 
-- -- Separada por una coma.
-- SELECT ProductNumber, ISNULL(Color, '') + ',' + ISNULL(Size, '') AS ProductDetails
-- FROM SalesLT.Product;

-- --Con esta funcion busca los vlores dentro de la columna color que sean
-- --igual a blanco y los sustituye por null
-- SELECT ProductNumber, NULLIF(Color, 'White') AS Colorcitos
-- FROM SalesLT.Product;

-- --COALESCENCE >> Esta funcion devuelve la primera expresion que no tenga NULL entre sus argumentos
-- SELECT Name, COALESCE(DiscontinuedDate, SellEndDate, SellStartDate) AS LastActivity
-- FROM SalesLT.Product;
 
-- --CASE >> esta funcion proporciona logica de tipo 
-- --"si-entonces-otro"

-- SELECT Name, 
--     CASE
--         WHEN SellEndDate IS NULL THEN 'On Sale'
--         ELSE 'Discontinued'
--     END AS SalesStatus
-- FROM SalesLT.Product;

-- --Esta funcion aplica un tipo de logica >> "Si, entonces Otro"
-- --Entonces en este caso lo que hace es cuando suceda algo, 
-- --entonce...ELSE si no encuentra lo que le hemos dicho, que suceda algo
-- --y en este caso nombramos la columna.
-- SELECT Name, 
--     CASE Size
--         WHEN 'S' THEN 'Small'
--         WHEN 'M' THEN 'Medium'
--         WHEN 'L' THEN 'Large'
--         WHEN 'XL' THEN 'Extra-Large'
--         ELSE ISNULL(Size, 'n/a')
--     END AS ProductSize
-- FROM SalesLT.Product;


-- --Busca en la columna color, si encuentra Null devuelve None
-- -- y lo mete en una columna llamada color y dentroe de la tabla Sales
-- SELECT ISNULL(Color, 'None') AS Color FROM SalesLT.Product;

-- SELECT ISNULL(Color, 'None') AS Color, ISNULL(Size, '-') 
-- AS Size FROM SalesLT.Product ORDER BY Color;


-- --Busca en la columana color los valores distintos de null 
-- --Los sustituye por Nome y los llama color.
-- --Con la columna size pasa parecido, sustituye los valores NULL que encuentra
-- --Por ultimo asigna un criterio en el orden. 
-- --Orden alfabetico y cuendo encuentra del mismo color en funcion de las unidades.
-- SELECT DISTINCT ISNULL(Color, 'None') AS Color, ISNULL(Size, '-') 
-- AS Size FROM SalesLT.Product ORDER BY Color;

-- -- Display the top ten productos by list price
-- SELECT TOP 100 Name, ListPrice 
-- FROM SalesLT.Product ORDER BY ListPrice DESC;

-- -- Display the first ten products by product number
-- --REVISAR FUNCION OFFSET
-- SELECT Name, ListPrice 
-- FROM SalesLT.Product 
-- ORDER BY ProductNumber OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;

-- -- Selecciona 3 columnas Name, Color, Talla que cumpla la function
-- -- donde se cumpla la condicion. 
-- SELECT Name, Color, Size FROM SalesLT.Product WHERE ProductModelID = 6;
-- -- La pongo de referencia.
-- SELECT Name, Color, Size, ProductModelID FROM SalesLT.Product;

-- -- Lista con la informacion de productos que acaban
-- SELECT Name, Color, Size AS pruebita
-- FROM SalesLT.Product 
-- WHERE ProductNumber LIKE'%R%';

-- -- Filter the previous query to ensure that the product number 
-- -- contains two sets of two digits
-- SELECT ProductNumber, ListPrice
-- FROM SalesLT.Product 
-- WHERE ProductNumber LIKE'FR-_[0-9][0-9]_-[0-9][0-9]';

-- --Encuentra los productos que no han tenido nunca ventas
-- SELECT Name FROM SalesLT.Product WHERE SellEndDate is NOT NULL;

-- --Selecciona los productos que se han vendido entre las 
-- --fechas comprendidas
-- SELECT Name 
-- FROM SalesLT.Product
-- WHERE SellEndDate BETWEEN '2006/1/1' AND '2006/12/31';

-- -- Reviso el header.
-- SELECT TOP(1) * FROM SalesLT.Product;

-- -- /*mayor precio*/
-- SELECT TOP(5) ProductID, Name, ListPrice AS TOP5 FROM SalesLT.Product ORDER BY ListPrice;

-- -- /*Listado total de colores no nulos, si encuentra alguno pone none*/

-- SELECT ISNULL (Color, 'None') AS colores FROM SalesLT.Product;

-- -- /*Listado de colores unicos, nulos sustituidos sin ordenar*/
-- SELECT DISTINCT ISNULL (Color, 'None') AS coloresUnicos FROM SalesLT.Product;

-- -- /*Listado de colores unicos, nulos sustituidos ordenador*/
-- SELECT DISTINCT ISNULL (Color, 'None') AS ColorUnico FROM SalesLT.Product ORDER BY ColorUnico;

-- -- /*Listado relacion de colores*talla ordenados por orden alfabetico en base a los colores */
-- SELECT DISTINCT ISNULL (Color, 'None') AS Colores, ISNULL (Size, '-') AS Size FROM SalesLT.Product ORDER BY Colores;



-- -- El filtro OFFSET-FETCH
-- -- El filtro OFFSET-FETCH es una característica 
-- -- estándar diseñada similar a TOP pero con un elemento 
-- -- adicional. Puede especificar cuántas filas desea omitir antes 
-- -- de especificar cuántas filas desea filtrar.

-- SELECT Name, ListPrice 
-- FROM SalesLT.Product ORDER BY ProductNumber OFFSET 5 ROWS FETCH NEXT 10 ROWS ONLY;


-- SELECT Name, ListPrice
-- FROM SalesLT.Product ORDER BY ProductNumber OFFSET 0 ROWS FETCH FIRST 5 ROWS ONLY;


-- VIDEO
-- SELECT __(campos)___ FROM ___(tabla1)___
-- INNER JOIN _(tabla2)____ 
-- ON (id_tabla1=id_tabla2)
-- WHERE condiciones_para_cualquier_campo_de_cualquier_tabla


SELECT * FROM INFORMATION_SCHEMA.TABLES 
WHERE table_type='BASE TABLE' 
ORDER BY table_name

-- SELECT SalesLT.ProductID FROM SalesLT
-- INNER JOIN  Sales