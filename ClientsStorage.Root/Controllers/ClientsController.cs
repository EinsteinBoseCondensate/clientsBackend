using ClientsStorage.Domain.Interfaces;
using ClientsStorage.Domain.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ClientsStorage.Root.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class ClientsController : ControllerBase
    {


        private readonly ILogger<ClientsController> _logger;
        private readonly IClientManager _clientManager;

        public ClientsController(ILogger<ClientsController> logger, 
            IClientManager clientManager)
        {
            _clientManager = clientManager;
            _logger = logger;
        }

        [HttpGet]
        public async Task<IActionResult> Get()
        {
            return Ok(await _clientManager.GetClients(default));
        }
        [HttpPost]
        public async Task<IActionResult> Create([FromBody]ClientDTO dto)
        {
            return Ok(await _clientManager.CreateClient(dto));
        }
        [HttpPost]
        public async Task<IActionResult> Edit([FromBody] ClientDTO dto)
        {
            return Ok(await _clientManager.EditClient(dto));
        }
        [HttpPost]
        public async Task<IActionResult> Remove([FromBody] ClientDTO dto)
        {
            return Ok(await _clientManager.DeleteClient(dto.Id));
        }

    }
}
