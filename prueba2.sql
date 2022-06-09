create database fauna2;
use fauna2;

create table taxonomia(
    DIVISION varchar(10) not null,
    CLASE varchar (20) not null,
    ORDEN varchar (25) not null,
    FAMILIA varchar (25) not null,
    GENERO varchar (25) not null,
    ESPECIE varchar (50) not null primary key,
    N_COMUN varchar (200)
);

 
create table infoespecies(
	SCIENTIFIC_NAME varchar(50) not null,
	T_DISTRIB varchar(50) not null,
	VEDA varchar(50) not null,
	RESOLUCION varchar(50),
	ENTID_VEDA varchar(100),
	CATEG_CIT varchar(50),
	CATEG_UICN varchar(50),
	CATE_MINIS varchar(50),
	MIGRACION varchar(2),
	TIPO_MIGR varchar(50),
	VIGEN_VEDA varchar(20),
	USO varchar(50),
	DIETA varchar(20),
	DISTR_ALT varchar(20),
	constraint foreign key(SCIENTIFIC_NAME) REFERENCES taxonomia(ESPECIE)
);

select * from punto;

CREATE TABLE punto(
	VEREDA varchar(50),
	MUNICIPIO varchar(50),
	DEPTO varchar(50),
	NOMBRE varchar(50),
	ID_MUES_PT int not null primary key,
	N_COBERT varchar(100),
	NOMENCLAT int,
	T_MUEST varchar(50),
	HABITAT varchar(100),
	DESCRIP varchar(100),
	FEC_MUEST date,
	ESTACIONAL varchar(50),
	CUERPO_AGU varchar(50),
	COTA int,
	ESTE int,
	NORTE int,
	GERENCIA varchar(10)
);

ALTER TABLE 
	punto
RENAME COLUMN 
	GGERENCIA 
TO 	
	GERENCIA;

select * from muestreo;
select count(distinct(PUNTO_MUEST)) from muestreo;
create table muestreo(
	PUNTO_MUEST int not null,
	SP varchar(50),
	ABUND_ABS int not null,
	OBSERV varchar(100),
	EVENTO varchar(20),
	HORA time,
	FOTO varchar(1),
	DETERM varchar(20),
	OT_DETERM varchar(20),
constraint foreign key(PUNTO_MUEST) REFERENCES punto(ID_MUES_PT),
constraint foreign key(SP) REFERENCES taxonomia(ESPECIE)
);



