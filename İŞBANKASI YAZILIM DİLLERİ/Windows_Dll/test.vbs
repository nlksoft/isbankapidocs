msgbox("��bankas� Sanal POS test'e ba�lamak i�in t�klay�n�z..." & Chr(13) & Chr(13) & "(i�lem 20 saniye kadar s�rebilir)")

wscript.echo "L�tfen bekleyiniz..."

Set pay = CreateObject("epayapi.payment")


'Asagidaki bilgiler test icindir gercek islem icin bankadan gonderilen bilgileri kullanmal�s�n�z
pay.name="isbank2"
pay.password="isbank2"
pay.clientid="7777"
pay.host="testsanalpos.est.com.tr"


'Test yapmak icin host="testsanalpos.est.com.tr" gercek islem icin host="sanalpos.isbank.com.tr" olmal�d�r

host="testsanalpos.est.com.tr"

pay.host=host

pay.OrderResult=0
pay.chargetype="PreAuth"
pay.cardnumber= "4242424242424242"
pay.expmonth="01"
pay.expyear="09"
pay.cv2="000"
pay.subtotal="12.04"
pay.currency=949
pay.transid=""
pay.groupid=""
retval=pay.processorder



If (pay.Appr = "Approved") Then
    retApprCode = pay.code
' geridonus degerleri aliniyor
retOid = pay.oid
end if


if pay.err = "00" Then
	myStr = ""
	myStr = myStr & "Test i�lemi ba�ar�yla sona erdi." & Chr(13)
	myStr = myStr & "" & Chr(13)
	myStr = myStr & "VBScript dosyas� ��bankas� SanalPOS ile ba�lant� kurabiliyor." & Chr(13)
	myStr = myStr & "" & Chr(13)
	myStr = myStr & "Sunucu �zerinden �a��r�lan COM nesnesi farkl� �ekilde �al��t���ndan" & Chr(13)
	myStr = myStr & "test.asp 'yi �al��t�rarak test'i tamamlaman�z� �neririz." & Chr(13)
	msgbox(myStr)
Else
	myStr = ""
	myStr = myStr & "Sunucunuz "&host&" adresine" & Chr(13)
	myStr = myStr & "443 no'lu port �zerinden ba�lant� kuram�yor!" & Chr(13)
	myStr = myStr & "" & Chr(13)
	myStr = myStr & "L�tfen register etti�iniz COM nesnesinin" & Chr(13)
	myStr = myStr & "bu adrese eri�mek i�in yeterli yetkilere" & Chr(13)
	myStr = myStr & "sahip olup olmad���n� kontrol ediniz." & Chr(13)
	myStr = myStr & "" & Chr(13)
	myStr = myStr & "Daha detayl� bilgi i�in Sanal POS" & Chr(13)
	myStr = myStr & "bilgi dok�man�n� incelemenizi tavsiye ederiz." & Chr(13)
	msgbox(myStr)
End if