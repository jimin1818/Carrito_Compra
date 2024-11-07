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

