/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sit.int303.demo.model.PrimeCheck;


/**
 *
 * @author jiraw
 */
public class PrimeServlet extends HttpServlet {

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
        String userNumStr = "";
        String message = "";
        userNumStr = request.getParameter("numUserIn");
        PrimeCheck pc1 = new PrimeCheck();
        if (pc1.checkPrime(Integer.parseInt(userNumStr))==1) {
            request.setAttribute("userNumStr", pc1.checkPrime(Integer.parseInt(userNumStr)));
            message = ""+userNumStr+" is a prime number";
            request.setAttribute("message", message);
        } else if (userNumStr==null) {
            message = "Null is not a prime number!";
            request.setAttribute("message", message);
        } else if (Integer.parseInt(userNumStr)<1) {
            message = "Value can not be zero or negative";
            request.setAttribute("message", message);
        } else {
            message = ""+userNumStr+" is not a prime number!";
            request.setAttribute("message", message);
        }
        //request.getRequestDispatcher("").forward(request, response);
        getServletContext().getRequestDispatcher("/CheckPrimeNumber.jsp").forward(request, response);
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
