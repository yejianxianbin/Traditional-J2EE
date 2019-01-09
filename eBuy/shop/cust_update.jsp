<%@page contentType="text/html;charset=gb2312"%>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="shopBeans.Convert" %>
<%@ page import="java.sql.*" %>
<html>
<head><title>Easy Buy Online</title><meta http-equiv="Content-Type" content="text/html; charset=gb2312"><style type="text/css">
<!--
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
</style></head>
<body>
<jsp:include page="title.jsp"/>
<jsp:include page="menu.jsp" flush="true"/>
<% 
	String c_name=(String)session.getAttribute("c_name");
	if(c_name=="" || c_name==null)
	{
		out.println("<script language='javascript'>alert('请先登录!');window.location.href='index_.jsp';</script>");
	}
	ConnDB conn=new ConnDB();
	String name = (String) session.getAttribute("c_name");
	String sql="select * from customer where c_name='"+name+"'";
	ResultSet rs=conn.doQuery(sql);
	rs.next();
	
%>
<style type="text/css">
<!--
.STYLE1 {font-size: 12px;}
.STYLE2 {font-size:14px;}
.STYLE3 {color: #FF0000; font-size: 12px; }
-->
</style>
<script>
<!--
	function check_info(form)
	{
		if(form.c_pass2.value != form.c_pass.value)
		{
			alert("两次密码不一致，请重新填写");
			form.c_pass2.focus();
			return false;
		}
		if(form.c_phone.value=="")
		{
			alert("请输入您的联系电话");
			form.c_phone.focus();
			return false;
		}
		if(form.c_phone.value.length>15)
		{
			alert("错误的电话号码，请重新填写您的电话！");
			form.c_phone.focus();
			return false;
		}
		if(form.c_question.value=="")
		{
			alert("请选择您的问题提示");
			form.c_question.focus();
			return false;
		}
		if(form.c_answer.value=="")
		{
			alert("请填写提示答案");
			form.c_answer.focus();
			return false;
		}
		if(form.c_email.value.indexOf("@")==-1 ||(form.c_email.value.indexOf(".")==-1))
		{
			alert("错误的Email格式，请填写正确的电子邮箱");
			form.c_email.focus();
			return false;
		}
	}
	
-->
</script>
<center> 
<form action="cust_update_ok.jsp?name=<%= name %>" method="post" onSubmit="return check_info(this);">
<table width="782" border="1" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
  <!--DWLayoutTable-->
  <tr>
    <td height="30" colspan="2" align="center" bgcolor="#99CCFF"><span class="STYLE2">用户资料修改</span></td>
  </tr>
  <tr>
    <td width="224" height="30" align="right"><span class="STYLE1">用户名</span>：</td>
    <td width="526" align="left" valign="middle"><%= name %>&nbsp;&nbsp;<span class="STYLE3">*</span> <span class="STYLE1">（任意的数字或者是字符，长度（</span><span class="STYLE3">6-20</span><span class="STYLE1">）</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">密码</span>：&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass" value="<%= rs.getString("c_pass") %>" />
      <span class="STYLE3">*</span> <span class="STYLE1">（任意的数字或者是字符）</span>  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">确认密码</span>：&nbsp;</td>
    <td height="30" align="left"><input type="password" name="c_pass2" value="<%= rs.getString("c_pass") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">头像选择</span>：&nbsp;</td>
    <td height="30" align="left"><select name=reg_userPic size=1 onChange="document.images['avatar'].src=options[selectedIndex].value;">
            <option value="..\images\face\Image1.gif">Image1
            <option value="..\images\face\Image2.gif">Image2
            <option value="..\images\face\Image3.gif">Image3
			<option value="..\images\face\Image4.gif">Image4
            <option value="..\images\face\Image5.gif">Image5
            <option value="..\images\face\Image6.gif">Image6
			<option value="..\images\face\Image7.gif">Image7
            <option value="..\images\face\Image8.gif">Image8
            <option value="..\images\face\Image9.gif">Image9
			<option value="..\images\face\Image10.gif">Image10
            <option value="..\images\face\Image11.gif">Image11
            <option value="..\images\face\Image12.gif">Image12
			<option value="..\images\face\Image13.gif">Image13
            <option value="..\images\face\Image14.gif">Image14
            <option value="..\images\face\Image15.gif">Image15
			<option value="..\images\face\Image16.gif">Image16
            <option value="..\images\face\Image17.gif">Image17
            <option value="..\images\face\Image18.gif">Image18
			<option value="..\images\face\Image19.gif">Image19 
			<option value="..\images\face\Image20.gif">Image20
			<option value="..\images\face\Image21.gif">Image21
            <option value="..\images\face\Image22.gif">Image22
            <option value="..\images\face\Image23.gif">Image23
			<option value="..\images\face\Image24.gif">Image24
            <option value="..\images\face\Image25.gif">Image25
            <option value="..\images\face\Image26.gif">Image26
			<option value="..\images\face\Image27.gif">Image27
            <option value="..\images\face\Image28.gif">Image28
            <option value="..\images\face\Image29.gif">Image29
			<option value="..\images\face\Image30.gif">Image30
            <option value="..\images\face\Image31.gif">Image31
            <option value="..\images\face\Image32.gif">Image32
			<option value="..\images\face\Image33.gif">Image33
            <option value="..\images\face\Image34.gif">Image34
            <option value="..\images\face\Image35.gif">Image35
			<option value="..\images\face\Image36.gif">Image36
            <option value="..\images\face\Image37.gif">Image37
            <option value="..\images\face\Image38.gif">Image38
			<option value="..\images\face\Image39.gif">Image39
            <option value="..\images\face\Image40.gif">Image40
			<option value="..\images\face\Image41.gif">Image41
            <option value="..\images\face\Image42.gif">Image42
            <option value="..\images\face\Image43.gif">Image43
			<option value="..\images\face\Image44.gif">Image44
            <option value="..\images\face\Image45.gif">Image45
            <option value="..\images\face\Image46.gif">Image46
			<option value="..\images\face\Image47.gif">Image47
            <option value="..\images\face\Image48.gif">Image48
            <option value="..\images\face\Image49.gif">Image49
			<option value="..\images\face\Image50.gif">Image50
            <option value="..\images\face\Image51.gif">Image51
            <option value="..\images\face\Image52.gif">Image52
			<option value="..\images\face\Image53.gif">Image53
            <option value="..\images\face\Image54.gif">Image54
            <option value="..\images\face\Image55.gif">Image55
			<option value="..\images\face\Image56.gif">Image56
            <option value="..\images\face\Image57.gif">Image57
            <option value="..\images\face\Image58.gif">Image58
			<option value="..\images\face\Image59.gif">Image59
            <option value="..\images\face\Image60.gif">Image60
         </select>
		 &nbsp;&nbsp;<img id=avatar src="<%= rs.getString("c_header") %>" alt=个人形象代表 width="32" height="32"> <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">联系电话</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_phone" value="<%= rs.getString("c_phone") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">（请认真填写，方便日后联系）</span></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">问题提示</span>：&nbsp;</td>
    <td height="30" align="left"><select name="c_question">
	<option value="<%= rs.getString("c_question") %>"><%= rs.getString("c_question") %></option>
	<option value="你最喜欢的人是?">你最喜欢的人是？</option>
	<option value="你最喜欢的一部电影是?">你最喜欢的一部电影是？</option>
	<option value="你最喜欢的歌曲是?">你最喜欢的歌曲是？</option>
	<option value="你最喜欢的偶像是?">你最喜欢的偶像是？</option>
	<option value="地球是圆的还是方的呢?">地球是圆的还是方的呢?</option>
	</select> 
      <span class="STYLE3">*</span>	</td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">问题答案</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_answer" value="<%= rs.getString("c_answer") %>"  /> 
      <span class="STYLE3">*</span> </td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">所在地址</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_address" size="30" value="<%= rs.getString("c_address") %>" /></td>
  </tr>
  <tr>
    <td height="30" align="right"><span class="STYLE1">E_mail</span>：&nbsp;</td>
    <td height="30" align="left"><input type="text" name="c_email" size="30" value="<%= rs.getString("c_email") %>"  /> 
      <span class="STYLE3">*</span> <span class="STYLE1">（如：tangzy111@163.com）</span></td>
  </tr>
  <tr>
    <td height="35" colspan="2" align="center"><input type="submit" class="STYLE1" value=" 提交 " />&nbsp;&nbsp;<input type="button" class="STYLE1" value=" 返回 " onClick="history.go(-1);" /></td>
  </tr>
</table>
</form>
</center>
<jsp:include page="copyright.jsp"/>
</body>
</html>
