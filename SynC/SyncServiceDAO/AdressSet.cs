//------------------------------------------------------------------------------
// <auto-generated>
//     Ce code a été généré à partir d'un modèle.
//
//     Des modifications manuelles apportées à ce fichier peuvent conduire à un comportement inattendu de votre application.
//     Les modifications manuelles apportées à ce fichier sont remplacées si le code est régénéré.
// </auto-generated>
//------------------------------------------------------------------------------

namespace SyncServiceDAO
{
    using System;
    using System.Collections.Generic;
    
    public partial class AdressSet
    {
        public AdressSet()
        {
            this.EventSets = new HashSet<EventSet>();
        }
    
        public int AdressId { get; set; }
        public string ZipCode { get; set; }
        public string Street { get; set; }
        public string Name { get; set; }
    
        public virtual ICollection<EventSet> EventSets { get; set; }
    }
}
