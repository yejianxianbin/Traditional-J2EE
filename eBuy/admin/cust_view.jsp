<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String c_name=(String)request.getParameter("c_name");
	ConnDB conn=new ConnDB();
	String sql="select c_header,c_pass,c_phone,c_question,c_answer,c_address,c_email from customer where c_name='"+c_name+"'";
	ResultSet rs=conn.doQuery(sql);
	if(rs.next())
	{

 %>
 
 <style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size: 14px;}
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

<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">客户详细资料</span></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="right"><a href="cust_select_order.jsp?c_name=<%= c_name %>" class="STYLE1">查看购物信息</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
      </tr>
	  <tr>
    <td height="30" align="right"><span class="STYLE1">头像选择</span>:&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<img src="<%= rs.getString("c_header") %>"></td>
  </tr>
      <tr>
    <td height="30" align="right"><span class="STYLE1">用户名</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= c_name %></td>
  </tr>
      <tr>
    <td width="28%" height="30" align="right"><span class="STYLE1">密码</span>:&nbsp;</td>
    <td width="72%" height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_pass") %></tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">联系电话</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_phone") %></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">问题提示</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_question") %></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">问题答案</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_answer") %></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">所在地址</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_address") %></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>:&nbsp;</td>
    <td height="30" align="left" class="STYLE2">&nbsp;&nbsp;&nbsp;<%= rs.getString("c_email") %></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="button" class="STYLE1" onclick="window.location.href='cust_all.jsp'" value=" 确定 " />
    &nbsp;<input type="button" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
  </tr>
 
</table>
</center>
 <% 
  	}
	else
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=cust_select.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有查到任何数据..." + "</font></center></body></html>");
   %>