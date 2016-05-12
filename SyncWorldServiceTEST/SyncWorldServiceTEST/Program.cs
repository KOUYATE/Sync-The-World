using SyncWorldServiceTEST.ServiceReferenceV1;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SyncWorldServiceTEST
{
    class Program
    {
        static void Main(string[] args)
        {
            String choix;
                /*var db = new Entities();
                
                var adress = new AdressSet();
                adress.Name = "Avenue de savigny";
                adress.Street = "44";
                adress.ZipCode = "93600";
                db.AdressSets.Add(adress);
                db.SaveChanges();
                Console.ReadLine();*/
            do
            {
                Console.WriteLine();
                Console.WriteLine("|------------------------------------------------------------|");
                Console.WriteLine("|--------------SYNC WORLD WEBSERVICE TESTER MENU-------------|");
                Console.WriteLine("|------------------------------------------------------------|");
                Console.WriteLine("|1 Add Personn | 2 Update Person | 3 Delete Person           |");
                Console.WriteLine("|3 Add Event   | 4 Update Event  | 5 Delete Event            |");
                Console.WriteLine("|6 Add Contrib | 7 DeleteCl Event| 8 Event By Name           |");
                Console.WriteLine("|9 Pending UP  | 10 Link Event   | 11 Delete Event           |");
                Console.WriteLine("|12 Add Event  | 13 All O Event  | 14 Delete Event           |");
                Console.WriteLine("|15 Cont Event | 16 Person Event | 0 EXIT                    |");
                Console.WriteLine("|------------------------------------------------------------|");

                Console.WriteLine();
                Console.Write("Enter a number to test a service : ");
               
                choix = Console.ReadLine().Trim();

                switch (choix)
                {
                    case "1" :
                        PersonAdd();
                        break;
                    case "2" :
                        PersonnUpdate();
                        break;
                    case "3" :
                        DeletePerson();
                        break;
                    case "4" :
                        AddEvent();
                        break;

                }

            } while (!choix.Equals("0"));
            
            
            Console.ReadLine();
        }

        private static void PersonnUpdate()
        {
            SyncWolrdServiceClient client = new SyncWolrdServiceClient();
            PersonSet person = new PersonSet();
            Console.WriteLine();
            Console.WriteLine("|----------- PersonUpdate Test ----------|");
            Console.WriteLine();
            int fin = 0;
            do {
                fin = 0;
                try{
                    Console.Write("Person Id = ");
                    person.PersonId = int.Parse(Console.ReadLine().Trim());
                } catch(Exception ex)
                {
                    Console.Write("Person Id invalid");
                    fin = -1;
                }
                
            } while (fin == -1);

            
            Console.Write("Person Name = ");
            person.Name = Console.ReadLine().Trim();
            Console.Write("Person NickName = ");
            person.NickName = Console.ReadLine().Trim();
            Console.Write("Person Email = ");
            person.Email = Console.ReadLine().Trim();
            Console.WriteLine("Result = " + client.UpdatePerson(person));
            client.Close();
        }

        private static void PersonAdd()
        {
            SyncWolrdServiceClient client = new SyncWolrdServiceClient();
            PersonSet person = new PersonSet();
            Console.WriteLine();
            Console.WriteLine("|----------- PersonAdd Test ----------|");
            Console.WriteLine();
            Console.Write("Person Name = ");
            person.Name = Console.ReadLine().Trim();
            Console.Write("Person NickName = ");
            person.NickName = Console.ReadLine().Trim();
            Console.Write("Person Email = ");
            person.Email = Console.ReadLine().Trim();
            Console.WriteLine("Result = "+client.AddPerson(person));
            client.Close();
        }

        private static void DeletePerson()
        {
            Console.WriteLine();
            Console.WriteLine("|----------- PersonDelete Test ----------|");
            Console.WriteLine();
            SyncWolrdServiceClient client = new SyncWolrdServiceClient();
            Console.Write("Person Email = ");
            string email = Console.ReadLine().Trim();
            Console.WriteLine("Result = " + client.DeletePerson(email));
        }

        public static void AddEvent()
        {
            Console.WriteLine();
            Console.WriteLine("|----------- EventAdd Test ----------|");
            Console.WriteLine();
            SyncWolrdServiceClient client = new SyncWolrdServiceClient();
            EventSet e = new EventSet();
            AdressSet address = new AdressSet();
            Console.Write("Event Name = ");
            e.Name = Console.ReadLine().Trim();
            Console.Write("Event Description = ");
            e.Description = Console.ReadLine().Trim();
            Console.Write("Event Type = ");
            e.Type = Console.ReadLine().Trim();
            Console.Write("Street number = ");
            address.Street = Console.ReadLine().Trim();
            Console.Write("Street name = ");
            address.Name = Console.ReadLine().Trim();
            Console.Write("Zip Code = ");
            address.ZipCode = Console.ReadLine().Trim();
            e.AdressSet = address;
            Console.WriteLine("Result = " + client.AddEvent(e));

        }
    }
}
