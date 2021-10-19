using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FacturaDto
{
    public class FacturaMostrar
    {
        public int IdFactura { get; set; }
        public string NumeroFactura { get; set; }
        public DateTime Fecha { get; set; }
        public string TipodePago { get; set; }
        public string DocumentoCliente { get; set; }
        public string NombreCliente { get; set; }
        public int Subtotal { get; set; }
        public decimal Descuento { get; set; }
        public decimal IVA { get; set; }
        public int TotalDescuento { get; set; }
        public int TotalImpuesto { get; set; }
        public int Total { get; set; }
    }
}
