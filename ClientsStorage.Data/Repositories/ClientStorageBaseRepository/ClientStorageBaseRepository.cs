using ClientsStorage.Data.Context;
using ClientsStorage.Data.Repositories.GenericRepository;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories
{
    public class ClientStorageBaseRepository<TEntity> : GenericRepository<ClientsStorageDbContext, TEntity> where TEntity : class
    {
        public ClientStorageBaseRepository(ILogger<TEntity> logger, IConfiguration configuration) : base(logger, configuration)
        {
        }
        public ClientStorageBaseRepository(ClientsStorageDbContext context, ILogger<TEntity> logger, IConfiguration configuration) : base(context, logger, configuration)
        {
        }
    }
}
