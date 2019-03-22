Class IRISDemo.Production Extends IRISDemo.BaseProduction
{

/// Override this in your Production class to do setup before the Production starts
ClassMethod OnStart(pTimeStarted As %String) As %Status
{
		Quit ##class(IRISDemo.Data.Utils).PopulateModel()
}

XData ProductionDefinition
{
<Production Name="IRISDemo.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EMR HL7 Feed" Category="" ClassName="EnsLib.HL7.Service.FileService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="MessageSchemaCategory">2.5</Setting>
    <Setting Target="Host" Name="TargetConfigNames">HL7_SMS_Router,EMR HL7 Feed_Router</Setting>
    <Setting Target="Adapter" Name="FilePath">/EMRHL7Feed/FileIn/</Setting>
    <Setting Target="Adapter" Name="FileSpec">*</Setting>
  </Item>
  <Item Name="EMR HL7 Feed_Router" Category="" ClassName="EnsLib.HL7.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="BusinessRuleName">IRISDemo.EMRHL7FeedRoutingRule</Setting>
  </Item>
  <Item Name="AWS SNS Operation" Category="" ClassName="AWS.BO.SNS.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="EMR HL7 Appointment Store Operation" Category="" ClassName="IRISDemo.BO.Appointment.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
