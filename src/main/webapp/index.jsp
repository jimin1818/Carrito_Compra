<%-- 
    Document   : index
    Created on : 22 oct. 2024, 19:48:45
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
        <title>Carrito de compras</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href="assets/css/estilos.css" rel="stylesheet" type="text/css"/>
        <style>
            .product-price {
                text-align: center; 
                margin-top: 0.5rem; 
            }
            .btn-small {
                padding: 0.2rem 0.5rem; 
                font-size: 0.8rem; 
            }
            .container {
                max-width: 1200px;
                margin: auto;
                text-align: center;
            }
            .card {
                width: 150px;
                margin: 50px; 
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
            }
            .card img {
                height: 230px;
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
        
        <section class="banner">
            <img src="assets/img/Novedades/BannerPromocional1.png" alt="Banner Promocional 1" class="img-fluid"/>
            <img src="assets/img/Novedades/BannerPromocional2.png" alt="Banner Promocional 2" class="img-fluid"/>
            <img src="assets/img/Novedades/BannerPromocional3.png" alt="Banner Promocional 3" class="img-fluid"/>
        </section>

        <div class="container-fluid mt-2">
            <h2 class="text-center text-warning">Novedades</h2>
            <div id="carouselNovedades" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <c:set var="count" value="0"/>
                    <c:forEach items="${productos}" var="item">
                        <c:if test="${count % 5 == 0}">
                            <div class="carousel-item ${count == 0 ? 'active' : ''}">
                                <div class="row justify-content-center"> 
                        </c:if>
                        <div class="col d-flex justify-content-center">
                            <form action="CarritoControlador" method="get">
                                <div class="card">
                                    <input type="hidden" name="accion" value="agregar">
                                    <input type="hidden" name="id" value="${item.idProd}">
                                    <img src="assets/img/productos/${item.imagen}" alt="${item.nombre}" class="card-img-top"/>
                                    <div class="card-body">
                                        <p class="fw-bold">${item.nombre}</p>
                                        <div class="d-flex justify-content-between align-items-center">
                                            <button type="submit" class="btn btn-small btn-primary">
                                                <i class="fa fa-shopping-cart"></i> Agregar al carrito
                                            </button>
                                            <small>S/ <fmt:formatNumber value="${item.precio}" type="number" minFractionDigits="2" maxFractionDigits="2"/></small>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <c:set var="count" value="${count + 1}"/>
                        <c:if test="${count % 5 == 0 || count == productos.size()}">
                                </div> 
                            </div> 
                        </c:if>
                    </c:forEach>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselNovedades" data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Anterior</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselNovedades" data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Siguiente</span>
                </button>
            </div>
            <div class="text-center mt-3">
                <a href="Novedades.jsp" class="btn btn-danger view-more">Ver más</a>
            </div>
        </div>

        <footer>
            <p>&copy; 2024 Susurros de Tinta Entre Páginas Mágicas - Todos los derechos reservados</p>
        </footer>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
