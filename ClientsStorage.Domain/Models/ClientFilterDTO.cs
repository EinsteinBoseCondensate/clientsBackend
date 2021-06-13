using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Models
{
    public class ClientFilterDTO : ClientDTO
    {
        public DateTime? From { get; set; }
        public DateTime? To { get; set; }
        public int? Skip { get; set; }
        public int? Take { get; set; }
    }
}
