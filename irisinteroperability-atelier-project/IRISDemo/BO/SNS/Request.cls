Class IRISDemo.BO.SNS.Request Extends AWS.BO.SNS.SendSNSReq 
{
	Property FirstName As %String [ Required ];
	
	Property LastName As %String [ Required ];
	
	Property AppointmentTime As %TimeStamp [ Required ];
		
	Method MessageGet() As %String
	{
		Set tDate = $ZDate($ZDateH($Piece(..AppointmentTime, " ", 1),3),9) // Month DD YYYY
		Set tTime = $Piece(..AppointmentTime, " ", 2)
		return "Do not Reply. Hello "_..FirstName_" "_..LastName_", "_"you have a scheduled appointment on "_tDate_" at "_tTime_"." 
	}
Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>FirstName</Value>
</Value>
<Value name="2">
<Value>LastName</Value>
</Value>
<Value name="3">
<Value>AppointmentTime</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}