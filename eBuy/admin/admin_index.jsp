<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>

<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	else
	{
%>
<jsp:include page="top.jsp" flush="true"/>
<%
	String n_message="";
	String n_time="";
	String allString="";
	int temp=1;
	ConnDB conn=new ConnDB();
	String sql="select n_message,n_time from notice";
	ResultSet rs=conn.doQuery(sql);
	while(rs.next())
	{	
		n_message=rs.getString("n_message");
		n_time=rs.getString("n_time");
		allString=allString+temp+". "+n_message+"."+"  "+"["+n_time+"]"+"<******>";
		temp++;
	}	
	conn.closeConnection();
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>Easy Buy Online</title>
<style type="text/css">
<!--

.STYLE1 {
	font-size: 12px;
}

.STYLE2 {
	font-size: 14px;
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

-->
</style>
</head>

<body>
<center>
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="146" height="30" align="center"><span class="STYLE2">当前管理员</span>：<span class="STYLE2"><%= admin_name %></span></td>
    <td width="102" align="center"><span class="STYLE2">公告栏</span>：</td>
    <td width="504" align="center"><table width="90%" border="0" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="454" height="28"><marquee scrolldelay="5" scrollamount="2" bgcolor="#FFFFFF" onMouseOver="this.stop();" onMouseOut="this.start();">
      <span class="STYLE2"><%= allString %></span></marquee></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td height="476" colspan="3" valign="top"><table width="100%" height="383" border="0" align="right" cellpadding="0" cellspacing="0">
      <!--DWLayoutTable-->
      <tr>
        <td width="782" height="383"><iframe src="index1.jsp" width="782" height="550"> </iframe></td>
        </tr>
    </table></td>
    </tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%}%>
