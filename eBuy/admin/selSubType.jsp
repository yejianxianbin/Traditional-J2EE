<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="shopBeans.ConnDB"%>
<%
ConnDB conn=new ConnDB();
int P_superID=-1;
int superID=-1;
String superName="";
ResultSet rs_sub=null;
//查询所属小类的默认选项
if(request.getParameter("superID")=="" || request.getParameter("superID")==null){
	P_superID=superID;
}else{
	P_superID=Integer.parseInt(request.getParameter("superID"));
}
rs_sub=conn.doQuery("select * from sub_type where s_superType=187");
int subID=-1;
String subName="";
%>
<select name="typeID" class="textarea" id="typeID">
<%while(rs_sub.next()){
	subID=rs_sub.getInt(1);
	subName=rs_sub.getString(3);
%>
   <option value="<%=subID%>"><%=subName%></option>
<%}%>
 </select>