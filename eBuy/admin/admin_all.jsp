<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.sql.*" %>

<% 
	ConnDB conn =  new ConnDB();
	String admin_name="",admin_header="",admin_phone="";
try
{
	String sql="select a_header,a_name,a_phone from admin";
	ResultSet rs = conn.doQuery(sql);
	
 %>

</head>

<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size: 14px;}
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
<body>
<center>
<table width="520" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td width="54" height="30" align="center" bgcolor="#99CCFF"><span class="STYLE2">ͷ��</span></td>
    <td width="88" align="center" bgcolor="#99CCFF"><span class="STYLE2">�˺�</span></td>
    <td width="99" align="center" bgcolor="#99CCFF"><span class="STYLE2">��ϵ�绰</span></td>
    <td colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">����</span></td>
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
		admin_header=rs.getString(1);
		admin_name=rs.getString(2);
		admin_phone=rs.getString(3);
 %>
  <tr>
    <td height="46" align="center"><img src="<%= admin_header %>"></td>
    <td height="46" align="center"><span class="STYLE2"><%= admin_name %></span></td>
    <td height="46" align="center"><span class="STYLE2"><%= admin_phone %></span></td>
    <td width="149" height="46" align="center"><span class="STYLE1">[ <a href="admin_update.jsp?admin_name=<%= admin_name %>">�鿴/�޸�����</a> ]</span></td>
    <td width="98" align="center"><span class="STYLE1">[ <a href="admin_delete.jsp?admin_name=<%= admin_name %>">ɾ��</a> ]</span></td>
  </tr>
  <% 
		try
		{
			if(!rs.next()){break;}
		}catch(Exception e){}
	}	  
   %>
   <tr>
    <td height="30" colspan="5" align="center"><p align="center" class="STYLE1">�� <span class="STYLE1"><%= recordCount %></span> ����¼,��<span class="STYLE1"> <%= maxPage %> </span>��ʾ,��ǰҳ<strong>:</strong> �� <span class="STYLE1"><%= currentPage %> </span>ҳ
        <%
	for(int j=1;j<=maxPage;j++)
	{
		out.print("&nbsp;&nbsp;<a href='admin_all.jsp?page="+j+"'>"+j+"</a>");
	}
}
catch(Exception e){}
conn.closeConnection();
%>
</p></td>
   </tr>
</table>
</center>