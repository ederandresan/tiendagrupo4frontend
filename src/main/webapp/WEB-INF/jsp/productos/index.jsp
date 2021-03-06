<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<t:plantilla>
	<h2>Portal de Productos</h2>

	<c:if test="${not empty mensajeExito}">
		<div class="alert alert-success" role="alert">${mensajeExito}</div>
	</c:if>

	<div
		class="container mt-4border  rounded-lg form-register login font-weight-normal purple-gradient "
		id="conxtainer">

		<form action="/productos/cargarcsv" method="post"
			enctype="multipart/form-data" class="form-inline pt-2">
			<div class="row">

				<input type="file" name="archivocsv" class="form-control" /> <input
					type="submit" value="Cargar" class="btn btn-outline-secondary">
			</div>

		</form>
	</div>
	</br>

	<c:if test="${fn:length(errores) > 0}">
		<div class="alert alert-danger" role="alert">
			<p>Se presentaron estos errores:</p>
			<ul>
				<c:forEach items="${errores}" var="error">
					<li>${error}</li>
				</c:forEach>
			</ul>
		</div>
	</c:if>

	<center>
		<form action="/productos/" method="get">
			<div class="mb-3 form-group col-6">
				<label>Buscar por Código:</label><input type="text" name="codigo"
					class="form-control" /> <input type="submit" value="Consultar"
					class="btn btn-outline-secondary form-group col-2" />
			</div>
		</form>
	</center>

	<h2>Listado de Productos</h2>

	<table class="table table-striped">
		<caption>Listado de los productos existentes.</caption>
		<thead>
			<tr>
				<th scope="col">Código</th>
				<th scope="col">Nombre</th>
				<th scope="col">Precio de Compra</th>
				<th scope="col">IVA de Compra</th>
				<th scope="col">Precio de Venta</th>
				<th scope="col">NIT Proveedor</th>
				<th scope="col">Nombre Proveedor</th>
				<th scope="col"></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productos}" var="producto">
				<tr>
					<td>${producto.codigo}</td>
					<td>${producto.nombre}</td>
					<td>${producto.precioCompra}</td>
					<td>${producto.ivaCompra}</td>
					<td>${producto.precioVenta}</td>
					<td><a href="/proveedores/${producto.proveedor.nit}">${producto.proveedor.nit}</a></td>
					<td><a href="/proveedores/${producto.proveedor.nit}">${producto.proveedor.nombre}</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</t:plantilla>