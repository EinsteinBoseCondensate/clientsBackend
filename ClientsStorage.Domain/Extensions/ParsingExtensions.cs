using ClientsStorage.Data.Entities;
using ClientsStorage.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Domain.Extensions
{
    public static class ParsingExtensions
    {
        public static Client ToNewClient(this ClientDTO dto, Country country)
        {
            return new Client
            {
                Id = Guid.NewGuid(),
                Address = dto.Address,
                Country = country,
                DateOfBirth = dto.DateOfBirth,
                Gender = dto.Gender,
                Name = dto.Name,
                PostalCode = dto.PostalCode,
                Surname = dto.Surname
            };
        }
        public static void UpdateFromDTOAndCountry(this Client client, ClientDTO dto, Country country)
        {

            client.Address = dto.Address;
            client.Country = country;
            client.DateOfBirth = dto.DateOfBirth;
            client.Gender = dto.Gender;
            client.Name = dto.Name;
            client.PostalCode = dto.PostalCode;
            client.Surname = dto.Surname;

        }
        public static ClientDTO ToClientDto(this Client client)
        {
            return new ClientDTO
            {
                Id = client.Id.ToString(),
                Address = client.Address,
                CountryId = client.Country.Id.ToString(),
                DateOfBirth = client.DateOfBirth,
                Gender = client.Gender,
                Name = client.Name,
                PostalCode = client.PostalCode,
                Surname = client.Surname
            };
        }
    }
}
