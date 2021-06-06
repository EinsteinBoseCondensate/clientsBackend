using ClientsStorage.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Models
{
    public class ClientDTO
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Surname { get; set; }
        public int Gender { get; set; } = 1000;
        public DateTime DateOfBirth { get; set; }
        public string Address { get; set; }
        public string CountryId { get; set; }
        public string PostalCode { get; set; }


    }
}
