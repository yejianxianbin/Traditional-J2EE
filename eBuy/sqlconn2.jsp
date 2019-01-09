<%@ page contentType="text/html;charset=GB2312" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head><title>JDBC专用驱动程序连接SQL Server</title></head>
<% 
	Connection conn=null;
	try
	{
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String strConn="jdbc:sqlserver://localhost:1433;DatabaseName=ShopSystem";
		String strUser="sa";
		String strPassword="123456";
		conn=DriverManager.getConnection(strConn,strUser,strPassword);
		out.println("<h2>JDBC专用驱动程序连接数据库成功!</h2>");
	}
	catch(ClassNotFoundException e)
	{
		out.println("a"+e.getMessage());
	}
	catch(SQLException e)
	{
		out.println(e.getMessage());
	}
	finally
	{
		try
		{
			if (conn!=null)
				conn.close();
		}
		catch(Exception e){}
	}
 %>
</html>
