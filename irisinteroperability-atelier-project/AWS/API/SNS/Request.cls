Class AWS.API.SNS.Request Extends AWS.AWS4Auth.BaseRequest
{

Parameter RESPONSECLASS = "AWS.API.SNS.Response";

Parameter Method As %String = "GET";

Parameter URI As %String = "/";

Parameter Service As %String = "sns";

Property PhoneNumber As %String [ Required ];

Property Message As %String [ Required ];

Method %OnNew(pAccessKey As AWS.AWS4Auth.AccessKey = "", pSignatureMethod As %String = "") As %Status
{
		do ..Parameters.SetAt("2010-03-31","Version")
		do ..Parameters.SetAt("Publish","Action")
		
		Quit ##super(pAccessKey, pSignatureMethod)
}

Method PhoneNumberSet(pVal As %String) As %Status
{
		Set i%PhoneNumber=pVal
		do ..Parameters.SetAt(pVal,"PhoneNumber")
}

Method MessageSet(pVal As %String) As %Status
{
		Set i%Message=pVal
		do ..Parameters.SetAt(pVal,"Message")
}

Method HostGet() As %String
{
		//"sns.us-east-1.amazonaws.com"
		Quit ..#Service_"."_..Region_".amazonaws.com" 
}

}

