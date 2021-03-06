using ClientsStorage.Domain.Interfaces;
using ClientsStorage.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Net;
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

        [HttpPost("get")]
        public async Task<IActionResult> Get([FromBody] ClientFilterDTO dto)
        {
            try
            {
                return Ok(await _clientManager.GetClients(dto));
            }
            catch//Manager logs the exception and rethrows it
            {
                return StatusCode((int)HttpStatusCode.InternalServerError, "Server error");
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
                return StatusCode((int)HttpStatusCode.InternalServerError, "Server error");
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
                return StatusCode((int)HttpStatusCode.InternalServerError, "Server error");
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
                return StatusCode((int)HttpStatusCode.InternalServerError, "Server error");
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
                return StatusCode((int)HttpStatusCode.InternalServerError, "Server error");
            }
        }

    }
}
