<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Navbar Adaptada</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1XsbALwX7iomSU" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Georgia&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="assets/estilos.css"/>
    <div class="top-bar">
        <p>Donde hay libros, hay magia. ¡Sumérgete en la magia de la lectura!</p>
    </div>

</head>
<style>
    /* Eliminar el margen y el padding del cuerpo para que el color cubra toda la página */
    body, html {
        margin: 0;
        padding: 0;
        width: 100%;
        height: 100%;
        background-color: #000; /* Fondo negro por defecto */
    }

    /* Contenedor de la barra superior (top-bar) */
    .top-bar {
        background-color: red;
        color: white;
        padding: 5px 0;
        text-align: center;
        font-weight: bold;
        width: 100%;
    }

    /* Navbar y categorías */
    .navbar, .categories-container {
        background: linear-gradient(90deg, #8B0000, #000000); /* Degradado de rojo oscuro a negro */
        color: white;
        padding: 10px 0;
        display: flex;
        align-items: center;
    }

    /* Ajuste del contenedor del logo para que no tenga márgenes ni padding adicionales */
    .navbar img {
        margin: 0;
        padding: 0;
        display: block; /* Asegura que no haya espacio alrededor de la imagen */
    }

    .navbar .logo {
        display: flex;
        flex-direction: column;
        margin-left: 10px; /* Espacio entre el logo y el texto */
    }

    /* Estilos para el logo y texto principal */
    .navbar .logo .title {
        font-family: 'Georgia', serif;
        font-weight: bold;
        color: #efb810; /* Color dorado */
        font-size: 1.8em;
    }
    .navbar .logo .tagline {
        color: #f5d473; /* Un dorado más claro */
        font-size: 0.9em;
    }

    /* Barra de búsqueda */
    .search-bar input[type="text"] {
        padding: 5px 10px;
        border: 1px solid #efb810;
        border-radius: 4px;
    }
    .search-bar button {
        background-color: #efb810;
        border: none;
        color: black;
        padding: 5px 8px;
        cursor: pointer;
        border-radius: 4px;
    }

    /* Estilos para los íconos de navegación */
    .nav-icons a, .nav-icons span {
        color: white;
        font-weight: bold;
        text-decoration: none;
    }
    .nav-icons a:hover, .nav-icons span:hover {
        color: #efb810; /* Cambia a dorado en hover */
    }

    /* Sección de categorías */
    .categories-container {
        padding: 15px 0;
        width: 100%;
        text-align: center;
    }
    .categories a {
        color: white;
        padding: 10px 15px;
        font-weight: bold;
        text-decoration: none;
    }
    .categories a:hover {
        color: #f5d473; /* Dorado claro en hover */
    }
</style>

<body>
    <div class="navbar">
        <img src="assets/img/recursos/logo.png" alt="Logo" style="width: 120px; height: auto;">

        <div class="logo">
            <a href="index.jsp" style="text-decoration: none; color: #efb810;"> 
                <span class="title">Susurros de Tinta</span>  
                <small class="tagline">Entre Páginas Mágicas</small>
            </a>
        </div>

        <div class="search-bar">
            <input type="text" placeholder="Buscar por título, autor o ISBN">
            <button><svg width="16" height="16" fill="currentColor" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.415l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                </svg></button>
        </div>

        <div class="nav-icons">
            <c:if test="${sessionScope.usuario == null}">
                <a href="ClienteControlador?accion=nuevo" class="btn btn-dark">
                    <i class="fas fa-user-plus"></i> Registrarse
                </a>
                &nbsp;
                <a href="AuthControlador?accion=login" class="btn btn-dark">
                    <i class="fas fa-user-lock"></i> Login
                </a>
            </c:if>

            <c:if test="${sessionScope.usuario != null}">
                <span class="btn btn-light">${sessionScope.usuario.nombresCompletos()}</span>
                &nbsp;
                <a href="AuthControlador?accion=logout" class="btn btn-dark">
                <i class="fa fa-sing-out-alt"></i> Cerrar Sesión
                </a>
            </c:if>
            <a href="CarritoControlador?accion=listar" class="btn btn-dark">
                <i class="fa fa-shopping-cart"></i> (<span class="fw-bold">${sessionScope.carrito != null? sessionScope.carrito.size(): 0}</span>) Carrito
            </a>
        </div>
    </div>

    <div class="categories-container">
        <div class="categories">
            <a class="nav-link" href="Novedades.jsp">Novedades</a>
            <a href="#">No Ficción</a>
            <a href="#">Romance</a>
            <a href="#">Juveniles</a>
            <a href="#">Ficción</a>
            <a href="#">Wattpad</a>
            <a href="#">Misterio</a>    
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A9YHarIhF1yLgt8VJATtjF0OsfhaBw1JJ0yOp6Ewl7v5E4Fo5o2bMZt0ikP5r" crossorigin="anonymous"></script>
</body>
</html>

