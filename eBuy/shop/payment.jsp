<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.util.Vector"%>
<%@ page import="shopBeans.CartBean"%>
<%@ page import="shopBeans.Convert"%>
<%@ page import="shopBeans.ConnDB"%>
<%@ page import="java.util.Date" %>
<%

	String c_name=(String)session.getAttribute("c_name");
	String c_header=(String)session.getAttribute("c_header");
	String order_number=(String)session.getAttribute("order_number");
	Date date=new Date();
	String o_time=String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);
	session.setAttribute("o_time",o_time);
	Convert convert=new Convert();
	String pay_fangshi=request.getParameter("pay_fangshi");
	String pay_address=request.getParameter("pay_address");
	String pay_email=request.getParameter("pay_email");
	pay_fangshi=convert.method(pay_fangshi);
	pay_address=convert.method(pay_address);
	pay_email=convert.method(pay_email);
	session.setAttribute("pay_fangshi",pay_fangshi);
	session.setAttribute("pay_address",pay_address);
	session.setAttribute("pay_email",pay_email);
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index_.jsp';</script>");
	}
	else
	{
		ConnDB conn=new ConnDB();
		Vector cart=(Vector)session.getAttribute("cart");
		if(cart==null || cart.size()==0)
		{
			response.sendRedirect("cart_null.jsp");
		}
		else
		{
	%>
<html>
<head>
<title>Easy Buy Online</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2{
	font-size: 14px;
}
.STYLE9 {color: #FF0000}
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
.STYLE10 {
	font-size: 36px;
	font-family: "���ռ��п�";
	color: #000099;
}
-->
</style>
<script language="javascript">
<!--
	function check_pay(form)
	{
		if(form.pay_fangshi.value=="")
		{
			alert("��ѡ�����ĸ��ʽ");
			form.pay_fangshi.focus();
			return false;
		}
		if(form.pay_address.value=="")
		{
			alert("���������ĵ�ַ");
			form.pay_address.focus();
			return false;
		}
		if(form.pay_email.value=="")
		{
			alert("����������Eamil");
			form.pay_email.focus();
			return false;
		}
		if(form.pay_email.value.indexOf("@")==-1 ||(form.pay_email.value.indexOf(".")==-1))
		{
			alert("�����Email��ʽ������д��ȷ�ĵ�������");
			form.pay_email.focus();
			return false;
		}
	}
-->
</script>

</head>
<body>
<jsp:include page="title.jsp" flush="true"/>
<jsp:include page="menu.jsp" flush="true"/>
<center>
<table width="782"  border="1" bordercolor="#99CCFF" cellspacing="0" cellpadding="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
        <tr>
          <td width="183" align="center" valign="top"><jsp:include page="login.jsp" flush="true"/></td>
          <td width="602" valign="top"><table width="100%"  border="0" bordercolor="#99CCFF" style="border-collapse:collapse" cellspacing="0" cellpadding="0">
            <!--DWLayoutTable-->
                      <tr>
                        <td height="14" colspan="5" align="center">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="37" colspan="5" align="center" bgcolor="#eeeeee"><span class="STYLE10">������ϸ��Ϣ</span></td>
                      </tr>
                      <tr>
                        <td width="2%" height="37" align="center">&nbsp;</td>
                        <td height="37" colspan="2" align="center" ><!--DWLayoutEmptyCell-->&nbsp;</td>
                        <td width="43%" align="center">&nbsp;</td>
                        <td width="2%">&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="24">&nbsp;</td>
                        <td colspan="2">&nbsp;<span class="STYLE1">�û���</span>��<font size="2"><%= c_name %></font></td>
                        <td>&nbsp;<span class="STYLE1">������</span>��<font size="2" color="#FF0000"><%= order_number %> (���ס���Ķ�����)</font></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="24">&nbsp;</td>
                        <td colspan="2">&nbsp;<span class="STYLE1">�����˵�E_mail</span>��<font size="2"><%= pay_email %></font></td>
                        <td>&nbsp;<span class="STYLE1">����ʱ��</span>��<font size="2"><%= o_time %></font></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="24">&nbsp;</td>
                        <td colspan="3">&nbsp;<span class="STYLE1">�����˵ĵ�ַ</span>��<font size="2"><%= pay_address %></font></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td height="24">&nbsp;</td>
                        <td colspan="3">&nbsp;<span class="STYLE1">���ʽ</span>��<font size="2"><%= pay_fangshi %></font></td>
                        <td>&nbsp;</td>
                      </tr>
					  <% 
					  		try
							{
								String pay_sql="select pay_msg from Payment where pay_payment='"+pay_fangshi+"'";
								ResultSet pay_rs=conn.doQuery(pay_sql);
								if(pay_rs.next())
								{
					   %>
                      <tr>
                        <td height="24">&nbsp;</td>
                        <td colspan="3">&nbsp;<span class="STYLE1">���ע</span>��<font size="2" color="#FF0000"><%= pay_rs.getString("pay_msg") %></font></td>
                        <td>&nbsp;</td>
                      </tr>
					  <%
					  			}
					  		}
							catch(Exception e){}
					  %>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3">&nbsp;</td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td>&nbsp;</td>
                        <td colspan="3"><hr size="1" color="#99CCFF" width="560"></td>
                        <td>&nbsp;</td>
                      </tr>
                      <tr>
                        <td colspan="5">
<form method="post" action="cart_modify.jsp" name="form1">
<table width="95%" height="83" border="0" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="27" class="STYLE1">���</td>
        <td height="27" class="STYLE1">��Ʒ���</td>
        <td class="STYLE1">��Ʒ����</td>
        <td height="27" class="STYLE1">����</td>
        <td height="27" class="STYLE1">����</td>
        <td width="86" height="27" class="STYLE1">���</td>
        </tr> 
	<%
		float sum=0;
		String p_id="";
		String goodsname="";
		for(int i=0;i<cart.size();i++){
			CartBean goodsitem=(CartBean)cart.elementAt(i);
			sum=sum+goodsitem.p_number*goodsitem.p_price;
			p_id=goodsitem.p_id;
			ResultSet rs_goods=conn.doQuery("select * from Product where p_id='"+p_id+"'");
			if (rs_goods.next())
			{
				goodsname=rs_goods.getString("p_name");
				
			}
	%> 
      <tr align="center" valign="middle"> 
        <td width="39" height="27"><font size="2"><%=i+1%></font></td>
        <td width="110" height="27"><font size="2"><%=p_id%></font></td> 
        <td width="197" height="27"><font size="2"><%=goodsname%></font></td>
        <td width="79" height="27"><font size="2">��<%=goodsitem.p_price%></font></td> 
        <td width="52" height="27" class="STYLE1"><%=goodsitem.p_number%></td> 
        <td height="27"><font size="2">��<%=(goodsitem.p_price*goodsitem.p_number)%></font></td> 
        <script language="javascript">
			<!--
			function check(myform){
				if(isNaN(myform.num<%=i%>.value) || myform.num<%=i%>.value.indexOf('.',0)!=-1){
					alert("�벻Ҫ����Ƿ��ַ�");myform.num<%=i%>.focus();return;}
				if(myform.num<%=i%>.value==""){
					alert("�������޸ĵ�����");myform.num<%=i%>.focus();return;}	
				myform.submit();
			}
			-->
		</script>
	<%
		}

	%> </tr>
      </table>
	  </form>
<table width="100%" height="83" border="0" bordercolor="#99CCFF" align="center" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
      <tr align="center" valign="middle">
        <td height="10" colspan="3"><hr size="1" color="#99CCFF" width="560"></td>
        </tr>
      <tr align="center" valign="middle">
		<td width="40%" height="10">&nbsp;</td>
        <td width="32%">&nbsp;</td>
        <td width="28%" height="10" colspan="-3" align="left"><span class="STYLE1">�ϼ��ܽ��</span><font size="2"><font size="2">��</font></font><span class="STYLE9">��<%=sum%></span></td>
		</tr>
      <tr align="center" valign="middle">
        <td height="26">&nbsp;</td>
        <td>&nbsp;</td>
        <td height="26" colspan="-3" align="left">&nbsp;</td>
      </tr>
      <tr align="center" valign="middle">
        <td height="29" colspan="3"><input name="button" type="button" class="STYLE1" onClick="window.location.href='payment1.jsp'" value=" ȷ������ "/>          &nbsp;&nbsp;
          <input type="button" class="STYLE1" value=" ȡ������ " onClick="history.go(-1);"/></td></tr>
</table></td>
                      </tr>
                      
                      <tr>
                        <td height="30" colspan="5" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
                      </tr>
          </table>          </td>
        </tr>
      </table>
</td>
  </tr>
</table>
</td>
</tr>
</table>
</center>
<br>
<jsp:include page="copyright.jsp" flush="true"/>
</body>
</html>
<%conn.closeConnection();}
}%>