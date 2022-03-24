create database IF NOT EXISTS Mascotas;
use Mascotas;

create table IF NOT EXISTS Persona(
CI int not null,
nombre varchar(20),
direccion varchar(100),
primary key (CI)
);

create table IF NOT EXISTS Persona_Telefono(
CI int not null,
telefono int,
primary key (CI),
foreign key (CI) references Persona(CI)
);

create table IF NOT EXISTS Mascota (
ID int not null,
nombre varchar(20),
añoNacimiento date,
primary key(ID)
);

create table IF NOT EXISTS tiene (
ID int not null,
CI int,
primary key (ID),
constraint FK_PetID foreign key (ID) references Mascota(ID),
foreign key (CI) references Persona(CI)
);

/* Cambia el nombre de el atributo nombre a nombreyapellido */

alter table Persona
rename column nombre to nombreyapellido ;

/* Cambia el nombre de el atributo CI a cedulaPersona */

alter table Persona
rename column CI to cedulaPersona;

/* Convertir direccion en un atributo compuesto */

alter table Persona
drop column direccion;

alter table Persona
add dir_puerta int;

alter table Persona
add dir_calle varchar(50);

alter table Persona
add dir_cuidad varchar(50);

/* Cambia el nombre de el atributo CI en Persona_Telefono por cedulaPersona */

alter table Persona_Telefono
rename column CI to cedulaPersona;

/* Cambia el nombre de el atributo telefono en Persona_Telefono por tel */

alter table Persona_Telefono
rename column telefono to tel;

/* Insertar columnas en mascotas */

alter table Mascota
add column raza varchar(30);

alter table Mascota
add column fechaUltimaVacuna date;

alter table Mascota
add column colorPelo varchar(30);

alter table Mascota
add column enfermedadDetalle varchar(200);

alter table Mascota
add column siTieneCrias boolean;

/* Eliminar la primary key de Mascota */

alter table Mascota
drop primary key;

show create table Mascota;

/* Agregar un atributo llamado numeroPasaporte y ponerla como primary key de Mascotas */

alter table Mascota
add numeroPasaporte int primary key;

/* Eliminar columnas de Mascotas */

alter table Mascota
drop column colorPelo;

alter table Mascota
drop column enfermedadDetalle;

alter table Mascota
drop column siTieneCrias;
