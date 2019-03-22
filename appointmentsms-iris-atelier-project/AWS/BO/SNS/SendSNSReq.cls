Class AWS.BO.SNS.SendSNSReq Extends (%Persistent,Ens.Request)
{

Property PhoneNumber As %String [ Required ];

/// TODO: How long can a message be?? Is 50 ok?
Property Message As %String(MAXLEN=140)[ Required ];

Storage Default
{
<Data name="SendSNSReqDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PhoneNumber</Value>
</Value>
<Value name="3">
<Value>Message</Value>
</Value>
</Data>
<DataLocation>^AWS.BO.SNS.SendSNSReqD</DataLocation>
<DefaultData>SendSNSReqDefaultData</DefaultData>
<IdLocation>^AWS.BO.SNS.SendSNSReqD</IdLocation>
<IndexLocation>^AWS.BO.SNS.SendSNSReqI</IndexLocation>
<StreamLocation>^AWS.BO.SNS.SendSNSReqS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}