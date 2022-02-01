create database test
use test
CREATE TABLE dbo.Supervisor
(
Id_supervisor int identity(1,1),
nombre varchar(60),
apellido varchar(60),
cedula varchar(13),
fecha_registro date
)

INSERT INTO dbo.Supervisor
VALUES('maria Pilar','Hernandez','0000000000000',GETDATE())

CREATE TABLE dbo.Tienda
(
Id_tienda int identity(1,1),
Id_almacen int NOT NULL,
nombre varchar(80),
descripcion varchar(80),
ubicacion varchar(100),
telefono varchar(10) NOT NULL
)

INSERT INTO dbo.Tienda
VALUES(1,'Seredes','Solo electrodomesticos','El pantal','0000000000'),
(2,'Yupi','Electrodomesticos y ropa','oujia','1111111111'),
(1,'Tijuana','Solo ropa','higueral','2222222222'),
(2,'Yami','Solo ropa','Alma rosa','9090909090'),
(1,'Americana','Solo canzado','higueral','8080808080'),
(3,'Sotanos','Solo ropa','higueral','3030303030')

CREATE TABLE dbo.Almacen
(
Id_almacen int identity(1,1),
Id_supervisor int NOT NULL,
nombre varchar(60),
descripcion varchar(60),
ubicacion varchar(100),
telefono varchar(10)
)

INSERT INTO dbo.Almacen
VALUES(2,'Almacenen Unidos','Electrodomestico','Tenares','7770000000'),
(1,'Almacen Hernande','Electrodomesticos y ropa','Cotui','9990000000'),
(1,'Almacen JB','Ropa y calzado','SPM','1010000000'),
(1,'Almacen Julio','Calzad','Puerto principe','9876543267'),
(1,'Almacen MC','Ropa','SPM','8769087654')

WITH A (Almacen,Nombre,Descripcion,Ubicacion) AS
(
SELECT
Id_almacen,nombre,descripcion,ubicacion
FROM Almacen 
)

SELECT
Almacen,Nombre,Descripcion
FROM A
WHERE Descripcion LIKE '%Ropa%'