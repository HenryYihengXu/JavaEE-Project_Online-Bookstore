package action;

import po.User;
import po.UserDao;

public class RegisterAction {
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
        dao.register(userName, password);
        return "success";
    }
}
