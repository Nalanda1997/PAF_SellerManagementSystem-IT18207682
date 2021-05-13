$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	{
		$("#alertSuccess").hide();
	}
	$("#alertError").hide();
});

// SAVE ============================================
$(document).on("click", "#btnSave", function(event)
{
	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();

	// Form validation-------------------
	var status = validateSellerForm();
	if (status != true)
	{
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#hidSellerIDSave").val() == "") ? "POST" : "PUT";
	
	$.ajax(
	{
		url : "SellerAPI",
		type : type,
		data : $("#formSeller").serialize(),
		dataType : "text",
		complete : function(response, status)
		{
			onSellerSaveComplete(response.responseText, status);
		}
	});
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event)
{
	$("#hidSellerIDSave").val($(this).closest("tr").find('#hidSellerIDUpdate').val());
	$("#name").val($(this).closest("tr").find('td:eq(0)').text());
	$("#email").val($(this).closest("tr").find('td:eq(1)').text());
	$("#phone").val($(this).closest("tr").find('td:eq(2)').text());
	$("#username").val($(this).closest("tr").find('td:eq(3)').text());
	$("#password").val($(this).closest("tr").find('td:eq(4)').text());
});

// CLIENT-MODEL================================================================
function validateSellerForm()
{
	// NAME
	if ($("#name").val().trim() == "")
	{
		return "Insert Your name.";
	}
	// EMAIL
	if ($("#email").val().trim() == "")
	{
		return "Insert Your email.";
	}
	// PHONE NUMBER
	if ($("#phone").val().trim() == "")
	{
	return "Insert Your phone number.";
	}
	
	// USER NAME
	if ($("#username").val().trim() == "")
	{
	return "Insert Your username.";
	}
	
	// PASSWORD
	if ($("#password").val().trim() == "")
	{
		return "Insert Your password.";
	}
	
	return true;
	
}


function onSellerSaveComplete(response, status)
{
	if (status == "success")
	{

		var resultSet = JSON.parse(response);

		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();

			$("#divSellerGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} else if (status == "error")
	{
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#hidSellerIDSave").val("");
	$("#formSeller")[0].reset();
}

//update
$(document).on("click", ".btnUpdate", function(event)
{
		$("#hidSellerIDSave").val($(this).data("id"));
		$("#name").val($(this).closest("tr").find('td:eq(0)').text());
		$("#email").val($(this).closest("tr").find('td:eq(1)').text());
		$("#phone").val($(this).closest("tr").find('td:eq(2)').text());
		$("#username").val($(this).closest("tr").find('td:eq(3)').text());
		$("#password").val($(this).closest("tr").find('td:eq(4)').text());
		
});

//remove
$(document).on("click", ".btnRemove", function(event)
{
	$.ajax(
	{
		url : "SellerAPI",
		type : "DELETE",
		data : "sellerID=" + $(this).data("id"),
		dataType : "text",
		complete : function(response, status)
		{
			onSellerDeleteComplete(response.responseText, status);
		}
	});
});


function onSellerDeleteComplete(response, status)
{
	if (status == "success")
	{
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success")
		{
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();

			$("#divSellerGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error")
		{
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}

	} else if (status == "error")
	{
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
	} else
	{
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}






