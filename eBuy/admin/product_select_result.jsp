<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<%
	String type=(String) request.getParameter("p_type");
	String id=(String) request.getParameter("p_id");

	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	id=convert.method(id);
	type=convert.method(type);
	
	String sql="select p_type,p_id,p_name,p_image from product where p_type='"+type+"' and p_id like '%"+id+"%'";
	String p_type="",p_id="",p_name="",p_image="";
	ResultSet rs=conn.doQuery(sql);

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
</head>

<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">图片</span></td>
    <td width="135" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">名称</span></td>
    <td width="99" align="center" bgcolor="#99CCFF"><span class="STYLE2">商品号</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">操作</span></td>
  </tr>
  <tr>
    <td height="14" colspan="5">&nbsp;</td>
  </tr>
  <%
	while(rs.next())
	{
		p_type=rs.getString(1);
		p_id=rs.getString(2);
		p_name=rs.getString(3);
		p_image=rs.getString(4);
 %>
  <tr>
    <td width="86" rowspan="3" align="center"><img src="../<%= p_image %>" width="70" height="50"></td>
    <td height="25" colspan="4" align="center"><span class="STYLE2"><%= p_type %></span></td>
  </tr>
  <tr>
    <td height="33" align="center"><span class="STYLE1"><%= p_name %></span></td>
    <td height="25" align="center"><span class="STYLE1"><%= p_id %></span></td>
    <td width="101" height="25" align="center"><span class="STYLE1">[ <a href="product_update.jsp?p_id=<%= p_id %>">查看/修改</a> ]</span></td>
    <td width="67" align="center"><span class="STYLE1">[ <a href="product_delete.jsp?p_id=<%= p_id %>">删除</a> ]</span></td>
  </tr>
  <tr>
    <td height="14" colspan="4" bgcolor="#99CCFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="12" colspan="5">&nbsp;</td>
    </tr>
    <% 
	}	  
   %>
  <tr>
    <td height="30" colspan="5" align="center"></td>
   </tr>
</table>
</center>
	