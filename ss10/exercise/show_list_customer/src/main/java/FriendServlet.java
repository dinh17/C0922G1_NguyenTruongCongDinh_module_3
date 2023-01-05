import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "FriendServlet", value = "/friend")
public class FriendServlet extends HttpServlet {
    private static  List<Friend> friendList = new ArrayList<>();
    static{
        friendList.add(new Friend("Định","17-03-1999","Quảng Nam","img_fjords.jpg"));
        friendList.add(new Friend("Định","17-03-1999","Quảng Nam","img_fjords.jpg"));
        friendList.add(new Friend("Định","17-03-1999","Quảng Nam","img_fjords.jpg"));
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        request.setAttribute("friendList", friendList);
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
}
