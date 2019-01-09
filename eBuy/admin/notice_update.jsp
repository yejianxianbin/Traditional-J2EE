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

	String id=(String) request.getParameter("n_id");
	String message=(String) request.getParameter("n_message");
	String time=(String) request.getParameter("n_time");
	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	
	message=convert.method(message);
	id=convert.method(id);
	time=convert.method(time);
	
	if(message!=null)
	{
		String sql="update notice set n_message='"+message+"',n_time='"+time+"' where n_id='"+id+"'";
		int temp= conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=notice_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
	%>
<jsp:include page="update_ok.html" flush="true"/>
	<%
		}
		else
		{
			out.println("<script language='javascript'>alert('公告修改失败,请稍候再发');window.location.href='notice_all.jsp';</script>");
		}
	}
	conn.closeConnection();
 %>
 
 
 <%
	String n_admin="",n_message="",n_time="",n_header="";
	try
	{
		String sql="select n_admin,n_header,n_message,n_time from notice where n_id='"+id+"'";
		ResultSet rs=conn.doQuery(sql);
		while(rs.next())
		{
			n_admin=rs.getString("n_admin");
			n_header=rs.getString("n_header");
			n_message=rs.getString("n_message");
			n_time=rs.getString("n_time");
		}
	}catch(Exception e){}
%>
 

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {
	font-size: 14px;
}
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
        <td height="30" colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">公告发布</span></td>
      </tr>
      <tr>
        <td height="14" colspan="3">&nbsp;</td>
      </tr>
      
      <tr>
        <td width="127" height="109" align="center"><p><img src="<%= n_header %>" width="50" height="50" /></p>
        <p><span class="STYLE1"><%= n_admin %></span></p></td>
        
        <td width="367" align="left"><textarea name="n_message" rows="8" cols="45"><%= n_message  %></textarea></td>
      </tr>
      <tr>
        <td height="14" colspan="2" align="center"><!--DWLayoutEmptyCell-->&nbsp;</td>
      </tr>
      <tr>
        <td height="28" align="center"><span class="STYLE1">发布时间</span>：</td>
        <td align="left"><input type="text" name="n_time" value="<%= n_time %>"/></td>
      </tr>
      
      
      <tr>
        <td height="35" colspan="3" align="center"><input type="submit" class="STYLE1" value=" 修改 " />
&nbsp;          <input type="reset" class="STYLE1" onclick="history.go(-1);" value=" 返回 " /></td>
      </tr>
    </table>
  </form>
</center>
<% conn.closeConnection(); %>