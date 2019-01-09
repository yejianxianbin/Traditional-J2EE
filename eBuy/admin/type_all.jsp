<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<% 
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	ConnDB conn=new ConnDB();
	String t_id="";
	String t_type="";
	int temp=1;
	String sql="select t_id,t_type from main_type";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{
 %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
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
</head>

<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="4" align="center" bgcolor="#99CCFF"><span class="STYLE2">主面板</span></td>
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
		t_id=rs.getString("t_id");
		t_type=rs.getString("t_type");
 %>
  <tr>
    <td width="40" height="40" align="center" class="STYLE1"><%= temp %></td>
    <td width="290" align="center"><span class="STYLE2"><%= t_type %></span></td>
    <td width="70" align="center"><span class="STYLE1">[ <a href="type_update.jsp?t_id=<%= t_id %>">修改</a> ]</span></td>
    <td width="70" align="center"><span class="STYLE1">[ <a href="type_delete.jsp?t_id=<%= t_id %>">删除</a> ]</span></td>
  </tr>
  <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
		temp++;
	}	  
   %>
  <tr>
    <td height="21" colspan="4" align="right"><span class="STYLE1"><a href="type_add.jsp">添加新面板</a></span>&nbsp;</td>
  </tr>
  <tr>
    <td height="30" colspan="4" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1"><%= recordCount %></span> 个记录,分<span class="STYLE1"> <%= maxPage %> </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1"><%= currentPage %> </span>页
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='type_all.jsp?page="+j+"'>"+j+"</a>");
	}
%>
</p></td>
  </tr>
</table>
</center>
<% 
	conn.closeConnection();
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=type_add.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有任何数据..." + "</font></center></body></html>");
	}
 %>