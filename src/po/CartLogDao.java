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

public class CartLogDao {
    public void addItems(String bookName, int price, int number) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");
        CartLog cartLog = getCartLog(user.getUserName(), bookName);

        if (cartLog != null) {
            cartLog.setPrice((cartLog.getPrice() / cartLog.getNumber()) * (cartLog.getNumber() + number));
            cartLog.setNumber(cartLog.getNumber() + number);
            Transaction tran = session.beginTransaction();
            session.saveOrUpdate(cartLog);
            tran.commit();
        } else {
            CartLog cartLog2 = new CartLog();
            cartLog2.setBookName(bookName);
            cartLog2.setPrice(price * number);
            cartLog2.setNumber(number);
            cartLog2.setUser(user.getUserName());
            Transaction tran = session.beginTransaction();
            session.save(cartLog2);
            tran.commit();
        }
        session.close();
    }
    public CartLog getCartLog(String user, String bookName) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        String hql = "from CartLog where bookName=:bookName and user=:user";
        Query query = session.createQuery(hql);
        query.setString("bookName", bookName);
        query.setString("user", user);
        List list = query.list();
        if (list.isEmpty()) {
            session.close();
            return null;
        }
        CartLog cartLog = (CartLog) list.get(0);
        return cartLog;
    }

    public List getCartLogByUser() {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");
        String userName = user.getUserName();
        String hql = "from CartLog where user=:user";
        Query query = session.createQuery(hql);
        query.setString("user", userName);
        List list = query.list();
        return list;
    }

    public void deleteBook(String bookName) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");
        String userName = user.getUserName();
        String hql = "from CartLog where user=:user and bookName=:bookName";
        Query query = session.createQuery(hql);
        query.setString("user", userName);
        query.setString("bookName", bookName);
        List list = query.list();
        Transaction tran = session.beginTransaction();
        session.delete(list.get(0));
        tran.commit();
        session.close();
    }

    public static void main(String[] args) {
        CartLogDao dao = new CartLogDao();
        CartLog cartLog = dao.getCartLog("user1", "三国演义");
        System.out.println(cartLog.getBookName());
    }
}
