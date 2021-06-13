using ClientsStorage.Data.Repositories.ClientRepository;
using ClientsStorage.Data.Repositories.CountryRepository;
using ClientsStorage.Domain.Extensions;
using ClientsStorage.Domain.Interfaces;
using ClientsStorage.Domain.Models;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Implementations
{
    public class ClientManager : IClientManager
    {
        private readonly IClientRepository _clientRepository;
        private readonly ICountryRepository _countryRepository;
        private readonly ILogger<ClientManager> _logger;
        public ClientManager(IClientRepository clientRepository,
            ICountryRepository countryRepository,
            ILogger<ClientManager> logger)
        {
            _clientRepository = clientRepository;
            _countryRepository = countryRepository;
            _logger = logger;
        }

        public async Task<CRUDResult> CreateClient(ClientDTO dto)
        {

            try
            {
                bool result = false;
                if (dto.IsValidToCreate())
                {
                    var country = await _countryRepository.GetFirstOrDefaultBy(c => c.Id == Guid.Parse(dto.CountryId));
                    if (country != null && country != default)
                    {
                        _clientRepository.InsertEntry(dto.ToNewClient(country));
                        result = (await _clientRepository.SaveChangesAsync()) == Data.Repositories.GenericRepository.SaveChangesState.OK;
                    }
                }
                return new CRUDResult
                {
                    WasOk = result
                };

            }
            catch (Exception e)
            {
                _logger?.LogError(e, $"Exception creating client for dto: {JsonConvert.SerializeObject(dto)}");
                throw;
            }
        }


        public async Task<CRUDResult> DeleteClient(string userId)
        {
            bool result = false;
            try
            {
                var client = await _clientRepository.GetFirstOrDefaultBy(c => c.Id == Guid.Parse(userId));
                if (client != null && client != default)
                {
                    _clientRepository.RemoveEntry(client);
                    result = (await _clientRepository.SaveChangesAsync()) == Data.Repositories.GenericRepository.SaveChangesState.OK;
                }
            }
            catch (Exception e)
            {
                _logger?.LogError(e, $"Exception removing client for userId: {userId}");
                throw;
            }
            return new CRUDResult
            {
                WasOk = result
            };
        }

        public async Task<CRUDResult> EditClient(ClientDTO dto)
        {
            bool result = false;
            try
            {
                if (dto.IsValidToEdit())
                {
                    var client = await _clientRepository.GetFirstOrDefaultBy(c => c.Id == Guid.Parse(dto.Id));
                    var country = await _countryRepository.GetFirstOrDefaultBy(c => c.Id == Guid.Parse(dto.CountryId));
                    if (client != null && client != default && country != null && country != default)
                    {
                        client.UpdateFromDTOAndCountry(dto, country);
                        _clientRepository.UpdateEntry(client);
                        result = (await _clientRepository.SaveChangesAsync()) == Data.Repositories.GenericRepository.SaveChangesState.OK;
                    }
                }
            }
            catch (Exception e)
            {
                _logger?.LogError(e, $"Exception editing client for userId: {JsonConvert.SerializeObject(dto)}");
                throw;
            }
            return new CRUDResult
            {
                WasOk = result
            };
        }

        public async Task<CRUDResult<ClientDTO>> GetClients(ClientFilterDTO dto)
        {
            CRUDResult<ClientDTO> result = new CRUDResult<ClientDTO>();
            var expression = dto.ToExpression();
            try
            {
                result.Data = await _clientRepository.GetManyAndConvertByAfter(
                    expression, 
                    c => c.ToClientDto(), 
                    orderClause: c => c.DateOfBirth,
                    skippedIndex: dto.Skip ?? default, 
                    topResults: dto.Take ?? default, 
                    includes: c => c.Country
                    );
                result.Count = await _clientRepository.SelectAndCountAsync(expression, c => c.Id);
                return result;
            }
            catch (Exception e)
            {
                _logger?.LogError(e, $"Exception getting clients for userId: {JsonConvert.SerializeObject(dto)}");
                throw;
            }
        }
    }
}
