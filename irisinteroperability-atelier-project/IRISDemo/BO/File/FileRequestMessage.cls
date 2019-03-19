Class IRISDemo.BO.File.FileRequestMessage Extends (%Persistent,Ens.Request)
{
	Property FirstName As %String;
	
	Property LastName As %String;
	
	Property PhoneNumber As %String;
	
Storage Default
{
<Data name="FileRequestMessageDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FirstName</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>PhoneNumber</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.BDCE3.FileRequestA10ED</DataLocation>
<DefaultData>FileRequestMessageDefaultData</DefaultData>
<IdLocation>^IRISDemo.BDCE3.FileRequestA10ED</IdLocation>
<IndexLocation>^IRISDemo.BDCE3.FileRequestA10EI</IndexLocation>
<StreamLocation>^IRISDemo.BDCE3.FileRequestA10ES</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}