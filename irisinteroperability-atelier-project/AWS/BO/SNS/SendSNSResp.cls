Class AWS.BO.SNS.SendSNSResp Extends (%Persistent, Ens.Response)
{

Property PublishResultMessageId As %String;

Storage Default
{
<Data name="SendSNSRespDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PublishResultMessageId</Value>
</Value>
</Data>
<DataLocation>^AWS.BO.SNS.SendSNSRespD</DataLocation>
<DefaultData>SendSNSRespDefaultData</DefaultData>
<IdLocation>^AWS.BO.SNS.SendSNSRespD</IdLocation>
<IndexLocation>^AWS.BO.SNS.SendSNSRespI</IndexLocation>
<StreamLocation>^AWS.BO.SNS.SendSNSRespS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
