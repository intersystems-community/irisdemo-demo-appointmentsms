Class IRISDemo.Data.Appointment Extends (%Persistent, %Populate)
{
	Parameter DSTIME = "AUTO";
	
	Property Patient As Patient [ Required ];
	
	ForeignKey PatientFK(Patient) References Patient();
	
	Property StartDateTime As %TimeStamp;
	
	Property Specialty As %String(VALUELIST=",PCP,Cardiologist,Pediatrist,Ophthalmologist,Dermatologist,") [ Required ];
	
	Property Bill As %Float [ SqlComputed, SqlComputeCode = { 
		Set {Bill}=..ComputeBill({Specialty}) 
	} ];
	
	ClassMethod PopulateStartDateTime() As %TimeStamp
	{
		Quit ##class(%PopulateUtils).TimeStamp($ZDateTime(($H-90)_",",3), $ZDateTime($H,3))
	}
	
	ClassMethod ComputeBill(pSpecialty) As %Float
	{
		Quit $Case(pSpecialty,
			"PCP":100,
			"Cardiologist":200,
			"Pediatrist":100,
			"Ophthalmologist":200,
			"Dermatologist":250,
			:300)
			
	}
	
Storage Default
{
<Data name="AppointmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Patient</Value>
</Value>
<Value name="3">
<Value>StartDateTime</Value>
</Value>
<Value name="4">
<Value>Specialty</Value>
</Value>
<Value name="5">
<Value>Bill</Value>
</Value>
</Data>
<DataLocation>^IRISDemo.Data.AppointmentD</DataLocation>
<DefaultData>AppointmentDefaultData</DefaultData>
<IdLocation>^IRISDemo.Data.AppointmentD</IdLocation>
<IndexLocation>^IRISDemo.Data.AppointmentI</IndexLocation>
<StreamLocation>^IRISDemo.Data.AppointmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}