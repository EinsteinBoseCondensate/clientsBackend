using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Entities
{
    public class Country
    {
        [System.ComponentModel.DataAnnotations.Key]
        public Guid Id { get; set; }
        public string Name { get; set; }
    }
}
