Class AWS.AWS4Auth.AccessKey Extends %RegisteredObject
{

Property AccessKey As %String;

Property SecretKey As %String;

Method %OnNew(pAccessKey As %String = "", pAccessSecret As %String = "") As %Status
{

		Set ..AccessKey = pAccessKey
		Set ..SecretKey = pAccessSecret
		
		Quit $$$OK
}

}

