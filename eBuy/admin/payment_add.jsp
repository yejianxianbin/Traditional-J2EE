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
%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {font-size: 14px}
-->
</style>
<script>
	<!-- 
		function check_type(form)
		{
			if(form.fangshi_name.value=="")
			{
				alert("请输入面板的名字");
				form.fangshi_name.focus();
				return false;
			}
		}
	 -->
</script>
<%
	String fangshi_name=request.getParameter("fangshi_name");
	String fangshi_msg=request.getParameter("fangshi_msg");
	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	double m=Math.random();
	String fangshi_id=String.valueOf(m).substring(2,5);
	fangshi_name=convert.method(fangshi_name);
	fangshi_msg=convert.method(fangshi_msg);
	if(fangshi_name!=null && fangshi_msg!="")
	{
		String sql="insert Payment values ('"+fangshi_id+"','"+fangshi_name+"','"+fangshi_msg+"')";
		int temp=conn.doUpdate(sql);
		if(temp!=0)
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=payment_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
				<jsp:include page="ok_ok.html" flush="true"/>
			<%
		}
		else
		{
			out.println( "<HTML><HEAD><META http-equiv='refresh' content='1; URL=payment_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
			%>
				<jsp:include page="delete_ok.html" flush="true"/>
			<%
		}
	}
%>

<center>
<form action="" method="post" onsubmit="return check_type(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="35" colspan="2" align="center" valign="middle" bgcolor="#99CCFF" class="STYLE2">添加支付方式</td>
  </tr>
  <tr>
    <td width="163" height="40" align="right"><span class="STYLE1">支付方式</span>：</td>
    <td width="351" align="left"><input type="text" name="fangshi_name" /></td>
    </tr>
  <tr>
    <td height="76" align="right"><span class="STYLE1">备注</span>：</td>
    <td align="left"><label>
      <textarea name="fangshi_msg" cols="30" rows="6" wrap="hard"></textarea>
    </label></td>
    </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" class="STYLE1" value=" 添加 " />&nbsp;<input type="button" class="STYLE1" value=" 返回 " onclick="history.go(-1);" /></td>
  </tr>
</table>
</form>
</center>
