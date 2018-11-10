package action;

import org.apache.struts2.ServletActionContext;
import po.User;
import po.UserDao;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LoginAction {
    private String userName;
    private String password;

    public void setUserName(String account) {
        this.userName = account;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUserName() {
        return userName;
    }

    public String getPassword() {
        return password;
    }

    public String execute() throws Exception {
        UserDao dao = new UserDao();
        User user = dao.getUser(userName, password);
        if (user != null) {
            HttpServletRequest request = ServletActionContext.getRequest();
            HttpSession session = request.getSession();
            session.setAttribute("currentUser", user);
            return "success";
        }
        return "fail";
    }
}
