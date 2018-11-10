package action;

import po.UserDao;

public class UserInfoAction {
    private String userName;
    private String password;
    private String phone;
    private String address;

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

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
        dao.userInfoUpdate(userName, password, phone, address);
        return "success";
    }
}
