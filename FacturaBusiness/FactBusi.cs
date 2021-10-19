using FacturaDal;
using FacturaDto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FacturaBusiness
{
    public class FactBusi
    {
        DalFactura factu = new DalFactura();

        public int crearFactura(FacturaaDto reg)
        {
            try
            {
                return factu.creaFactura(reg);
            }
            catch (Exception Ex)
            {

                return 0;
            }
        }

        public int editaFactura(int id, FacturaaDto reg)
        {
            try
            {
                return factu.actufactu(id, reg);
            }
            catch (Exception Ex)
            {

                return 0;
            }
        }

        public List<FacturaMostrar> getFacturas()
        {
            try
            {
                return factu.getFacturas();
            }
            catch (Exception Ex)
            {

                return new List<FacturaMostrar>();
            }
        }

        public int delFactura(int id)
        {
            try
            {
                return factu.elimfactu(id);
            }
            catch (Exception Ex)
            {

                return 0;
            }
        }

        public FacturaMostrar getFactById(int id)
        {
            try
            {
                return factu.getFactById(id);
            }
            catch (Exception Ex)
            {

                return new FacturaMostrar();
            }
        }
    }
}
