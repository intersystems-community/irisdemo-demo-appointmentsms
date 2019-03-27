Include DEMOMACROS

Class IRISDemo.BO.Appointment.Operation Extends Ens.BusinessOperation
{
	Parameter INVOCATION = "Queue";
	
	Method ConvertHL7Date(date) As %String
	{
		return ##class(Ens.Util.FunctionSet).ConvertDateTime(date,"%q","%q(1)")
	}
	
	Method StoreAppointment(pInput As EnsLib.HL7.Message, Output pOutput As Ens.Response) As %Status
	{
		#dim pInput As EnsLib.HL7.Message
		#dim patient As IRISDemo.Data.Patient
		#dim appointment As IRISDemo.Data.Appointment
		
		Set tSC = $$$OK
		Try	{
			
			Set tMRN = pInput.GetValueAt("PIDgrp(1).PID:3(1).1")
			
			Set patient = ##class(IRISDemo.Data.Patient).MRNIndexOpen(tMRN)
			
			If patient=""
			{
				Set patient = ##class(IRISDemo.Data.Patient).%New()
				Set patient.MRN = tMRN
			}
			
			Set patient.FirstName = pInput.GetValueAt("PIDgrp(1).PID:5(1).2")
			Set patient.LastName = pInput.GetValueAt("PIDgrp(1).PID:5(1).1.1")
			Set patient.Gender = pInput.GetValueAt("PIDgrp(1).PID:8")
			Set patient.PhoneNumber = pInput.GetValueAt("PIDgrp(1).PID:13(1).1")
			Set patient.City = pInput.GetValueAt("PIDgrp(1).PID:11(1).3")
			
			Set appointment = ##class(IRISDemo.Data.Appointment).%New()
			Set appointment.Patient = patient
			Set appointment.Specialty = pInput.GetValueAt("RGSgrp(1).AIPgrp(1).AIP:4.1")
			
			Set StartDateTime = ..ConvertHL7Date(pInput.GetValueAt("SCH:11(1).4.1"))
			Set appointment.StartDateTime = StartDateTime
			
			Set tSC = appointment.%Save()
			$$$ThrowStatusExceptionIfError(tSC, "Error Saving Appointment")
			
		} Catch (oException)
		{
			Set tSC = oException.AsStatus()
		}
		
		Quit tSC
	}
	
	XData MessageMap
	{
	<MapItems>
	    <MapItem MessageType="EnsLib.HL7.Message">
	        <Method>StoreAppointment</Method>
	    </MapItem>
	</MapItems>
	}
}