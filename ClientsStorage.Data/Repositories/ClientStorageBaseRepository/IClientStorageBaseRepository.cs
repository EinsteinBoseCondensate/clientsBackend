using ClientsStorage.Data.Context;
using ClientsStorage.Data.Repositories.GenericRepository;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Repositories
{
    public interface IClientStorageBaseRepository<TEntity> : IGenericRepository<ClientsStorageDbContext, TEntity>
    {
    }
}
