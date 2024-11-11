<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Navbar Adaptada</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A9YHarIhF1yLgt8VJATtjF0OsfhaBw1JJ0yOp6Ewl7v5E4Fo5o2bMZt0ikP5r" crossorigin="anonymous"></script>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Georgia&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/estilos.css"/>

        <style>
            .categories-container {
                background-color: #ffffff;
                padding: 10px;
            }

            .categories a {
                color: #003366;
                font-weight: bold;
                margin-right: 20px;
                text-decoration: none;
            }

            .dropdown-menu-juvenil {
                border: 1px solid #ddd;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.15);
                border-radius: 8px;
                padding: 20px;
                background-color: rgba(255, 255, 255, 0.9);
                width: 700px;
                margin-left: 350px; 
            }

            .dropdown-menu-juvenil .category-title {
                font-weight: bold;
                color: #003366;
                margin-bottom: 10px;
                display: block;
                border-bottom: 2px solid #ffcc00;
                padding-bottom: 5px;
            }

            .dropdown-menu-juvenil .list-unstyled {
                padding: 0;
                margin: 0;
            }

            .dropdown-menu-juvenil .dropdown-item {
                color: #333333;
                padding: 5px 0;
                text-decoration: none;
            }

            .dropdown-menu-juvenil .dropdown-item:hover {
                background-color: #f0f0f0;
                color: #003366;
            }
        </style>
    </head>
    <body>
        <div class="top-bar">
            <p>Donde hay libros, hay magia. ¡Sumérgete en la magia de la lectura!</p>
        </div>
        <div class="navbar">
            <div class="logo-container">
                <img src="assets/img/recursos/logo.png" alt="Logo" class="logo-img">
                <div class="logo">
                    <a href="index.jsp" style="text-decoration: none; color: #efb810;"> 
                        <span class="title">Susurros de Tinta</span>  
                        <small class="tagline">Entre Páginas Mágicas</small>
                    </a>
                </div>
            </div>
            <div class="search-bar">
                <input type="text" placeholder="Buscar por título, autor o ISBN">
                <button><svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                    <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.415l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a 5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                    </svg></button>
            </div>

            <div class="nav-icons">
                <c:if test="${sessionScope.usuario == null}">
                    <a href="ClienteControlador?accion=nuevo" class="btn btn-dark">
                        <i class="fas fa-user-plus" style="letter-spacing:5px;"></i> Registrarse
                    </a>
                    &nbsp;
                    <a href="AuthControlador?accion=login" class="btn btn-dark">
                        <i class="fas fa-user-lock" style="letter-spacing:5px;"></i> Login
                    </a>
                </c:if>
                <c:if test="${sessionScope.usuario != null}">          
                    <a href="PedidoControlador?accion=mis_pedidos" class="btn btn-dark">
                        <i class="fa fa-receipt" style="letter-spacing:5px;"></i>  Mis pedidos
                    </a>              
                </c:if>
                <a href="CarritoControlador?accion=listar" class="btn btn-dark">
                    <i class="fa fa-shopping-cart"></i> (<span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size(): 0}</span>) Carrito
                </a>
                <c:if test="${sessionScope.usuario != null}">
                    <span class="btn btn-light">${sessionScope.usuario.nombresCompletos()}</span>
                    &nbsp;
                    <a href="AuthControlador?accion=logout" class="btn btn-dark">
                        <i class="fa fa-sign-out-alt" style="letter-spacing:5px;"></i> Cerrar Sesión
                    </a>
                </c:if>
            </div>
        </div>

        <div class="categories-container">
            <div class="categories">
                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=45">Los Más Vendidos</a>
                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=1">Novedades</a>
                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=2">Ficción</a>
                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=3">No Ficción</a>

                <!-- Menú desplegable personalizado para "Juvenil" -->
                <div class="dropdown">
                    <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown">Juvenil</a>
                    <div class="dropdown-menu dropdown-menu-juvenil">
                        <div class="row">
                            <!-- Columna 1 -->
                            <div class="col-md-3">
                                <span class="category-title">Wattpad</span>
                                <ul class="list-unstyled">
                                    <li><a class="dropdown-item" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=4">Wattpad</a></li>
                                </ul>
                            </div>

                            <!-- Columna 2 -->
                            <div class="col-md-3">
                                <span class="category-title">Romance spicy</span>
                                <ul class="list-unstyled">
                                    <li><a class="dropdown-item" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=5">Romance</a></li>
                                </ul>
                            </div>

                            <!-- Columna 3 -->
                            <div class="col-md-3">
                                <span class="category-title">Comics y mangas</span>
                                <ul class="list-unstyled">
                                    <li><a class="dropdown-item" href="#">Shojo</a></li>
                                    <li><a class="dropdown-item" href="#">Shonen</a></li>
                                    <li><a class="dropdown-item" href="#">Comics de héroes</a></li>
                                    <li><a class="dropdown-item" href="#">One Piece</a></li>
                                </ul>
                            </div>

                            <!-- Columna 4 -->
                            <div class="col-md-3">
                                <span class="category-title">Literatura juvenil</span>
                                <ul class="list-unstyled">
                                    <li><a class="dropdown-item" href="#">Terror y misterio</a></li>
                                    <li><a class="dropdown-item" href="#">Fantasía</a></li>
                                    <li><a class="dropdown-item" href="#">Ciencia ficción</a></li>
                                    <li><a class="dropdown-item" href="#">Youtubers</a></li>
                                    <li><a class="dropdown-item" href="#">Drama</a></li>
                                    <li><a class="dropdown-item" href="#">Clásicos</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=8">Ebooks y más</a>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A9YHarIhF1yLgt8VJATtjF0OsfhaBw1JJ0yOp6Ewl7v5E4Fo5o2bMZt0ikP5r" crossorigin="anonymous"></script>

    </body>
</html>

