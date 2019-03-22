Class AWS.AWS4Auth.SignatureMethods.AWS4HMACSHA256 Extends AWS.AWS4Auth.SignatureMethods.BaseSignatureMethod
{

Parameter SignatureMethodName As %String = "AWS4-HMAC-SHA256";

Method BuildSignature(pRequest As AWS.AWS4Auth.BaseRequest, pDebug As %Boolean = 0) As %String
{
		Do ##super(pRequest, pDebug)
		
		Set canonicalRequest = ..getCanonicalRequest(pRequest)
		Set hashedCanonicalRequest = ##class(%SYSTEM.Encryption).SHAHash(256, canonicalRequest)
		Set HCRHex = ##class(AWS.Utils).hexDigest(hashedCanonicalRequest)
		
		Set credentialScope = ..getCredentialScope(pRequest)
		Set stringToSign = ..getStringToSign(pRequest, HCRHex)
		Set signingKey = ..getSignatureKey(pRequest)
		Set signatureHex = ..getSignature(stringToSign, signingKey)
		
		Write:pDebug !,"SIGNATURE: ", signatureHex
		
		set signedHeaders = ..getSignedHeaders(pRequest)
		
		Set pRequest.AuthorizationHeader= ..#SignatureMethodName_" Credential=" _ pRequest.AccessKey.AccessKey _ "/" _ credentialScope _ ", " _ "SignedHeaders=" _ signedHeaders _ ", " _ "Signature=" _ signatureHex

		Quit signatureHex
}

Method getPayloadHash(pRequest As AWS.AWS4Auth.BaseRequest) As %String [ Private ]
{
		Set payloadHash = ##class(%SYSTEM.Encryption).SHAHash(256, "")
		
		if pRequest.#Method '= "GET"
		{
			set payload = pRequest.Payload.%ToJSON()
			set payloadHash = ##class(%SYSTEM.Encryption).SHAHash(256, payload)
		}
		
		return ##class(AWS.Utils).hexDigest(payloadHash)
}

Method getSignature(stringToSign As %String, signingKey) [ Private ]
{
		Set signature = ##class(%SYSTEM.Encryption).HMACSHA(256, stringToSign, signingKey)
		return ##class(AWS.Utils).hexDigest(signature)
}

Method sign(key As %String, msg As %String) [ Private ]
{
		set msg = $ZCONVERT(msg,"O","UTF8")
		return ##class(%SYSTEM.Encryption).HMACSHA(256, msg, key)
}

}

