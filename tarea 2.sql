
set @v_id_subscriptor =16;
set @v_id_factura  = null;
set @v_id_producto = 1;
set @v_cantidad    = 1;
set @v_numero_items = 0;
set @v_precio_prod = 0; 

/*
insert into bd_sample.tbl_facturas (
id_factura, fecha_emision, id_subscriptor, numero_items, isv_total, subtotal, totapagar
) values (
null, curdate(), @v_id_subscriptor,0,0,0,0
);
*/

select id_factura into @v_id_factura from bd_sample.tbl_facturas
where id_subscriptor = @v_id_subscriptor
order by id_factura desc;

insert into bd_sample.tbl_items_factura
(
id_factura, id_producto, cantidad
) values(@v_id_factura,@v_id_producto,@v_cantidad);


 select count(*) into @v_numero_items 
 from bd_sample.tbl_items_factura
 where id_factura = @v_id_factura;
 
 select precio_venta into @v_precio_prod
 from bd_sample.tbl_productos
 where id_producto = @v_id_producto ;
 
 
 update bd_sample.tbl_facturas
set numero_items = @v_numero_items,
 isv_total = (@v_precio_prod * @v_numero_items) * 0.18,
 subtotal =  @v_precio_prod * @v_numero_items,
 totapagar = (@v_precio_prod * @v_numero_items) * 1.18
 where id_factura = @v_id_factura;
 
 
 
 select * from bd_sample.tbl_productos;
select * from bd_sample.tbl_items_factura;
select * from bd_sample.tbl_subscriptores;
select * from bd_sample.tbl_facturas;

set @v_cod_subs = '201801845';
set @v_nomb = 'Jon Paul';
set @v_ape = 'Doe';

insert into bd_sample.tbl_subscriptores(
codigo_subscriptor, nombres, apellidos
) values (@v_cod_subs, @v_nomb, @v_ape);


