<%@ page contentType="text/html;charset=GB2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.util.Date"%>
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
//提交客户意见或建议
	String c_name=(String) session.getAttribute("c_name");
	String c_header=(String) session.getAttribute("c_header");
	if(c_name!=null && c_name!="")
	{
		String message = (String) request.getParameter("c_message");
		double m=Math.random();
		String id=String.valueOf(m).substring(2,5);
		
		ConnDB conn=new ConnDB();
		Date date=new Date();
		String new_time=date.getHours()+":"+date.getMinutes()+" "+String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);
		Convert convert=new Convert();
		id=convert.method(id);
		c_name=convert.method(c_name);
		c_header=convert.method(c_header);
		message=convert.method(message);
		
		if(c_name!=null || c_header!=null || message !=null)
		{
			String sql="insert idea(id,c_name,c_header,new_message,new_time) values('"+id+"','"+c_name+"','"+c_header+"','"+message+"','"+new_time+"')";
			int temp= conn.doUpdate(sql);
			if(temp!=0)
			{
				out.println( "<HTML><HEAD><META http-equiv='refresh' content='2;URL=message.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
<br /><br /><br /><br /><br /><br /><br /><br />
<center>
 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->
	<tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	</tr>
	<tr>
		<td height="57" align="center"><span class="STYLE10">发表成功<span class="STYLE3">！</span></span></span></td>
	</tr>
</table>
</center>
			<%
			}
			else
			{
				out.println( "<HTML><HEAD><META http-equiv='refresh' content='3; URL=message.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "系统忙，请重新再发..." + "</font></center></body></html>");
			}
			
		}
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2;URL=message.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
<br /><br /><br /><br /><br /><br /><br /><br />
<center>
 <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
<!--DWLayoutTable-->
	<tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	</tr>
	<tr>
		<td height="57" align="center"><span class="STYLE10">发表失败,请先登录<span class="STYLE3">！</span></span></span></td>
	</tr>
</table>
</center>
<%}%>
