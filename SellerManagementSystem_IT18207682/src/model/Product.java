package model;

import java.sql.*;


public class Product {
	
	
	    // Method to connect to the DB /----------------------------------------------------------------------------------
		private Connection connect()
		{
		Connection con = null;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		//Add dataBase Connection usrname and password
		con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/paf_sellermanagement", "root", "root");
		}
		catch (Exception e)
		{e.printStackTrace();}
		return con;
		}
		
		// Insert Method /-----------------------------------------------------------------------------------------------
		public String insertProduct(String code, String name, String price, String desc)
		{
		String output = "";
		try
		{
		Connection con = connect();
		if (con == null)
		{return "Error while connecting to the database for inserting."; }
		String query = " insert into sellerproductinfo(`productID`,`productCode`,`productName`,`productPrice`,`productDesc`)"
		+ " values (?, ?, ?, ?, ?)";
		PreparedStatement preparedStmt = con.prepareStatement(query);
		
		preparedStmt.setInt(1, 0);
		preparedStmt.setString(2, code);
		preparedStmt.setString(3, name);
		preparedStmt.setDouble(4, Double.parseDouble(price));
		preparedStmt.setString(5, desc);
		preparedStmt.execute();
		con.close();
		
		String newProduct = readProduct();
		output = "{\"status\":\"success\", \"data\": \"" + newProduct + "\"}";
		}
		catch (Exception e)
		{
			output = "{\"status\":\"error\", \"data\":\"Error while inserting the product.\"}";
			System.err.println(e.getMessage());
		}
		return output;
		}
		
		// Read Method /--------------------------------------------------------------------------------------
		public String readProduct()
		{
		String output = "";
		try
		{
		Connection con = connect();
		if (con == null)
		{return "Error while connecting to the database for reading."; }
		
		output = "<table border='1'><tr><th>Product Code</th><th>Product Name</th>" +
		"<th>Product Price</th>" +
		"<th>Product Description</th>" +
		"<th>Update</th><th>Remove</th></tr>";
		String query = "select * from sellerproductinfo";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(query);
		
		while (rs.next())
		{
		String productID = Integer.toString(rs.getInt("productID"));
		String productCode = rs.getString("productCode");
		String productName = rs.getString("productName");
		String productPrice = Double.toString(rs.getDouble("productPrice"));
		String productDesc = rs.getString("productDesc");
		
		output += "<tr><td>" + productCode + "</td>";
		output += "<td>" + productName + "</td>";
		output += "<td>" + productPrice + "</td>";
		output += "<td>" + productDesc + "</td>";

		output += "<td><input name='btnUpdate' type='button' value='Update'class='btn btn-secondary'></td>"
		+ "<td><form method='post' action='Product.jsp'>"+ "<input name='btnRemove' type='submit' value='Remove'class='btn btn-danger'>"
		+ "<input name='itemID' type='hidden' value='" + productID
		+ "'>" + "</form></td></tr>";
		}
		con.close();
		
		output += "</table>";
		}
		catch (Exception e)
		{
		output = "Error while reading the Product.";
		System.err.println(e.getMessage());
		}
		return output;
		}
		
		// Update Method /---------------------------------------------------------------------------------------------
		public String updateProduct(String ID, String code, String name, String price, String desc)
		{
			String output = "";
			try
			{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for updating."; }
			
			String query = "UPDATE sellerproductinfo SET productCode=?,productName=?,productPrice=?,productDesc=?WHERE productID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			preparedStmt.setString(1, code);
			preparedStmt.setString(2, name);
			preparedStmt.setDouble(3, Double.parseDouble(price));
			preparedStmt.setString(4, desc);
			preparedStmt.setInt(5, Integer.parseInt(ID));
			
			preparedStmt.execute();
			con.close();
			String newProduct = readProduct();
			output = "{\"status\":\"success\", \"data\": \"" +
			newProduct + "\"}";
			}
			catch (Exception e)
			{
				output = "{\"status\":\"error\", \"data\":\"Error while updating the product.\"}";
				System.err.println(e.getMessage());
			}
			return output;
			}
		
		// Delete Method /--------------------------------------------------------------------------------------------------
		public String deleteProduct(String productID)
			{
			String output = "";
			try
			{
			Connection con = connect();
			if (con == null)
			{return "Error while connecting to the database for deleting."; }
			
			String query = "delete from sellerproductinfo where productID=?";
			PreparedStatement preparedStmt = con.prepareStatement(query);
			
			preparedStmt.setInt(1, Integer.parseInt(productID));
			
			preparedStmt.execute();
			con.close();
			String newProduct = readProduct();
			output = "{\"status\":\"success\", \"data\": \"" +
			newProduct + "\"}";
			}
			catch (Exception e)
			{
				output = "{\"status\":\"error\", \"data\":\"Error while deleting the product.\"}";
				System.err.println(e.getMessage());
			}
			return output;
			}
	

}
