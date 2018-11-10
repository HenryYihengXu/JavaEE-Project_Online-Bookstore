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

public class BuyLogDao {
    public void buyBooks(String bookName, int price, int number) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");

        BuyLog log = new BuyLog();
        log.setBookName(bookName);
        log.setPrice(price);
        log.setNumber(number);
        log.setUser(user.getUserName());
        Transaction tran = session.beginTransaction();
        session.save(log);
        tran.commit();
        session.close();
    }

    public void buyBooks2(String bookName, int price, int number) {
        buyBooks(bookName, price, number);
        new CartLogDao().deleteBook(bookName);
    }

    public List getBuyLogByUser() {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession httpSession = request.getSession();
        User user = (User)httpSession.getAttribute("currentUser");
        String userName = user.getUserName();
        String hql = "from BuyLog where user=:user";
        Query query = session.createQuery(hql);
        query.setString("user", userName);
        List list = query.list();
        return list;
    }
}
