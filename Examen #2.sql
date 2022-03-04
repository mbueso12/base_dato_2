select * from  tbl_productos_facturados where idFactura=207
select * from tbl_facturas where idFactura=207
update tbl_facturas set cantidadProductos=0 , subTotalPagar=0,totalISV=0 ,totalpagar=0 where  idFactura=207


delimiter //
create procedure bd_factsv2.sp_productfac(
in p_idProducto int,
in p_idFactura int,
in p_cantidad int
)
begin 
	declare precioproducto decimal(12,2);
    declare stock int;
    declare unidadtotal int;
	declare totalproductos int;
    declare subTotal decimal(12,2);
    declare total_isv decimal(12,2);
    declare total_pagar decimal(12,2);
    
	set precioproducto=(select precioVenta from tbl_productos where idProducto=p_idProducto);
    set stock = (select saldoUnidades from tbl_productos WHERE idProducto=p_idProducto);
    
    if stock >=p_cantidad THEN
     insert into tbl_productos_facturados values(p_idProducto,p_idFactura,p_cantidad, precioproducto * 0.15 ,precioproducto);
     set unidadtotal = (stock - p_cantidad);
     update tbl_productos set saldoUnidades = unidadtotal where idProducto=p_idProducto;
     set totalproductos=(select count(cantidad) from tbl_productos_facturados where idFactura=p_idProducto);
	 set subTotal=(select subTotalPagar from tbl_facturas where idFactura=p_idFactura);
     set total_isv=(select totalISV from tbl_facturas where idFactura=p_idFactura);
     set total_pagar=(select totalpagar from tbl_facturas where idFactura=p_idFactura);
     
     update tbl_facturas set cantidadProductos=totalproductos , subTotalPagar=(precioproducto * p_cantidad) + subTotal, totalISV = (p_cantidad * ( precioproducto * 0.15) ) + total_isv ,
     totalpagar= ((precioproducto * p_cantidad)+(p_cantidad * ( precioproducto * 0.15) )) + total_pagar where idFactura =p_idFactura; 
     
    else
     select 'Existencia Insuficiente';
    END IF;
	
	commit;
END;

call bd_factsv2.sp_productfac (1026, 207, 1)
drop procedure bd_factsv2.sp_productfac


select * from tbl_productos