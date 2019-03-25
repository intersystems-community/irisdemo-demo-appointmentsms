Class IRISDemo.Data.Utils
{
	ClassMethod PopulateModel() As %Status
	{
		Set tSC = $$$OK
		Try
		{
			Set tSC = ##class(IRISDemo.Data.Appointment).%DeleteExtent()
			Quit:$$$ISERR(tSC)
			
			Set tSC = ##class(IRISDemo.Data.Patient).%DeleteExtent()
			Quit:$$$ISERR(tSC)
			
			Set tSC = ##class(IRISDemo.Data.Patient).Populate(1000)
			Quit:$$$ISERR(tSC)
			
			Set tSC = ##class(IRISDemo.Data.Appointment).Populate(1000)
			Quit:$$$ISERR(tSC)
			
			Set tSC = ..FixApptDates()
			Quit:$$$ISERR(tSC)
						
			set tSC = ##class(%DeepSee.CubeManager.Utils).SetActiveRegistry("IRISDemo.Cube.Registry")
			Quit:$$$ISERR(tSC)
			
			set tSC = ##class(%DeepSee.CubeManager.Utils).BuildAllRegisteredGroups()
		}
		Catch (oException)
		{
			Set tSC = oException.AsStatus()
		}
		
		Quit tSC
	}
	
	ClassMethod FixApptDates() As %Status
	{
		Set tSC = $$$OK
		Try
		{
			Set iLastDate=$H-90
			Set iNextAppId=""
			
			// going back in time, one day at a time
			For iDate=$H-1:-1:iLastDate
			{
				Set iWeek=$ZDate(iDate, 10)
				Continue:iWeek=0 // Sunday
				Continue:iWeek=6 // Saturday
				
				Set iBaseTime=32400 // 9am
				
				/// 7 hours a day with a slot of 30min each
				For iSlot=0:1:13
				{
					Set iTime=iBaseTime+(iSlot*30*60)
					
					Set iNextAppId=$Order(^IRISDemo.Data.AppointmentD(iNextAppId), -1)
					Quit:iNextAppId=""
					
					Set oApp=##class(IRISDemo.Data.Appointment).%OpenId(iNextAppId)
					Set oApp.StartDateTime=$ZDateTime(iDate_","_iTime,3)
					Set tSC = oApp.%Save()
					Quit:$$$ISERR(tSC)
				}
				Quit:$$$ISERR(tSC)
				Quit:iNextAppId=""
			}
		}
		Catch (oException)
		{
			Set tSC = oException.AsStatus()
		}
		
		Quit tSC
	}
}