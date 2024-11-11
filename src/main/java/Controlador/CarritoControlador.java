package Controlador;

import Modelo.DetallePedido;
import Modelo.Producto;
import ModeloDAO.ProductoDAO;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import util.Carrito;

/**
 *
 * @author tania
 */
public class CarritoControlador extends HttpServlet {

    private String PagListarCarrito = "PagCarrito.jsp";
    private String PagInicio = "index.jsp";

    private ProductoDAO prodDao = new ProductoDAO();
    private Carrito objCarrito = new Carrito();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        switch (accion) {
            case "listar":
                Listar(request, response);
                break;
            case "agregar":
                Agregar(request, response);
                break;
            case "eliminar":
                Eliminar(request, response);
                break;
            case "filtrarPorCategoria":
                FiltrarPorCategoria(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void Listar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        ArrayList<DetallePedido> lista = objCarrito.ObtenerSesion(request);
        request.setAttribute("carrito", lista);
        request.setAttribute("total", objCarrito.ImporteTotal(lista));
        request.getRequestDispatcher(PagListarCarrito).forward(request, response);
    }

    protected void Agregar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int idProd = Integer.parseInt(request.getParameter("id"));
        Producto obj = prodDao.BuscarPorId(idProd);

        if (obj != null) {
            DetallePedido objDet = new DetallePedido();
            objDet.setProducto(obj);
            objDet.setCantidad(1);

            objCarrito.AgregarCarrito(objDet, request);
        }
        request.getRequestDispatcher(PagInicio).forward(request, response);
    }

    protected void Eliminar(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        int indice = Integer.parseInt(request.getParameter("indice"));

        objCarrito.RemoverItemCarrito(request, indice);

        response.sendRedirect("CarritoControlador?accion=listar");
    }

    protected void FiltrarPorCategoria(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idCategoria = Integer.parseInt(request.getParameter("idCategoria"));
        ArrayList<Producto> productos = prodDao.ListarPorCategoria(idCategoria);
        request.setAttribute("productos", productos);
        
        switch (idCategoria) {
            case 1:
                request.getRequestDispatcher("Novedades.jsp").forward(request, response);
                break;
            case 2:
                request.getRequestDispatcher("Ficcion.jsp").forward(request, response);
                break;
            case 3:
                request.getRequestDispatcher("No Ficcion.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect("index.jsp");
                break;
        }
    }
        // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
        /**
         * Handles the HTTP <code>GET</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doGet
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Handles the HTTP <code>POST</code> method.
         *
         * @param request servlet request
         * @param response servlet response
         * @throws ServletException if a servlet-specific error occurs
         * @throws IOException if an I/O error occurs
         */
        @Override
        protected void doPost
        (HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
        }

        /**
         * Returns a short description of the servlet.
         *
         * @return a String containing servlet description
         */
        @Override
        public String getServletInfo
        
            () {
        return "Short description";
        }// </editor-fold>

    }
