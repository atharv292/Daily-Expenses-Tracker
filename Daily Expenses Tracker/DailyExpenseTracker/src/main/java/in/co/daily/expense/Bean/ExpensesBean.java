package in.co.daily.expense.Bean;

import java.util.Date;

public class ExpensesBean  extends BaseBean{
	
	
	private String Title;
	private Date date;
	private long price;
	private String description;
	private long userId;
	private String Email;

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	@Override
	public String getkey() {
		return null;
	}

	@Override
	public String getvalue() {
		return null;
	}
	
	

}
