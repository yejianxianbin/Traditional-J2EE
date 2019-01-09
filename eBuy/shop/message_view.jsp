<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<% 
	ConnDB conn=new ConnDB();
try
{
	String sql="select c_header,c_name,new_time,new_message,re_time,re_message from idea";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{

 %>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2{font-size: 14px}
.STYLE3 {
	font-size: 36px;
	font-family: "创艺简行楷";
	color: #000099;
}
-->
</style>
<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
	 <tr>
			<td height="48" colspan="2" align="center" bgcolor="#eeeeee"><span class="STYLE3">eBuy电子商城 意见与建议 </span></td>
	</tr>
   <%
	String str=(String)request.getParameter("page");
	if(str==null)
	{
		str="0";
	}
	int pagesize=5;
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
 %>
      <tr>
        <td width="127" rowspan="4" align="center"><p><img src="<%= rs.getString("c_header") %>" width="50" height="50"></p></td>
        <td width="619" height="20" align="right" bgcolor="#99CCFF"> <span class="STYLE1">[留言者]&nbsp;<%= rs.getString("c_name") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[留言时间]&nbsp;&nbsp;<%= rs.getString("new_time") %></span>&nbsp;&nbsp;</td>
      </tr>
      <tr>
        <td width="619" height="45"><span class="STYLE1">&nbsp;[留言]&nbsp;&nbsp;<span class="STYLE2"><%= rs.getString("new_message") %></span></span></td>
      </tr>
      <tr>
        <td width="619" height="20" align="right"><span class="STYLE1">[回复者]&nbsp;管理员&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[留言时间]&nbsp;&nbsp;<%= rs.getString("re_time") %>&nbsp;&nbsp;</span></td>
      </tr>
      <tr>
       <td height="45"><span class="STYLE1">&nbsp;<span class="STYLE1">[回复]</span>&nbsp;&nbsp;<span class="STYLE2"><%= rs.getString("re_message") %></span></span></td>
      </tr>
      
      <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}
	
   %>
      <tr>
        <td height="30" colspan="2"><p align="center" class="STYLE1">共 <span class="STYLE1"><%= recordCount %></span> 个记录,分<span class="STYLE1"> <%= maxPage %> </span>显示,当前页<strong>:</strong> 第 <span class="STYLE1"><%= currentPage %> </span>页
        <%
		for(int j=1;j<=maxPage;j++)
		{
			out.print("&nbsp;&nbsp;<a href='message.jsp?page="+j+"'>"+j+"</a>");
		}
	}
	else
	{
		out.print("<HTML><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "没有数据......" + "</font></center></body></html>");
	}
}
catch(Exception e){}
conn.closeConnection();
%>
</p></td>
    </tr>
</table>
</center>