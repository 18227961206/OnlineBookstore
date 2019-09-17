package bean;

public class ShoppingCart {
	private int id;
	private String bookname;    //书名
	private String bookimage;    //书图片
	private double bookmoney;    //书定价
	private String booktheordernumber;    //订单号
	private String bookcreationtime;    //订单时间

	/**
	 * 无参构造
	 */
	public ShoppingCart() {

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

	public String getBooktheordernumber() {
		return booktheordernumber;
	}

	public void setBooktheordernumber(String booktheordernumber) {
		this.booktheordernumber = booktheordernumber;
	}

	public String getBookcreationtime() {
		return bookcreationtime;
	}

	public void setBookcreationtime(String bookcreationtime) {
		this.bookcreationtime = bookcreationtime;
	}

}
