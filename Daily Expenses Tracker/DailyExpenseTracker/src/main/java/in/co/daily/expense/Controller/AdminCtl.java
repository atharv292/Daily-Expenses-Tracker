package in.co.daily.expense.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.co.daily.expense.Utility.ServletUtility;


@WebServlet(name = "AdminCtl",urlPatterns = "/Admin")
public class AdminCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
       
 
    public AdminCtl() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		ServletUtility.forward(getView(), request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	protected String getView() {
		return DETView.ADMIN_VIEW;
	}

}
