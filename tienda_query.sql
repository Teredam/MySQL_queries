select tienda.producto.nombre from tienda.producto;
select tienda.producto.nombre, tienda.producto.precio from tienda.producto;
select * from tienda.producto;
select tienda.producto.nombre, tienda.producto.precio as precio_euros, tienda.producto.precio * 1.1 as precio_dolares from tienda.producto; 
select tienda.producto.nombre as nombre_de_producto, tienda.producto.precio as euros, tienda.producto.precio * 1.1 as dolares from tienda.producto;
select upper(nombre) as nombre_producto, tienda.producto.precio from tienda.producto;
select lower(nombre), tienda.producto.precio from tienda.producto;
select tienda.fabricante.nombre, upper(SUBSTRING(nombre, 1, 2)) as dos_caracteres_iniciales  from tienda.fabricante;
select tienda.producto.nombre, round(precio, 0) from tienda.producto;	
select tienda.producto.nombre, truncate(precio, 0) from tienda.producto;
select tienda.fabricante.codigo from tienda.fabricante inner join tienda.producto on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select distinctrow tienda.fabricante.codigo from tienda.fabricante inner join tienda.producto on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select tienda.fabricante.nombre from tienda.fabricante order by tienda.fabricante.nombre asc;
select tienda.fabricante.nombre from tienda.fabricante order by tienda.fabricante.nombre desc;
select * from tienda.producto order by tienda.producto.nombre desc, tienda.producto.precio desc;
select * from tienda.fabricante limit 5;
select * from tienda.fabricante limit 3,2;
select * from tienda.producto order by tienda.producto.precio asc limit 1;
select * from tienda.producto order by tienda.producto.precio desc limit 1;
select tienda.producto.nombre from tienda.producto where tienda.producto.codigo_fabricante = 2; 
select tienda.producto.nombre, tienda.producto.precio, tienda.fabricante.nombre as nombre_fabricante from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select tienda.producto.nombre, tienda.producto.precio, tienda.fabricante.nombre as nombre_fabricante from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) order by tienda.fabricante.nombre asc;
select tienda.producto.codigo as codigo_producto, tienda.producto.nombre as nombre_producto, tienda.fabricante.codigo as codigo_fabricante, tienda.fabricante.nombre as nombre_fabricante from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select tienda.producto.nombre as nombre_producto, tienda.producto.precio, tienda.fabricante.nombre as nombre_fabricante from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) order by tienda.producto.precio asc limit 1;
select tienda.producto.nombre as nombre_producto, tienda.producto.precio, tienda.fabricante.nombre as nombre_fabricante from tienda.productoinner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) order by tienda.producto.precio desc limit 1;
select tienda.producto.nombre from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre = 'Lenovo';
select tienda.producto.nombre from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre = 'Crucial' and tienda.producto.precio > 200;
select tienda.producto.nombre from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre = 'Asus' or tienda.fabricante.nombre = 'Hewlett-Packard' or tienda.fabricante.nombre = 'Seagate';
select tienda.producto.nombre from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre in('Asus', 'Hewlett-Packard', 'Seagate');
select tienda.producto.nombre, tienda.producto.precio from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre like '%e';
select tienda.producto.nombre, tienda.producto.precio from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre like '%w%';
select tienda.producto.nombre as nombre_producto, tienda.producto.precio, tienda.fabricante.nombre as nombre_fabricante from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where precio >= 180 order by tienda.producto.precio desc, tienda.fabricante.nombre asc;
select tienda.fabricante.codigo, tienda.fabricante.nombre from tienda.fabricante where exists (select * from tienda.producto where tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select tienda.fabricante.codigo, tienda.fabricante.nombre, tienda.producto.nombre from tienda.fabricante left join tienda.producto on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select * from tienda.fabricante where not exists (select * from tienda.producto where tienda.fabricante.codigo = tienda.producto.codigo_fabricante);
select tienda.producto.nombre from tienda.producto where exists (select * from tienda.fabricante where tienda.fabricante.codigo = tienda.producto.codigo_fabricante and tienda.fabricante.nombre = 'Lenovo');
select * from producto where tienda.producto.precio = (select max(precio) from tienda.producto where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo from tienda.fabricante where tienda.fabricante.nombre = 'Lenovo'));
select tienda.fabricante.nombre, max(precio) from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre = 'Lenovo';  
select tienda.fabricante.nombre, min(precio) from tienda.producto inner join tienda.fabricante on (tienda.fabricante.codigo = tienda.producto.codigo_fabricante) where tienda.fabricante.nombre = 'Hewlett-Packard';
select * from tienda.producto where tienda.producto.precio >= (select max(precio) from tienda.producto where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo from tienda.fabricante where nombre = 'Lenovo'));
select * from tienda.producto where tienda.producto.precio > (select avg(precio) from tienda.producto where tienda.producto.codigo_fabricante = (select tienda.fabricante.codigo from tienda.fabricante where tienda.fabricante.nombre = 'Asus'))