<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String p_id=request.getParameter("p_id");
	ConnDB conn=new ConnDB();
	String sql="delete product where p_id='"+p_id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=product_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=product_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "ɾ��ʧ��!���Ժ�����..." + "</font></center></body></html>");
	}

 %>
