using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using WBL;
using Entity;

namespace WebApp.Pages.TipoInquilino
{
    public class GridModel : PageModel
    {
        private readonly ITipoInquilinoService TipoInquilinoService;

        public GridModel(ITipoInquilinoService TipoInquilinoService)
        {
            this.TipoInquilinoService = TipoInquilinoService;
        }


        public IEnumerable<TipoInquilinoEntity> GridList { get; set; } = new List<TipoInquilinoEntity>();

        public string Mensaje { get; set; } = "";
        public async Task<IActionResult> OnGet()
        {

            try
            {
                GridList = await TipoInquilinoService.Get();

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
                var result = await TipoInquilinoService.Delete( new TipoInquilinoEntity { Id_TipoInquilino = id});

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
