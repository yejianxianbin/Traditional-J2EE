<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {font-size: 14px}
-->
</style>
<script>
	<!-- 
		function check_type(form)
		{
			if(form.fangshi_name.value=="")
			{
				alert("请输入面板的名字");
				form.fangshi_name.focus();
				return false;
			}
		}
	 -->
</script>
<%
	String pay_id=request.getParameter("pay_id");
	ConnDB conn=new ConnDB();
	String pay_payment="",pay_msg="";
	String sql="select pay_payment,pay_msg from Payment where pay_id='"+pay_id+"'";
	ResultSet rs=conn.doQuery(sql);
	if(rs.next())
	{
		pay_payment=rs.getString(1);
		pay_msg=rs.getString(2);
%>
<center>
<form action="payment_update.jsp?pay_id=<%= pay_id %>" method="post" onsubmit="return check_type(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="2" align="center" valign="middle" bgcolor="#99CCFF" class="STYLE2">查看/修改支付方式</td>
  </tr>
  <tr>
    <td width="163" height="40" align="right"><span class="STYLE1">支付方式</span>：</td>
    <td width="351" align="left"><input type="text" name="fangshi_name" value="<%= pay_payment %>" /></td>
    </tr>
  <tr>
    <td height="76" align="right"><span class="STYLE1">备注</span>：</td>
    <td align="left"><label>
      <textarea name="fangshi_msg" cols="30" rows="6" wrap="hard"><%= pay_msg %></textarea>
    </label></td>
    </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" class="STYLE1" value=" 修改 " />&nbsp;<input type="button" class="STYLE1" value=" 返回 " onclick="history.go(-1);" /></td>
  </tr>
</table>
</form>
</center>
<%
	}
	conn.closeConnection();
%>