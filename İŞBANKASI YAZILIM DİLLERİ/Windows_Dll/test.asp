<%
Set pay = Server.CreateObject("epayapi.payment")


'Asagidaki bilgiler test icindir gercek islem icin bankadan gonderilen clientid,name ve password kullan�l�r

pay.name="isbank2"
pay.password="isbank2"
pay.clientid="7777"
pay.host="testvpos.est.com.tr"


'Test yapmak icin host="testsanalpos.est.com.tr" gercek islem icin host="sanalpos.isbank.com.tr" olmal�d�r


pay.OrderResult=0
pay.chargetype="PreAuth"
pay.cardnumber= "4242424242424242"
pay.expmonth="01"
pay.expyear="09"
pay.cv2="000"
pay.subtotal="12.04"
pay.currency=949
retval=pay.processorder

if pay.err = "00" then
	myStr = "Test Ba�ar�l�: Sanal POS ile ba�lant� kuruldu!"
Else
	myStr = ""
	myStr = myStr & "Sunucunuz testsanalpos.est.com.tr veya sanalpos.isbank.com.tr adresine<br>"
	myStr = myStr & "443 no'lu port �zerinden ba�lant� kuram�yor!<br>"
	myStr = myStr & "<br>"
	myStr = myStr & "L�tfen register etti�iniz COM nesnesinin<br>"
	myStr = myStr & "bu adrese eri�mek i�in yeterli yetkilere<br>"
	myStr = myStr & "sahip olup olmad���n� kontrol ediniz.<br>"
	myStr = myStr & "<br>"
	myStr = myStr & "Daha detayl� bilgi i�in Sanal POS<br>"
	myStr = myStr & "bilgi dok�man�n� incelemenizi tavsiye ederiz.<br>"
End if
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE>  Sanal POS Test </TITLE>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=ISO-8859-9">
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=windows-1254">
</HEAD>

<BODY>

<h1>Test i�lemi sonucu:</h1>
<br>
<h1><% =myStr %></h1>
<hr>
<%
if pay.err <> "" then
response.write("<b>D�nen De�erler</b>")
response.write("<pre>")
response.write("<br>retval : " & retval)
response.write("<br>err    : " & pay.err)
response.write("<br>errmsg : " & pay.errmsg)
response.write("<br>code   : " & pay.code)
response.write("<br>appr   : " & pay.appr)
response.write("<br>HostMsg: " & pay.Extra("HostMsg"))
response.write("<br>OrderID: " & pay.oid)
response.write("<br>rrn    : " & pay.refno)
response.write("</pre>")
end if
%>
</BODY>
</HTML>