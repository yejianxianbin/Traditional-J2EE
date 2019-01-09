package shopBeans;
import java.util.*;
public class Convert
{
	public Convert()
	{
	}
	public String method(String sql)	
	{
		try
		{
			byte temp[]=sql.getBytes("ISO-8859-1");
			sql=new String(temp);
		}
		catch(Exception e)
		{
		}
	
		return sql;
	}
}