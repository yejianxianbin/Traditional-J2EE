<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<% 
	ConnDB conn=new ConnDB();
	String c_name=(String)session.getAttribute("c_name");
	String sum=(String) session.getAttribute("sum");
	String order_number=(String)session.getAttribute("order_number");
	String pay_fangshi=(String) session.getAttribute("pay_fangshi");
	String pay_address=(String) session.getAttribute("pay_address");
	String pay_email=(String) session.getAttribute("pay_email");
	String o_time=(String) session.getAttribute("o_time");	
	
	String order_sql="insert Orders values ('"+order_number+"','"+pay_fangshi+"','"+pay_address+"','"+pay_email+"','"+c_name+"','"+o_time+"','"+Float.parseFloat(sum)+"')";
	int temp=conn.doUpdate(order_sql);
	if(temp!=0)
	{
		response.sendRedirect("payment2.jsp");
	}
	
 %>