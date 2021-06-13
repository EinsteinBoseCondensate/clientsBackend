using ClientsStorage.Data.Context;
using ClientsStorage.Data.Entities;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories.ClientRepository
{
    public class ClientRepository : ClientStorageBaseRepository<Client>, IClientRepository
    {
        public ClientRepository(ILogger<Client> logger, IConfiguration configuration) : base(logger, configuration)
        {
        }
        public ClientRepository(ClientsStorageDbContext context, ILogger<Client> logger, IConfiguration configuration) : base(context, logger, configuration)
        {
        }
        
    }
}
