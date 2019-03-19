Class IRISDemo.BO.File.FileOutput Extends EnsLib.HL7.Operation.FileOperation
{

Method SaveToOutputFile(pRequest As IRISDemo.BO.File.FileRequestMessage, Output pResponse As Ens.Response) As %Status
{
	set tSC = $$$OK
	Try
	{
		
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
	<MapItem MessageType="IRISDemo.BO.File.FileRequestMessage"> 
		<Method>SaveToOutputFile</Method>
	</MapItem>
</MapItems>
}

}