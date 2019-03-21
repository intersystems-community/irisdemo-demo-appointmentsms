Class IRISDemo.Data.Patient Extends (%Persistent, %Populate)
{
	Property City As %String (VALUELIST=",Boston,Cambridge,Belmont,Sommerville,Andover,Haverhill,Medford,Malden,Swapscott,Salem,Milton,Arlington,Quincy") [ Required ];
	
	Property LastName As %String [ Required ];
	
	Property FirstName As %String [ Required ];
	
	Property PhoneNumber As %String [ Required ];
	
	Property Gender As %String (VALUELIST=",M,F,O,") [ Required ];
	
	Property MRN As %Integer [ Required ];
	
	Index MRNIndex On MRN [ Unique ];

Storage Default
{
<Data name="PatientDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LastName</Value>
</Value>
<Value name="3">
<Value>FirstName</Value>
</Value>
<Value name="4">
<Value>PhoneNumber</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
<Value name="6">
<Value>MRN</Value>
</Value>
<Value name="7">
<Value>City</Value>
</Value>
<Value name="8">
<Value>Country</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.Data.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<IdLocation>^IRISDemo.Data.PatientD</IdLocation>
<IndexLocation>^IRISDemo.Data.PatientI</IndexLocation>
<StreamLocation>^IRISDemo.Data.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}