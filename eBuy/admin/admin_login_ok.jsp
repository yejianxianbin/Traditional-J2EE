<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<style type="text/css">
		<!--
		.STYLE10 {
			font-size: 14px;
			color: #FF0000;
		}
.STYLE3 {color: #FF0000; font-size: 12px; }
		-->
		</style>
<%
	ConnDB conn=new ConnDB();
	String admin_name=(String)request.getParameter("a_name");
	String admin_pass=(String)request.getParameter("a_pass");
	String name="",pass="",header="";
	if (admin_name!=null || admin_pass!="")
	{
		try
		{
			String strSql="select a_name,a_pass,a_header from admin where a_name='"+admin_name+"' and a_pass='"+admin_pass+"'";
			ResultSet rs=conn.doQuery(strSql);
			while(rs.next())
			{
				name=rs.getString("a_name");
				pass=rs.getString("a_pass");
				header=rs.getString("a_header");
			}
			if(admin_name.equals(name) && admin_pass.equals(pass))
			{
				session.setAttribute("admin_name",admin_name);
				session.setAttribute("admin_header",header);
				out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=admin_index.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<br /><br /><br /><br /><br /><br /><br /><br />
 <center>
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	    </tr>
	  <tr>
		<td height="60" align="center"><span class="STYLE10">登录中...</span></td>
	    </tr>
   </table>
</center>
	<%
			}
			else
			{
					out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=index.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<br /><br /><br /><br /><br /><br /><br /><br />
 <center>
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	    </tr>
	  <tr>
		<td height="60" align="center"><span class="STYLE10">登录失败，请重新登录<span class="STYLE3">！</span></span></td>
	    </tr>
   </table>
</center>
	<%
			}
		}
		catch(Exception e)			
		{
			out.println("<script language='javascript'>alert('您的操作有误!');window.location.href='default.jsp';</script>");
		}
	}
%>
