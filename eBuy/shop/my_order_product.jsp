<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<html><head>
<title>Easy Buy Online</title>
<% 
	String o_id=(String) request.getParameter("order_id");
	if(o_id=="" || o_id==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index_.jsp';</script>");
	}
	String p_id="",p_name="";
	float p_price=0;
	int p_number=0;
	ConnDB conn=new ConnDB();
	String sql="select p.p_name,o.p_id,o.p_price,o.p_number from product p JOIN orderdetails o ON p.p_id=o.p_id where o.order_id='"+o_id+"'";
	ResultSet rs = conn.doQuery(sql);

 %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
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
.STYLE3 {
	font-size: 36px;
	font-family: "创艺简行楷";
	color: #000099;
}
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>

<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="40" colspan="6" align="center" bgcolor="#eeeeee" class="STYLE3">订单信息</td>
    </tr>
  <tr>
    <td height="35" colspan="6" align="left">&nbsp;&nbsp;<font size="2">订单号码</font>：&nbsp;<font size="2" color="#FF0000"><%= o_id %></font></td>
    </tr>
  <tr>
    <td width="49" align="center" class="STYLE1">编号</td>
    <td width="83" height="30" align="center" class="STYLE1">商品号</td>
    <td width="145" align="center" class="STYLE1">商品名称</td>
    <td width="77" align="center" class="STYLE1">商品价格</td>
    <td width="62" align="center" class="STYLE1">商品数量</td>
    <td width="90" align="center" class="STYLE1">金额</td>
  </tr>
  <%
  	int num=1;
	float all_sum=0;
  	while(rs.next())
	{
		p_name=rs.getString(1);
		p_id=rs.getString(2);
		p_price=rs.getFloat(3);
		p_number=rs.getInt(4);
  %>
  <tr>
    <td height="30" align="center" class="STYLE2"><%= num %></td>
    <td height="30" align="center" class="STYLE2"><%= p_id %></td>
    <td height="30" align="center" class="STYLE2"><%= p_name %></td>
    <td height="30" align="center" class="STYLE2"><%= p_price %></td>
    <td height="30" align="center" class="STYLE2"><%= p_number %></td>
    <td height="30" align="center" class="STYLE2"><%= p_price*p_number %></td>
  </tr>
  <% 
  		all_sum=all_sum+(p_price*p_number);
  		num++;
  	}
  %>
  <tr>
    <td height="33" colspan="6" align="right"><font size="2">合计金额</font>：<font size="3" color="red">￥<%= all_sum %></font>&nbsp;&nbsp;&nbsp;&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="6" align="center"><a href="javascript:window.close()" class="styleac">[关闭窗口]</a></td>
    </tr>
</table>
</center>
</body>
</html>
