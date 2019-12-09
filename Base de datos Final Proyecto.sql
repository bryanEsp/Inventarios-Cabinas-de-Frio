	drop database if exists Drone2;
	create DATABASE Drone2;
	USE Drone2;

	CREATE TABLE Institucion (
	  Cod_insti TINYINT  AUTO_INCREMENT,
	  nombre VARCHAR(50) NOT NULL ,  
	  celular bigint NOT NULL,
	  direccion VARCHAR(100) NOT NULL,
	  estado_insti CHAR(1) default 'A',
	   PRIMARY KEY  (Cod_insti)
	);
	create TABLE Usuario (
		cedula_U BIGINT NOT NULL ,
		nombre VARCHAR(50) NOT NULL ,
		apellido VARCHAR(50) NOT NULL,
		celular BIGINT NOT NULL ,
		direccion VARCHAR(100) NOT NULL ,
		cargo enum('Almacenista','Admin'),
		correo VARCHAR(70) NOT NULL unique ,
		Fecha_Registro DATE NOT NULL,
		clave blob NOT NULL ,
		institucion TINYINT NOT NULL,
		estado_usu CHAR(1)  DEFAULT 'A',
		PRIMARY KEY (cedula_U),
		FOREIGN KEY (institucion)
		 REFERENCES Institucion (Cod_insti)
	);

	create TABLE Cuarto_Frio (
	  Cod_cufi TINYINT NOT NULL AUTO_INCREMENT,
	  longitud SMALLINT NOT NULL, 
	  altitud SMALLINT NOT NULL, 
	  temperatura CHAR(3) NOT NULL ,
	  estado_cufi CHAR(1) default 'A' ,
	  Cant_estante int,
	  Cant_ProFu_estante int,
	  Cant_Nivel_estante int,
	  Institucion TINYINT NOT NULL,
	   PRIMARY KEY  (Cod_cufi),
	  FOREIGN KEY(Institucion)
	  REFERENCES Institucion(Cod_insti)
	);

	CREATE TABLE Proveedor (
	  nombre VARCHAR(50) NOT NULL ,
	  NIT BIGINT NOT NULL,
	  celular BIGINT NOT NULL,
	  direccion VARCHAR(100) NOT NULL ,
	  correo VARCHAR(70) NOT NULL , 
	  estado_Proveedor CHAR(1)  DEFAULT 'A',
	   PRIMARY KEY  (NIT)
	);


	CREATE TABLE Categoria (
	id SMALLINT NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR(100) NOT NULL,
	Descripcion VARCHAR(250) NOT NULL,
	estado_cate char(1) default 'A',
	PRIMARY KEY (id)
	);

	create TABLE `producto` (
	  `Cod_pro` int(11) NOT NULL auto_increment,
	  `nombre_pro` varchar(70) NOT NULL,
	  `descripcion` varchar(200) NOT NULL,
	  `unidad_medida` varchar(100) NOT NULL,
	  `peso_producto` decimal(10,5) NOT NULL,
	  `cantidad_general_pro` bigint(20) NOT NULL,
	  `temperatura_pro` decimal(5,2) NOT NULL,
	  `estado_Pro` char(1) DEFAULT 'A',
	  `categoria` smallint(6) NOT NULL,
	  Proveedor BIGINT NOT NULL,
	  primary key(Cod_pro),
		FOREIGN KEY(categoria)
		  REFERENCES Categoria(id),
		  FOREIGN KEY(Proveedor)
		  REFERENCES Proveedor(NIT)
	);

	CREATE TABLE ITEMS 
	(
	Codigo_Barras BIGINT NOT NULL,
	Fecha_Vencimiento DATE,
	Estante CHAR(1) NOT NULL ,
	Nivel SMALLINT NOT NULL ,
	Profundidad SMALLINT NOT NULL ,
	cantidad SMALLINT NOT NULL ,
	Observaciones varchar(200) NOT NULL,
	Lote varchar(100) NOT NULL,
	Ingreso_Fechahor DATETIME NOT NULL,
	Embalaje varchar(50) NOT NULL,
	Cod_producto INT NOT NULL,
	Cuarto_Frio TINYINT NOT NULL ,
	estado char(1) default 'A',
	PRIMARY KEY(Codigo_Barras),
	FOREIGN KEY(Cod_producto)
	REFERENCES Producto(Cod_pro),
	FOREIGN KEY(Cuarto_Frio)
	REFERENCES Cuarto_Frio(Cod_cufi)
	);

	CREATE TABLE EntradaSalida (
	  Cod_M TINYINT  AUTO_INCREMENT,
	  CodigoBarras bigint NOT NULL ,  
	  CantidadRegistrada bigint NOT NULL,
	  FechaRegistro date,
	  Motivo VARCHAR(100) NOT NULL,
	  Tipo enum('I','R'),
	  estado_insti CHAR(1) default 'A',
	   PRIMARY KEY  (Cod_M),
	   FOREIGN KEY(CodigoBarras)
		REFERENCES Items(Codigo_Barras)
	);


	select* from producto;
	select* from cuarto_frio;


																			-- CRUD de institucion  --

	DELIMITER  $$
	create  PROCEDURE crudinsti /* nombre */
	(/* parametros de Entrada INput */
	IN  P_Cod_insti TINYINT, 
	IN  P_nombre VARCHAR(50),  
	IN  P_celular bigint,
	IN  P_direccion VARCHAR(100),
	IN opcion char(15)
	) 
	BEGIN /*inicio del la programación*/
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT Cod_insti as 'Código', nombre , celular, direccion as 'Dirección',estado_insti as 'Estado' FROM Institucion WHERE Cod_insti=P_Cod_insti;
			WHEN  'insertar' THEN 
			IF  NOT EXISTS (SELECT * FROM Institucion WHERE nombre=P_nombre) THEN  
			INSERT INTO Institucion (nombre,celular,direccion) VALUES (P_nombre, P_celular,P_direccion);
			END IF;
			WHEN  'actualizar' THEN 
			UPDATE Institucion SET nombre = P_nombre,celular=P_celular,direccion=P_direccion  WHERE Cod_insti = P_Cod_insti;
			when 'eliminar' then
			UPDATE Institucion SET estado_insti='I'   WHERE Cod_insti = P_Cod_insti;
		END CASE;
	END; $$



													-- CRUD de usuarios --

	DELIMITER  $$
	create  PROCEDURE crudUsuario /* nombre */
	(/* parametros de Entrada INput */
	IN P_cel BIGINT,
	IN P_nombre VARCHAR(50),
	IN P_apellido VARCHAR(50),
	IN P_celular BIGINT,
	IN P_direccion VARCHAR(100),
	IN P_cargo varchar(70),
	IN P_correo VARCHAR(70),
	IN P_Fecha_Registro DATE,
	IN P_clave blob,
	IN P_institucion TINYINT,
	IN P_estado CHAR(1) ,
	IN opcion CHAR(15)
	) 
	BEGIN /*inicio del la programación*/
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT cedula_U AS 'Cédula', nombre AS 'Nombre',apellido,celular, direccion AS 'Dirección',cargo,correo,Fecha_Registro AS 'Fecha Registro', cast(aes_decrypt(clave, 'xyz123') as char), Institucion,estado_usu AS 'Estado'FROM usuario WHERE cedula_U=P_cel;
			WHEN  'insertar' THEN  
			INSERT INTO usuario (cedula_U,nombre,apellido,celular,direccion,cargo,correo,Fecha_Registro,clave,institucion)    VALUES ( P_cel,P_nombre,P_apellido,P_celular,P_direccion,P_cargo,P_correo,CURDATE(), aes_encrypt(P_clave,'xyz123'),P_institucion);
			WHEN  'actualizar' THEN 
			UPDATE usuario SET nombre=P_nombre, apellido=P_apellido,celular=P_celular,direccion=P_direccion,cargo=P_cargo,correo=P_correo,clave=aes_encrypt(P_clave,'xyz123')  WHERE cedula_U = P_cel;
			WHEN 'eliminar' THEN
			UPDATE usuario SET estado_usu ='I' WHERE cedula_U = P_cel; 
		END CASE;
	END; $$


								-- Procedimiento de  Crud Cuarto Frio --
	DELIMITER  $$
	create  PROCEDURE crudcuartofrio /* nombre */
	(/* parametros de Entrada INput */
	 in P_Cod_cufi TINYINT,
	 in P_longitud SMALLINT, 
	 in P_altitud SMALLINT, 
	 in P_temperatura CHAR(3),
	 in P_estado_cufi CHAR(1),
	 in P_Cant_estante int,
	 in P_Cant_ProFu_estante int,
	 in P_Cant_Nivel_estante int,
	 in P_Institucion TINYINT,
	IN opcion CHAR(15)
	) 
	BEGIN /*inicio del la programación*/
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT Cod_cufi as 'Código', longitud, altitud ,temperatura,estado_cufi as 'Estado',Cant_estante,Cant_ProFu_estante,Cant_Nivel_estante,Institucion FROM Cuarto_Frio WHERE Cod_cufi=P_Cod_cufi;
			WHEN  'insertar' THEN 
			INSERT INTO Cuarto_Frio (longitud,altitud,temperatura,Cant_estante,Cant_ProFu_estante,Cant_Nivel_estante,Institucion) VALUES (P_longitud,P_altitud,P_temperatura,P_Cant_estante,P_Cant_ProFu_estante,P_Cant_Nivel_estante,P_Institucion);
			WHEN  'actualizar' THEN 
			UPDATE Cuarto_Frio SET longitud = P_longitud,altitud=P_altitud,temperatura=P_temperatura,Cant_estante=P_Cant_estante,Cant_ProFu_estante=P_Cant_ProFu_estante,Cant_Nivel_estante=P_Cant_Nivel_estante WHERE Cod_cufi = P_Cod_cufi;
			when 'eliminar' then
			UPDATE Cuarto_Frio SET estado_cufi='I'   WHERE  Cod_cufi=P_Cod_cufi;
		END CASE;
	END; $$



										-- Procedimiento crud de  Proveedor --

	DELIMITER  $$
	create  PROCEDURE crudProveedor /* nombre */
	(/* parametros de Entrada INput */
	IN   P_nombre VARCHAR(50),
	IN   P_NIT BIGINT,
	IN   P_celular BIGINT,
	IN   P_direccion VARCHAR(100),
	IN   P_correo VARCHAR(70), 
	IN   P_estado_Proveedor CHAR(1),
	IN   opcion CHAR(15)
	) 
	BEGIN /*inicio del la programación*/
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT NIT , nombre, celular ,direccion as 'Dirección', correo,estado_Proveedor as 'Estado' FROM Proveedor WHERE NIT=P_NIT;
			WHEN  'insertar' THEN 
			INSERT INTO Proveedor (NIT , nombre, celular ,direccion, correo) VALUES (P_NIT , P_nombre, P_celular ,P_direccion, P_correo);
			WHEN  'actualizar' THEN 
			UPDATE Proveedor SET nombre = P_nombre,celular=P_celular,direccion=P_direccion,correo=P_correo WHERE NIT = P_NIT;
			when 'eliminar' then
			UPDATE Proveedor SET estado_Proveedor='I'   WHERE  NIT = P_NIT;
		END CASE;
	END; $$

	DELIMITER $$
	--
	-- Procedimientos
	--
	CREATE PROCEDURE `crudCategoria` (IN `P_id` SMALLINT, IN `P_Nombre` VARCHAR(100), IN `P_Descripcion` VARCHAR(250), IN `P_estado_cate` CHAR(1), IN `opcion` CHAR(15))  BEGIN 
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT id as 'Código' , Nombre , Descripcion as 'Descripción',estado_cate as 'Estado' FROM Categoria WHERE id=P_id;
			WHEN  'insertar' THEN 
			IF NOT EXISTS (SELECT * FROM Categoria WHERE Nombre=P_Nombre) THEN 
			INSERT INTO Categoria (id , Nombre, Descripcion) VALUES (P_id , P_Nombre, P_Descripcion);
			
			End if;
			WHEN  'actualizar' THEN 
			UPDATE Categoria SET Nombre = P_Nombre,Descripcion=P_Descripcion WHERE id = P_id;
			when 'eliminar' then
			UPDATE Categoria SET estado_cate='I'   WHERE id = P_id;
		END CASE;
	END$$


	DELIMITER $$
	CREATE  PROCEDURE `CrudProducto` (IN `P_Cod_pro` INT, IN `P_nombre_pro` VARCHAR(70), IN `P_descripcion` VARCHAR(200), IN `P_UnidaddeMedida` VARCHAR(100), IN `P_Peso_Pro` DECIMAL(10,5), IN `P_Cantidad_General` BIGINT, IN `P_Temperatura` DECIMAL(5,2), IN `P_estado_Pro` CHAR(1), IN `P_categoria` SMALLINT,IN `P_proveedor` bigint, IN `opcion` CHAR(15))  BEGIN 
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT Cod_pro as 'Código' , nombre_pro as 'Nombre' , descripcion as 'Descripción',unidad_medida as 'Unidad',peso_producto as 'Peso',cantidad_general_pro as 'Cantidad',temperatura_pro as 'Temperatura',estado_Pro as 'Estado', categoria,proveedor FROM Producto WHERE Cod_pro=P_Cod_pro;
			WHEN  'insertar' THEN 
			IF NOT EXISTS (SELECT * FROM Producto WHERE nombre_pro=P_nombre_pro) THEN 
			INSERT INTO Producto (nombre_pro , descripcion, unidad_medida,peso_producto,cantidad_general_pro,temperatura_pro,categoria,proveedor) VALUES (P_nombre_pro , P_descripcion,P_UnidaddeMedida,P_Peso_Pro,P_Cantidad_General,P_Temperatura, P_categoria,P_proveedor);
			End if;
			WHEN  'actualizar' THEN 
			UPDATE Producto SET nombre_pro = P_nombre_pro,descripcion=P_descripcion,unidad_medida=P_UnidaddeMedida,peso_producto=P_Peso_Pro,cantidad_general_pro=P_Cantidad_General ,temperatura_pro=P_Temperatura,categoria=P_categoria,proveedor=P_proveedor WHERE Cod_pro=P_Cod_pro;
			when 'eliminar' then
			UPDATE Producto SET estado_Pro='I'   WHERE Cod_pro=P_Cod_pro;
		END CASE;
	END$$




	-- CRUD ITEMS --
	-- A este no le meto eliminar, ya que hace parte del producto y al eliminarlo, este  tambien se elimina--
	DELIMITER  $$
	create procedure CrudITEMS(
	in P_Codigo_Barras BIGINT ,
	in P_Fecha_Vencimiento DATE,
	in P_Estante CHAR(1),
	in P_Nivel SMALLINT ,
	in P_Profundidad SMALLINT ,
	in P_cantidad SMALLINT  ,
	in P_Observaciones varchar(200),
	in P_Lote varchar(100),
	in P_Ingreso_Fechahor DATETIME,
	in P_Embalaje varchar(50),
	in P_Cod_producto INT,
	in P_Cuarto_Frio TINYINT,
	IN  opcion CHAR(15),
	estado char(1))
	BEGIN /*inicio del la programación*/
		CASE opcion 
			WHEN  'consultar' THEN 
			SELECT Codigo_Barras as 'Código de barras' , Fecha_Vencimiento as 'Fecha de vencimiento' , Estante , Nivel,Profundidad,cantidad,Observaciones,Lote,Ingreso_Fechahor,Embalaje,Cod_producto,Cuarto_Frio FROM ITEMS WHERE Codigo_Barras=P_Codigo_Barras;
			WHEN  'insertar' THEN 
			IF  NOT EXISTS (SELECT * FROM ITEMS WHERE Codigo_Barras=P_Codigo_Barras) THEN 
			INSERT INTO ITEMS (Codigo_Barras , Fecha_Vencimiento, Estante , Nivel,Profundidad,cantidad,Observaciones,Lote,Ingreso_Fechahor,Embalaje,Cod_producto,Cuarto_Frio) VALUES (P_Codigo_Barras , P_Fecha_Vencimiento, P_Estante, P_Nivel,P_Profundidad,P_cantidad,P_Observaciones,P_Lote,current_timestamp(),P_Embalaje,P_Cod_producto,P_Cuarto_Frio);
			End if;
			WHEN  'actualizar' THEN 
			UPDATE ITEMS SET Estante = P_Estante,Nivel=P_Nivel,Profundidad=P_Profundidad,cantidad=P_cantidad,Observaciones=P_Observaciones,Lote=P_Lote,Embalaje=P_Embalaje,Cuarto_Frio=P_Cuarto_Frio WHERE Codigo_Barras=P_Codigo_Barras;
			WHEN  'eliminar' THEN 
		   UPDATE ITEMS SET estado='I' where Codigo_Barras= P_Codigo_Barras;
		END CASE;
	END; $$

	 
	 
	 Delimiter  $$
	 create procedure validar(
	 in correoP varchar(70),
	 in clave2 varchar(100)
	 )
	 begin
	 select * from usuario where correo = correoP and clave = aes_encrypt(clave2,'xyz123')   and estado_usu = "A";
	 End;$$
	 
	  Delimiter  $$
	 create procedure ActualizaItem(
	 in codigo varchar(70),
	 in P_cantidad varchar(100)
	 )
	 begin
	UPDATE ITEMS SET cantidad=(Cantidad+P_cantidad) WHERE Codigo_Barras=codigo;
	 End;$$
	 
	   Delimiter  $$
	 create procedure RestarItem(
	 in codigo varchar(70),
	 in P_cantidad varchar(100)
	 )
	 begin
	UPDATE ITEMS SET cantidad=(Cantidad-P_cantidad) WHERE Codigo_Barras=codigo;
	 End;$$
	 
	 
	 call ActualizaItem (311233123,-20);
	 
	call validar('brayansmite748@gmail.com','bqNzQ52CQwmIxfw');
	select * from items;
	 
	   Delimiter  $$
	 create procedure ConsultarPosicion(
	 in P_es char(1), 
	 in P_po smallint, 
	 in p_ni smallint, 
	in p_cu int 
	 )
	 begin
	 select items.codigo_barras, items.Fecha_Vencimiento, items.Estante , items.Nivel, items.Profundidad , items.cantidad,items.Observaciones, items.Lote,items.Ingreso_Fechahor,items.Embalaje,Producto.nombre_pro ,items.Cuarto_Frio from items inner join producto on items.Cod_Producto = Producto.Cod_pro where Estante=P_es and Profundidad=p_po and nivel=p_ni and Cuarto_Frio=P_cu and estado='A';
	 End;$$
	 call ConsultarPosicion('A',1,1,2);
	 
		Delimiter  $$
	 create procedure crudEntradaSalida(
	 in barra bigint, 
	 in can bigint, 
	 in mo varchar(100),
	 in ti enum('I','R')
	 )
	 begin
	insert into EntradaSalida(codigoBarras,CantidadRegistrada,Motivo,FechaRegistro,tipo) values (barra,can,mo,current_date(),ti);
	 End;$$

	 
	Delimiter  $$
	 create procedure validarUsuario(
	 in P_val varchar(50), 
	 in P_opc smallint
	 )
	 begin
	 case P_opc 
			WHEN  1 THEN 
			select  cedula_U AS 'Cédula', nombre AS 'Nombre',apellido,celular, direccion AS 'Dirección',cargo,correo,Fecha_Registro AS 'Fecha Registro', cast(aes_decrypt(clave, 'xyz123') as char), Institucion,estado_usu AS 'Estado' from usuario where correo=P_val;
			WHEN 2 THEN 
			select * from usuario where cedula_U=P_val;
		end case;
	 End;$$
	 
	 call validarUsuario('Jos@gmail.com',1);
	  call validarUsuario('1000156154',2);
								
	call validarUsuario('brayansmite748@gmail.com',1);


	call crudinsti (null,'Villa  nueva',12112,'calle 12','insertar');
	call crudinsti (null,'Villa  vieja',32120215,'calle 15','insertar');
	call crudinsti (1,null,null,null,'consultar');
	call crudinsti (2,'Villa  Actualizada',1243456,'Calle 45 # 123-52','actualizar');
	call crudinsti (1,null,null,null,'eliminar');
	select * from Institucion;

			
	call crudUsuario (1000150151,'Jose luis','Quintero',32015215630,'Calle 150# 150-12','Admin','Jose@gmail.com',null, 123,1,null,'insertar');
	call crudUsuario(1000150153,'Jose luis','Quintero',32015215630,'Calle 150# 150-12','Admin','Jos@gmail.com',null,'123',1,null,'insertar');	
	call crudUsuario(1000150152,'Jose luis','Quintero',32015215630,'Calle 150# 150-12','Admin','Josep@gmail.com',null,'123',1,null,'insertar');	
	call crudUsuario(1000150151,null,null,null,null,null,null,null,null,null,null,'Consultar');
	call crudUsuario(1000150151,'lucas Actualizado','Este',32015215650,'Calle 120# 150-12','Almacenista','Luca@gmail.com',null,'123',null,null,'actualizar');
	call crudUsuario(1000150152,null,null,null,null,null,null,null,null,null,null,'eliminar');
	SELECT cast(aes_decrypt(clave, 'xyz123') as char) FROM usuario;
	delete from usuario where correo="brayansmite748@gmail.com";
	delete from usuario where correo="briane2301@hotmail.com";
	select * from usuario;
	SELECT cast(aes_decrypt(clave, 'xyz123') as char) FROM usuario;


	call crudcuartofrio(null,1000,500,'-10',null,5,10,10,1,'insertar');
	call crudcuartofrio(null,5000,1000,'-50',null,5,5,5,2,'insertar');
	call crudcuartofrio(1,null,null,null,null,null,null,null,null,'consultar');
	call crudcuartofrio(2,1400,700,'-5',null,7,7,7,null,'actualizar');
	call crudcuartofrio(1,null,null,null,null,null,null,null,null,'eliminar');

	SELECT 
		*
	FROM
		Cuarto_Frio;




	call crudProveedor ('La agencia maravilla',1548911312,3854795,'Calle 13-45','Maravilla@agent.com',null,'insertar');
	call crudProveedor ('La norie',48998798,456123,'Calle 73-45','Norie@agent.com',null,'insertar');
	call crudProveedor (null,1548911312,null,null,null,null,'consultar');
	call crudProveedor ('La mtrs maravilla',154894512,3854795,'Calle 130-15','Maravilla@agent.com',null,'actualizar');
	call crudProveedor (null,1548911312,null,null,null,null,'eliminar');

	SELECT 
		*
	FROM
		Proveedor;


	call crudCategoria (null,'Analgesico','Es una pastilla para algo',null,'insertar');
	call crudCategoria (null,'Antiflamatorio','Es una pastilla para desinflamar',null,'insertar');
	call crudCategoria (1,null,null,null,'consultar');
	call crudCategoria (1,'Analgesico','Es una pastilla para algo el dolor',null,'actualizar');
	call crudCategoria (2,null,null,null,'eliminar');

	SELECT 
		*
	FROM
		categoria;



	call CrudProducto(null,'Omeprazol','12x2 capsulas ','Gramos',12,'12',12,null,1,48998798,'insertar');
	call CrudProducto(null,'april','50 listros','Listros',20,'15',0,null,1,48998798,'insertar');
	call CrudProducto(1,null ,null,null,null,null,null,null,1,null,'consultar');
	call CrudProducto(1,'Omeprazol','10x5 capsulas ','Gramos',12,'12',12,null,1,48998798,'actualizar');
	call CrudProducto(1,null ,null,null,null,null,null,null,1,null,'eliminar');

	select * from producto;


	call CrudITEMS(10000115454,'2020-05-12','A',45,10,10,'Ninguna','easde54',null,'esta',2,1,'insertar',null);
	call CrudITEMS(311233123,'2025-10-20','B',23,1,50,'Ninguna','easde54',null,'mala',2,1,'insertar',null);
	call CrudITEMS(10000115454,null,null,null,null,null,null,null,null,null,null,null,'consultar',null);
	call CrudITEMS(10000115454,'2020-05-12','A',45,10,10,'Retirado','easde54',null,'esta',1,1,'actualizar',null);
	call CrudITEMS(311233123,null,null,null,null,null,null,null,null,null,null,null,'Eliminar',null);
	select * from items;
	SELECT codigo_barras as 'C' from Items;

	select * from Items where estado='A';


	create view Ubicacion as
	select items.codigo_barras, items.Fecha_Vencimiento, items.Estante , items.Nivel, items.Profundidad , items.cantidad,items.Observaciones, items.Lote,items.Ingreso_Fechahor,items.Embalaje,Producto.nombre_pro ,items.Cuarto_Frio from items inner join producto on items.Cod_Producto = Producto.Cod_pro;
	  select * from Ubicacion;
	  
	  create view Producto_Item_Categoria  as 
	  Select producto.Cod_pro as 'Código Producto' ,producto.nombre_pro as 'Nombre Producto', producto.descripcion as 'Descripción', categoria.nombre as 'Categoria', items.codigo_Barras as 'Codigo de barras', items.Fecha_vencimiento as 'Fecha de vencimiento',  
	  items.cantidad,items.Estante,items.Nivel, Items.Profundidad, items.Cuarto_Frio as 'Cuarto frio', producto.estado_Pro as 'Estado producto' from  producto inner join categoria on producto.categoria= categoria.id inner join items on producto.Cod_pro= items.Cod_producto;
	  
	   
	select * from Producto_Item_Categoria;


	  
	  create view Usuario_intitu as
	  select usuario.cedula_U as 'N# identificación', concat(usuario.nombre," ",usuario.apellido) as 'nombre', usuario.celular, usuario.direccion as 'Dirección',cargo,correo , institucion.nombre as 'Institucion', institucion.celular as 'Teléfono institucion', institucion.direccion as 'Direccion institucion' from usuario inner join institucion on usuario.institucion = institucion.Cod_insti;
	 
	 select * from Usuario_intitu;
	 

	  create view Cuartofrio_producto as
	  select items.Codigo_Barras as 'Codigo de Barras', producto.nombre_pro 'Producto', concat(items.Estante, items.Nivel, items.Profundidad) as 'Ubicación',cuarto_Frio.Cod_cufi as 'Código de cuarto frio', cuarto_Frio.temperatura from items inner join producto on items.Cod_producto = producto.Cod_pro inner join Cuarto_frio on items.Cuarto_Frio = Cuarto_frio.Cod_cufi;
	 
	 select * from Cuartofrio_producto;
	 select * from EntradaSalida;
	 call crudEntradaSalida(10000115454, 50,"nose",'R');
	call crudEntradaSalida(10000115454, 12,'ewqewqe','I');