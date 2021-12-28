using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventSpaceproduction.Entities
{
    public class ESP_SystemOperations
    {
        string LastError = string.Empty;
        public bool AddSystemUser(string userName, string firstName, string lastName, string password, string title, string department, string email, string phone, string license, string active, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_AddUser(userName, firstName, lastName, title, department, email, phone, active, license, password).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }

        public bool UpdateSystemUser(string userName, string firstName, string lastName, string password, string title, string department, string email, string phone, string license, string active, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_UpdateUser(userName, firstName, lastName, title, department, email, phone, active, license, password, loggedinUser).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool AddUserToRole(string userName, string roleName, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_AddUserToRole(userName, roleName).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool RemoveUserFromRole(string userName, string roleName, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_RemoveUserFromRole(userName, roleName).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool AddPermissionToRole(string roleName, string permissionName, string granted, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_AddPermissionToRole(roleName, permissionName, granted).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool RemovePermissionFromRole(string roleName, string permissionName, string granted, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_RemovePermissionFromRole(roleName, permissionName, granted).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool AddUpdateRegisteredCompany(string companyId, string companyName, string address1, string address2, string address3, string city, string state, string postalCode, string country, string phone, string loggedinUser)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string callingId = Guid.NewGuid().ToString();

            string dbresult = sysdb.ESPSP_AddUpdateRegisteredCompany(companyId, companyName, address1, address2, address3, city, state, postalCode, country, phone, callingId).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool AddUpdateEmailSetting(string emailType, string emailServer, string port, string emailLogin, string emailPassword, string emailSecurity, string enabled)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_AddUpdateEmailSetting(emailType, emailServer, port, emailLogin, emailPassword, emailSecurity, enabled).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
        public bool DeleteEmailSetting(string emailType, string emailServer, string port, string emailLogin, string emailPassword, string emailSecurity, string enabled)
        {
            bool Result = false;

            ESP_SystemEntities sysdb = new ESP_SystemEntities();

            string dbresult = sysdb.ESPSP_DeleteEmailSetting(emailType, emailServer, port, emailLogin, emailPassword, emailSecurity, enabled).ToString();

            if (dbresult.Contains("Error:"))
            {
                Result = false;
                LastError = dbresult;
            }
            else
            {
                Result = true;
                LastError = "Success";
            }

            return Result;
        }
    }
}
