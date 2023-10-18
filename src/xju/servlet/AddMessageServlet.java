package xju.servlet;

import xju.dao.AddDao;
import xju.pojo.Xinxi;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddMessageServlet", value = "/AddMessageServlet")
public class AddMessageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String nickname = request.getParameter("Books_Name");
        String qq = request.getParameter("Books_Qq");
        String email = request.getParameter("Books_Mail");
        String text = request.getParameter("Books_Info");
        Xinxi xinxi = new Xinxi(nickname,qq,email,text);
        System.out.println(nickname+qq+email+text);
        AddDao addDao = new AddDao();
        addDao.insert(xinxi);
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
