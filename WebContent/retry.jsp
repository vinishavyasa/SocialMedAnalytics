<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="formHandler" class="com.bean.UserBean" scope="request"/>
<html> 
<body>
<form action="proces.jsp" method=post>
<center>
<table cellpadding=4 cellspacing=2 border=0>
<th bgcolor="lightblue" colspan=2>
<font size=5>User Registration</font>
<br>
<font size=2 color="red"><sup>*</sup> Required Fields </font>
</th>
<tr bgcolor="lightblue">
<td valign=top> 
<B>First Name<sup>*</sup></B> 
<br>
<input type="text" name="firstName" 
value='<%=formHandler.getFirstName()%>' size=15 maxlength=20>
<br><font size=2 
color=red><%=formHandler.getErrorMsg("firstName")%></font>
</td>
<td  valign=top>
<B>Last Name<sup>*</sup></B>
<br>
<input type="text" name="lastName" 
value='<%=formHandler.getLastName()%>' size=15 maxlength=20>
<br><font size=2 
color=red><%=formHandler.getErrorMsg("lastName")%></font>
</td>
</tr>
<tr bgcolor="lightblue">
<td valign=top>
<B>E-Mail<sup>*</sup></B> 
<br>
<input type="text" name="email" value='<%=formHandler.getEmail()%>' 
size=25  maxlength=125>
<br><font size=2 color=red><%=formHandler.getErrorMsg("email")%></font>
</td>
<td  valign=top>
<B>Zip Code<sup>*</sup></B> 
<br>
<input type="text" name="zip" value='<%=formHandler.getZip()%>' size=5  
maxlength=6>
<br><font size=2 color=red><%=formHandler.getErrorMsg("zip")%></font>
</td>
</tr>
<tr bgcolor="lightblue">
<td valign=top colspan=2> 
<B>User Name<sup>*</sup></B>
<br>
<input type="text" name="userName" size=10 
value='<%=formHandler.getUserName()%>'  maxlength=10>
<br><font size=2 
color=red><%=formHandler.getErrorMsg("userName")%></font>
</td>
</tr>
<tr bgcolor="lightblue">
<td valign=top>
<B>Password<sup>*</sup></B> 
<br>
<input type="password" name="password1" size=10 
value='<%=formHandler.getPassword1()%>'  maxlength=10>
<br><font size=2 
color=red><%=formHandler.getErrorMsg("password1")%></font>
</td>
<td  valign=top>
<B>Confirm Password<sup>*</sup></B>
<br>
<input type="password" name="password2" size=10 
value='<%=formHandler.getPassword2()%>'  maxlength=10>
<br><font size=2 
color=red><%=formHandler.getErrorMsg("password2")%></font>
</td>
<br>
</tr>
<tr bgcolor="lightblue">
<td colspan=2 valign=top>
<B>Competitors you wnat to analyze</B>
<br>
<input type="checkbox" name="competitor" value="Target"<%=formHandler.isCbSelectedcomp("Target")%>>Target    
<input type="checkbox" name="competitor" value="Costco" 
<%=formHandler.isCbSelectedcomp("Costco")%>>Costco  
<input type="checkbox" name="competitor" value="BJ's" 
<%=formHandler.isCbSelectedcomp("BJ's")%>>BJ's
<input type="checkbox" name="competitor" value="Walmart" 
<%=formHandler.isCbSelectedcomp("Walmart")%>>Walmart 

</td>
</tr>

<tr bgcolor="lightblue">
<td colspan=2 valign=top>
<B>Social media coverage</B>
<br>
<input type="checkbox" name="socMed" value="Twitter"<%=formHandler.isCbSelected("Twitter")%>>Twitter    
<input type="checkbox" name="socMed" value="Facebook" <%=formHandler.isCbSelectedcomp("Facebook")%>>Facebook 
<input type="checkbox" name="socMed" value="Yelp" <%=formHandler.isCbSelectedcomp("Yelp")%>>Yelp
<input type="checkbox" name="socMed" value="Google+" <%=formHandler.isCbSelectedcomp("Google+")%>>Google+ 

</td>
</tr>



<tr bgcolor="lightblue">
<td colspan=2 valign=top>
<B>Select the expected result format</B>
<br>
<input type="radio" name="result" value="Table Format" 
<%=formHandler.isRbSelected("Table Format")%>>Table Format       
<input type="radio" name="result" value="Charts" 
<%=formHandler.isRbSelected("Charts")%>> Charts
<br><br></td>
</tr>
<tr bgcolor="lightblue">
<td colspan=2 align=center>
<input type="submit" value="Submit"> <input type="reset"  
value="Reset">
</td>
</tr>
</table>
</center>
</form>
</body>
</html>


