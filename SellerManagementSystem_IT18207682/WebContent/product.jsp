<%@page import="model.Product"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
<%

//Save---------------------------------
if (request.getParameter("productCode") != null)
{
	Product productObj = new Product();
	String stsMsg = "";

	//Insert--------------------------
	if (request.getParameter("hidProductIDSave") == "")
	{
		stsMsg = productObj.insertProduct(request.getParameter("productCode"),
					request.getParameter("productName"),
					request.getParameter("productPrice"),
					request.getParameter("productDesc"));
	}
	else//Update----------------------
	{
		stsMsg = productObj.updateProduct(request.getParameter("hidProductIDSave"),
					request.getParameter("productCode"),
					request.getParameter("productName"),
					request.getParameter("productPrice"),
					request.getParameter("productDesc"));
	}
	
	session.setAttribute("statusMsg", stsMsg);
}

//Delete-----------------------------
if (request.getParameter("hidProductIDDelete") != null)
{
	Product productObj = new Product();
	String stsMsg = productObj.deleteProduct(request.getParameter("hidProductIDDelete"));
	session.setAttribute("statusMsg", stsMsg);
}


%>        
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Product Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/product.js"></script>
</head>
<body>

<div class="container"><div class="row"><div class="col-6">

	<h1>Product Management System</h1>

	<form id="formProduct" name="formProduct">
		Product Code :
		<input id="productCode" name="productCode" type="text"class="form-control form-control-sm">

		<br> Product Name :
		<input id="productName" name="productName" type="text"class="form-control form-control-sm">

		<br> Product Price : 
		<input id="productPrice" name="productPrice" type="text"class="form-control form-control-sm">

		<br> Product Description :
		<input id="productDesc" name="productDesc" type="text"class="form-control form-control-sm">

		<br>
		<input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">
		<input type="hidden" id="hidProductIDSave"name="hidProductIDSave" value="">
	</form>


	<div id="alertSuccess" class="alert alert-success"></div>
	
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	<div id="divProductGrid">
		<%
			Product productObj = new Product();
			out.print(productObj.readProduct());
		%>
	</div>	

</div> </div> </div>
</body>
</html>