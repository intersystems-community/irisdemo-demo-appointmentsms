/// 
Class IRISDemo.Cube.Appointment Extends %DeepSee.CubeDefinition [ DependsOn = IRISDemo.Data.Appointment, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Appointment" displayName="Appointment" disabled="false" abstract="false" sourceClass="IRISDemo.Data.Appointment" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
  <dimension name="City" disabled="false" hasAll="false" allCaption="All City" allDisplayName="City" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="City" disabled="false" sourceProperty="Patient.City" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Gender" disabled="false" hasAll="false" allCaption="All Gender" allDisplayName="Gender" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Gender" disabled="false" sourceProperty="Patient.Gender" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="Specialty" disabled="false" hasAll="false" allCaption="All Specialty" allDisplayName="Specialty" type="data" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="Specialty" disabled="false" sourceProperty="Specialty" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <dimension name="StartDateTime" disabled="false" hasAll="false" allCaption="All StartDateTime" allDisplayName="StartDateTime" sourceProperty="StartDateTime" type="time" calendar="gregorian" hidden="false" showHierarchies="default">
    <hierarchy name="H1" disabled="false" hidden="false">
      <level name="AppointmentYear" displayName="Appointment Year" disabled="false" timeFunction="Year" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Appointment Month" displayName="AppointmentMonth" disabled="false" timeFunction="MonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
      <level name="Appointment Day" displayName="AppointmentDay" disabled="false" timeFunction="DayMonthYear" list="false" useDisplayValue="true" useAsFilter="true" hidden="false">
      </level>
    </hierarchy>
  </dimension>
  <measure name="Bill" disabled="false" sourceProperty="Bill" aggregate="SUM" type="number" hidden="false" searchable="false">
  </measure>
  <listing name="Listing" disabled="false" listingType="table" fieldList="StartDateTime AS &quot;Appointment Date&quot;,Specialty,Patient-&gt;MRN,Patient-&gt;LastName AS &quot;Last Name&quot;,Patient-&gt;FirstName AS &quot;First Name&quot;,Patient-&gt;Gender,Patient-&gt;City,Patient-&gt;PhoneNumber AS &quot;Phone Number&quot;">
  </listing>
</cube>
}

Parameter DOMAIN;

}
