Class IRISDemo.DTL.Hl7TriggerNewAppointment Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, IRISDemo.BO.File.FileRequestMessage) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='IRISDemo.BO.File.FileRequestMessage' sourceDocType='2.5:SIU_S12' create='new' language='objectscript' >
<assign value='source.{PIDgrp(1).PID:PatientName().FamilyName.Surname}' property='target.LastName' action='set' />
<assign value='source.{PIDgrp(1).PID:PatientName().GivenName}' property='target.FirstName' action='set' />
<assign value='source.{PIDgrp(1).PID:PhoneNumberHome().TelephoneNumber}' property='target.PhoneNumber' action='set' />
</transform>
}

}
