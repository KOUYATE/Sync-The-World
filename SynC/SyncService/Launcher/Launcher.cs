using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;

namespace SyncService.Launcher
{
    class Launcher
    {
        private ServiceHost eventHost;
          
        private ServiceHost personHost;

        private ServiceHost contribHost;

        public Launcher()
        {
            eventHost = new ServiceHost(typeof(SyncService.Service.EventService));
            personHost = new ServiceHost(typeof(SyncService.Service.PersonService));
            contribHost = new ServiceHost(typeof(SyncService.Service.ContributionService));

        }

        public void StartSyncService()
        {
            Console.WriteLine("Service started @t " + DateTime.Now.ToShortDateString());
            eventHost.Open();
            personHost.Open();
            contribHost.Open();
        }

        public void CloseSyncService()
        {
            Console.WriteLine("Closing Service...");
            eventHost.Close();
            personHost.Close();
            contribHost.Close();
            Console.WriteLine("Service close @t " + DateTime.Now.ToShortDateString());
        }
    }
}
