package po;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


public class UserDao {

    public void register(String userName, String password) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        User user = new User();
        user.setUserName(userName);
        user.setPassword(password);
        user.setAddress(null);
        user.setPhone(null);
        //baocun
        Transaction tran = session.beginTransaction();
        session.saveOrUpdate(user);
        tran.commit();
        session.close();
    }

    public void userInfoUpdate(String userName, String password, String phone, String address) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");
        user.setUserName(userName);
        user.setPassword(password);
        user.setAddress(phone);
        user.setPhone(address);
        //baocun
        Transaction tran = session.beginTransaction();
        session.update(user);
        tran.commit();
        session.close();
    }

    public User getUser(String userName, String password) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        String hql = "from User where userName=:userName";
        Query query = session.createQuery(hql);
        query.setString("userName", userName);
        List list = query.list();
        if (list.isEmpty()) {
            session.close();
            return null;
        }
        User user = (User)list.get(0);
        if (user.getPassword().equals(password)) {
            session.close();
            return user;
        } else {
            session.close();
            return null;
        }
        //baocun
        /*Transaction tran = session.beginTransaction();
        session.save(user);
        tran.commit();*/
    }
    public static void main(String[] args) {

    }
}
