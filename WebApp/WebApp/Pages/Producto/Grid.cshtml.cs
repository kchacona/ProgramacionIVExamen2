using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;
using Entity;

namespace WebApp.Pages.Producto
{
    public class GridModel : PageModel
    {
        private readonly IProductoService ProductoService;

        public GridModel(IProductoService ProductoService)
        {
            this.ProductoService = ProductoService;
        }


        public IEnumerable<ProductoEntity> GridList { get; set; } = new List<ProductoEntity>();

        public string Mensaje { get; set; } = "";
        public async Task<IActionResult> OnGet()
        {

            try
            {
                GridList = await ProductoService.Get();

                if (TempData.ContainsKey("Msg"))
                {
                    Mensaje = TempData["Msg"] as string;
                }

                TempData.Clear();

                return Page();

            }
            catch (Exception ex)
            {

               return Content(ex.Message) ;
            }

        }

        public async Task<IActionResult> OnGetEliminar(int? id)
        {

            try
            {
                var result = await ProductoService.Delete( new ProductoEntity { IdProducto = id});

                if (result.CodeError!=0)
                {
                    throw new Exception(result.MsgError);
                }

                TempData["Msg"] = "<input type='text' id='mens' value='Registro Eliminado Correctamente' hidden></input> <br//>"; ;

                return Redirect("Grid");
        

            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }

        }
    }
}
