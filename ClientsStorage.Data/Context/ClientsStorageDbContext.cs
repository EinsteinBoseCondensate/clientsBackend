using ClientsStorage.Data.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Context
{
    public class ClientsStorageDbContext : DbContext
    {
        public ClientsStorageDbContext() : base()
        {

        }
        public ClientsStorageDbContext(DbContextOptions<ClientsStorageDbContext> opts) : base(opts)
        {
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Client>()
                .HasOne(s => s.Country).WithMany().OnDelete(DeleteBehavior.Restrict);
        }
    }
}
