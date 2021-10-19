
using FacturaBusiness;
using FacturaDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace ProyectoLibros.Controllers
{
    [RoutePrefix("api/Factura")]
    public class FacturaController : ApiController
    {
        private FactBusi _fact = new FactBusi();

        [HttpGet]
        [Route("getFacturas")]
        public List<FacturaMostrar> getFacturas()
        {
           
            try
            {

                return _fact.getFacturas();
            }
            catch (Exception Ex)
            {

                return new List<FacturaMostrar>();
            }
        }

        [HttpGet]
        [Route("getFactById")]
        public FacturaMostrar getFacturaById(int id)
        {
            try
            {
                var ee = _fact.getFactById(id);
                return ee;
            }
            catch (Exception Ex)
            {

                return new FacturaMostrar();
            }
        }

        [HttpPost]
        [Route("addFactura")]
        public int addAutor(FacturaaDto reg)
        {
            try
            {
                return _fact.crearFactura(reg);
            }
            catch (Exception)
            {

                throw;
            }
        }

        [HttpPut]
        [Route("updaFact")]
        public int actuFactura(int id, FacturaaDto reg)
        {
            try
            {
                return _fact.editaFactura(id, reg);
            }
            catch (Exception Ex)
            {

                return 0;
            }
        }

        [HttpDelete]
        [Route("delFactura")]
        public int delFactura(int id)
        {
            try
            {
                return _fact.delFactura(id);
            }
            catch (Exception)
            {

                throw;
            }
        }
        
    }
}
