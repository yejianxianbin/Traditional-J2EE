<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean class="shopBeans.ConnDB" scope="page" id="conn"></jsp:useBean>
<%
request.setCharacterEncoding("GB2312");
String username=request.getParameter("username");
ResultSet rs=conn.doQuery("select * from customer where c_name='"+username+"'");
if (rs.next()){
	out.println("�ܱ�Ǹ!�û���["+username+"]�Ѿ���ע��!");
}else{
	out.println("ף����!�û���["+username+"]û�б�ע��!");
}
%>
