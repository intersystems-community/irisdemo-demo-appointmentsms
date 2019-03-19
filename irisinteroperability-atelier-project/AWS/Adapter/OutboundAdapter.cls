Class AWS.Adapter.OutboundAdapter Extends Ens.OutboundAdapter
{
	Property AWSHashingAlgorithm As %String [ InitialExpression = "AWS4-HMAC-SHA256" ];
	
	Property AWSRegion As %String [ InitialExpression = "us-east-1", Required ];
	
	Property SSLConfig As %String [ InitialExpression = "AWSSSLConfig" ];
	
	Property AWSAccessKey As AWS.AWS4Auth.AccessKey;
	
	Property AWSAccessKeyCredential As %String [ InitialExpression = "AWSAccessKeyCredential" ]; 
	
	Parameter SETTINGS = "SSLConfig:Connection:sslConfigSelector,AWSRegion:Basic:selector?context={AWS.Adapter.ContextSearch/RegionList},AWSAccessKeyCredential:Basic:credentialsSelector,AWSHashingAlgorithm:Basic:selector?context={AWS.Adapter.ContextSearch/HashList}";

	Method AWSAccessKeyCredentialSet(pInVal As %String) As %Status
	{
		#; (Re)Set the Credentials object; do it always because we never know if the source row fields might have been updated
		#; make sure to instantiate even if re-setting to the InitialExpression string
		Set ..%CredentialsObj=$$$NULLOREF
	
		Set tClassname=$zobjmethod($this,"%ClassName",1) ; call subclass
		Set tClass = $$$comMemberKeyGet(tClassname,$$$cCLASSproperty,"%CredentialsObj",$$$cPROPtype)
		If ""'=tClass {
			Set tSC=##Class(Ens.Config.Credentials).GetCredentialsObj(.tObj,tClassname,tClass,pInVal)
			If $$$ISOK(tSC) { Set ..%CredentialsObj=tObj }
			ElseIf '$$$StatusEquals(tSC,$$$EnsErrNoCallerCredentials) {
				$$$LOGSTATUS(tSC)
			}
		}
		Set i%Credentials=pInVal
		Quit $$$OK
	}

	Method Send(pAWSAPIRequest As AWS.AWS4Auth.BaseRequest, Output pAWSAPIResponse As AWS.AWS4Auth.BaseResponse) As %Status
	{
		set tSC = $$$OK
		
		try{
			Set pAWSAPIRequest.AccessKey=..AWSAccessKey
			Set pAWSAPIRequest.Region = ..AWSRegion
			Set pAWSAPIRequest.SSLConfiguration=..SSLConfig
			Set pAWSAPIRequest.SignatureMethod= ##class(AWS.AWS4Auth.SignatureMethods.BaseSignatureMethod).GetSignatureMethod(..AWSHashingAlgorithm)
			
			Set pAWSAPIResponse = pAWSAPIRequest.Send(0)
		}
		Catch(oException){
			set tSC = oException.AsStatus()
		}
		
		Quit tSC
	}
	
	Method OnInit() As %Status
	{
		Do ##class(AWS.Utils).CheckSSLConfiguration(..SSLConfig)
		
		//TODO: Validate if a credential is set and that it has both a username and a password
		Set ..AWSAccessKey = ##class(AWS.AWS4Auth.AccessKey).%New(..%CredentialsObj.Username, ..%CredentialsObj.Password)
		
		Quit $$$OK
	}

}