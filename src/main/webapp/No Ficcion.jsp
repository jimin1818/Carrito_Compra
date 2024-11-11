<%-- 
    Document   : No Ficcion
    Created on : 10 nov. 2024, 16:25:24
    Author     : tania
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>No Ficcion</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/estilos.css"/>
        <style>
            .container {
                max-width: 1000px;
                margin: auto;
                text-align: center;
            }
            .products-viewing {
                margin-bottom: 20px;
                font-size: 14px;
                color: #666;
            }
            .card {
                width: 150px;
                margin: 20px auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }
            .card img {
                height: 200px;
                object-fit: cover;
            }
            .card-body p {
                font-size: 14px;
                font-weight: bold;
            }
            .card-body small {
                font-size: 14px;
                color: #00796b;
            }
        </style>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>

        <section style="text-align: center;">
            <img src="assets/img/Banners/banner3.png" alt="Banner Novedades" class="img-fluid" width="950" height="600"/>
        </section>

        <div class="container">
            <h1 style="color: #efb810">✨ No Ficcion ✨</h1>

            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-5 g-3">
                <c:forEach items="${productos}" var="item">
                    <div class="col d-flex justify-content-center">
                        <form action="CarritoControlador" method="get">
                            <div class="card">
                                <input type="hidden" name="accion" value="agregar">
                                <input type="hidden" name="id" value="${item.idProd}">
                                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=3"></a>
                                <img src="assets/img/NoFiccion/${item.imagen}" alt="${item.nombre}" class="card-img-top"/>
                                <div class="card-body">
                                    <p>${item.nombre}</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <button type="submit" class="btn btn-sm btn-primary">
                                            <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                        </button>
                                        <small>S/ <fmt:formatNumber value="${item.precio}" type="number" minFractionDigits="2" maxFractionDigits="2"/></small>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </c:forEach>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
