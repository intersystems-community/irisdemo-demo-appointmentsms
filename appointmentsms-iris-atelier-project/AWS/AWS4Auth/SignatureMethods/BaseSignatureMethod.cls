Class AWS.AWS4Auth.SignatureMethods.BaseSignatureMethod Extends %RegisteredObject [ Abstract ]
{

Parameter SignatureMethodName As %String = "METHOD NAME";

Property SignatureTime As %String;

Method GetName() As %String [ Final ]
{
		Quit ..#SignatureMethodName
}

/// To be implemented by subclass
Method BuildSignature(pRequest As AWS.AWS4Auth.BaseRequest, pDebug As %Boolean = 0) As %String
{
		Set ..SignatureTime = $ZDT($ZTS, 8,7)
		Do pRequest.Headers.SetAt($REPLACE(..SignatureTime, ":", ""), "X-Amz-Date")
		Quit ""
}

ClassMethod GetSignatureMethod(pSignatureMethodName As %String) As BaseSignatureMethod
{
		Quit $classmethod("AWS.AWS4Auth.SignatureMethods."_$Translate(pSignatureMethodName,"-"), "%New")
}

Method getSignatureKey(pRequest As AWS.AWS4Auth.BaseRequest) [ Private ]
{
		set dateStamp = $PIECE(..SignatureTime, "T", 1)
		
		set kDate = ..sign($ZCONVERT(("AWS4"_pRequest.AccessKey.SecretKey),"O","UTF8"), dateStamp)
	    set kRegion = ..sign(kDate, pRequest.Region)
	    set kService = ..sign(kRegion, pRequest.#Service)
	    set kSigning = ..sign(kService, "aws4_request")
	    return kSigning
}

Method getSignedHeaders(pRequest As AWS.AWS4Auth.BaseRequest) As %String [ Private ]
{
		Set signedHeaders = ""
    	Set key=""
    	For 
    	{
    		Do pRequest.Headers.GetNext(.key)
    		
    		Quit:key=""
    		
    		Set signedHeaders = signedHeaders_$ZConvert(key,"L")_";"
			
    	}
    	
    	return $Extract(signedHeaders, 1, *-1)
}

Method getCredentialScope(pRequest As AWS.AWS4Auth.BaseRequest) [ Private ]
{
		set dateStamp = $PIECE(..SignatureTime, "T", 1)
		
		return dateStamp_"/"_pRequest.Region_"/"_pRequest.#Service_"/"_"aws4_request"
}

Method getCanonicalRequest(pRequest As AWS.AWS4Auth.BaseRequest) [ Private ]
{
		Set method = pRequest.#Method
		Set canonicalUri = pRequest.#URI
		Set canonicalQS = ..getCanonicalQueryString(pRequest)
		Set canonicalHeaders = ..getCanonicalHeaders(pRequest)
		Set signedHeaders = ..getSignedHeaders(pRequest)
		Set payloadHash = ..getPayloadHash(pRequest)
		
		return method  _$C(10)_  canonicalUri  _$C(10)_  canonicalQS  _$C(10)_  canonicalHeaders  _$C(10,10)_  signedHeaders  _$C(10)_ payloadHash
}

Method getCanonicalHeaders(pRequest As AWS.AWS4Auth.BaseRequest) [ Private ]
{
		Set canonicalHeaders = ""
    	Set key=""
    	For 
    	{
    		Do pRequest.Headers.GetNext(.key)
    		
    		Quit:key=""
    		
    		Set value = pRequest.Headers.GetAt(key)
    		
    		Set canonicalHeaders = canonicalHeaders_$ZConvert(key,"L")_":"_value_$C(10)
			
    	}
    	
    	return $Extract(canonicalHeaders, 1, *-1)
}

Method getCanonicalQueryString(pRequest As AWS.AWS4Auth.BaseRequest) [ Private ]
{
		Set canonicalQS = ""
    	Set key=""
    	For 
    	{
    		Do pRequest.Parameters.GetNext(.key)
    		
    		Quit:key=""
    		
    		Set value = ##class(AWS.Utils).URLEncode(pRequest.Parameters.GetAt(key))
    		
    		Set canonicalQS = canonicalQS_key_"="_value_"&"
			
    	}
    	
    	return $Extract(canonicalQS, 1, *-1)
}

Method getStringToSign(pRequest As AWS.AWS4Auth.BaseRequest, HCRHex As %String) [ Private ]
{
		set amzDate = $REPLACE(..SignatureTime, ":", "")
		set credentialScope = ..getCredentialScope(pRequest)

		return ..#SignatureMethodName _$C(10)_  amzDate _$C(10)_  credentialScope _$C(10)_ HCRHex
}

}

