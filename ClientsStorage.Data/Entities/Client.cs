using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ClientsStorage.Data.Entities
{
    public class Client
    {
        [System.ComponentModel.DataAnnotations.Key]
        public Guid Id { get; set; }
        [System.ComponentModel.DataAnnotations.MaxLength(50)]
        public string Name { get; set; }
        [System.ComponentModel.DataAnnotations.MaxLength(50)]
        public string Surname { get; set; }
        public Gender Gender { get; set; }
        public DateTime DateOfBirth { get; set; }
        [System.ComponentModel.DataAnnotations.MaxLength(100)]
        public string Address { get; set; }
        public virtual Country Country { get; set; }
        [System.ComponentModel.DataAnnotations.MaxLength(25)]
        public string PostalCode { get; set; }

    }
    public enum Gender
    {
        Male,
        Female,
        Ambiguous
    }
}
