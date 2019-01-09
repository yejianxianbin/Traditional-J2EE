<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String id=request.getParameter("order_id");
	ConnDB conn=new ConnDB();
	String sql="delete Orders where order_id='"+id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=order_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}
	else
		out.println("<script language='javascript'>alert('¶©µ¥É¾³ýÊ§°Ü!');window.location.href='order_all.jsp';</script>");

 %>
