<%@ page contentType="text/html;charset=gb2312" %>
<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
	}
%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
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


<table width="160" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">�ͻ�����</span></td>
  </tr>
  <tr>
    <td height="25" align="center"><span class="STYLE1"><a href="cust_all.jsp" target="Rigth">�鿴/�༭���пͻ�����</a></span></td>
  </tr>
  <tr>
    <td height="25" align="center"><span class="STYLE1"><a href="cust_select.jsp" target="Rigth">�ͻ���������</a></span></td>
  </tr>
  <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">��Ʒ����</span></td>
  <tr>
    <td height="25" align="center"><span class="STYLE1"><a href="product_all.jsp" target="Rigth">�鿴/�༭������Ʒ</a></span></td>
  </tr>
  <tr>
    <td height="25" align="center"><span class="STYLE1"><a href="product_select.jsp" target="Rigth">��Ʒ��������</a></span></td>
  </tr>
  <tr>
    <td height="25" align="center"><span class="STYLE1"><a href="product_add.jsp" target="Rigth">�����Ʒ</a></span></td>
  </tr>
  <tr>
    <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">��������</span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="order_all.jsp" target="Rigth">�鿴/�༭���ж���</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="order_select.jsp" target="Rigth">������ѯ</a></span></td>
  </tr>
  <tr>
   <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">��Ʒ�������</span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="type_all.jsp" target="Rigth">�鿴/�༭��Ʒ������</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="type_add.jsp" target="Rigth">�����Ʒ������</a></span></td>
  </tr>
  <tr align="center">
    <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">����/��������</span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="notice_all.jsp" target="Rigth">�鿴/�༭����</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="notice_send.jsp" target="Rigth">��������</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><a href="cust_message_all.jsp" target="Rigth" class="STYLE1">�鿴/�ظ��ͻ���Ϣ</a></td>
  </tr>
  <tr align="center">
    <td height="25" background="images/logo/admin_left_memu_back.gif" class="STYLE2">֧������</td>
  </tr>
  <tr align="center">
    <td height="25" class="STYLE1"><a href="payment_all.jsp" target="Rigth">�鿴/�༭֧����ʽ</a></td>
  </tr>
  <tr align="center">
    <td height="25" class="STYLE1"><a href="payment_add.jsp" target="Rigth">���֧����ʽ</a></td>
  </tr>
  <tr>
    <td width="243" height="25" align="center" background="images/logo/admin_left_memu_back.gif"><span class="STYLE2">��������</span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="admin_all.jsp" target="Rigth">�鿴/�༭���й���Ա</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="admin_select.jsp" target="Rigth">��ѯ����</a></span></td>
  </tr>
  <tr align="center">
    <td height="25"><span class="STYLE1"><a href="admin_reg.jsp" target="Rigth">��ӹ���Ա</a></span></td>
  </tr>
</table>
