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
    
    public partial class UserPassword
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public string Password { get; set; }
        public System.DateTime SetDate { get; set; }
        public System.DateTime ExpirationDate { get; set; }
    }
}
