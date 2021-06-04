using ClientsStorage.Data.Context;
using ClientsStorage.Data.Entities;
using ClientsStorage.Data.Repositories;
using ClientsStorage.Data.Repositories.CountryRepository;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CountrysStorage.Data.Repositories.CountryRepository
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
