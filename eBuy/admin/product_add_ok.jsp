<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<% 
	String admin_name=(String) session.getAttribute("admin_name");
	if(admin_name==null || admin_name=="")
	{
		out.println("<script language='javascript'>alert('ÇëÏÈµÇÂ¼!');window.location.href='index.jsp';</script>");
	}
	else
	{
	Date date=new Date();
	String p_type=(String) request.getParameter("p_type");
	String p_id=(String) request.getParameter("p_id");
	String p_name=(String) request.getParameter("p_name");
	String p_price=(String) request.getParameter("p_price");
	String p_quantity=(String) request.getParameter("p_quantity");
	String p_image=(String) request.getParameter("p_image");
	int count=p_image.indexOf("images");
	String p_image_temp=p_image.substring(count,p_image.length());

	String p_description=(String) request.getParameter("p_description");
	String p_time=String.valueOf(date.getMonth()+1)+"-"+date.getDate()+"-20"+String.valueOf(date.getYear()).substring(1);	
	
	ConnDB conn=new ConnDB();
	Convert convert=new Convert();
	p_type=convert.method(p_type);
	p_id=convert.method(p_id);
	p_name=convert.method(p_name);
	p_image_temp=convert.method(p_image_temp);
	p_description=convert.method(p_description);
	
	String sql="insert into product values('"+p_type+"','"+p_id+"','"+p_name+"','"+Float.parseFloat(p_price)+"','"+Integer.parseInt(p_quantity)+"','"+p_image_temp+"','"+p_description+"','"+p_time+"')";
	int temp=conn.doUpdate(sql);
	if(temp!=0)
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=product_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<jsp:include page="ok_ok.html" flush="true"/>
		<%
	}
	else
	{
		out.println( "<HTML><HEAD><META http-equiv='refresh' content='2; URL=product_all.jsp' target=Main></HEAD><BODY bgcolor='#FFFFFF'></body></html>");
		%>
		<jsp:include page="delete_ok.html" flush="true"/>
		<%
	}
}
 %>