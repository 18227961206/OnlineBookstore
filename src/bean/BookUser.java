package bean;


public class BookUser {
	private int id;
	private String bookname;    //书名
	private String bookimage;    //书图片
	private double bookmoney;    //书定价
	private String booktheauthor;    //书作者
	private String bookpress;    //书出版社
	private String bookshelftime;    //书上架时间
	private String bookdateofpublication;    //书出版日期
	private String booksize;    //书开本
	private String bookedition;    //书版次
	private String bookcategory; //书类别
	private String bookinformation;    //图书信息

	/**
	 * 无参构造
	 */
	public BookUser() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getBookimage() {
		return bookimage;
	}

	public void setBookimage(String bookimage) {
		this.bookimage = bookimage;
	}

	public double getBookmoney() {
		return bookmoney;
	}

	public void setBookmoney(double bookmoney) {
		this.bookmoney = bookmoney;
	}

	public String getBooktheauthor() {
		return booktheauthor;
	}

	public void setBooktheauthor(String booktheauthor) {
		this.booktheauthor = booktheauthor;
	}

	public String getBookpress() {
		return bookpress;
	}

	public void setBookpress(String bookpress) {
		this.bookpress = bookpress;
	}

	public String getBookshelftime() {
		return bookshelftime;
	}

	public void setBookshelftime(String bookshelftime) {
		this.bookshelftime = bookshelftime;
	}

	public String getBookdateofpublication() {
		return bookdateofpublication;
	}

	public void setBookdateofpublication(String bookdateofpublication) {
		this.bookdateofpublication = bookdateofpublication;
	}

	public String getBooksize() {
		return booksize;
	}

	public void setBooksize(String booksize) {
		this.booksize = booksize;
	}

	public String getBookedition() {
		return bookedition;
	}

	public void setBookedition(String bookedition) {
		this.bookedition = bookedition;
	}

	public String getBookcategory() {
		return bookcategory;
	}

	public void setBookcategory(String bookcategory) {
		this.bookcategory = bookcategory;
	}

	public String getBookinformation() {
		return bookinformation;
	}

	public void setBookinformation(String bookinformation) {
		this.bookinformation = bookinformation;
	}
}
