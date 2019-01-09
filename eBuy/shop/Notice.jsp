<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import="shopBeans.ConnDB" %>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>

<table width="180" border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
          <!--DWLayoutTable-->
          <tr>
            <td width="184" height="30" align="center" background="../images/logo/back.gif"><span class="STYLE2">公告栏</span></td>
          </tr>
		  <%
		  	ConnDB non=new ConnDB();
			String nsql="select n_message from notice";
			String notice="";
			String nsum="";
			ResultSet nrs=non.doQuery(nsql);
			int count=1;
			while(nrs.next())
			{
				notice =nrs.getString("n_message");
				nsum=nsum+"<br><Br>公告"+String.valueOf(count)+"：   "+notice;
				count++;
			}	  
		  %>
          <tr>
            <td height="70" align="center"><span class="STYLE1" style="color: #000000">
              <marquee direction=up height=100  id=m onmouseout=m.start() onMouseOver=m.stop() scrollamount=2 align="center">
            	<%= nsum %>
            </marquee>
            </span></td>
          </tr>
          
</table>
        <% non.closeConnection(); %>