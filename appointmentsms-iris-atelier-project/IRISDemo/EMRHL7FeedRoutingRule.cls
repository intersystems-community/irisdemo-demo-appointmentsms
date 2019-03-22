/// 
Class IRISDemo.EMRHL7FeedRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.HL7.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="IRISDemo.EMR HL7 FeedRoutingRule" context="EnsLib.HL7.MsgRouter.RoutingEngine" production="IRISDemo.Production">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="source" value="EMR HL7 Feed"></constraint>
<constraint name="docCategory" value="2.5"></constraint>
<constraint name="docName" value="SIU_S12"></constraint>
<when condition="1">
<send transform="IRISDemo.DTL.HL7ToSMSTransformer" target="AWS SNS Operation"></send>
<send transform="" target="EMR HL7 Appointment Store Operation"></send>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
