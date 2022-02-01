create database quejas_reclamaciones
;

use quejas_reclamaciones
;

create table Estados(
ID_Estado int not null identity(1,1) primary key,
Desc_Estado varchar(20)
)
;

create table Departamentos(
ID_Dept int not null identity(1,1) primary key,
nombre varchar(50),
ID_Estado int not null,
constraint fk_dept_estado foreign key (ID_Estado) references Estados
)
;

create table Empleados(
ID_Empleado int not null identity(1,1) primary key,
Nombre varchar(50),
Apellido varchar(50),
Cedula varchar(15),
Telefono varchar(20),
Direccion varchar(50),
ID_Dept int not null,
ID_Estado int not null,
constraint fk_emp_dept foreign key (ID_Dept) references Departamentos,
constraint fk_emp_estado foreign key (ID_Estado) references Estados
)
;
create table Usuarios(
ID_Usuario int not null identity(1,1) primary key,
Username varchar(50),
Userpass varchar(50),
Typeaccess int
);

create table Clientes(
ID_Cliente int not null identity(1,1) primary key,
Nombre varchar(50),
Apellido varchar(50),
Cedula varchar(15),
Telefono varchar(20),
ID_Estado int not null,
constraint fk_cliente_estado foreign key (ID_Estado) references Estados
)
;

create table Tipo_Queja(
ID_Tipo_Queja int not null identity(1,1) primary key,
Desc_Tipo_Queja varchar(50)
)
;

create table Quejas(
ID_Queja int not null identity(1,1) primary key,
Desc_Queja varchar(150),
ID_Tipo_Queja int not null,
ID_Cliente int not null,
ID_Dept int not null,
ID_Estado int not null,
constraint fk_queja_tq foreign key (ID_Tipo_Queja) references Tipo_Queja,
constraint fk_queja_cliente foreign key (ID_Cliente) references Clientes,
constraint fk_queja_dept foreign key (ID_Dept) references Departamentos,
constraint fk_queja_estado foreign key (ID_Estado) references Estados
)
;

create table Tipo_Reclamaciones(
ID_Tipo_Reclamacion int not null identity(1,1) primary key,
Desc_Reclamaciones varchar(50)
)
;

create table Reclamaciones(
ID_Reclamaciones int not null identity(1,1) primary key,
Desc_Reclamacion varchar(150),
ID_Tipo_Reclamacion int not null,
ID_Cliente int not null,
ID_Dept int not null,
ID_Estado int not null,
constraint fk_recl_tq foreign key (ID_Tipo_Reclamacion) references Tipo_Reclamaciones,
constraint fk_recl_cliente foreign key (ID_Cliente) references Clientes,
constraint fk_recl_dept foreign key (ID_Dept) references Departamentos,
constraint fk_recl_estado foreign key (ID_Estado) references Estados
)
;

create table Productos(
ID_Producto int not null identity(1,1) primary key,
Codigo varchar(50),
Nombre varchar(50),
Precio decimal,
ID_Estado int not null,
constraint fk_prod_estado foreign key (ID_Estado) references Estados
)
;

create table Cliente_Producto(
ID_Cliente int not null,
ID_Producto int not null,
constraint fk_cp_cliente foreign key (ID_Cliente) references Clientes,
constraint fk_cp_producto foreign key (ID_Producto) references Productos
)
;
create table Encuesta(
ID_Encuenta int not null identity(1,1) primary  key,
Tipo_solicitud varchar(50),
Grado_Satisfaccion int,
Comentarios varchar(100)
)
;
ALTER TABLE Encuesta
Alter Column Comentarios varchar(100);

insert into Estados values
('Activo'),
('Inactivo')
select * from estados

insert into Departamentos values
('Tecnología de la Información',1),
('Recursos Humanos',1),
('Dirección Financiera',1),
('Servicios Generales',1),
('Transportacion',1),
('Logistica',1),
('Mercadeo',1),
('Publicidad',1);

insert into Empleados values
('Christian','Montolio','402-7845125-8','809-845-7810','C/4 No. 10 Urb. El Duarte',1,1),
('Hector','El Father','402-3435125-5','809-847-7014','C/10 No. 1, La Victoria',1,1),
('Thamayra','Berroa','401-3243164-1','809-457-2400','C/Juana Mies No. 3, Ensanche Piantini',3,1),
('Digno','Familia Peluche','402-7864115-7','829-432-4645','C/B No. 433, El Duarte',5,1),
('Elvis','Janalan Crespo','402-6235984-8','849-647-3145','C/A  No. 1, Ensanche Isabelita',5,1)

insert into Usuarios values
('chmontolio','12345678',1),
('hfather','12345678',2);

insert into Tipo_Queja values
('Atención en el servicio'),
('Aplicación de pagos'),
('Artículos incautados'),
('Artículos incautados'),
('Cobros compulsivos'),
('Reporte en buró'),
('Eliminación de mora'),
('Aprobación pendiente'),
('Sucursal sin representante'),
('Cobros a domicilio');

insert into Tipo_Reclamaciones values
('Reclamo garantía extendida'),
('Reclamo de seguro'),
('Reclamo de prebea por fallecimiento '),
('Acuerdos de pagos'),
('Refinanciamientos'),
('Problemas con el artículo'),
('Incumplimiento tiempo de entrega');

select * from Usuarios

insert into Clientes values
('Laura','Montolio','402-7847305-8','829-841-7831',1),
('Juanez','Perez','402-3435125-5','849-420-7074',1),
('Yajayra','Berroa','401-3243164-1','809-470-2350',1),
('Quqin','Victoria','402-7876415-7','829-102-4675',1),
('Elvis','Martinez','402-6235984-8','849-647-3145',1)

insert into Productos values
('A0001','Lampara',1520,1),
('A0002','Computadora',14200,1),
('A0003','Mouse',540,1);
