using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Models
{
    public class CRUDResult
    {
        public bool WasOk { get; set; }
    }
    public class CRUDResult<T> : CRUDResult
    {
        public ICollection<T> Data { get; set; }
        public int Count { get; set; }
    }
}
