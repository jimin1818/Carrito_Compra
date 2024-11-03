<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Romance</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="css/css.css"/>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>

        <div class="container-fluid mt-2">
            <div class="row">
                <div class="col-md-3">
                    <h5>Filtros</h5>
                    <hr /> 
                    <h6>Categoría</h6>
                    <ul class="list-group">
                        <c:forEach items="${categorias}" var="categoria">
                            <li class="list-group-item">${categoria.nombre}</li>
                        </c:forEach>
                    </ul>
                </div>

                <div class="col-md-9">
                    <h5>Catálogo de Productos</h5>
                    <hr />
                    <div class="d-flex justify-content-between">
                        <p>Artículos 1-20 de 100</p>
                        <div>
                            <select class="form-select form-select-sm" style="width: auto; display: inline-block;">
                                <option selected>Ordenar por: Posición</option>
                                <option value="precio">Precio</option>
                            </select>
                            <select class="form-select form-select-sm" style="width: auto; display: inline-block;">
                                <option selected>Mostrar: 20</option>
                                <option value="30">40</option>
                                <option value="50">60</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                        <c:forEach items="${productos}" var="item">
                            <div class="col-sm-3 mt-1" style="padding: 15px">
                                <form action="CarritoControlador" method="get">
                                    <div class="card">
                                        <input type="hidden" name="accion" value="agregar">
                                        <input type="hidden" name="id" value="${item.idProd}">
                                        <img src="assets/img/Juveniles/${item.imagen}" width="100%" alt="${item.nombre}" class="card-img-top"/>
                                        <div class="card-body">
                                            <p class="fw-bold">${item.nombre}</p>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <button type="submit" class="btn btn-sm btn-primary">
                                                    <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                                </button>
                                                <small class="fw-bold">S/ <fmt:formatNumber value="${item.precio}" type="number" minFractionDigits="2" maxFractionDigits="2"/></small>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
