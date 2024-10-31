<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Navbar Adaptada</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1XsbALwX7iomSU" crossorigin="anonymous">
    <style>
        .navbar {
            background-color: #000000 !important;
        }
        .navbar-brand {
            font-size: 1.5rem;
            font-weight: bold;
            color: #008db9;
        }
        .navbar-brand small {
            display: block;
            font-size: 0.9rem;
            color: #006a8e;
        }
        .search-bar {
            flex-grow: 1;
            max-width: 600px;
            position: relative;
        }
        .search-bar input {
            width: 100%;
            padding: 8px 20px 8px 15px;
            border: 1px solid #ddd;
            border-radius: 20px;
            outline: none;
        }
        .search-bar button {
            position: absolute;
            right: 5px;
            top: 50%;
            transform: translateY(-50%);
            background-color: transparent;
            border: none;
            color: #00458b;
            font-size: 1.2rem;
            cursor: pointer;
        }
        .navbar-nav .nav-link {
            color: #005b91;
            font-weight: 500;
            margin-left: 15px;
            font-size: 0.9rem;
        }
        .right-icons a {
            color: #008db9;
            margin-left: 15px;
            font-size: 0.9rem;
        }
        .right-icons a i {
            margin-right: 5px;
        }
        .lower-navbar {
            background-color: #e9f4fc;
            padding: 8px 0;
        }
        .lower-navbar .nav-link {
            color: #005b91;
            font-weight: 500;
            font-size: 0.9rem;
            padding: 0 15px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid d-flex align-items-center">

        <a class="navbar-brand d-flex flex-column me-3" href="#">
            <img src="assets/img/recursos/logo.png" alt="Logo" style="width: 80px; height: auto;">
        </a>

        <a class="nav-link home-link ms-3 me-3 d-none d-lg-block" aria-current="page" href="index.jsp">
            <i class="fa fa-home"></i> Home
        </a>

        <a class="navbar-brand d-flex flex-column ms-3 me-4" href="">
            Susurros de Tinta 
            <small>Entre Páginas Mágicas</small>
        </a>

        <!-- Toggle button for mobile view -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Collapsible content for mobile view -->
        <div class="collapse navbar-collapse" id="navbarContent">
            <form class="search-bar d-flex my-3 my-lg-0 ms-lg-4">
                <input type="text" placeholder="Buscar por título o autor" aria-label="Buscar">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>

            <div class="right-icons d-flex ms-lg-auto">
                <a href="#" class="nav-link">Blog</a>
                <a href="#" class="nav-link">Tiendas</a>
                <a href="ClienteControlador?accion=nuevo"><i class="fas fa-user-plus"></i> Registrarse</a>
                <a href="CarritoControlador?accion=listar">
                    <i class="fa fa-shopping-cart"></i> 
                    (<span class="fw-bold">${sessionScope.carrito != null ? sessionScope.carrito.size() : 0}</span>) Carrito
                </a>
            </div>
        </div>
    </div>
</nav>

<div class="lower-navbar text-center">
    <div class="container d-flex justify-content-center">
        <div class="navbar-nav d-flex flex-row flex-wrap justify-content-center">
            <a class="nav-link" href="#">Novedades</a>
            <a class="nav-link" href="#">No Ficción</a>
            <a class="nav-link" href="#">Romance</a>
            <a class="nav-link" href="#">Libros Juveniles</a>
            <a class="nav-link" href="#">Ficción</a>
            <a class="nav-link" href="#">Wattpad</a>
            <a class="nav-link" href="#">Misterio</a>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76A9YHarIhF1yLgt8VJATtjF0OsfhaBw1JJ0yOp6Ewl7v5E4Fo5o2bMZt0ikP5r" crossorigin="anonymous"></script>
</body>
</html>

