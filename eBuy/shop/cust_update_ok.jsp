<%@page contentType="text/html;charset=GB2312"%>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>

<% 
	String name=(String) request.getParameter("name");
	String pass=(String) request.getParameter("c_pass");
	String image=(String) request.getParameter("reg_userPic");
	String phone=(String) request.getParameter("c_phone");
	String question=(String) request.getParameter("c_question");
	String answer=(String) request.getParameter("c_answer");
	String address=(String) request.getParameter("c_address");
	String email=(String) request.getParameter("c_email");
	ConnDB conn=new ConnDB();
	Convert convert = new Convert();
	
	name=convert.method(name);
	pass=convert.method(pass);
	image=convert.method(image);
	phone=convert.method(phone);
	question=convert.method(question);
	answer=convert.method(answer);
	address=convert.method(address);
	email=convert.method(email);
	
	if(name!=null || question!=null || email!=null)
	{
		String sql="update customer set c_pass='"+pass+"',c_header='"+image+"',c_phone='"+phone+"',c_question='"+question+"',c_answer='"+answer+"',c_address='"+address+"',c_email='"+email+"' where c_name='"+name+"'";
		int temp=conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=index_.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<style type="text/css">
		<!--
		.STYLE10 {
			font-size: 14px;
			color: #FF0000;
		}
.STYLE3 {color: #FF0000; font-size: 12px; }
		-->
		</style>
		<br /><br /><br /><br /><br /><br /><br /><br />
 <center>
	  <table width="300" border="1" bordercolor="#99CCFF" style="border-collapse:collapse" cellpadding="0" cellspacing="0">
	  <!--DWLayoutTable-->
	  <tr bgcolor="#99CCFF">
		<td height="13">&nbsp;</td>
	    </tr>
	  <tr>
		<td height="60" align="center"><span class="STYLE10">恭喜<span class="STYLE3">！</span>资料修改成功<span class="STYLE3">！</span></span></td>
	    </tr>
   </table>
</center>
	<%
		}
		else
			out.println("<script language='javascript'>alert('修改失败!');window.location.href='index_.jsp';</script>");
			
	}
	%>