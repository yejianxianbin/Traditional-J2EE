<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String id=request.getParameter("order_id");
	ConnDB conn=new ConnDB();
	String sql="delete OrderDetails where order_id='"+id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		response.sendRedirect("order_delete.jsp?order_id="+id);
	}

 %>
