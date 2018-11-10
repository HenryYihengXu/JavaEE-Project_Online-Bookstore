package action;

import po.BookDao;
import po.UserDao;

public class AddGoodAction {
    private String bookName;
    private String type;
    private String originPrice;
    private String currentPrice;

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(String originPrice) {
        this.originPrice = originPrice;
    }

    public String getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(String currentPrice) {
        this.currentPrice = currentPrice;
    }

    public String execute() throws Exception {
        BookDao dao = new BookDao();
        dao.addBook(bookName, type, originPrice, currentPrice);
        return "success";
    }
}
