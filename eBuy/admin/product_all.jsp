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
	String sql="select p_type,p_id,p_name,p_image from product order by p_type,p_id";
	String p_type="",p_id="",p_name="",p_image="";
	ResultSet rs=conn.doQuery(sql);
if(rs.next())
{

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
		p_type=rs.getString(1);
		p_id=rs.getString(2);
		p_name=rs.getString(3);
		p_image=rs.getString(4);
 %>
  <tr>
    <td width="86" rowspan="3" align="center"><img src="../<%= p_image %>" width="70" height="50"/></td>
    <td height="25" colspan="4" align="center"><span class="STYLE2"><%= p_type %></span></td>
  </tr>
  <tr>
    <td height="33" align="center"><span class="STYLE2"><%= p_name %></span></td>
    <td height="33" align="center"><span class="STYLE2"><%= p_id %></span></td>
    <td width="101" height="33" align="center"><span class="STYLE1">[ <a href="product_update.jsp?p_id=<%= p_id %>">查看/修改</a> ]</span></td>
    <td width="67" align="center"><span class="STYLE1">[ <a href="product_delete.jsp?p_id=<%= p_id %>">删除</a> ]</span></td>
  </tr>
  <tr>
    <td height="14" colspan="4" bgcolor="#99CCFF">&nbsp;</td>
  </tr>
  <tr>
    <td height="12" colspan="5">&nbsp;</td>
    </tr>
    <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}	  
   %>
  <tr>
    <td height="30" colspan="5" align="center"><p align="center" class="STYLE1">共 <span class="STYLE1"><%= recordCount %></span> 个记录,分<span class="STYLE1"> <%= maxPage %> </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1"><%= currentPage %> </span>页
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='product_all.jsp?page="+j+"'>"+j+"</a>");
	}
	conn.closeConnection();
%>
</p></td>
   </tr>
</table>
</center>
<%
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=product_add.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有任何数据..." + "</font></center></body></html>");
	}

%>