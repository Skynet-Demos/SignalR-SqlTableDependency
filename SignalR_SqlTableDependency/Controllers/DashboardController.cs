using Microsoft.AspNetCore.Mvc;

namespace SignalR_SqlTableDependency.Controllers
{
    public class DashboardController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
