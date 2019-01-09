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
	Convert convert=new Convert();
	String pay_id=request.getParameter("pay_id");
	String pay_payment = request.getParameter("fangshi_name");
	String pay_msg=request.getParameter("fangshi_msg");
	pay_payment=convert.method(pay_payment);
	pay_msg=convert.method(pay_msg);
	ConnDB conn=new ConnDB();
	String sql="update Payment set pay_payment='"+pay_payment+"',pay_msg='"+pay_msg+"' where pay_id='"+pay_id+"'";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=payment_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="update_ok.html" flush="true"/>
		<%
	}

 %>
