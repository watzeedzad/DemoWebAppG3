/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jiraw
 */
@WebServlet(name = "MultiplicationTable", urlPatterns = {"/MultiplicationTable"})
public class MultiplicationTable extends HttpServlet {

    int n;
    int x;

    @Override
    public void init() throws ServletException {
        x = Integer.parseInt(getInitParameter("defaultNumber"));
        //To change body of generated methods, choose Tools | Templates.
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String nStr = "";
        String message = "";
        if (request.getParameter("n")==null) {
            n = x;
        }
        try {
            nStr = request.getParameter("n");
            n = Integer.parseInt(nStr);
        } catch (Exception e) {
            message = "Can't convert " + nStr + " to integer, Please try again.";
        }
        try (PrintWriter out = response.getWriter()) {
            out.println("<HTML><HEAD><TITLE>Multiplication Table");
            out.println("</TITLE></HEAD><BODY>");
            out.println("<table><tr><td colspan = '5'>Multiplication Table of " + n + "</td></tr>");
            for (int i = 1; i <= 12; i++) {
                out.println("<tr><td>" + n + "</td><td> x </td><td>" + i + " </td>");
                out.println("<td> = </td><td> " + n * i + " </td></tr>");
            }
            out.println("</table>");
            if (message.length() > 0) {
                out.println("<hr><h3 style='color:red'>" + message + "</h3>");
            }
            out.println("</BODY></HTML>");
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
