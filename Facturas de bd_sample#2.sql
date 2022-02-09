/* Tarea numero 2*/
 
 
 select * from bd_sample.tbl_productos;
select * from bd_sample.tbl_items_factura;
select * from bd_sample.tbl_subscriptores;
select * from bd_sample.tbl_facturas;

set @v_id_sub = 0;
set @v_cod_subs = '202212345';
set @v_nomb = 'Jon Paul';
set @v_ape = 'Doe';

update tbl_subscriptores set codigo_subscriptor = '202212345'
where id_subscriptor = 20;
insert into bd_sample.tbl_subscriptores(
id_subscriptor, codigo_subscriptor, nombres, apellidos
) values (@v_id_sub, @v_cod_subs, @v_nomb, @v_ape);
/*Ejecucion 2 */
set @v_id_factura = 0;
set @v_fecha_emision = '2022-02-07 18:45:45';
set @v_id_subscriptor = 20;
set @v_numero_items = 1;
set @v_precio_venta = 9.50;
set @v_subtotal = @v_precio_venta * @v_numero_items;
set @v_isv_total = (@v_subtotal * 0.18);
set @v_totapagar = @v_subtotal + @v_isv_total;
set @v_id_producto = 3;
set @v_cantidad = 2;

/*Ejecucion 1 */
set @v_id_factura = 0;
set @v_fecha_emision = '2022-02-07 18:45:45';
set @v_id_subscriptor = 20;
set @v_numero_items = 1;
set @v_precio_venta = 5.50;
set @v_subtotal = @v_precio_venta * @v_numero_items;
set @v_isv_total = (@v_subtotal * 0.18);
set @v_totapagar = @v_subtotal + @v_isv_total;
set @v_id_producto = 2;
set @v_cantidad = 2;



insert into bd_sample.tbl_facturas
values( @v_id_factura,
@v_fecha_emision,
 @v_id_subscriptor, 
@v_numero_items ,
 @v_isv_total,
@v_subtotal,
@v_totapagar
);

 set @v_id_factura = (select last_insert_id());
 
 insert into bd_sample.tbl_items_factura values
 (
 @v_id_factura,
@v_id_producto,
 @v_cantidad
 );

select sum(totapagar) Monto_Total  from bd_sample.tbl_facturas
where  id_subscriptor = 20;
