Class IRISDemo.Production Extends IRISDemo.BaseProduction
{

	XData ProductionDefinition
	{
	<Production Name="IRISDemo.Production" TestingEnabled="true" LogGeneralTraceEvents="true">
	  <Description></Description>
	  <ActorPoolSize>2</ActorPoolSize>
	</Production>
	}
	
	/// Override this in your Production class to do setup before the Production starts
	ClassMethod OnStart(pTimeStarted As %String) As %Status
	{
		Quit ##class(IRISDemo.Data.Utils).PopulateModel()
	}

}
