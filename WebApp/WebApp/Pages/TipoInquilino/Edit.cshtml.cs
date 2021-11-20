using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Entity;
using WBL;

namespace WebApp.Pages.TipoInquilino
{
    public class EditModel : PageModel
    {
        private readonly ITipoInquilinoService TipoInquilinoService;

        public EditModel(ITipoInquilinoService TipoInquilinoService)
        {
            this.TipoInquilinoService = TipoInquilinoService;
        }

        [BindProperty]
        public TipoInquilinoEntity Entity { get; set; } = new TipoInquilinoEntity();

        [BindProperty(SupportsGet = true)]
        public int? id { get; set; }


        public async Task<IActionResult> OnGet()
        {

            try
            {
                if (id.HasValue)
                {
                    Entity = await TipoInquilinoService.GetById(new() { Id_TipoInquilino = id });
                }

                return Page();
            }
            catch (Exception ex)
            {

                return Content(ex.Message);
            }

        }

        public async Task<IActionResult> OnPostAsync()
        {

            try
            {
                if (Entity.Id_TipoInquilino.HasValue)
                {
                    //Actualizar 
                    var result = await TipoInquilinoService.Update(Entity);

                    if (result.CodeError != 0) throw new Exception(result.MsgError);
                    TempData["Msg"] = "<input type='text' id='mens' value='Registro Modificado Correctamente' hidden></input><br/>";
                }
                else
                {
                    //Nuevo 
                    var result = await TipoInquilinoService.Create(Entity);

                    if (result.CodeError != 0) throw new Exception(result.MsgError);
                    TempData["Msg"] = "<input type='text' id='mens' value='Registro Agregado Correctamente' hidden></input><br/>";

                }

                return RedirectToPage("Grid");
            }



            catch (Exception ex)
            {

                return Content(ex.Message);
            }

        }




    }
}
