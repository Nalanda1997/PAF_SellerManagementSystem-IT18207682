package model;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;
import model.Seller;


@WebServlet("/SellerAPI")
public class SellerAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Seller sellerObj = new Seller();
	
    public SellerAPI() {
    	super();
    }
    
    // Convert request parameters to a Map
    private static Map getParasMap(HttpServletRequest request)
    {
    	Map<String, String> map = new HashMap<String, String>();
    	try
    	{
    		Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");
    		String queryString = scanner.hasNext() ?
    							scanner.useDelimiter("\\A").next() : "";
    		scanner.close();
    		
    		String[] params = queryString.split("&");
    		for (String param : params)
    		{
    			String[] p = param.split("=");
    			map.put(p[0], p[1]);
    		}
    	}
    	catch (Exception e)
    	{
    	}
    	return map;
    }
    

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String output = sellerObj.insertSeller(request.getParameter("name"),
				request.getParameter("email"),
				request.getParameter("phone"),
				request.getParameter("username"),
				request.getParameter("password"));
				
		response.getWriter().write(output);
	}

	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map paras = getParasMap(request);
		
		String output = sellerObj.updateSeller(paras.get("hidSellerIDSave").toString(),
							paras.get("name").toString(),
							paras.get("email").toString(),
							paras.get("phone").toString(),
							paras.get("username").toString(),
							paras.get("password").toString());
		
		response.getWriter().write(output);
	}

	
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Map paras = getParasMap(request);
		
		String output = sellerObj.deleteSeller(paras.get("id").toString());
		
		response.getWriter().write(output);
	}

}
