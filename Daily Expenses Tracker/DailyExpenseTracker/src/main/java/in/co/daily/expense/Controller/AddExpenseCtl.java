package in.co.daily.expense.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.co.daily.expense.Bean.BaseBean;
import in.co.daily.expense.Bean.ExpensesBean;
import in.co.daily.expense.Bean.UserBean;
import in.co.daily.expense.Exception.ApplicationException;
import in.co.daily.expense.Exception.DuplicateRecordException;
import in.co.daily.expense.Model.ExpenseModel;
import in.co.daily.expense.Utility.DataUtility;
import in.co.daily.expense.Utility.DataValidator;
import in.co.daily.expense.Utility.PropertyReader;
import in.co.daily.expense.Utility.ServletUtility;


@WebServlet(name = "AddExpenseCtl",urlPatterns = "/AddExpenses")
public class AddExpenseCtl extends BaseCtl {
	private static final long serialVersionUID = 1L;
 
    public AddExpenseCtl() {
        super();
    }
    
    @Override
	protected boolean validate(HttpServletRequest request) {
		boolean pass = true;

		if (DataValidator.isNull(request.getParameter("title"))) {
			request.setAttribute("title", PropertyReader.getvalue("error.require", "Title"));
			pass = false;
		}

		if (DataValidator.isNull(request.getParameter("price"))) {
			request.setAttribute("price", PropertyReader.getvalue("error.require", "Price"));
			pass = false;
		}
		
		if (DataValidator.isNull(request.getParameter("description"))) {
			request.setAttribute("description", PropertyReader.getvalue("error.require", "Description"));
			pass = false;
		}
		
		return pass;
	}

@Override
protected BaseBean populateBean(HttpServletRequest request) {
	ExpensesBean bean = new ExpensesBean();

	bean.setId(DataUtility.getLong(request.getParameter("id")));
	bean.setTitle(DataUtility.getString(request.getParameter("title")));
	bean.setDate(DataUtility.getDate(request.getParameter("date")));
	bean.setPrice(DataUtility.getLong(request.getParameter("price")));
	bean.setDescription(DataUtility.getString(request.getParameter("description")));
	HttpSession session = request.getSession();
	UserBean userbBean = (UserBean) session.getAttribute("user");
	long userId = userbBean.getId();
	bean.setUserId(userId);
	populateDTO(bean, request);
	return bean;
}


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  ServletUtility.forward(getView(), request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String op = DataUtility.getString(request.getParameter("operation"));
		ExpenseModel model = new ExpenseModel();
		ExpensesBean bean = new ExpensesBean();
		bean = (ExpensesBean) populateBean(request);
		
		if (OP_SUBMIT.equalsIgnoreCase(op)) {
				try {
					long pk = model.add(bean);
					ServletUtility.setbean(bean, request);
					ServletUtility.setSuccessMessage("Expenses Added Successfully !!", request);
					ServletUtility.forward(getView(), request, response);
					return;
				} catch (DuplicateRecordException e) {
					ServletUtility.setbean(bean, request);
					ServletUtility.setErrorMessage(e.getMessage(), request);
					ServletUtility.forward(getView(), request, response);
				} catch (ApplicationException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
				ServletUtility.forward(getView(), request, response);

			}
	}


	@Override
	protected String getView() {
		return DETView.ADD_EXPENSES_VIEW;
	}

}
