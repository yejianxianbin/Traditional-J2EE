<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String a_name=request.getParameter("a_name");
	String a_pass=request.getParameter("a_pass");
	String a_header=request.getParameter("a_header");
	String a_phone=request.getParameter("a_phone");
	String a_email=request.getParameter("a_email");
	ConnDB conn=new ConnDB();
			
try
{		
	if(a_name!=null)
	{
		String sql="update admin set a_pass='"+a_pass+"', a_header='"+a_header+"',a_phone='"+a_phone+"',a_email='"+a_email+"' where a_name='"+a_name+"'";
		int temp=conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=admin_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
			<jsp:include page="update_ok.html" flush="true"/>
			<%
		}
		else
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=admin_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "ÐÞ¸ÄÊ§°Ü!" + "</font></center></body></html>");
		}
	}
}
catch(Exception e)
{
	out.println("wrong");
}
 %>