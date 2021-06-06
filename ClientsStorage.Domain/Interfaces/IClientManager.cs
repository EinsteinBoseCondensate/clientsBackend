
using ClientsStorage.Data.Entities;
using ClientsStorage.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Interfaces
{
    public interface IClientManager
    {
        Task<List<ClientDTO>> GetClients(ClientFilterDTO dto);
        Task<CRUDResult> DeleteClient(string userId);
        Task<CRUDResult> EditClient(ClientDTO dto);
        Task<CRUDResult> CreateClient(ClientDTO dto);
    }
}
