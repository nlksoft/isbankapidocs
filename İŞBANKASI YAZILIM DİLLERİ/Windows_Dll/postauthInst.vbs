Set pay = CreateObject("epayapi.payment")


'baglanti bilgileri
pay.name="isbank2"
pay.password="isbank2"
pay.clientid="7777"
pay.host="testsanalpos.est.com.tr"

'alisverisi yapanin ip'si
pay.ip="remote"

pay.OrderResult=0

'pay.oid="Sipari� numaras�n� iste�e ba�l�d�r. Bo� g�nderildi�i zaman server yeni bir sipari� numaras� ver�r."

pay.oid=""

'pay.transid="Bo� b�rakalabilir."
pay.chargetype="PostAuth"


pay.cardnumber="4242424242424242"
pay.expmonth="01"
pay.expyear="09"
pay.cv2="000"


pay.subtotal="12.14"
pay.currency=949

pay.taksit=5

retval=pay.processorder


wscript.echo "err: " & pay.err & Chr(13) & "errmsg: " & pay.errmsg & Chr(13) _
&"code: " & pay.code & Chr(13) &"appr: " & pay.appr _
& Chr(13) &"HostMsg: " & pay.Extra("HostMsg") & Chr(13) &"OrderID: " & pay.oid & Chr(13) &"rrn: " & pay.refno

