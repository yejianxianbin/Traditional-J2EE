<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	String t_id=request.getParameter("t_id");
	String t_type="";
	ConnDB conn=new ConnDB();
	String sql="select t_type from main_type where t_id='"+t_id+"'";
	ResultSet rs=conn.doQuery(sql);
	if(rs.next())
	{
		t_type=rs.getString(1);
	
%>

<script>
	<!-- 
		function check_type(form)
		{
			if(form.t_name.value=="")
			{
				alert("请输入面板的名字");
				form.t_name.focus();
				return false;
			}
		}
	
	 -->
</script>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
-->
</style>

<center>
<form action="type_update_ok.jsp?t_id=<%= t_id %>" method="post" onsubmit="return check_type(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">添加主面板</span></td>
  </tr>
  <tr>
    <td width="130" height="40" align="center"><span class="STYLE1">主面板名称</span>：</td>
    <td width="228" align="center"><input type="text" name="t_type" value="<%= t_type %>" /></td>
    <td width="154" align="center"><input type="submit" class="STYLE1" value=" 修改 " />&nbsp;<input type="button" class="STYLE1" value=" 返回 " onclick="history.go(-1);" /></td>
    </tr>
  <tr>
    <td colspan="3" align="right">&nbsp;</td>
  </tr>
</table>
</form>
</center>
<%
	}
	conn.closeConnection();
%>