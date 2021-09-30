package ru.job4j.cinema.servlet;

import ru.job4j.cinema.service.Cinema;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class BuyTicketServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int row = Integer.parseInt(req.getParameter("row"));
        int cell = Integer.parseInt(req.getParameter("cell"));
        String fio = req.getParameter("username");
        String phone = req.getParameter("phone");
        String busyPlace = "/success.jsp";
        try {
            Cinema.instOf().buyTicket(row, cell, fio, phone);
        } catch (Exception e) {
            busyPlace = "/busyPlace.jsp";
        }
        resp.sendRedirect(req.getContextPath() + busyPlace);
    }
}
