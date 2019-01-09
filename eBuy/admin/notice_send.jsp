<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.sql.*" %>
<% 
	String admin_name=(String)session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index.jsp';</script>");
	}
	String admin_header=(String) session.getAttribute("admin_header");
	String message=(String) request.getParameter("n_message");
	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	Date date=new Date();
	String n_time=String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);	
	double m=Math.random();
	String n_id=String.valueOf(m).substring(2,5);
	
	message=convert.method(message);
	n_id=convert.method(n_id);
	if(message!=null)
	{
		String sql="insert Notice(n_id,n_message,n_admin,n_header,n_time) values('"+n_id+"','"+message+"','"+admin_name+"','"+admin_header+"','"+n_time+"')";
		int temp= conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=notice_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
				<jsp:include page="ok_ok.html" flush="true"/>
			<%
		}
		else
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=notice_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		}
	}
	conn.closeConnection();
 %>

 <%
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
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {
	font-size: 14px;
}
-->
</style>


<center>
<form action="" method="post" onSubmit="return check_message(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <!--DWLayoutTable-->
      <tr>
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">公告发布</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="124" align="center"><p><img src="<%= header %>" width="50" height="50" /></p><p><%= admin_name %></p></td>
        
        <td width="367" rowspan="2" align="left"><textarea name="n_message" rows="10" cols="50" wrap="off"></textarea></td>
      </tr>
      <tr>
        <td align="center"><span class="STYLE1">管理员</span></span></td>
      </tr>
      
      
      <tr>
        <td height="40" colspan="3" align="center"><input type="submit" class="STYLE1" value="发表意见" />
&nbsp;          <input type="reset" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<% conn.closeConnection(); %>