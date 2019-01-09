<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%
	ConnDB conn=new ConnDB();
	Vector cart=(Vector)session.getAttribute("cart");
	String order_number=(String)session.getAttribute("order_number");
	for(int i=0;i<cart.size();i++)
	{
		CartBean goodsitem=(CartBean)cart.elementAt(i);
		String sql="insert OrderDetails values ('"+order_number+"','"+goodsitem.p_id+"','"+goodsitem.p_price+"','"+goodsitem.p_number+"')";
		int temp2=conn.doUpdate(sql);
		out.print(goodsitem.p_number);
		if(temp2!=0)
		{

		}
		else
			out.println("<script language='javascript'>alert('¶©µ¥·¢ËÍÊ§°Ü!');window.location.href='index.jsp';</script>");
	}
	
	//cart.removeAllElements();
%><jsp:forward page="payment3.jsp"/>