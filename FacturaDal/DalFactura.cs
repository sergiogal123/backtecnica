using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FacturaDto;
using System.Threading.Tasks;

namespace FacturaDal
{
    public class DalFactura
    {
        ///         
        public int creaFactura(FacturaaDto reg)
        {
            try
            {
                using(ModeloFacturaDataContext contex = new ModeloFacturaDataContext())
                {
                    var result = (from f in contex.sp_creaFactura(reg.NumeroFactura, reg.Fecha, reg.TipodePago, reg.DocumentoCliente, reg.NombreCliente, reg.Subtotal, reg.Descuento, reg.IVA, reg.TotalDescuento, reg.TotalImpuesto, reg.Total)
                                  select f).FirstOrDefault();
                    //contex.SubmitChanges();
                    return result.IdFactura;
                }
            }
            catch (Exception Ex)
            {

                return 0;
            }
        }

        /// <summary>
        /// Este procedimiento actuliza la factura
        /// </summary>
        /// <param name="id"></param>
        /// <param name="reg"></param>
        /// <returns> 1 si es exitoso, 0 no exitoso </returns>
        public int actufactu(int id, FacturaaDto reg)
        {
            try
            {
                using (ModeloFacturaDataContext contex = new ModeloFacturaDataContext())
                {
                    var resultado = (from w in contex.sp_editFactura(id, reg.NumeroFactura, reg.Fecha, reg.TipodePago, reg.DocumentoCliente, reg.NombreCliente, reg.Subtotal, reg.Descuento, reg.IVA, reg.TotalDescuento, reg.TotalImpuesto, reg.Total)
                                     select w).FirstOrDefault();
                    return Convert.ToInt32( resultado.Result);
                }
            }
            catch (Exception)
            {

                return 0;
            }
        }

        /// <summary>
        /// Retorna todas las facturas guardadas en el sistema
        /// </summary>
        /// <returns></returns>
        public List<FacturaMostrar> getFacturas()
        {
            
            try
            {
                using (ModeloFacturaDataContext contex = new ModeloFacturaDataContext())
                {
                    List<FacturaMostrar> result = (from b in contex.sp_getFacturas()
                                                   select new FacturaMostrar()
                                                   {
                                                       IdFactura = b.IdFactura,
                                                       NumeroFactura = b.NumeroFactura,
                                                       Fecha = Convert.ToDateTime( b.Fecha), 
                                                       TipodePago = b.TipodePago,
                                                       DocumentoCliente = b.DocumentoCliente, 
                                                       NombreCliente = b.NombreCliente,
                                                       Subtotal = Convert.ToInt32( b.Subtotal),
                                                       Descuento = Convert.ToDecimal( b.Descuento), 
                                                       IVA = Convert.ToDecimal(b.IVA),
                                                       TotalDescuento = Convert.ToInt32( b.TotalDescuento),
                                                       TotalImpuesto = Convert.ToInt32(b.TotalImpuesto), 
                                                       Total = Convert.ToInt32(b.Total)
                                                   }).ToList();
                    return result;
                }
            }
            catch (Exception r)
            {

                return new List<FacturaMostrar>();
            }
        }


        /// <summary>
        /// Devuelve una factura en especifico de acuerdo al ID
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public FacturaMostrar getFactById(int id)
        {

            try
            {
                using (ModeloFacturaDataContext contex = new ModeloFacturaDataContext())
                {
                    FacturaMostrar reg = (from t in contex.sp_getFactbyId(id)
                                          select new FacturaMostrar()
                                          {
                                              IdFactura = t.IdFactura,
                                              NumeroFactura = t.NumeroFactura,
                                              Fecha = Convert.ToDateTime(t.Fecha),
                                              TipodePago = t.TipodePago,
                                              DocumentoCliente = t.DocumentoCliente,
                                              NombreCliente = t.NombreCliente,
                                              Subtotal = Convert.ToInt32(t.Subtotal),
                                              Descuento = Convert.ToDecimal(t.Descuento),
                                              IVA = Convert.ToDecimal(t.IVA),
                                              TotalDescuento = Convert.ToInt32(t.TotalDescuento),
                                              TotalImpuesto = Convert.ToInt32(t.TotalImpuesto),
                                              Total = Convert.ToInt32(t.Total)
                                          }).FirstOrDefault();
                    return reg;
                }
            }
            catch (Exception y)
            {

                throw;
            }
        }


        /// <summary>
        /// Elimina una Factura de acuerdo al Id
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public int elimfactu(int id)
        {
            try
            {
                using (ModeloFacturaDataContext contex = new ModeloFacturaDataContext())
                {
                    var resultado = (from w in contex.sp_delFactura(id)
                                     select w).FirstOrDefault();
                    return Convert.ToInt32(resultado.Result);
                }
            }
            catch (Exception g)
            {

                return 0;
            }
        }
    }
}
