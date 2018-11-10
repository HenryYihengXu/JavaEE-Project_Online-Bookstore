package po;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import java.util.List;

public class BookDao {
    public List getBooksByType(int type) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        switch (type) {
            case 0: {
                String hql = "from Book";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
            case 1: {
                String hql = "from Book where currentPrice != originPrice";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
            case 2: {
                String hql = "from Book where type = 'academic'";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
            case 3: {
                String hql = "from Book where type = 'novel'";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
            case 4: {
                String hql = "from Book where type = 'literature'";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
            default: {
                String hql = "from Book where type = 'other'";
                Query query = session.createQuery(hql);
                List list = query.list();
                session.close();
                return list;
            }
        }
    }

    public Book getBook(String bookName) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        String hql = "from Book where bookName=:bookName";
        Query query = session.createQuery(hql);
        query.setString("bookName", bookName);
        List list = query.list();
        if (list.isEmpty()) {
            session.close();
            return null;
        }
        Book book = (Book)list.get(0);
        return book;
    }

    public void addBook(String bookName, String type, String originPrice, String currentPrice) {
        Configuration conf = new Configuration().configure();
        SessionFactory sf = conf.buildSessionFactory();
        Session session = sf.openSession();
        Book book = new Book();
        book.setBookName(bookName);
        book.setType(type);
        book.setOriginPrice(Integer.parseInt(originPrice));
        book.setCurrentPrice(Integer.parseInt(currentPrice));
        Transaction tran = session.beginTransaction();
        session.saveOrUpdate(book);
        tran.commit();
        session.close();
    }
}
