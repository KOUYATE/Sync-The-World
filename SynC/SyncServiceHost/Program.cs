using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ServiceModel;
using SyncServiceDAO;


namespace SyncServiceHost
{
    class Program
    {
        static void Main(string[] args)
        {
            using (ServiceHost host = new ServiceHost(typeof(SyncService.HelloService)))
            {
                host.Open();
                Console.WriteLine("Service started @t " + DateTime.Now.ToShortDateString());
                var db = new Entities();
                var adress = new AdressSet();
                adress.Name = "Avenue de savigny";
                adress.Street = "44";
                adress.ZipCode = "93600";
                db.AdressSets.Add(adress);
                db.SaveChanges();
                Console.ReadLine();
            }
        }
    }
}
