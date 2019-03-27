Class IRISDemo.DTL.HL7ToSMSTransformer Extends Ens.DataTransformDTL [ DependsOn = (EnsLib.HL7.Message, IRISDemo.BO.SNS.Request) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='EnsLib.HL7.Message' targetClass='IRISDemo.BO.SNS.Request' sourceDocType='2.5:SIU_S12' create='new' language='objectscript' >
<assign value='source.{PIDgrp(1).PID:PhoneNumberHome()}' property='target.PhoneNumber' action='set' />
<assign value='source.{PIDgrp(1).PID:PatientName().FamilyName}' property='target.LastName' action='set' />
<assign value='..ConvertDateTime(source.{SCH:AppointmentTimingQuantity().StartDateTime},"%q","%q(1)")' property='target.AppointmentTime' action='set' />
<assign value='source.{PIDgrp(1).PID:PatientName().GivenName}' property='target.FirstName' action='set' />
</transform>
}

}
