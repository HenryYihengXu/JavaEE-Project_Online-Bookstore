package po;

public class Book {
    private String bookName;
    private String type;
    private int originPrice;
    private int currentPrice;
    private int bookNo;

    public int getCurrentPrice() {
        return currentPrice;
    }

    public void setCurrentPrice(int currentPrice) {
        this.currentPrice = currentPrice;
    }

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

    public int getOriginPrice() {
        return originPrice;
    }

    public void setOriginPrice(int price) {
        this.originPrice = price;
    }

    public int getBookNo() {
        return bookNo;
    }

    public void setBookNo(int bookNo) {
        this.bookNo = bookNo;
    }
}
