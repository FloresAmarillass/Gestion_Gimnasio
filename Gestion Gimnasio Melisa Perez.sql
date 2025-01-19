DROP SCHEMA IF EXISTS gestion_gimnasio ;
CREATE SCHEMA IF NOT EXISTS gestion_gimnasio; 
USE gestion_gimnasio ; 

-- CREACIÓN DE LAS TABLAS

-- Borramos las tablas si existen. 

DROP TABLE IF EXISTS alumno;
DROP TABLE IF EXISTS plan;
DROP TABLE IF EXISTS venta_plan;
DROP TABLE IF EXISTS plan_pago;
DROP TABLE IF EXISTS profesor;

/*
 En la tabla Alumno, se insertaran los datos corrrespondientes a cada cliente que
 compre un plan en el gimnasio. 
 El Id de cada alumno/ cliente sera su número de DNI, cédula o pasaporte.
*/


CREATE TABLE alumno (
	id_alumno INT NOT NULL , 
    nombre VARCHAR (20) NOT NULL, 
    apellido VARCHAR (20) NOT NULL,
    direccion VARCHAR (50), 
    telefono NUMERIC (15) NOT NULL, 
	correo_electronico VARCHAR (50) UNIQUE,
    PRIMARY KEY (id_alumno)
	);
    
    
/*    
 Creación de la tabla PLAN: Se especificán los datos del tipo de plan 
 elegido por el alumno/ cliente a realizar en el gimnasio: 
 sólo sala de musculación, sólo clases, clases + musculación.
*/ 
 
 
CREATE TABLE plan (
	id_plan INT NOT NULL ,
    id_alumno INT NOT NULL,
    detalle ENUM('M','C', 'MC') NOT NULL , 
    precio NUMERIC NOT NULL , 
    PRIMARY KEY (id_plan) , 
    CONSTRAINT FK_plan_alumno  FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno)
    );

/*    
En la tabla VENTA PLAN se detallará el plan, precio, la fecha de venta y 
alumno que haya comprado el mismo. 
 
*/ 
    
CREATE TABLE venta_plan (
	id_venta_plan INT AUTO_INCREMENT , 
    id_alumno INT NOT NULL, 
    id_plan INT NOT NULL , 
    fecha DATE,
	PRIMARY KEY (id_venta_plan) ,
    CONSTRAINT FK_venta_plan_alummo 
    FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno),
    CONSTRAINT FK_venta_plan_plan
    FOREIGN KEY (id_plan) REFERENCES plan (id_plan)
    ); 

/*    
 La tabla PLAN DE PAGO especificará el tipo de plan de pago elegido 
 por el alumno: Mensual, trimestral, semestral o anual. 
*/ 

CREATE TABLE plan_pago (
	id_plan_pago INT NOT NULL,
    id_alumno INT NOT NULL, 
    id_venta_plan INT AUTO_INCREMENT,
    fecha DATE, 
    detalle TEXT (30) NOT NULL, 
    PRIMARY KEY (id_plan_pago) ,
    CONSTRAINT FK_plan_pago_alummo 
    FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno),
    CONSTRAINT FK_plan_pago_venta_plan
    FOREIGN KEY (id_venta_plan) REFERENCES venta_plan (id_venta_plan)
    );

/*
 En la tabla Profesor, se insertarán los datos corrrespondientes a cada profesor/a 
 que trabaje en el gimnasio. 
 El id_profesor corresponderá a su numero de DNI, cédula o pasaporte. 
*/
    
CREATE TABLE profesor (
	id_profesor INT NOT NULL,
	id_alumno INT NOT NULL,
    nombre VARCHAR (20) NOT NULL, 
    apellido VARCHAR (20) NOT NULL, 
    direccion VARCHAR (50),
    telefono INT (15) NOT NULL, 
	correo_electronico VARCHAR (50) UNIQUE,
    PRIMARY KEY (id_profesor) ,
    CONSTRAINT FK_profesor_alummo 
    FOREIGN KEY (id_alumno) REFERENCES alumno (id_alumno)
    );
    
	
	
    

/*    
CREATE TABLE MEDIO_PAGO (
	ID_MEDIO_PAGO INT NOT NULL , 
    ID_ALUMNO VARCHAR (10) NOT NULL,
    TIPO_METODO VARCHAR (10) ,
    CUOTAS INT,
    DESCUENTO NUMERIC ,
    PRIMARY KEY (ID_ALUMNO)
    );

*/




    
    
-- INSERT INTO ALUMNO(`ID_ALUMNO`,`NOMBRE`,`APELLIDO`,`DIRECCION`,`TELEFONO`,`CORREO_ELECTRONICO`) VALUES ('',);
-- INSERT INTO PLAN (`ID_PLAN`,`ID_ALUMNO`,`DETALLE`,`PRECIO`) VALUES ('',);
-- INSERT INTO PLAN_PAG0 (`ID_VENTA_PLAN`,`ID_ALUMNO`,`ID_PLAN`,`FECHA`) VALUES ('',);
-- INSERT INTO PLAN_PAGO(`ID_PLAN_PAGO`,`ID_ALUMNO`,`ID_VENTA_PLAN`,`FECHA`,`DETALLE`) VALUES ('',);
-- INSERT INTO PROFESOR (`ID_PROFESOR`,`ID_ALUMNO`,`NOMBRE`,`APELLIDO`,`DIRECCION`,`TELEFONO`,`CORREO_ELECTRONICO`) VALUES ('',);

	