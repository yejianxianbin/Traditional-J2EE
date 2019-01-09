<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<%

	String id=(String) request.getParameter("id");
	String message=(String) request.getParameter("c_message");
	ConnDB conn=new ConnDB();
	Date date=new Date();
	String m_time=date.getHours()+":"+date.getMinutes()+" "+String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);
	Convert convert=new Convert();
	message=convert.method(message);
	if(message!=null)
	{
		String sql="update idea set re_message='"+message+"',re_time='"+m_time+"' where id='"+id+"'";
		int temp= conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=cust_message_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
				<jsp:include page="ok_ok.html" flush="true"/>
			<%
		}
		else
		{
out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=cust_message_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
			<jsp:include page="ok_fails.html" flush="true"/>
		<%
		}
	}
	conn.closeConnection();
 %>
 
 
 <%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}

	String header="";
	try
	{
		String sql="select a_header from admin where a_name='"+admin_name+"'";
		ResultSet rs=conn.doQuery(sql);
		while(rs.next())
		{
			header=rs.getString("a_header");
		}
	}catch(Exception e){}
%>
 

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size: 14px}
-->
</style>
<script>
	<!--
		function check_message(form)
		{
			if(form.c_message.value=="")
			{
				alert("请填写意见或者建议");
				form.c_message.focus();
				return false;
			}
		}
	-->
</script>


<center>
<form action="" method="post" onSubmit="return check_message(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">回复意见和建议</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="150" align="center"><p><img src="<%= header %>" width="50" height="50" /></p><p><span class="STYLE1"><%= admin_name %></span></p></td>
        
        <td width="367" rowspan="2" align="left"><textarea name="c_message" rows="13" cols="50"></textarea></td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE1">管理员</span></td>
      </tr>
      
      
      <tr>
        <td height="30" colspan="3" align="center"><input type="submit" class="STYLE1" value="发表意见" />
&nbsp;          <input type="button" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<% conn.closeConnection(); %>