
<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="shopBeans.ConnDB"%>
<%@ page import="shopBeans.Convert" %>

<%
	ConnDB conn=new ConnDB();
	String t_type="";
	String sql="select t_type from main_type";
	ResultSet rs=conn.doQuery(sql);

 %>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
body {
	margin-top: 0px;
}
-->
</style>
<script language="javascript">
<!--
	function check_Found(form)
	{
		if(form.select_type.value=="")
		{
			alert("��ѡ������������");
			form.select_type.focus();
			return false;
		}
	}
-->	
</script>

<center>
<form action="select_ok.jsp" method="post" onsubmit="return check_Found(this);">
<table width="782" border="0" cellpadding="0" cellspacing="0"  bordercolor="#99CCFF" bgcolor="#99CCFF" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="122" height="44" align="right"><span class="STYLE1">����</span>��</td>
    <td width="108"><select name="select_type">
	<option value="">-��Ʒ����-</option>
    <% 
    	while(rs.next())
    	{
    		t_type=rs.getString("t_type");
     %>
    <option value="<%= t_type %>"><%= t_type %></option>
    <% 
    	}
     %>
    </select></td>
    <td width="58" align="right"><span class="STYLE1">��Ʒ��</span>��</td>
    <td width="230"><input type="text" name="select_p_name" value="" size="30" /></td>
    <td width="156" bgcolor="#99CCFF"><input type="submit" name="Submit" value=" ���� " /></td>
  </tr>
</table>
</form>
</center>