<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String pay_id=request.getParameter("pay_id");
	ConnDB conn=new ConnDB();
	String sql="delete Payment where pay_id='"+pay_id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=payment_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}

 %>
