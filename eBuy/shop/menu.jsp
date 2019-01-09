<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<%
	ConnDB conn=new ConnDB();
	String t_id="",t_type="";
	String sql="select t_id,t_type from main_type";
	ResultSet rs=conn.doQuery(sql);
		
%>
<style type="text/css">
<!--
.STYLE2 {font-size: 14px}
-->
</style>
<center>
<table width=782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <tr bgcolor="#dddddd">
    <%
		while(rs.next())
		{
			t_id=rs.getString("t_id");
			t_type=rs.getString("t_type");
	%>
    <td width="400" height="25" align="center" bgcolor="#eeeeee"><span class="STYLE2"><a href="menu_index_top.jsp?t_type=<%= t_type %>" title="<%= t_type %>"><%= t_type %></a></span></td>
	<%
		}
	%>
    </tr>
</table>
</center>
