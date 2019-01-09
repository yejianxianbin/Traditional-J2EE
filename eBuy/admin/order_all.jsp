<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	ConnDB conn = new ConnDB();
	String order_user="",order_id="",order_time="",order_sum="";
try
{
	String sql="select order_user,order_id,order_time,order_sum from Orders";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{
 %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
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
    <td width="66" height="30" align="center" bgcolor="#99CCFF" class="STYLE2">用户名</td>
    <td width="94" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">订单号</span></td>
    <td width="95" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">订单时间</span></td>
    <td width="77" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">总金额</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF" class="STYLE2"><span class="STYLE2">操作</span></td>
    </tr>
     <%
	String str=(String)request.getParameter("page");
	if(str==null)
	{
		str="0";
	}
	int pagesize=10;
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
		order_user=rs.getString("order_user");
		order_id=rs.getString("order_id");
		order_time=rs.getString("order_time");
		order_sum=rs.getString("order_sum");
 %>
  <tr>
    <td height="35" align="center" class="STYLE2"><%= order_user %></td>
    <td height="32" align="center" class="STYLE2"><%= order_id %></td>
    <td height="32" align="center" class="STYLE2"><%= order_time %></td>
    <td align="center" class="STYLE2"><%= order_sum %></td>
    <td width="107" height="32" align="center" class="STYLE1"><span class="STYLE1">[ <a href="order_view.jsp?order_id=<%= order_id %>">查看详细资料</a> ]</span></td>
    <td width="67" align="center" class="STYLE1"><span class="STYLE1">[ <a href="orderDetails_delete.jsp?order_id=<%= order_id %>">删除</a> ]</span></td>
  </tr>
  <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}	  
   %>
   <tr>
    <td height="30" colspan="7" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1"><%= recordCount %></span> 个记录,分<span class="STYLE1"> <%= maxPage %> </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1"><%= currentPage %> </span>页
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='order_all.jsp?page="+j+"'>"+j+"</a>");
	}
	}
	else
	{
		out.println( "<HTML><HEAD></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有订单记录......" + "</font></center></body></html>");
	}
}
catch(Exception e){}
conn.closeConnection();
%>
</p></td>
   </tr>
</table>
</center>