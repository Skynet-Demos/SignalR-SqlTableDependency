using Microsoft.AspNetCore.SignalR;
using SignalR_SqlTableDependency.Repositories;

namespace SignalR_SqlTableDependency.Hubs
{
    public class DashboardHub : Hub
    {
        ProductRepository productRepository;
        SaleRepository saleRepository;
        CustomerRepository customerRepository;

        public DashboardHub(IConfiguration configuration)
        {
            var connectionString = configuration.GetConnectionString("DefaultConnection");
            productRepository = new ProductRepository(connectionString);
            saleRepository = new SaleRepository(connectionString);
            customerRepository = new CustomerRepository(connectionString);
        }

        public async Task SendProducts()
        {
            var products = productRepository.GetProducts();
            await Clients.All.SendAsync("ReceivedProducts", products);

            var productsForGraph = productRepository.GetProductsForGraph();
            await Clients.All.SendAsync("ReceivedProductsForGraph", productsForGraph);
        }

        public async Task SendSales()
        {
            var sales = saleRepository.GetSales();
            await Clients.All.SendAsync("ReceivedSales", sales);

            var salesForGraph = saleRepository.GetSalesForGraph();
            await Clients.All.SendAsync("ReceivedSalesForGraph", salesForGraph);
        }

        public async Task SendCustomers()
        {
            var customers = customerRepository.GetCustomers();
            await Clients.All.SendAsync("ReceivedCustomers", customers);

            var customersForGraph = customerRepository.GetCustomersForGraph();
            await Clients.All.SendAsync("ReceivedCustomersForGraph", customersForGraph);
        }
    }
}
