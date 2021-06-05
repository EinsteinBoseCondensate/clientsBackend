using ClientsStorage.Data.Context;
using ClientsStorage.Data.Entities;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace ClientsStorage.Data.Repositories.CountryRepository
{
    public class CountryRepository : ClientStorageBaseRepository<Country>, ICountryRepository
    {
        public CountryRepository(ILogger<Country> logger, IConfiguration configuration) : base(logger, configuration)
        {
        }
        public CountryRepository(ClientsStorageDbContext context, ILogger<Country> logger, IConfiguration configuration) : base(context, logger, configuration)
        {
        }
    }
}
