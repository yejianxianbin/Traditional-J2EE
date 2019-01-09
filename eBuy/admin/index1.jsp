<%@ page contentType="text/html;charset=gb2312" %>
<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('ÇëÏÈµÇÂ¼!');window.location.href='index.jsp';</script>");
	}
	else
	{
%>
<HTML>
<META http-equiv=Content-Type content="text/html; 

charset=gb2312">
<HEAD>
</HEAD>

<frameset cols="26%,*" frameborder="NO" border="0" framespacing="0" rows="*">
<FRAME name=Left src="left_menu.jsp">
<FRAME name=Rigth src="cust_all.jsp">
</FRAMESET><noframes></noframes>

</HTML>
<%}%>
