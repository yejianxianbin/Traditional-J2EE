<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
.STYLE5 {color: #FFFFFF}
.STYLE6 {font-size: 12px; color: #FF0000; }
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
	Convert convert=new Convert();
	String t_type=(String) request.getParameter("t_type");
	String select_type=request.getParameter("select_type");
	String select_p_name=request.getParameter("select_p_name");
	t_type=convert.method(t_type);
	select_type=convert.method(select_type);
	select_p_name=convert.method(select_p_name);
 %>

<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="186" height="245" valign="top"><table width="184" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td width="184" align="left" valign="baseline"><jsp:include page="login.jsp" flush="true"/></td>
      </tr>
      
      
    </table>
	  </td>
	
    <td width="590" rowspan="5" align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="200" height="30" align="center" background="../images/logo/back_new.gif"><span class="STYLE2">&nbsp;搜索结果</span></td>
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
		String sql="select p_id,p_name,p_price,p_image,p_description from product where p_type='"+select_type+"' and p_name like '%"+select_p_name+"%'";
		rs=st.executeQuery(sql);
	}
	catch(Exception e)
	{}
	
int i=1;
int j=0;
for(;i<=10;i++)
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
    <p><a href="#" onClick="window.open('view_product.jsp?p_id=<%= p_id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')"><input name="see" type="button" class="STYLE1" value="详情"></a><%if (c_name!=null && c_name!=""){%><input name="see" type="button" class="STYLE1" onClick="window.location.href='cart_add.jsp?p_id=<%=p_id%>'" value="购买">
	<%}%>
	</p></td>
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
</table><p><hr size="1" color="#99CCFF" /><input type="button" class="STYLE1" value=" 返回 " onclick="window.location.href='index_.jsp'"/></p>
    </center>
      </tr>
    </table>
    </td>
  </tr>
</table>
<br />
<jsp:include page="copyright.jsp" flush="true"/>
</center>





