<%@page contentType="text/html;charset=ISO-8859-9"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page import="com.est.jpay"%>
<%@page import="java.util.Enumeration"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-9">
        <title>3DModel �deme Sayfas�</title>
    </head>
    <body>

    <h1>3D �deme Sayfas�</h1>    
    <h3>3D D�nen Parametreler</h3>
    <table border="1">
        <tr>
            <td><b>Parametre �smi:</b></td>
            <td><b>Parametre De�eri:</b></td>
        </tr>
    <%
    	Enumeration enu = request.getParameterNames();
    	while (enu.hasMoreElements()) {
    		String param = (String) enu.nextElement();
    		String val = (String) request.getParameter(param);
    		out.println("<tr><td>" + param + "</td>" + "<td>" + val + "</td></tr>");
    	}
    %>
    </table>
    <br>
    <br>
    <%
    	String hashparams = request.getParameter("HASHPARAMS");
    	String hashparamsval = request.getParameter("HASHPARAMSVAL");
    	String storekey = "xxxxxx";
    	String paramsval = "";
    	int index1 = 0, index2 = 0;
    	// hash hesaplamada kullan�lacak de�erler ayr��t�r�l�p de�erleri birle�tiriliyor.
    	do {
    		index2 = hashparams.indexOf(":", index1);
    		String val = request.getParameter(hashparams.substring(index1,
    		index2)) == null ? "" : request.getParameter(hashparams
    		.substring(index1, index2));
    		paramsval += val;
    		index1 = index2 + 1;
    	} while (index1 < hashparams.length());

    	//out.println("hashparams="+hashparams+"<br/>");
    	//out.println("hashparamsval="+hashparamsval+"<br/>");
    	//out.println("paramsval="+paramsval+"<br/>");
    	String hashval = paramsval + storekey; //elde edilecek hash de�eri i�in paramsval e store key ekleniyor. (i�yeri anahtar�)
    	String hashparam = request.getParameter("HASH");
    	java.security.MessageDigest sha1 = java.security.MessageDigest
    			.getInstance("SHA-1");

    	String hash = (new sun.misc.BASE64Encoder()).encode(sha1
    			.digest(hashval.getBytes()));
    	//out.println("gelen hash="+hashparam+"<br/>");
    	//out.println("olu�turulan hash="+hash+"<br/>");
    	if (paramsval.equals(hashparamsval) && hash.equals(hashparam)) //olu�turulan hash ile gelen hash ve hash parametreleri de�erleri ile ayr��t�r�l�p edilen edilen ayn� olmal�.
    	{
    		out.println("<h4>G�venlik Uyar�s�. Say�sal �mza Ge�erli De�il</h4>");
    		/************     �deme i�lemi alanlar�      ****************/
    		String name = "xxxxxxxx"; //��yeri kullan�c� ad�
    		String password = "XXXXXXXX"; //��yeri �ifresi
    		String clientId = request.getParameter("clientid"); // ��yeri numaras�
    		String mode = "P"; //P olursa ger�ek i�lem, T olursa test i�lemi yapar.
    		String islemtipi = "Auth"; //Auth PreAuth PostAuth Credit Void olabilir.
    		String expires = request.getParameter("Ecom_Payment_Card_ExpDate_Month") + "/" + request.getParameter("Ecom_Payment_Card_ExpDate_Year"); //Kredi Kart� son kullan�m tarihi mm/yy format�ndan olmal�
    		String cv2 = request.getParameter("cv2"); //G�venlik Kodu
    		String amount = request.getParameter("amount"); //Tutar

    		String taksit = "4"; //Taksit say�s� pe�in sat��lar da bo� olarak g�nderilmelidir.
    		String oid = request.getParameter("oid"); // 3D modelde bo� yollanm��sa sistem taraf�ndan �retilir.

    		String mdStatus = request.getParameter("mdStatus"); // 3D i�leminin sonucunu g�sterir (1,2,3,4) ise ba�ar�l�, (5,6,7,8,9,0) i�e ba�ar�s�d�r
    		if (mdStatus != null
    		&& (mdStatus.equals("1") || mdStatus.equals("2")
    				|| mdStatus.equals("3") || mdStatus.equals("4"))) //Ba�ar�l� ve �deme ger�ekle�tiriliyor
    		{
    %>
                <h5>3D ��lemi Ba�ar�l�</h5><br/>
            <%
                                            			String paymentHost = "<odeme_gecidi>"; //�deme ge�idi hos ismi
                                            			String api = "<apiserver_path>"; //
                                            			int port = 443;
                                            			jpay myjpay = new jpay();
                                            			myjpay.setDebug(true);

                                            			/**************************   �DEME ���N GEREKL� PARAMETRELER      ******************************/

                                            			myjpay.setName(name);
                                            			myjpay.setPassword(password);
                                            			myjpay.setClientId(clientId);
                                            			myjpay.setMode(mode);
                                            			myjpay.setType(islemtipi);
                                            			myjpay.setNumber(request.getParameter("md")); // Kart numaras� yerine 3d secure i�leminden d�nen MD parametresi kullan�lmal�d�r.
                                            			myjpay.setExpires(""); // Son kullanma tarihine md kullan�ld��� i�in gerek yoktur.
                                            			myjpay.setCvv2Val(""); // MD de�eri kullan�ld���nda gerek yoktur.
                                            			myjpay.setTotal(amount);
                                            			myjpay.setCurrency("949"); //YTL icin 949

                                            			// 3d i�in deme alanlar�
                                            			myjpay.setCardholderPresentCode("13"); // her zaman 13 de�erini al�r
                                            			myjpay.setPayerSecurityLevel(request.getParameter("eci")); // 3d sonucu parametre olarak gelir
                                            			myjpay.setPayerTxnId(request.getParameter("xid")); //3d Sonucu parametre olarak gelir.
                                            			myjpay.setPayerAuthenticationCode(request
                                            			.getParameter("cavv")); //3d sonucu parametre olarak gelir

                                            			/************************    �DEME ���N GEREKL� PARAMETRELER        ****************************/

                                            			/************************    �DEME ���N �STE�E BA�LI ALANLAR        *****************************/

                                            			myjpay.setTaksit("4");
                                            			myjpay.setOrderId(oid);
                                            			myjpay.setGroupId("");
                                            			myjpay.setTransId("");
                                            			myjpay.setIPAddress("");
                                            			myjpay.setUserId("");
                                            			myjpay.setComments("");
                                            			myjpay.setBName("xxxfirma");
                                            			myjpay.setBStreet1("");
                                            			myjpay.setBStreet2("");
                                            			myjpay.setBStreet3("");
                                            			myjpay.setBCity("");
                                            			myjpay.setBPostalCode("");
                                            			myjpay.setBStateProv("");
                                            			myjpay.setSName("");
                                            			myjpay.setSStreet1("");
                                            			myjpay.setSStreet2("");
                                            			myjpay.setSStreet3("");
                                            			myjpay.setSCity("");
                                            			myjpay.setSPostalCode("");
                                            			myjpay.setSStateProv("");
                                            			//myjpay.setExtra("","");

                                            			int val = myjpay.processTransaction(paymentHost, port, api);
                                            			if (val > 0) {
                                            %>
                
                <h3>�deme Sonucu</h3>
                <table border="1">
                    <tr>
                        <td><b>Parameter �smi:</b></td>
                        <td><b>Parameter De�eri</b></td>
                    </tr>
                    
                    <tr>
                        <td>AuthCode</td>
                        <td><%=myjpay.getAuthCode()%></td>
                    </tr>
                    
                    <tr>
                        <td>Response</td>
                        <td><%=myjpay.getResponse()%></td>
                    </tr>
                    
                    <tr>
                        <td>HostRefNum</td>
                        <td><%=myjpay.getHostRefNum()%></td>
                    </tr>
                    
                    <tr>
                        <td>ProcReturnCode</td>
                        <td><%=myjpay.getProcReturnCode()%></td>
                    </tr>
                    
                    <tr>
                        <td>TransId</td>
                        <td><%=myjpay.getTransId()%></td>
                    </tr>
                    
                    <tr>
                        <td>ErrMsg</td>
                        <td><%=myjpay.getErrMsg()%></td>
                    </tr>
                    
                </table>
                
                
                <%
                                                			if ("Approved".equalsIgnoreCase(myjpay.getResponse())) {
                                                			out
                                                			.println("<b>�deme ��leminiz Ba�ar�yla Ger�ekle�tirildi</b>");
                                                		} else {
                                                			out
                                                			.println("<b>�deme ��leminiz Ba�ar�yla Ger�ekle�tirilmedi</b> ");
                                                		}
                                                			} else {
                                                		out.println("<b>Ba�lant� Hatas�</b>");
                                                			}

                                                		} else {
                                                			out.println("3D Onay�  Alamad�n�z");
                                                		}
                                                	} else {
                                                		out
                                                		.println("hash de�erleri uyu�mamaktad�r. ��lem devam ettirilemez.");
                                                	}
                                                %>
    
    
    </body>
</html>
