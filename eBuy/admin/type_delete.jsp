<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String t_id=request.getParameter("t_id");
	ConnDB conn=new ConnDB();
	String sql="delete main_type where t_id='"+t_id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=type_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}
	else
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=type_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "É¾³ýÊ§°Ü!" + "</font></center></body></html>");

 %>