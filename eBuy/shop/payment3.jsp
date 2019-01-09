<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<html>
<head><title>Easy Buy Online</title>
<style type="text/css">
<!--
.STYLE3 {color: #FF0000; font-size: 12px; }
.STYLE10 {
			font-size: 14px;
			color: #FF0000;
-->
</style>
</head>
<body>
<%
	ConnDB conn=new ConnDB();
	Vector cart=(Vector)session.getAttribute("cart");
	for(int i=0;i<cart.size();i++)
	{
		CartBean goodsitem=(CartBean)cart.elementAt(i);
		String sql="update product set p_quantity=p_quantity-'"+goodsitem.p_number+"' where p_id='"+goodsitem.p_id+"'";
		int temp2=conn.doUpdate(sql);
		if(temp2!=0)
		{				
		}
		else
		{
			out.println("<script language='javascript'>alert('订单发送失败!');window.location.href='index.jsp';</script>");
		}
	}
	out.println( "<HTML><HEAD><META http-equiv='refresh' content='3;URL=index_.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<br /><br /><br /><br /><br /><br /><br /><br />
		<center>
		 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
		<!--DWLayoutTable-->
			<tr bgcolor="#99CCFF">
				<td height="13">&nbsp;</td>
			</tr>
			<tr>
				<td height="60" align="center"><span class="STYLE10">订单发送成功<span class="STYLE3">！</span></span></span></td>
			</tr>
		</table>
		</center>
			<%	
	cart.removeAllElements();
%>
</body>
</html>