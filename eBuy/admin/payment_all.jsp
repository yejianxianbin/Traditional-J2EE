<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>
<%
String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
	}
%>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 12px;
}
.STYLE2 {font-size: 14px}
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
<script>
	<!-- 
		function check_type(form)
		{
			if(form.t_name.value=="")
			{
				alert("��������������");
				form.t_name.focus();
				return false;
			}
		}
	
	 -->
</script>
<%
		ConnDB conn=new ConnDB();
		String sql="select pay_id,pay_payment from payment";
		String pay_id="",pay_payment="";
		int temp=1;
		ResultSet rs=conn.doQuery(sql);
		if(rs.next())
		{
%>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="52" height="35" align="center" bgcolor="#99CCFF" class="STYLE2">���</td>
    <td width="234" align="center" bgcolor="#99CCFF" class="STYLE2">֧����ʽ</td>
    <td height="35" colspan="2" align="center" bgcolor="#99CCFF" class="STYLE2">����</td>
    </tr>
	<%
	String str=(String)request.getParameter("page");
	if(str==null)
	{
		str="0";
	}
	int pagesize=10;
	rs.last();
	int recordCount=rs.getRow(); 
	int maxPage=0;
	maxPage=(recordCount%pagesize==0)?(recordCount/pagesize):(recordCount/pagesize+1);
	int currentPage=Integer.parseInt(str);
	if(currentPage<1)
	{
		currentPage=1;
	}
	else
	{
		if(currentPage>maxPage)
		{
			currentPage=maxPage;
		}
	}
	rs.absolute((currentPage-1)*pagesize+1);
	for(int i=1;i<=pagesize;i++)
	{

		pay_id=rs.getString(1);
		pay_payment=rs.getString(2);
	%>
  <tr>
    <td height="30" align="center" class="STYLE1"><%= temp %></td>
    <td height="30" align="center" class="STYLE2"><%= pay_payment %></td>
    <td width="123" height="30" align="center" class="STYLE1">[ <a href="payment_view.jsp?pay_id=<%= pay_id %>">�鿴/�޸�</a> ]</td>
    <td width="101" height="30" align="center" class="STYLE1">[ <a href="payment_delete.jsp?pay_id=<%= pay_id %>">ɾ��</a> ]</td>
  </tr>
  <%
  		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
  		temp++;
  	}
		
  %>
  <tr>
    <td height="30" colspan="4" align="right"><p align="center" class="STYLE1">�� <span class="STYLE1"><%= recordCount %></span> ����¼,��<span class="STYLE1"> <%= maxPage %> </span>��ʾ,��ǰҳ<strong>:</strong> �� <span class="STYLE1"><%= currentPage %> </span>ҳ
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='payment_all.jsp?page="+j+"'>"+j+"</a>");
	}
%>
</p></td>
  </tr>
</table>
</center>
<% 
	conn.closeConnection();
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=fangshi_add.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "û���κ�����..." + "</font></center></body></html>");
	}
 %>