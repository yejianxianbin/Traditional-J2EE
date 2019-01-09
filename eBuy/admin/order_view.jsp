<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<% 
	String o_id=(String) request.getParameter("order_id");
	String o_user="",o_number="",o_address="",o_email="",o_time="",o_fangshi="";
	float o_sum=0;
	ConnDB conn=new ConnDB();
	String sql="select order_user,order_address,order_email,order_sum,order_time,order_payment from Orders where order_id='"+o_id+"'";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{
		o_user=rs.getString(1);
		o_address=rs.getString(2);
		o_email=rs.getString(3);
		o_sum=rs.getFloat(4);
		o_time=rs.getString(5);
		o_fangshi=rs.getString(6);
 %>
</head>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: underline;
}
a:active {
	text-decoration: none;
}
-->
</style>
<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="2" align="center" bgcolor="#99CCFF" class="STYLE2">订单信息</td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人姓名</span>：</td>
    <td width="331" height="35">&nbsp;<font size="2"><%= o_user %></font></td>
  </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单号码</span>：</td>
    <td height="35">&nbsp;<font size="2"><%= o_id %></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font size="2"><a href="order_view_product.jsp?o_id=<%= o_id %>">查看所订购的商品</a></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人地址</span>：</td>
    <td height="35">&nbsp;<font size="2"><%= o_address %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单人E_mail</span>：</td>
    <td height="35">&nbsp;<font size="2"><%= o_email %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">订单总额</span>：</td>
    <td height="35">&nbsp;<font size="2"><%= o_sum %></font></td>
    </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">订单时间</span>：</td>
    <td height="30">&nbsp;<font size="2"><%= o_time %></font></td>
    </tr>
  <tr>
    <td width="183" align="right"><span class="STYLE1">采取付款方式</span>：</td>
    <td height="30">&nbsp;<font size="2"><%= o_fangshi %></font></td>
  </tr>
  <tr>
    <td align="right">&nbsp;<span class="STYLE1">是否完成交易</span>：</td>
    <td height="30"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center"><input type="button" class="STYLE1" onClick="history.go(-1);" value=" 返回 " /></td></tr>
</table>
</center>
<%
	}
	else
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=order_select.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有查到任何数据..." + "</font></center></body></html>");
%>