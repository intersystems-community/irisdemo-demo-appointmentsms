Class AWS.AWS4Auth.BaseRequest Extends %RegisteredObject
{

Parameter RESPONSECLASS = "AWS.AWS4Auth.BaseResponse";

/// Defined by the subclass. Can be GET,POST,DELETE,etc. Depending on your subclass API
Parameter Method As %String = "POST";

/// Defined by your subclass API
Parameter URI As %String = "/";

/// Defined by subclass
Parameter Service As %String;

Property SSLConfiguration As %String;

Property AccessKey As AWS.AWS4Auth.AccessKey;

Property SignatureMethod As AWS.AWS4Auth.SignatureMethods.BaseSignatureMethod;

/// Computed by HostGet() that is implemented by your API subclass
Property Host As %String [ Calculated, ReadOnly ];

Property Region As %String;

/// This will be set when the Sign() method calls BuildSignature
Property AuthorizationHeader As %String;

/// Subclasses should implement properties that will add keys to this array
Property Parameters As array Of %String;

/// Your headers. Additional headers will be added/updated when the Sign() method calls BuildSignature
Property Headers As array Of %String;

Property Payload As %Library.DynamicObject;

/// Must be implemented by Subclasses
Method HostGet() As %String
{
		//TODO: Use Region and your sub class semantics to return the correct host
		
		Quit "" 
}

Method RegionSet(pRegion As %String) As %Status [ Final ]
{
		Set i%Region = pRegion
		Do ..Headers.SetAt(..Host, "Host")
		
		Quit $$$OK
}

Method %OnNew(pAccessKey As AWS.AWS4Auth.AccessKey = "", pSignatureMethod As %String = "") As %Status
{
		Set ..AccessKey=pAccessKey
		if pSignatureMethod '= ""
		{
			Set ..SignatureMethod= ##class(AWS.AWS4Auth.SignatureMethods.BaseSignatureMethod).GetSignatureMethod(pSignatureMethod)
		}
		Quit $$$OK
}

Method GetHttpRequest(pDebug As %Boolean = 0) As %Net.HttpRequest
{
		set oHttpRequest = ##class(%Net.HttpRequest).%New()
		
		Set tSignature = ..SignatureMethod.BuildSignature($this, pDebug)
		set oHttpRequest.Authorization = $ZSTRIP($ZCONVERT(..AuthorizationHeader,"O","UTF8"),"<>","W")
		
		set oHttpRequest.SSLConfiguration = ..SSLConfiguration
		set oHttpRequest.Https = 1
		set oHttpRequest.Server = ..Host
		  
    	Set headerKey=""
    	For 
    	{
    		Do ..Headers.GetNext(.headerKey)
    		Quit:headerKey=""
    		
    		Do oHttpRequest.SetHeader(headerKey, ..Headers.GetAt(headerKey))
    	}
	    
    	Set paramKey=""
    	For 
    	{
    		Do ..Parameters.GetNext(.paramKey)
    		Quit:paramKey=""
    		
    		Do oHttpRequest.SetParam(paramKey, ..Parameters.GetAt(paramKey))
    	}
	    
		Quit oHttpRequest
}

Method Send(pDebug As %Boolean = 0) As AWS.AWS4Auth.BaseResponse
{
		Set oHttpRequest = ..GetHttpRequest(pDebug)
		
		If ..#Method="GET" 
		{
			set tSC = $method(oHttpRequest, "Get", ..#URI)
		}
		ElseIf ..#Method="POST"
		{
			set tSC = $method(oHttpRequest, "Post", ..#URI)
		}
		ElseIf ..#Method="DELETE"
		{
			set tSC = $method(oHttpRequest, "Delete", ..#URI)
		}
		ElseIf ..#Method="PUT"
		{
			set tSC = $method(oHttpRequest, "Put", ..#URI)
		}
		Else
		{
			Throw ##class(%Exception.General).%New("AWSSendMethodNotSupported")
		}
		
		If pDebug
		{
 //		    Write !,"=====",!
 //		    Do $System.OBJ.Dump(oHttpRequest)
 //
 //		    Write !,"=====",!
 //		    zwrite oHttpRequest.Params
		    
		    Write !,"=====",!
		    do oHttpRequest.OutputHeaders()
		    
		    If $$$ISERR(tSC)
		    {
		    	Write !,"=====",!
		    	Do $System.Status.DisplayError(tSC)
		    }
		    
		    Write !,"=====",!
		    Try
		    {
		    	Do oHttpRequest.HttpResponse.Data.OutputToDevice()
		    	Do oHttpRequest.HttpResponse.Data.Rewind()
		    }
		    Catch
		    {
		    	Write oHttpRequest.HttpResponse.Data
		    }
		    
		}
		
		If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
		
		Set pResponse = $classmethod(..#RESPONSECLASS, "%New")
		
		Do pResponse.ParseHttpResponse(oHttpRequest.HttpResponse)
		
		Quit pResponse
}

}

