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
	String c_name="",c_header="",new_message="",re_message,re_time="", new_time="",id="";
try
{
	String sql="select c_header,c_name, new_message,re_message,new_time,re_time,id from idea";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next()) 
	{
 %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px; }
.STYLE3 {color: #FF0000}
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
    <td width="62" height="30" align="center"><span class="STYLE2">留言者</span></td>
    <td width="324" align="center"><span class="STYLE2">意见与建议</span></td>
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
		c_header=rs.getString("c_header");
		c_name=rs.getString("c_name");
		new_message=rs.getString("new_message");
		re_message=rs.getString("re_message");
		new_time=rs.getString("new_time");
		re_time=rs.getString("re_time");
		id=rs.getString("id");
 %>
     <tr>
       <td rowspan="2" align="center"><p><img src="<%= c_header %>"></p></td>
       <td height="15" colspan="3" align="left" valign="middle"><span class="STYLE1">[留言者]&nbsp;&nbsp;<%= c_name %></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="STYLE1">[发表时间]&nbsp;&nbsp;</span> <span class="STYLE1"><%= new_time %></span></td>
     </tr>
    <tr>
      <td height="45" colspan="3" align="left" valign="middle"><span class="STYLE1">[留言]</span><span class="STYLE1">&nbsp;&nbsp;<%= new_message %></span></td>
    </tr>
  <tr>
    <td height="45" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
    <td height="45" align="left" valign="middle"><span class="STYLE1">[<span class="STYLE3">回复</span>]&nbsp;&nbsp;<%= re_message %>&nbsp;&nbsp;[<%= re_time %>]</span></td>
    <td width="52" align="center"><span class="STYLE1">[ <a href="cust_message_return.jsp?id=<%= id %>">回复</a> ]</span></td>
    <td width="52" align="center"><span class="STYLE1">[ <a href="cust_message_delete.jsp?id=<%= id %>">删除</a> ]</span></td>
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
			out.print("&nbsp;&nbsp;<a href='cust_message_all.jsp?page="+j+"'>"+j+"</a>");
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
	out.println( "<HTML><HEAD></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有任何数据..." + "</font></center></body></html>");
	}
}
catch(Exception e){}
conn.closeConnection();
%> 

