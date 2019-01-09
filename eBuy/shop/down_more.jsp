<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.ConnDB"%>
<%@ page import="java.sql.*" %>

<% 
	String c_name=(String) session.getAttribute("c_name");
	String c_header=(String) session.getAttribute("c_header");
	String t_type=(String) request.getParameter("t_type");
	session.setAttribute("t_type",t_type);
	ConnDB conn=new ConnDB();
	String p_id="",p_name="",p_price="",p_image="",p_description="";
	String sql="select p_id,p_name,p_price,p_image,p_description from product";
	ResultSet rs=conn.doQuery(sql);
 %>
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
<table width="256" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td width="256" height="119"><table width="200" border="0" bordercolor="#99CCFF" style="border-collapse:collapse">
<%
//int i=1;
int j=0;
	String str=(String)request.getParameter("page");
	if(str==null)
	{
		str="0";
	}
	int pagesize=15;
	rs.last();
	int recordCount=rs.getRow(); 
	int maxPage=0;
	maxPage=(recordCount%pagesize==0)?(recordCount/pagesize):(recordCount/pagesize+1);
	int currentPage=Integer.parseInt(str);
	if(currentPage<1)
	{
		currentPage=1;
	}
	else
	{
		if(currentPage>maxPage)
		{
			currentPage=maxPage;
		}
	}
	rs.absolute((currentPage-1)*pagesize+1);
	for(int i=1;i<=pagesize;i++)
	{
for(;i<=5;i++)
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
    <td width="110" height="135" align="center" valign="middle"><img src="../<%= p_image %>" width="90" /></td>
    <td width="100" align="center"><span class="STYLE5">============</span><p class="STYLE1"><%= p_name %></p><p><font size="2" color="red">￥<%= p_price %></font></p>
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
}
  %>
</table></td>
  </tr>
</table>
<p><span class="STYLE1">[ <%= maxPage-1 %>/<%= currentPage %> ]  当前页</span> <span class="STYLE1">第 <%= currentPage %> 页
   <%
	for(int n=1;n<=maxPage-1;n++)
	{
		out.print("&nbsp;&nbsp;<a href='index_down_more.jsp?page="+n+"'>"+n+"</a>");
		
	}
%>
</span></p><p></p>