using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EventSpaceproduction.Entities
{
    public class ESP_Event
    {
        string LastError = string.Empty;
        public bool AddUpdateEvent(string eventName, string eventDescription, DateTime eventStart, DateTime eventEnd, string loggedinUser)
        {
            bool Result = false;

            ESP_EventsEntities eventdb = new ESP_EventsEntities();

            string dbresult = eventdb.ESPSP_AddUpdateExistingEvent(eventName, eventDescription, eventStart, eventEnd).ToString();

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
        public bool AddUpdateLocation(string locationName, Int32 image, string loggedinUser)
        {
            bool Result = false;

            ESP_EventsEntities eventdb = new ESP_EventsEntities();

            string dbresult = eventdb.ESPSP_AddUpdateExistingLocation(locationName, image).ToString();

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
        public bool AddUpdateRoom(string roomName, DateTime operationStart, DateTime operationEnd, bool active, Int32 image, string loggedinUser)
        {
            bool Result = false;

            ESP_EventsEntities eventdb = new ESP_EventsEntities();

            string dbresult = eventdb.ESPSP_AddUpdateExistingRoom(roomName, operationStart.TimeOfDay, operationEnd.TimeOfDay, active, image).ToString();

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
        public bool AssignLocationToEvent(string eventName, string locationName, string loggedinUser)
        {
            bool Result = false;

            ESP_EventsEntities eventdb = new ESP_EventsEntities();

            string dbresult = eventdb.ESPSP_AssignLocationToEvent(eventName, locationName).ToString();

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
        public bool AssignRoomToLocation(string locationName, string roomName, string loggedinUser)
        {
            bool Result = false;

            ESP_EventsEntities eventdb = new ESP_EventsEntities();

            string dbresult = eventdb.ESPSP_AssignRoomToLocation(locationName, roomName).ToString();

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
