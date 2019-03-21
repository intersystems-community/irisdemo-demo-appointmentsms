Class AWS.BO.SNS.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "AWS.Adapter.OutboundAdapter";

Property Adapter As AWS.Adapter.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method SendSNS(pInput As AWS.BO.SNS.SendSNSReq, Output pOutput As AWS.BO.SNS.SendSNSResp) As %Status
{
	Set tSC = $$$OK
	Try
	{
		Set oSNSRequest = ##class(AWS.API.SNS.Request).%New()
		Set oSNSRequest.PhoneNumber=pInput.PhoneNumber
		Set oSNSRequest.Message=pInput.Message
		
		Set tSC = ..Adapter.Send(oSNSRequest, .oSNSResponse)
		Quit:$$$ISERR(tSC)
		
		Set pOutput = ##class(AWS.BO.SNS.SendSNSResp).%New()
		Set pOutput.PublishResultMessageId=oSNSResponse.PublishResultMessageId
	}
	Catch (oException)
	{
		Set tSC = oException.AsStatus()
	}
	
	Quit tSC
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="AWS.BO.SNS.SendSNSReq">
        <Method>SendSNS</Method>
    </MapItem>
</MapItems>
}

}
