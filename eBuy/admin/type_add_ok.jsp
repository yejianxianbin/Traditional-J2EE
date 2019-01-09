<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<% 
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('ÇëÏÈµÇÂ¼!');window.location.href='index.jsp';</script>");
	}
	else
	{
	String t_name=(String) request.getParameter("t_name");
	double m=Math.random();
	String id=String.valueOf(m).substring(2,5);

	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	t_name=convert.method(t_name);
	
	String sql="insert main_type values ('"+id+"','"+t_name+"')";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=type_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="ok_ok.html" flush="true"/>
		<%
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=type_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="ok_fails.html" flush="true"/>
		<%
	}
}

 %>