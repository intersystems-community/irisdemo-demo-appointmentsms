/// 	<p>Try using JSON on your APIs. But if the API only returns XML, here is an example on how to parse it.
/// Put this method on your subclass:</p>
/// 	<pre>
/// 	/// EXAMPLE OF METHOD ON YOUR SUBCLASS THAT PARSES XML FROM THE RESPONSE
/// 	Method ParseHttpResponse(pHttpResponse As %Net.HttpResponse)
/// 	{
/// 		Do ..PaseAsXPathDocument(pHttpResponse)
/// 		
/// 		Set ..XPathDocument.PrefixMappings="s http://sns.amazonaws.com/doc/2010-03-31/"
/// 		
/// 		Set ..PublishResultMessageId=..XPathEvaluatExpression("/s:PublishResponse/s:PublishResult/s:MessageId", "text()")		
/// 	}
/// 	</pre>
/// 	
Class AWS.AWS4Auth.BaseResponse Extends %RegisteredObject
{

Property XPathDocument As %XML.XPATH.Document;

Method ParseHttpResponse(pHttpResponse As %Net.HttpResponse)
{
		Quit $$$OK
}

/// Use this on your subclass if your response is XML based
Method PaseAsXPathDocument(pHttpResponse As %Net.HttpResponse)
{
		#Dim oDocument As %XML.XPATH.Document
		
		Try
		{
			Set tXML=pHttpResponse.Data.Read()
		}
		Catch
		{
			Set tXML=pHttpResponse.Data
		}
		
		Set tSC = ##class(%XML.XPATH.Document).CreateFromString(tXML ,.oDocument)
		If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
		
		Set ..XPathDocument=oDocument
}

/// Use this on your subclass if your response is XML based
Method XPathEvaluatExpression(pContext As %String, pExpression As %String = "") As %String
{
		Set tSC = ..XPathDocument.EvaluateExpression(pContext, pExpression, .oResults)
		If $$$ISERR(tSC) Throw ##class(%Exception.StatusException).CreateFromStatus(tSC)
		
		If oResults.Count()=1
		{
			Return oResults.GetAt(1).Value
		}
		ElseIf oResults.Count()>1
		{
			Throw ##class(%Exception.General).%New("XPathEvaluatExpressionReturnedSeveralResultsException")
		}
		Else
		{
			Throw ##class(%Exception.General).%New("XPathEvaluatExpressionReturnedNoResultsException")
		}
}

}

