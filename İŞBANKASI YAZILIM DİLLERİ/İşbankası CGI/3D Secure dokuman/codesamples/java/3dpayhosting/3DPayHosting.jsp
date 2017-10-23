<%@page contentType="text/html;charset=ISO-8859-9"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
        <title>3D Hosting</title>
    </head>
    <body>
        <%
        //  A�A�IDA 3D SECURE ��LEM� ���N GEREKL� ALANLAR VE KULLANIMLARI �LE JAVA KOD �RNE�� VER�LM��T�R. G�R�LEN DE�ERLER TEST AMA�LI G�R�LM��T�R.
        //  3D PAY HOSTING MODEL �ZER�NE D�ZENLENM�� KOD �RNE��D�R. �� YERLER� KEND� DE�ERLER�YLE DE���KENLER� TANIMLAMALIDIR. 
        //  �� YERLER�NE REFERANS AMA�LI OLU�TURULMU�TUR.
        
        
        /************************     GEREKL� ALANLAR       *****************/
        
        String clientId = "XXXXXXXX";     //Banka taraf�ndan verilen i�yeri numaras�
        String amount = "9.95";            //��lem tutar�
        String oid = "";                   //Sipari� numaras�
        String okUrl = "http://<magaza_sunucu_sayfas�>/3dpayosting/odemesayfasi.jsp";    //��lem ba�ar�l�ysa d�n�lecek i�yeri sayfas�  (3D i�leminin ve �deme i�leminin sonucu)
        String failUrl = "http://<magaza_sunucu_sayfas�>/3dpayhosting/odemesayfasi.jsp";  //��lem ba�ar�s�zsa d�n�lecek i�yeri sayfas�  (3D i�leminin ve �deme i�leminin sonucu)
        String rnd = new java.util.Date().toString();                         // Tarih veya her seferinde de�i�en bir de�er g�venlik ama�l� kullan�l�yor
        
        
        String taksit = "";                         //Taksit say�s�
        String islemtipi = "Auth";                  //��lem tipi
        String storekey="xxxxxx";                   //i�yeri anahtar�
        
        String hashstr = clientId + oid + amount + okUrl + failUrl + islemtipi + taksit + rnd + storekey;
        java.security.MessageDigest sha1 = java.security.MessageDigest.getInstance("SHA-1");
        
        String hash = (new sun.misc.BASE64Encoder()).encode(sha1.digest(hashstr.getBytes()));   //Kontrol ve g�venlik i�in gerekli hashli bilgi
        
        
        %>
   
        <center>
            <form method="post" action="https://<sunucu_adresi>/<3dgate_path>">
                <input type="hidden" name="clientid" value="<%=clientId%>">
                <input type="hidden" name="amount" value="<%=amount%>">

                <input type="hidden" name="oid" value="<%=oid%>">	
                <input type="hidden" name="okUrl" value="<%=okUrl%>" >
                <input type="hidden" name="failUrl" value="<%=failUrl%>" >
                <input type="hidden" name="islemtipi" value="<%=islemtipi%>" >
                <input type="hidden" name="taksit" value="<%=taksit%>">
                <input type="hidden" name="rnd" value="<%=rnd%>" >
                <input type="hidden" name="hash" value="<%=hash%>" >
	
                <input type="hidden" name="storetype" value="3d_pay_hosting" >
	
                <input type="hidden" name="refreshtime" value="10" >
		
                <input type="hidden" name="lang" value="tr">
                <input type="hidden" name="firmaadi" value="Benim Firmam">
	
                <input type="hidden" name="Fismi" value="is">
                <input type="hidden" name="faturaFirma" value="faturaFirma">
                <input type="hidden" name="Fadres" value="XXX">
                <input type="hidden" name="Fadres2" value="XXX">
                <input type="hidden" name="Fil" value="XXX">

                <input type="hidden" name="Filce" value="XXX">
                <input type="hidden" name="Fpostakodu" value="postakod93013">
                <input type="hidden" name="tel" value="XXX">
                <input type="hidden" name="fulkekod" value="tr">

                <input type="hidden" name="nakliyeFirma" value="na fi">
                <input type="hidden" name="tismi" value="XXX">
                <input type="hidden" name="tadres" value="XXX">
                <input type="hidden" name="tadres2" value="XXX">

                <input type="hidden" name="til" value="XXX">
                <input type="hidden" name="tilce" value="XXX">
                <input type="hidden" name="tpostakodu" value="ttt postakod93013">
                <input type="hidden" name="tulkekod" value="usa">
	
                <input type="hidden" name="itemnumber1" value="a1">
                <input type="hidden" name="productcode1" value="a2">
                <input type="hidden" name="qty1" value="3">
                <input type="hidden" name="desc1" value="a4 desc">
                <input type="hidden" name="id1" value="a5">

                <input type="hidden" name="price1" value="6.25">
                <input type="hidden" name="total1" value="7.50">
                
                <input type="submit" value="Devam" />
                
            </form>
            
            <b>Kullan�lan Hidden Parametreler</b>
            <br>
                
                &lt;input type="hidden" name="clientid" value=""&gt;<br>
                &lt;input type="hidden" name="amount" value=""&gt;<br>

                &lt;input type="hidden" name="oid" value="hla56bu"&gt;	<br>
                &lt;input type="hidden" name="okUrl" value="" &gt;<br>
                &lt;input type="hidden" name="failUrl" value="" &gt;<br>
                &lt;input type="hidden" name="islemtipi" value="" &gt;<br>
                &lt;input type="hidden" name="taksit" value=""&gt;<br>
                &lt;input type="hidden" name="rnd" value="" &gt;<br>
                &lt;input type="hidden" name="hash" value="" &gt;<br>
	
                &lt;input type="hidden" name="storetype" value="3d_pay_hosting" &gt;<br>
	
                &lt;input type="hidden" name="refreshtime" value="" &gt;<br>
		
                &lt;input type="hidden" name="lang" value=""&gt;<br>
                &lt;input type="hidden" name="firmaadi" value=""&gt;<br>
	
                &lt;input type="hidden" name="Fismi" value=""&gt;<br>
                &lt;input type="hidden" name="faturaFirma" value=""&gt;<br>
                &lt;input type="hidden" name="Fadres" value=""&gt;<br>
                &lt;input type="hidden" name="Fadres2" value=""&gt;<br>
                &lt;input type="hidden" name="Fil" value=""&gt;<br>

                &lt;input type="hidden" name="Filce" value=""&gt;<br>
                &lt;input type="hidden" name="Fpostakodu" value=""&gt;<br>
                &lt;input type="hidden" name="tel" value=""&gt;<br>
                &lt;input type="hidden" name="fulkekod" value=""&gt;<br>

                &lt;input type="hidden" name="nakliyeFirma" value=""&gt;<br>
                &lt;input type="hidden" name="tismi" value=""&gt;<br>
                &lt;input type="hidden" name="tadres" value=""&gt;<br>
                &lt;input type="hidden" name="tadres2" value=""&gt;<br>

                &lt;input type="hidden" name="til" value=""&gt;<br>
                &lt;input type="hidden" name="tilce" value=""&gt;<br>
                &lt;input type="hidden" name="tpostakodu" value=""&gt;<br>
                &lt;input type="hidden" name="tulkekod" value=""&gt;<br>
	
                &lt;input type="hidden" name="itemnumber1" value=""&gt;<br>
                &lt;input type="hidden" name="productcode1" value=""&gt;<br>
                &lt;input type="hidden" name="qty1" value=""&gt;<br>
                &lt;input type="hidden" name="desc1" value=""&gt;<br>
                &lt;input type="hidden" name="id1" value=""&gt;<br>

                &lt;input type="hidden" name="price1" value=""&gt;<br>
                &lt;input type="hidden" name="total1" value=""&gt;<br>
                
               
            
        </center>
    </body>
</html>
