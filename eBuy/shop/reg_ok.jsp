<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
.STYLE11 {font-size: 18px; color: #FF0000; }
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
<jsp:include page="title.jsp" flush="true"/>
<% 
	String name=(String) session.getAttribute("name");
	session.removeAttribute("name");
	String pass=(String) request.getParameter("c_pass");
	String image=(String) request.getParameter("reg_userPic");
	String phone=(String) request.getParameter("c_phone");
	String question=(String) request.getParameter("c_question");
	String answer=(String) request.getParameter("c_answer");
	String address=(String) request.getParameter("c_address");
	String email=(String) request.getParameter("c_email");
	
	ConnDB conn=new ConnDB();
	Convert convert = new Convert();
	
	name=convert.method(name);
	pass=convert.method(pass);
	image=convert.method(image);
	phone=convert.method(phone);
	question=convert.method(question);
	answer=convert.method(answer);
	address=convert.method(address);
	email=convert.method(email);
	
	if(name!=null || question!=null || email!=null)
	{
		String sql="INSERT INTO customer VALUES('"+name+"','"+pass+"','"+image+"','"+phone+"','"+question+"','"+answer+"','"+address+"','"+email+"')";
		int temp=conn.doUpdate(sql);
		if(temp==0)
		{
	%>
<br />
<center>
<table width="782" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="295" height="181" align="right"><img src="images/logo/false.jpg" width="96" height="96" /></td>
    <td width="267" align="center"><span class="STYLE11">×¢²áÊ§°Ü.</span>
      <p><span class="STYLE1"><a href="registry.jsp">µã»÷·µ»Ø×¢²á</a></span></p></td>
    <td width="220" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>	
	<%
		}
		else
		{
	%>
<br />
<center>
<table width="782" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
  <tr>
    <td width="291" height="181" align="right"><img src="..\images/logo/ok.gif" width="100" height="90" /></td>
    <td width="266" align="center"><p><span class="STYLE11">¹§Ï²! <%= name %> ×¢²á³É¹¦.</span></p>
      <p><span class="STYLE1"><a href="index_.jsp">µã»÷·µ»ØµÇÂ½</a></span></p></td>
    <td width="217" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="14" colspan="3">&nbsp;</td>
  </tr>
</table>
</center>
	<% 
		}
		
	}
%>
<br />
<jsp:include page="copyright.jsp" flush="true"/>