<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	String a_name=(String)request.getParameter("admin_name");
	ConnDB conn=new ConnDB();
	String sql="select * from admin where a_name='"+a_name+"'";
	ResultSet rs=conn.doQuery(sql);
	if(rs.next())
	{

 %>
 
 <style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2{font-size: 14px;}
-->
 </style>
 <script>
 	<!--
	function cancel()
	{
		window.location.href='admin_delete.jsp?admin_name=<%= a_name %>';
	}
	-->
 </script>
  
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">管理员详细资料</span></td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
    <td height="30" align="right"><span class="STYLE1">用户名</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="a_name" value="<%= rs.getString("a_name") %>" /></td>
  </tr>
      <tr>
    <td width="28%" height="30" align="right"><span class="STYLE1">密码</span>：&nbsp;</td>
    <td width="72%" height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="a_pass" value="<%= rs.getString("a_pass") %>" />      </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">头像选择</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<img src="<%= rs.getString("a_header") %>"></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">联系电话</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="a_phone" value="<%= rs.getString("a_phone") %>"  /></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>：&nbsp;</td>
    <td height="30" align="left">&nbsp;&nbsp;&nbsp;<input type="text" name="a_email" size="25" value="<%= rs.getString("a_email") %>" /></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="button" class="STYLE1" onclick="window.location.href='admin_update.jsp?admin_name=<%= a_name %>'" value=" 修改 "/>
    &nbsp;<input type="button" class="STYLE1" onclick="cancel()" value=" 删除 "/>
    &nbsp;<input type="button" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
  </tr>
  
</table>
</center>
<% 
	conn.closeConnection();
  	}
	else
	{	
	out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=admin_select.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有查找到任何数据......" + "</font></center></body></html>");
	
	}
%>