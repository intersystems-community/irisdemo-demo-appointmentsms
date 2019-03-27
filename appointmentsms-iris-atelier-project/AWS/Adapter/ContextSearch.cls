Class AWS.Adapter.ContextSearch Extends %ZEN.Portal.ContextSearch
{
	ClassMethod RegionList(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
	{
		Set pResults(1)="us-east-1"
		Set pResults(2)="us-west-1"
		
		Quit $$$OK 
	}
	
	ClassMethod HashList(Output pCaption As %String, Output pTopResults, Output pResults, ByRef pParms As %String, pSearchKey As %String = "") As %Status
	{
		Set pResults(1)="AWS4-HMAC-SHA256"
		
		Quit $$$OK 
	}
}