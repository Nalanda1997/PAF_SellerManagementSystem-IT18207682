<%@page import="model.Seller"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       
<%

//Save---------------------------------
if (request.getParameter("id") != null)
{
	Seller sellerObj = new Seller();
	String stsMsg = "";

	//Insert--------------------------
	if (request.getParameter("hidSellerIDSave") == "")
	{
		stsMsg = sellerObj.insertSeller(request.getParameter("name"),
					request.getParameter("email"),
					request.getParameter("phone"),
					request.getParameter("username"),
					request.getParameter("password"));
	}
	else//Update----------------------
	{
		stsMsg = sellerObj.updateSeller(request.getParameter("hidSellerIDSave"),
					request.getParameter("name"),
					request.getParameter("email"),
					request.getParameter("phone"),
					request.getParameter("username"),
					request.getParameter("password"));
	}
	
	session.setAttribute("statusMsg", stsMsg);
}

//Delete-----------------------------
if (request.getParameter("hidSellerIDDelete") != null)
{
	Seller sellerObj = new Seller();
	String stsMsg = sellerObj.deleteSeller(request.getParameter("hidSellerIDDelete"));
	session.setAttribute("statusMsg", stsMsg);
}


%>        
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Seller Management</title>
<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/seller.js"></script>
</head>
<body>

<div class="container"><div class="row"><div class="col-6">

	<h1>Seller Management System</h1>

	<form id="formSeller" name="formSeller">
		
		Seller Name :
		<input id="name" name="name" type="text"class="form-control form-control-sm">

		<br>Seller E-mail :
		<input id="email" name="email" type="text"class="form-control form-control-sm">
		
		<br> Seller Phone Number :
		<input id="phone" name="phone" type="text"class="form-control form-control-sm">
		
		<br>Seller User Name :
		<input id="username" name="username" type="text"class="form-control form-control-sm">

		<br>Seller Password :
		<input id="password" name="password" type="text"class="form-control form-control-sm">

		<br>
		<input id="btnSave" name="btnSave" type="button" value="Save"class="btn btn-primary">
		<input type="hidden" id="hidSellerIDSave"name="hidSellerIDSave" value="">
	</form>


	<div id="alertSuccess" class="alert alert-success"></div>
	
	<div id="alertError" class="alert alert-danger"></div>
	
	<br>
	<div id="divSellerGrid">
		<%
			Seller sellerObj = new Seller();
			out.print(sellerObj.readSeller());
		%>
	</div>	

</div> </div> </div>
</body>
</html>