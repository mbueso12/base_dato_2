select * from bd_facts.tbl_asesores;
select * from bd_facts.tbl_clientes;
select * from bd_facts.tbl_facturas;

select 
ase.idAsesor,
ase.numeroID,
ase.nombres,
ase.apellidos,
cl.nombrecompleto,
cl.numeroID
from  tbl_asesores ase left join tbl_clientes cl on ase.idAsesor = cl.idAsesor
where cl.idAsesor is null;


select
cl.idCliente,
cl.nombrecompleto,
F.idFactura,
F.fechaEmision,
F.fechaVencimiento,
F.fechapagada
 from tbl_facturas F inner join tbl_clientes cl on F.idCliente = cl.idCliente
 where F.fechaVencimiento between '2022-01-01 22:36:30' and '2022-02-10 04:11:10';
 
 
 
 /*Asignar un asesor a un cliente, actualizando el campo idasesor en la tabla clientes.*/ 
 /* El de aqui es para quitar error en el update*/
 SET SQL_SAFE_UPDATES = 0;
 set @v_idAsesor =0 ; 
 set @v_cantClientes = 0;
 set @v_idCliente = null;

 
 update bd_facts.tbl_clientes set idAsesor = 5
 where idCliente = 128;
 
 
 
 
 /*Actualizar el campo cantclientes en la tabla asesores, según la cantidad de clientes que tenga el asesor. */
 
 select  idAsesor into @v_idAsesor from bd_facts.tbl_clientes
 where idAsesor = @v_idAsesor ;
 
 select cantClientes into @v_cantClientes from bd_facts.tbl_asesores
 where cantClientes = @v_cantClientes;
 
 select
 count(*) Cantcliente
 from bd_facts.tbl_clientes 
 where idAsesor =  1 
 
 update bd_facts.tbl_asesores set cantClientes = 1
 where idAsesor = 7;
 

 
 
 
 
 
 
 
 
 
 select count(*) into @v_idAsesor 
 from bd_facts.tbl_clientes
 where idCliente = @v_idCliente;
 
 select cantClientes into @v_cantClientes
 from bd_facts.tbl_clientes
 where idAsesor = @v_idAsesor;
 
 
 update bd_facts.tbl_asesores
set idAsesor = @v_idAsesor,
 cantClientes = @v_cantClientes
 where idAsesor = @v_idAsesor;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 set @v_idCliente = 0;
 set @v_numeroID = '0101194045821';
 set @v_numeroRTN = '0101194045821';
 set @v_nombrecompleto = 'Allison Diaz';
 set @v_edad = 20;
 set @v_fechanacimiento = '';
 set @v_direccion = '';
 set @v_fechaingreso = '';
set @v_numeroTelefono = '';
set @v_idTipoCliente = 1;
set @v_idCiudad = 1;
set @v_idAsesor = 2;

 insert into bd_facts.tbl_clientes (
 idCliente,
 numeroID,
 numeroRTN,
 nombrecompleto ,
 edad,
 fechanacimiento,
 direccion,
 fechaingreso ,
numeroTelefono ,
idTipoCliente ,
idCiudad,
idAsesor
 ) values ();


 














