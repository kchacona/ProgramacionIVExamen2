using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entity
{
    public class OrdenEntity
    {
        public int? IdOrden { get; set; }
        public int? IdProducto { get; set; }
        public int CantidadProducto { get; set; }
        public Boolean Estado { get; set; }
    }
}
