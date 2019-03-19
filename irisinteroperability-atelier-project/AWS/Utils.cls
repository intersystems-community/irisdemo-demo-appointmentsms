Class AWS.Utils
{

ClassMethod URLEncode(pString As %String)
{
		Set tEncoded=$ZConvert($ZConvert(pString,"O","UTF8"),"O","URL")
		
		Set vEncTable("/")="%2F"
		Set vEncTable("!")="%21"
		Set vEncTable("$")="%24"
		Set vEncTable("$")="%24"
		Set vEncTable("'")="%27"
		Set vEncTable("(")="%28"
		Set vEncTable(")")="%29"
		Set vEncTable("'")="%27"
		Set vEncTable("*")="%2A"
		
		Set tChar=""
		For
		{
			Set tChar=$Order(vEncTable(tChar))
			Quit:tChar=""
			Set tEncoded=$Replace(tEncoded,tChar,vEncTable(tChar))
		}
		Quit tEncoded
}

ClassMethod hexDigest(hash As %String)
{
		set digest = ""
		
		for i=1:1:$L(hash) 
		{
			set hHex = $ZHex($Ascii($Extract(hash,i))) 
			
			//This accounts for leading zeros getting left out of converted hexidecimal string
			if $LENGTH(hHex) = 1
			{
				set hHex = "0"_hHex
			}
			
		 	set digest = digest _ hHex
		}
		
		Quit $ZConvert(digest,"L")
}

ClassMethod CheckSSLConfiguration(pSSLConfiguration As %String) As %Status
{
		Set tSC = $$$OK
		
		Try
		{
			Set tNS=$Namespace
			Set $Namespace="%SYS"
			
			Quit:##class(Security.SSLConfigs).Exists(pSSLConfiguration)
			 
			Set vParams("CipherList")="ALL:!aNULL:!eNULL:!EXP"
			Set vParams("Protocols")=30
			Set tSC = ##class(Security.SSLConfigs).Create(pSSLConfiguration, .vParams)		
		}
		Catch (oException)
		{
			Set tSC = oException.AsStatus()
		}

		Set $Namespace=tNS
		
		Quit tSC
}

}

