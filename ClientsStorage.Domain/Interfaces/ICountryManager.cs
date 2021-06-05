using ClientsStorage.Data.Entities;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Interfaces
{
    public interface ICountryManager
    {
        /// <summary>
        /// Get all countries stored in database
        /// </summary>
        /// <returns></returns>
        Task<List<Country>> GetCountries();
    }
}
