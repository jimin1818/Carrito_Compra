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
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css"/>

        <style>
            .slider-for {
                width: 100%;
                margin: 0 auto;
                display: flex;
                justify-content: center;
                align-items: center;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                overflow: hidden;
            }

            .slider-for img {
                width: 100%;
                height: auto;
                object-fit: cover; 
            }

            .slider-container {
                width: 80%;
                max-width: 1200px;
                text-align: center;
                margin: 0 auto;
            }

            .thumbnail-slider {
                width: 100%;
                max-width: 600px;
                margin: 20px auto;
            }

            .thumbnail {
                width: 70px;
                height: 70px;
                background-color: white;
                display: flex;
                justify-content: center;
                align-items: center;
                font-size: 1.2em;
                color: #2196F3;
                margin: 0 5px;
                cursor: pointer;
            }

            .slick-prev button, .slick-next button {
                font-size: 2em;
                color: white;
                background: none;
                border: none;
                cursor: pointer;
                outline: none;
            }

            .slick-prev, .slick-next {
                z-index: 1;
            }

            .carousel-container {
                position: relative;
                width: 80%;
                margin: 50px auto; 
            }

            .carousel {
                width: 80%;
                margin: auto;
            }

            .carousel-item {
                background: #ffffff;
                font-size: 16px;
                display: flex;
                align-items: center;
                justify-content: center;
                height: auto;
                border-radius: 5px;
                transition: transform 0.3s ease;
                margin: 0 5px;
            }
            .carousel-item small {
                color: #efb810;
            }
            .card {
                width: auto;
                margin: 0 auto;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                border-radius: 10px;
                overflow: hidden;
                background-color: white;
                text-align: center;
            }

            .card img {
                width: 600px;
                height: auto;
                object-fit: contain;
                border-bottom: 2px solid #ddd;
            }

            .slick-center .carousel-item {
                background: #ffffff;
                color: #ff8c00;
                font-weight: bold;
                transform: scale(1.1);
            }

            .carousel-button {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                background-color: transparent;
                color: white;
                border: none;
                padding: 10px;
                font-size: 20px;
                cursor: pointer;
                transition: color 0.3s;
            }

            .carousel-button:hover {
                color: #ff8c00;
            }

            .prev-btn {
                left: -25px;
            }

            .next-btn {
                right: -25px;
            }

            .carousel-item img {
                max-width: 100%;
                height: auto;
                object-fit: cover;
            }
        </style>
    </head>
    <body>
        <jsp:include page="components/Navegacion.jsp"/>

        <!-- Primer Carrusel -->
        <div class="slider-for">
            <div><img src="assets/img/Banners/banner1.png" alt="Imagen 1"/></div>
            <div><img src="assets/img/Banners/banner2.png" alt="Imagen 2"/></div>
            <div><img src="assets/img/Banners/banner6.png" alt="Imagen 3"/></div>
            <div><img src="assets/img/Banners/banner4.png" alt="Imagen 4"/></div>
            <div><img src="assets/img/Banners/banner5.png" alt="Imagen 5"/></div>
        </div>

        <div class="slider-container">
            <div class="slider-nav thumbnail-slider">
                <div class="thumbnail">1</div>
                <div class="thumbnail">2</div>
                <div class="thumbnail">3</div>
                <div class="thumbnail">4</div>
                <div class="thumbnail">5</div>
            </div>
        </div>

    <center>
        <h1 style="color: #efb810">✨ Novedades✨</h1>
    </center>       

    <!-- Carrusel de productos -->
    <div class="carousel-container">
        <div class="carousel center">
            <c:forEach items="${productos}" var="item">
                <div class="carousel-item">
                    <form action="CarritoControlador" method="get">
                        <div class="card">
                            <input type="hidden" name="accion" value="agregar">
                            <input type="hidden" name="id" value="${item.idProd}">
                            <a class="nav-link" href="CarritoControlador?accion=filtrarPorCategoria&idCategoria=2"></a>
                            <img src="assets/img/Novedades/${item.imagen}" alt="${item.nombre}" class="img-fluid">
                            <p>${item.nombre}</p>
                            <small>S/ <fmt:formatNumber value="${item.precio}" type="number" minFractionDigits="2" maxFractionDigits="2"/></small>
                            <button type="submit" class="btn btn-sm btn-primary mt-2">
                                <i class="fa fa-shopping-cart"></i> Agregar al carrito
                            </button>
                        </div>
                    </form>
                </div>
            </c:forEach>
        </div>

        <button class="carousel-button prev-btn"><i class="fas fa-chevron-left"></i></button>
        <button class="carousel-button next-btn"><i class="fas fa-chevron-right"></i></button>
    </div>

    <footer class="bg-dark text-white p-3 mt-5">
        <p>&copy; 2024 Susurros de Tinta Entre Páginas Mágicas - Todos los derechos reservados</p>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $(document).ready(function () {
            $('.slider-for').slick({
                slidesToShow: 1,
                slidesToScroll: 1,
                arrows: true,
                fade: true,
                asNavFor: '.slider-nav',
                autoplay: true,
                autoplaySpeed: 4000,
                pauseOnHover: true
            });

            $('.slider-nav').slick({
                slidesToShow: 3,
                slidesToScroll: 1,
                asNavFor: '.slider-for',
                centerMode: true,
                focusOnSelect: true,
                prevArrow: '<button class="slick-prev"><i class="fas fa-chevron-left"></i></button>',
                nextArrow: '<button class="slick-next"><i class="fas fa-chevron-right"></i></button>',
                responsive: [
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 480,
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });

            var slickCarousel = $('.carousel');
            slickCarousel.slick({
                slidesToShow: 5,
                slidesToScroll: 1,
                arrows: false,
                autoplay: true,
                autoplaySpeed: 3000,
                centerMode: true,
                focusOnSelect: true,
                responsive: [
                    {
                        breakpoint: 1200,
                        settings: {
                            slidesToShow: 3
                        }
                    },
                    {
                        breakpoint: 992,
                        settings: {
                            slidesToShow: 2
                        }
                    },
                    {
                        breakpoint: 768,
                        settings: {
                            slidesToShow: 1
                        }
                    }
                ]
            });

            $('.prev-btn').click(function () {
                slickCarousel.slick('slickPrev');
            });

            $('.next-btn').click(function () {
                slickCarousel.slick('slickNext');
            });
        });
    </script>
</body>
</html>
