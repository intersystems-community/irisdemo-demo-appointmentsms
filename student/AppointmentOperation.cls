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
		Try	
		{
			Set tMRN = pInput.GetValueAt("PIDgrp(1).PID:3(1).1")
			
			Set patient = ##class(IRISDemo.Data.Patient).MRNIndexOpen(tMRN)
			
			If patient=""
			{
				Set patient = ##class(IRISDemo.Data.Patient).%New()
				Set patient.MRN = tMRN
			}
			
			Set patient.FirstName = pInput.GetValueAt("PIDgrp(1).PID:5(1).2")
			Set patient.LastName = pInput.GetValueAt("PIDgrp(1).PID:5(1).1.1")
			Set patient.PhoneNumber = pInput.GetValueAt("PIDgrp(1).PID:13(1).1")
			Set patient.City = pInput.GetValueAt("PIDgrp(1).PID:11(1).3")

			// We are missing the patient gender! Locate it or you won't be able to save it. It is on PID:8. 
			// Patient genders are "M" or "F". Look at the PID segment on the example HL7 message and you will find it
			// You can also hover your mouse over the blue fields and let the interface tell you
			// what that field is.
			
			// HERE:

			Set appointment = ##class(IRISDemo.Data.Appointment).%New()
			Set appointment.Patient = patient
			Set StartDateTime = ..ConvertHL7Date(pInput.GetValueAt("SCH:11(1).4.1"))
			Set appointment.StartDateTime = StartDateTime

			// Locate the specialty! It is on Segment AIP! Look at the example HL7 message
			// for specialty "PCP" (Primary Care Provider) and you will see where it is.
			// You can also hover your mouse over the blue fields and let the interface tell you
			// what that field is.
			
			// HERE:
			
			Set tSC = appointment.%Save()
			$$$ThrowStatusExceptionIfError(tSC, "Error Saving Appointment")
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
	    <MapItem MessageType="EnsLib.HL7.Message">
	        <Method>StoreAppointment</Method>
	    </MapItem>
	</MapItems>
	}
}