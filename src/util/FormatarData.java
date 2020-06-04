package util;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class FormatarData {
	
	public static java.sql.Date formataData(String data_vencimento) throws Exception { 
 		if (data_vencimento == null || data_vencimento.equals(""))
 			return null;
 		
         java.sql.Date date = null;
         try {
             DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
             date = new java.sql.Date( ((java.util.Date)formatter.parse(data_vencimento)).getTime() );
         } catch (ParseException e) {            
             throw e;
         }
         return date;
 	}

}
