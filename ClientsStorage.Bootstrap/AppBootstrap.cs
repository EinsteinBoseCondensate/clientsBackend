using ClientsStorage.Data;
using ClientsStorage.Data.Context;
using ClientsStorage.Data.Repositories.ClientRepository;
using ClientsStorage.Data.Repositories.CountryRepository;
using ClientsStorage.Domain.Implementations;
using ClientsStorage.Domain.Interfaces;
using CountrysStorage.Data.Repositories.CountryRepository;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using System;

namespace ClientsStorage.Bootstrap
{
    public static class AppBootstrap
    {
        public static IServiceCollection InjectLoggerProvider(this IServiceCollection services)
        {
            services.AddSingleton<ILoggerProvider, Log4NetOwnWrapper.Log4netLoggerProvider>();
            return services;
        }
        public static IServiceCollection InjectDataProviders(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<ClientsStorageDbContext>(option => option.UseSqlServer(configuration.Get<AppConfig>().ConnectionStrings.ClientStorage));
            services.AddTransient<IClientRepository, ClientRepository>();
            services.AddTransient<ICountryRepository, CountryRepository>();
            services.AddTransient<IClientManager, ClientManager>();

            return services;
        }
    }
}
