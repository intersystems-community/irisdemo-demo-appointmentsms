Class AWS.API.SNS.Response Extends AWS.AWS4Auth.BaseResponse
{

Property PublishResultMessageId As %String;

Method ParseHttpResponse(pHttpResponse As %Net.HttpResponse)
{
		Do ..PaseAsXPathDocument(pHttpResponse)
		
		Set ..XPathDocument.PrefixMappings="s http://sns.amazonaws.com/doc/2010-03-31/"
		
		Set ..PublishResultMessageId=..XPathEvaluatExpression("/s:PublishResponse/s:PublishResult/s:MessageId", "text()")		
}

}

