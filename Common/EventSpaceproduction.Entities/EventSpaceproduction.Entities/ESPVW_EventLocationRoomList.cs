//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EventSpaceproduction.Entities
{
    using System;
    using System.Collections.Generic;
    
    public partial class ESPVW_EventLocationRoomList
    {
        public string Event_Name { get; set; }
        public string Event_Description { get; set; }
        public System.DateTime Event_Start_Date { get; set; }
        public System.DateTime Event_End_Date { get; set; }
        public string Location_Name { get; set; }
        public string Room_Name { get; set; }
        public System.TimeSpan Operations_Start { get; set; }
        public System.TimeSpan Operations_End { get; set; }
        public bool Active { get; set; }
    }
}
