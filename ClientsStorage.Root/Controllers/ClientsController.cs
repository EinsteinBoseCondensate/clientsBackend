using ClientsStorage.Domain.Interfaces;
using ClientsStorage.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace ClientsStorage.Root.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ClientsController : ControllerBase
    {


        private readonly ILogger<ClientsController> _logger;
        private readonly IClientManager _clientManager;
        private readonly ICountryManager _countryManager;

        public ClientsController(ILogger<ClientsController> logger,
            IClientManager clientManager,
            ICountryManager countryManager)
        {
            _clientManager = clientManager;
            _countryManager = countryManager;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            try
            {
                return Ok(await _clientManager.GetClients(default));
            }
            catch//Manager logs the exception and rethrows it
            {
                return BadRequest("Server error");
            }
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] ClientDTO dto)
        {
            try
            {
                return Ok(await _clientManager.CreateClient(dto));
            }
            catch//Manager logs the exception and rethrows it
            {
                return BadRequest("Server error");
            }
        }
        [HttpPut]
        public async Task<IActionResult> Edit([FromBody] ClientDTO dto)
        {
            try
            {
                return Ok(await _clientManager.EditClient(dto));
            }
            catch//Manager logs the exception and rethrows it
            { 
                return BadRequest("Server error");
            }
        }
        [HttpDelete("{id}")]
        public async Task<IActionResult> Remove(string id)
        {
            try
            {
                return Ok(await _clientManager.DeleteClient(id));
            }
            catch//Manager logs the exception and rethrows it
            { 
                return BadRequest("Server error");
            }
        }

        [HttpGet("countries")]
        public async Task<IActionResult> GetCountries()
        {
            try
            {
                return Ok(await _countryManager.GetCountries());
            }
            catch (Exception e)
            {
                _logger.LogError(e, "Error while fetching countries");
                return BadRequest("Server error");
            }
        }

    }
}
