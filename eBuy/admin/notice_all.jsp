<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	ConnDB conn =  new ConnDB();
	String n_id="",n_message="",n_admin="",n_time="",n_header="";
try
{
	String sql="select n_id,n_message,n_admin,n_header,n_time from Notice";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next()) 
	{
 %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
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

<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr bgcolor="#99CCFF">
    <td width="60" height="30" align="center"><span class="STYLE2">发布者</span></td>
    <td width="293" align="center"><span class="STYLE2">公告内容</span></td>
    <td colspan="2" align="center"><span class="STYLE2">操作</span></td>
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
		n_id=rs.getString("n_id");
		n_message=rs.getString("n_message");
		n_admin=rs.getString("n_admin");
		n_header=rs.getString("n_header");
		n_time=rs.getString("n_time");
 %>
  <tr>
    <td height="46" rowspan="2" align="center"><img src="<%= n_header %>" /></td>
    <td height="15" colspan="3" align="left" valign="middle"> <span class="STYLE1">[发布者] <%= n_admin %></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE1">[发布时间] <%= n_time %></span></td>
    </tr>
  <tr>
    <td height="45" align="left" valign="middle">&nbsp;<span class="STYLE1"><%= n_message %></span></td>
    <td width="81" align="center"><span class="STYLE1">[ <a href="notice_update.jsp?n_id=<%= n_id %>">查看/修改</a> ]</span></td>
    <td width="56" align="center"><span class="STYLE1">[ <a href="notice_delete.jsp?n_id=<%= n_id %>">删除</a> ]</span></td>
  </tr>
  
  <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}	  
   %>
   <tr>
    <td height="30" colspan="4" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1"><%= recordCount %></span> 个记录,分<span class="STYLE1"> <%= maxPage %> </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1"><%= currentPage %> </span>页
        <%
		for(int j=1;j<=maxPage;j++)
		{
			out.print("&nbsp;&nbsp;<a href='notice_all.jsp?page="+j+"'>"+j+"</a>");
		}
	
	%>
</p></td>
   </tr>
  </table>
</center>
<%
	}
	else
	{	
	out.println( "<HTML><HEAD></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有任何公告......" + "</font></center></body></html>");
	}
}
catch(Exception e){}
conn.closeConnection();
%> 

