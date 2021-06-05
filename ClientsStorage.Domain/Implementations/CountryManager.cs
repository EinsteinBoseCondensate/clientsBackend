using ClientsStorage.Data.Entities;
using ClientsStorage.Data.Repositories.CountryRepository;
using ClientsStorage.Domain.Interfaces;
using Microsoft.Extensions.Logging;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Implementations
{
    public class CountryManager : ICountryManager
    {
        private readonly ICountryRepository _countryRepository;
        private readonly ILogger<ClientManager> _logger;
        public CountryManager(
            ICountryRepository countryRepository,
            ILogger<ClientManager> logger)
        {
            _countryRepository = countryRepository;
            _logger = logger;
        }

        /// <inheritdoc/>
        public async Task<List<Country>> GetCountries()
        {
            return (await _countryRepository.GetManyBy(u => true)).ToList();
        }
    }
}
