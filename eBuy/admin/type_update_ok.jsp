<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>

<% 
	String t_id=request.getParameter("t_id");
	String t_type=request.getParameter("t_type");
	Convert convert=new Convert();
	t_type=convert.method(t_type);
	ConnDB conn=new ConnDB();
	String sql="update main_type set t_type='"+t_type+"' where t_id='"+t_id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=type_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "ÐÞ¸Ä³É¹¦!" + "</font></center></body></html>");
	}

 %>
