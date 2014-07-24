<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<meta charset="UTF-8">
<title>Registration Page</title>
<!-- bootstrap 3.0.2 -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="css/ionicons.min.css" rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="css/AdminLTE.css" rel="stylesheet" type="text/css" />
<link href="css/daterangepicker-bs3.css" rel="stylesheet"
	type="text/css" />
</head>
<body>

<h1 align="center">
<b>REGISTRATION FORM</b>
</h1>
<form action="welcome.jsp" method="post">
 
<div>
<label for="inputFirstname">First Name
</label>
<div>
<input type="text" name="firstname" maxlength="12"
placeholder="firstname"></input>
</div>
</div>
 
<div>
<label for="inputLastname">Last Name </label>
<div>
<input type="text" name="lastname" maxlength="12"
placeholder="lastname"></input>
</div>
</div>
 
<div>
<label for="inputMobile">Mobile</label>
<div>
<input type="text" name="mobile" maxlength="10"
placeholder="Ex:95xxxx4104"></input>
 
</div>
</div>
 
<div>
<label for="inputEmail">E-mail</label>
<div>
<input type="text" name="email" maxlength="50"
placeholder="rakesh@gmail.com"></input>
</div>
</div>
</body>
</html>