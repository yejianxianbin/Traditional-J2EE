<html>
<head>
<title>Easy Buy Online</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
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
</style></head>
<Body>
<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<% 
	String p_id=(String) request.getParameter("p_id");
	String p_image="";
	ConnDB conn=new ConnDB();
	String sql="select p_image from product where p_id='"+p_id+"'";
	ResultSet rs = conn.doQuery(sql);
	while(rs.next())
	{
		p_image=rs.getString("p_image");
	}
 %>
 <center>
 <table width="255" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="255" height="146" align="center"><img src="../<%= p_image %>" width="300"/></td>
  </tr>
  <tr>
    <td height="92" align="center"><a href="javascript:window.close()" class="styleac">[关闭窗口]</a></td>
  </tr>
</table>
</center>
</Body></html>
 
 