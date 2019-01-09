<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Easy Buy Online</title>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE10 {
	font-size: 14px;
	color: #FF0000;
}
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
.STYLE3 {font-size: 14px}
.STYLE11 {color: #FF0000; font-size: 12px; }
-->
</style>
</head>
<body>
<% 
	String c_name=request.getParameter("c_name");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index_.jsp';</script>");
	}
	else
	{
	String answer=request.getParameter("c_answer");
	String c_answer="";
	String c_pass="";
	String c_header="";
	ConnDB con=new ConnDB();
	String sql="select c_pass,c_header,c_answer from customer where c_name='"+c_name+"'";	
	ResultSet rs=con.doQuery(sql);
	if(rs.next())
	{
		c_pass=rs.getString("c_pass");
		c_header=rs.getString("c_header");
		c_answer=rs.getString("c_answer");
		if(!answer.equals(c_answer))
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=forget_pass.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
 %>
 <center>
 <br /><br /><br /><br /><br /><br /><br /><br />
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	  </tr>
	  <tr>
		<td height="60" align="center" ><span class="STYLE10">答案错误<span class="STYLE11">！</span>返回请重新输入<span class="STYLE11">！</span></span></td>
	    </tr>
   </table>
</center>
 <% }
 	else{ %>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>
<jsp:include page="explain.jsp" flush="true"/>
<center>
<table width="439" border="0" cellpadding="0" cellspacing="0">
  <!--DWLayoutTable-->
  <tr>
    <td height="25" colspan="3" align="left"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
  <tr>
    <td height="31" align="center"><img src="../images/logo/ok.gif" width="100" height="90" /></td>
    <td height="31" colspan="2" align="left"><span class="STYLE10">&nbsp;&nbsp;恭喜! 密码查询成功 !</span></td>
    </tr>
  <tr>
    <td width="152" rowspan="2" align="right"><img src="<%= c_header %>"/></td>
	<td width="76" align="right"><span class="STYLE1">用户名</span>：</td>
	<td width="211" height="34" align="left" class="STYLE2"><%= c_name %></td>
  </tr>
  <tr>
    <td height="34" align="right"><span class="STYLE1">密&nbsp;&nbsp;码</span>：</td>
	<td height="34" align="left" class="STYLE2"><%= c_pass %></td>
  </tr>
  <tr>
    <td height="13" colspan="3" align="right"><input type="button" class="STYLE1" value=" 返回登录>>> " onClick="window.location.href='index_.jsp'" /></td></tr>
  <tr>
    <td height="25" colspan="3" align="right"><!--DWLayoutEmptyCell-->&nbsp;</td>
  </tr>
</table>
</center>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<% 	}
}
}
 %>