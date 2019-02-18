--------------------------------Base de datos SharedWithMe-----------------------------
create database SharedWithMe
------------------------------------Tabla Usuarios-------------------------------------
create table Usuarios
(
	codigoUsuario int identity(1,1) primary key not null,
	nombre varchar(255) null, 
	apellido varchar(255) null,
	usuario varchar(255) not null,
	contraseña varchar(255) not null
);
go
----------------------------------------tabla Categorias----------------------------------
create table Categorias
(
	codigoCategoria int identity(1,1) primary key not null,
	descripcion varchar(255) not null,
);
go
---------------------------------tabla Salas de peliculas ---------------------------------
create table Sala
(
	codigoSala int identity(1,1) primary key not null,
	numeroSala int not null
);
go
-------------------------------------tabla Peliculas--------------------------------------
create table Peliculas
(
	codigoPelicula int identity(1,1) primary key not null,
	nombre varchar(255) not null,
	descripcion varchar(255) not null,
	duracion int not null,
	director varchar(255) null,
	precio varchar(255) not null,
	codigoCategoria int not null,
	codigoSala int null,
	Constraint FK_Peliculas_Categorias foreign key (codigoCategoria) references Categorias(codigoCategoria),
	Constraint FK_Peliculas_Sala foreign key (codigoSala) references Sala(codigoSala)
);
go
-----------------------------------------Tabla Alquiler-------------------------------------
create table Alquiler
(
	codigoAlquiler int identity(1,1) primary key not null,
	fechaInicio date not null,
	fechaDevolucion date not null,
	cantidad int not null,
	total int not null,
	codigoUsuario int not null,
	Constraint FK_Alquiler_Usuarios foreign key (codigoUsuario) references Usuarios(codigoUsuario)
);
go
-----------------------------------------Tabla Boletos------------------------------------------
create table Boletos
(
	codigoBoletos int identity(1,1) primary key not null,
	asientos varchar(255) not null,
	cantidad varchar(255) not null,
	total int not null,
	codigoUsuario int not null,
	Constraint FK_Alquiler_Usuarios foreign key (codigoUsuario) references Usuarios(codigoUsuario)
);
go
-------------------------------------------------------------------------------------------------