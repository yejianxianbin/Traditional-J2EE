<%@ page contentType="text/html;charset=gb2312" %>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
-->
</style>

<script>
	<!--
		function check_name(form)
		{
			if(form.admin_name.value=="")
			{
				alert("������ͻ��û���");
				form.admin_name.focus();
				return false;
			}
		}	
	-->

</script>
</head>

<body>
<center>
<form action="admin_select_result.jsp" method="post" onSubmit="return check_name(this);">
<table width="520" border="1" bordercolor="#99CCFF"  cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr bgcolor="#99CCFF">
    <td height="14">&nbsp;</td>
  </tr>
  <tr>
    <td height="30"><span class="STYLE1">&nbsp;������Ҫ��ѯ�ͻ����û���</span>��</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle"><span class="STYLE1">�û���</span>��&nbsp;
      <input type="text" name="admin_name"/>&nbsp;&nbsp;<input type="submit" class="STYLE1" value=" ��ѯ " /></td>
    </tr>
  <tr>
    <td height="20" align="right"></td>
    </tr>
  <tr bgcolor="#99CCFF">
    <td height="14">&nbsp;</td>
  </tr>
</table>
</form>
</center>