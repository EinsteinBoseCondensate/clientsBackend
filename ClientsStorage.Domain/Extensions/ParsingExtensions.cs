using ClientsStorage.Data.Entities;
using ClientsStorage.Domain.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
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
                Gender = (Gender)dto.Gender,
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
            client.Gender = (Gender)dto.Gender;
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
                Gender = (int)client.Gender,
                Name = client.Name,
                PostalCode = client.PostalCode,
                Surname = client.Surname
            };
        }
        public static Expression<Func<Client, bool>> ToExpression(this ClientFilterDTO client)
        {
            Expression<Func<Client, bool>> expressionResult = c => true;
            if (!string.IsNullOrEmpty(client.Name?.Trim()))
                expressionResult = expressionResult.And(client.GetNameLambda());
            if (!string.IsNullOrEmpty(client.Surname?.Trim()))
                expressionResult = expressionResult.And(client.GetSurnameLambda());
            if (!string.IsNullOrEmpty(client.PostalCode?.Trim()))
                expressionResult = expressionResult.And(client.GetPostalCodeLambda());
            if (client.Gender >= 0 || client.Gender <= (int)Gender.Ambiguous)
                expressionResult = expressionResult.And(client.GetGenderLambda());
            if (!string.IsNullOrEmpty(client.CountryId?.Trim()))
                expressionResult = expressionResult.And(client.GetCountryLambda());
            if (!string.IsNullOrEmpty(client.Address?.Trim()))
                expressionResult = expressionResult.And(client.GetAddressLambda());
            if (client.From != default && client.From != null)
                expressionResult = expressionResult.And(client.GetFromDateOfBirthLambda());
            if (client.To != default && client.To != null)
                expressionResult = expressionResult.And(client.GetToDateOfBirthLambda());
            return expressionResult;
        }

        private static Expression<Func<Client, bool>> GetNameLambda(this ClientFilterDTO client) => x => x.Name == client.Name;
        private static Expression<Func<Client, bool>> GetSurnameLambda(this ClientFilterDTO client) => x => x.Surname == client.Surname;
        private static Expression<Func<Client, bool>> GetPostalCodeLambda(this ClientFilterDTO client) => x => x.PostalCode == client.PostalCode;
        private static Expression<Func<Client, bool>> GetAddressLambda(this ClientFilterDTO client) => x => x.Address == client.Address;
        private static Expression<Func<Client, bool>> GetCountryLambda(this ClientFilterDTO client) => x => x.Country.Id == Guid.Parse(client.CountryId);
        private static Expression<Func<Client, bool>> GetToDateOfBirthLambda(this ClientFilterDTO client) => x => x.DateOfBirth <= client.To;
        private static Expression<Func<Client, bool>> GetFromDateOfBirthLambda(this ClientFilterDTO client) => x => x.DateOfBirth >= client.From;
        private static Expression<Func<Client, bool>> GetGenderLambda(this ClientFilterDTO client) => x => x.Gender == (Gender)client.Gender;
    }
}
