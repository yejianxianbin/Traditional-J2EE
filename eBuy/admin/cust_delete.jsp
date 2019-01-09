<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String c_name=request.getParameter("c_name");
	ConnDB conn=new ConnDB();
	String sql="delete customer where c_name='"+c_name+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=cust_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}
	else
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=cust_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "É¾³ýÊ§°Ü!" + "</font></center></body></html>");
	

 %>
