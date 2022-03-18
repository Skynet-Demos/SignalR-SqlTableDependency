namespace SignalR_SqlTableDependency.Models
{
    public class Customer
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Gender { get; set; }
        public string Mobile { get; set; }
    }

    public class CustomerForGraph
    {
        public string Gender { get; set; }
        public int Customers { get; set; }
    }
}
