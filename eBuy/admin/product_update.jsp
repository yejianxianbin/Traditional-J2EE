<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<% 
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
	}
	String p_id=(String) request.getParameter("p_id");
	String p_type="",p_name="",p_price="",p_quantity="",p_image="",p_description="";
	ConnDB conn=new ConnDB();
	String sql="select * from product where p_id='"+p_id+"'";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{
		p_type=rs.getString(1);
		p_name=rs.getString(3);
		p_price=rs.getString(4);
		p_quantity=rs.getString(5);
		p_image=rs.getString(6);
		p_description=rs.getString(7);
	}
	rs.close();
	

 %>
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
<script>
	<!--
	function check_product(form)
	{
		if(form.p_type.value=="")
		{
			alert("��ѡ����Ʒ����");
			form.p_type.focus();
			return false;
		}
		if(form.p_id.value=="")
		{
			alert("��������Ʒ��ID");
			form.p_id.focus();
			return false;
		}	
		if(form.p_name.value=="")
		{
			alert("��������Ʒ������");
			form.p_name.focus();
			return false;
		}	
		if(form.p_price.value=="")
		{
			alert("��������Ʒ�ļ۸�");
			form.p_price.focus();
			return false;
		}	
		if(form.p_quantity.value=="")
		{
			alert("��������Ʒ������");
			form.p_quantity.focus();
			return false;
		}	
		if(form.p_image.value=="")
		{
			alert("�������Ʒ��ͼƬ");
			form.p_image.focus();
			return false;
		}	
	}
	
	-->
</script>
<center>
<form action="product_update_ok.jsp?p_id=<%= p_id %>" method="post" onSubmit="return check_product(this);">
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">�鿴/�޸���Ʒ��Ϣ</span></td>
    </tr>
  <tr>
    <td width="146" height=40 align="center"><span class="STYLE1">��Ʒ����</span>��</td>
    <td width="348" align="left">&nbsp;&nbsp;
      <select name="p_type">
	  <option value="<%= p_type %>"><%= p_type %></option>
	  <%
		String str_sql="select t_type from main_type where t_type != '"+p_type+"'";
		rs=conn.doQuery(str_sql);
		while(rs.next())
		{
	  %>
	  	<option value="<%= rs.getString("t_type") %>"><%= rs.getString("t_type") %></option>
	  <%}%>
    </select></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">��ƷID</span>��</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_id" size="15" value="<%= p_id %>"/></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">��Ʒ����</span>��</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_name" size="30" value="<%= p_name %>"  /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">��Ʒ�۸�( RMB )</span>��</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_price" size="10" value="<%= p_price %>" /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">��Ʒ����</span>��</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="text" name="p_quantity" size="10" value="<%= p_quantity %>"  /></td>
  </tr>
  <tr>
    <td height="30" align="center"><span class="STYLE1">��ƷͼƬ</span>��</td>
    <td height="30" align="left">&nbsp;&nbsp;
      <input type="file" name="p_image" size="30" value="<%= p_image %>"/></td>
  </tr>
  
  <tr>
    <td height="94" align="center"><span class="STYLE1">��Ʒ����</span>��</td>
    <td height="94" align="left">&nbsp;&nbsp;
      <textarea name="p_description" cols="42" rows="5"><%= p_description %></textarea></td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="center"><input name="submit" type="submit" class="STYLE1" value=" �޸� " />      &nbsp;&nbsp;
      <input type="button" class="STYLE1" value=" ���� " onclick="history.go(-1);"/></td> 
  </tr>
</table>
</form>
</center>