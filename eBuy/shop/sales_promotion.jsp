<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<% 
	String c_name=(String)session.getAttribute("c_name");
	String t_type=(String)session.getAttribute("t_type");
	ConnDB pon=new ConnDB();
 %>

<table width="183" border="0" bordercolor="#99CCFF" cellpadding="0" cellspacing="0" style="border-collapse:collapse">
          <!--DWLayoutTable-->
		 <tr>
            <td height="30" colspan="2" align="center" background="../images/logo/back_sales.gif"><span class="STYLE2">促销商品</span></td>
      </tr>
	   <tr>
            <td height="7" colspan="2" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
          </tr>
		  <%
		  try
		  {
		  	
			String id="",name="",image="";
			float price=0;
		  	String psql="select top 4 p_id,p_name,p_price,p_image from product order by p_price asc";
			ResultSet prs=pon.doQuery(psql); 
			while(prs.next())
			{
				id=prs.getString("p_id");
				name=prs.getString("p_name");
				price=prs.getFloat("p_price");
				image=prs.getString("p_image");
			%>
        <tr>
	     <td width="88" rowspan="4" align="center" valign="middle"><img src="../<%= image %>" width="70"/></td>
	     <td width="96" height="24" align="center" class="STYLE1"><%= name %></td>
	   </tr>
	    <tr>
	      <td align="center" style="text-decoration:line-through;color:#FF0000">
	<font size="1">原价：<%=price+price*0.3%> </font> </td>
	      </tr>
	    <tr>
	     <td height="7" align="center" valign="top"><span class="STYLE1">现价</span>：<font size="2">￥<%= price %></font></td>
	     </tr>
	   <tr>
	     <td height="7" align="center" valign="top"><a href="#" onClick="window.open('view_product.jsp?p_id=<%=id %>','help','scrollbars=yes,resizable=yes,width=600,height=520')"><input name="see" type="button" class="STYLE1" value="详情"></a><%if (c_name!=null && c_name!=""){%><input name="see" type="button" class="btn_grey" onClick="window.location.href='cart_add.jsp?p_id=<%=id%>'" value="购买"><% } %></td>
	   </tr>
	   <tr>
	     <td height="7" colspan="2" align="center" valign="top"><!--DWLayoutEmptyCell-->&nbsp;</td>
	     </tr>
		  <%
		  		}
				
		  	}
		  	catch(Exception e)
			{}
			pon.closeConnection();
		  %>
        </table>