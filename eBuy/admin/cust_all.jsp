<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<%
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
	}
	ConnDB conn =  new ConnDB();
	String c_name="",c_header="",c_phone="";
try
{
	String sql="select c_header,c_name,c_phone from customer";
	ResultSet rs = conn.doQuery(sql);
	if(rs.next())
	{
 %>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px}
.STYLE2 {font-size:14px}
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
<center>
<table width="520" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#99CCFF" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="56" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">ͷ��</span></td>
    <td width="91" align="center" bgcolor="#99CCFF"><span class="STYLE2">�û���</span></td>
    <td width="103" align="center" bgcolor="#99CCFF"><span class="STYLE2">��ϵ�绰</span></td>
    <td colspan="3" align="center" bgcolor="#99CCFF"><span class="STYLE2">����</span></td>
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
		c_header=rs.getString(1);
		c_name=rs.getString(2);
		c_phone=rs.getString(3);
 %>
  <tr>
    <td height="46" align="center"><img src="<%= c_header %>"></td>
    <td height="46" align="center"><%= c_name %></td>
    <td height="46" align="center"><span class="STYLE2"><%= c_phone %></span></td>
    <td width="109" height="46" align="center"><span class="STYLE1">[ <a href="cust_view.jsp?c_name=<%= c_name %>">�鿴��ϸ����</a> ]</span></td>
    <td width="84" align="center"><span class="STYLE1">[ <a href="cust_select_order.jsp?c_name=<%= c_name %>">���׼�¼</a> ]</span></td>
    <td width="63" align="center"><span class="STYLE1">[ <a href="cust_delete.jsp?c_name=<%= c_name %>">ɾ��</a> ]</span></td>
  </tr>
  <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}	  
   %>
   <tr>
    <td height="30" colspan="6" align="center"><p align="center" class="STYLE1">�� <span class="STYLE1"><%= recordCount %></span> ����¼,��<span class="STYLE1"> <%= maxPage %> </span>��ʾ,��ǰҳ<strong>:</strong> �� <span class="STYLE1"><%= currentPage %> </span>ҳ
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='cust_all.jsp?page="+j+"'>"+j+"</a>");
	}
	}
	else
	{
		out.println( "<HTML><HEAD></HEAD><BODY bgcolor='#FFFFFF'><center><font size=4pt color='red'>" + "û�пͻ���¼......" + "</font></center></body></html>");
	}
}
catch(Exception e){}
conn.closeConnection();
%>
</p></td>
   </tr>
</table>
</center>