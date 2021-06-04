using ClientsStorage.Data.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories.CountryRepository
{
    public interface ICountryRepository : IClientStorageBaseRepository<Country>
    {
    }
}
