<%@page contentType="text/html;charset=ISO-8859-9"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
        <title>3D Model</title>
    </head>
    <body>
    <%
        
        //  A�A�IDA 3D SECURE ��LEM� ���N GEREKL� ALANLAR VE KULLANIMLARI �LE JAVA KOD �RNE�� VER�LM��T�R. G�R�LEN DE�ERLER TEST AMA�LI G�R�LM��T�R.
        //  3D MODEL �ZER�NE D�ZENLENM�� KOD �RNE��D�R. �� YERLER� KEND� DE�ERLER�YLE DE���KENLER� TANIMLAMALIDIR. 
        //  �� YERLER�NE REFERANS AMA�LI OLU�TURULMU�TUR.
        
        
        
        
        
        /* 3D secure i�in gerekli alanlar 3d modelinde a�a��daki alanlar ile birlikte formda yollanan alanlard�r. 
        * Form d���ndaki alanlar�n hidden text olarak post gerekmektedir. */
        
        
        /*******************      GEREKL� ALANLAR (��yeri taraf�ndan doldurulmas� gereken)       ******************************/
        String clientId = "XXXXXXXX";     //Banka taraf�ndan verilen i�yeri numaras�
        String amount = "9.95";       //��lem tutar�
        String oid = "";       //Sipari� numaras�
        String okUrl = "http://<magaza_sunucu_adresi>/3dmodel/odemesayfasi.jsp";   //��lem ba�ar�l�ysa d�n�lecek i�yeri sayfas�  (3D i�leminin sonucu �deme i�leminin de�il)
        String failUrl = "http://<magaza_sunucu_adresi>/3dmodel/odemesayfasi.jsp"; //��lem ba�ar�s�z ise d�n�lecek i�yeri sayfas�(3D i�leminin sonucu �deme i�leminin de�il)
        String rnd = new java.util.Date().toString(); // Tarih veya her seferinde de�i�en bir de�er g�venlik ama�l� kullan�l�yor
        
        String storekey="xxxxxx";       //��yeri ay�rac� (i�yeri anahtar�)
        
        String firmaadi = "xfirma";     //Firman�n g�sterilen ad�
        
        String storetype="3d";          //3D modeli 
        
        // 3D modelinde hash hesaplamas�nda i�lem tipi ve taksit kullan�lm�yor
        
        String hashstr = clientId + oid + amount + okUrl + failUrl + rnd + storekey;
        java.security.MessageDigest sha1 = java.security.MessageDigest.getInstance("SHA-1");
        
        String hash = (new sun.misc.BASE64Encoder()).encode(sha1.digest(hashstr.getBytes())); // G�venlik kontrolu i�in �retilen SHA1 de�eri
        
        /***************       GEREKL� ALANLAR          ********************************/
        
        
        
        
        
        
       
        
        
        // �ste�e ba�l� alanlarda i�yeri taraf�ndan e�er gerekli g�r�l�rse gerekli alanlara ilave olarak form ile birlikte post edilmelidir.  
        
    
        /***************       ISTE�E BA�LI ALANLAR    *********************************/
        String description = ""; //A��klama
        String xid = "";    //��lem takip numaras� 3D i�in XID i ma�aza �retirse o kullanir, yoksa sistem �retiyor. (3D secure i�lemleri i�in i�lem takip numaras� 20 bytelik bilgi 28 karaktere base64 olarak kodlanmal�, ge�ersiz yada bo� ise sistem taraf�ndan �retilir.)
        String lang="";     //g�sterim dili bo� ise T�rk�e (tr), �ngilizce i�in (en)
        String email="";    //email adresi
        String userid="";   //Kullan�c� takibi i�in id
        /***************       ISTE�E BA�LI ALANLAR     ********************************/
        
        
        
        
        //  FORMDA YER ALAN ALANLAR KART SAH�B�N�N KART B�LG�LER�N� G�RD��� GEREKL� ALANLARDIR 
        
        
    %>
        <center>
            <form method="post" action="https://<sunucu_adresi>/<3dgate_path>">
                <table>
                    <tr>
                        <td>Kredi Kart Numaras�:</td>
                        <td><input type="text" name="pan" size="20"/>
                    </tr>
                    
                    <tr>
                        <td>G�venlik Kodu:</td>
                        <td><input type="text" name="cv2" size="4" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Y�l�:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Year" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Son Kullanma Ay�:</td>
                        <td><input type="text" name="Ecom_Payment_Card_ExpDate_Month" value=""/></td>
                    </tr>
                    
                    <tr>
                        <td>Visa/MC secimi</td>
                        <td><select name="cardType">
                            <option value="1">Visa</option>
                            <option value="2">MasterCard</option>
                        </select>
                    </tr>
                    
                    <tr>
                        <td align="center" colspan="2">
                            <input type="submit" value="�demeyi Tamamla"/>
                        </td>
                    </tr>
                    
                </table>
                <input type="hidden" name="clientid" value="<%=clientId%>">
                <input type="hidden" name="amount" value="<%=amount%>">
                <input type="hidden" name="oid" value="<%=oid%>">	
                <input type="hidden" name="okUrl" value="<%=okUrl%>">
                <input type="hidden" name="failUrl" value="<%=failUrl%>">
                <input type="hidden" name="rnd" value="<%=rnd%>" >
                <input type="hidden" name="hash" value="<%=hash%>" >
                
                <input type="hidden" name="storetype" value="3d" >		
                <input type="hidden" name="lang" value="tr">
				<input type="hidden" name="currency" value="949">
                
                
            </form>
            <br>
            <b>Kullan�lan Hidden Parametreler</b>
            <br>
            
            &lt;input type="hidden" name="clientid" value=""&gt;<br>
                &lt;input type="hidden" name="amount" value=""&gt;<br>
                &lt;input type="hidden" name="oid" value=""&gt;	<br>
                &lt;input type="hidden" name="okUrl" value=""&gt;<br>
                &lt;input type="hidden" name="failUrl" value=""&gt;<br>
                &lt;input type="hidden" name="rnd" value="" &gt;<br>
                &lt;input type="hidden" name="hash" value="" &gt;<br>
                
                &lt;input type="hidden" name="storetype" value="" &gt;	<br>	
                &lt;input type="hidden" name="lang" value=""&gt;<br>
        </center>
    </body>
</html>
