<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<html><head><title>Easy Buy Online</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
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
<body>
<jsp:include page="title.jsp" flush="true"/>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
-->
</style>
<script language="javascript">
<!-- 

	function login()
	{
		window.location.href='c_registry.jsp';
	}

 -->
</script>

<% 
	String c_name=(String) session.getAttribute("c_name");
	String c_header=(String) session.getAttribute("c_header");
	String t_type=(String) request.getParameter("t_type");
	Convert convert=new Convert();
	t_type=convert.method(t_type);
	session.setAttribute("t_type",t_type);
 %>

<jsp:include page="menu.jsp" flush="true"/>
<jsp:include page="select.jsp" flush="true"/>
<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="184" height="245" valign="top">
	
     <table width="184" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="7" align="left" valign="baseline"><jsp:include page="login.jsp" flush="true"/></td>
      </tr>
      <tr>
        <td height="7" align="center" valign="baseline"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="14" valign="top"><jsp:include page="Notice.jsp" flush="true"/></td>
      </tr>
    </table>
		
      </td>
	
    <td width="592" rowspan="5" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="200" height="30" align="center" background="../images/logo/back_new.gif"><span class="STYLE2">&nbsp;新品上架</span></td>
        <td width="359" align="right"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <center>
<table width="200" border="0" bordercolor="#99CCFF" style="border-collapse:collapse">
<%
Connection conn=null;
	Statement st=null;
	ResultSet rs=null;
	String p_id="",p_name="",p_price="",p_image="",p_description="";
	try
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		conn=DriverManager.getConnection("jdbc:sqlserver://localhost:1433;DatabaseName=ShopSystem","sa","123456");
		st=conn.createStatement();
		String sql="select p_id,p_name,p_price,p_image,p_description from product where p_type='"+t_type+"'order by p_time desc";
		rs=st.executeQuery(sql);
	}
	catch(Exception e)
	{}
int i=1;
int j=0;
for(;i<=2;i++)
{
	j=j+1;
%>
  <tr>
  <% 
		for(;j<=21;j++)
		{  
			if(rs.next())
			{
				p_id=rs.getString("p_id");
				p_name=rs.getString("p_name");
				p_price=rs.getString("p_price");
				p_image=rs.getString("p_image");
				p_description=rs.getString("p_description");
   %>
    <td width="110" height="135" align="center" valign="middle"><img src="../<%= p_image %>" width="90"/></td>
    <td width="100" align="center"><p class="STYLE5">============</p><p class="STYLE1"><%= p_name %></p><p><font size="2" color="#FF0000">￥<%= p_price %></font></p>    
	<p><a href="#" onClick="window.open('view_product.jsp?p_id=<%= p_id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')"><input name="see" type="button" class="STYLE1" value="详情"></a><%if (c_name!=null && c_name!=""){%><input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?p_id=<%=p_id%>'" value="购买">
	<%}%></p></td>
    <% 		}
 		
			if(j==3*i)
			{
				break;
			}
    	}
     %>
  </tr>
  <%
}
  %>
</table>
    </center>
      </tr>
    </table>
    </td>
  </tr>
</table>
</center>
<br />

<jsp:include page="menu_index_down.jsp" flush="true"/>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>


