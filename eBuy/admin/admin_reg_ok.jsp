<%@ page contentType="text/html;charset=gb2312" %>
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
	color: red;
}
-->
</style>
<% 
	String name=(String) request.getParameter("a_name");
	String pass=(String) request.getParameter("a_pass");
	String image=(String) request.getParameter("reg_userPic");
	String phone=(String) request.getParameter("a_phone");
	String email=(String) request.getParameter("a_email");
	
	ConnDB conn=new ConnDB();
	Convert convert = new Convert();
	
	name=convert.method(name);
	pass=convert.method(pass);
	image=convert.method(image);
	phone=convert.method(phone);
	email=convert.method(email);
	
	if(name!=null || email!=null)
	{
		String sql="INSERT INTO admin VALUES('"+name+"','"+pass+"','"+image+"','"+phone+"','"+email+"')";
		int temp=conn.doUpdate(sql);
		if(temp==0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=admin_reg.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
	%>
<jsp:include page="ok_fails.jsp" flush="true"/>	
	<%
		}
		else
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=admin_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
	%>
<jsp:include page="ok_ok.html" flush="true"/>
	<% 
		}		
	}
%>

