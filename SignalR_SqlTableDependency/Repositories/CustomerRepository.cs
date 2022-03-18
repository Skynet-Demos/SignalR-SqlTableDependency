using SignalR_SqlTableDependency.Models;
using System.Data;
using System.Data.SqlClient;

namespace SignalR_SqlTableDependency.Repositories
{
    public class CustomerRepository
    {
        string connectionString;

        public CustomerRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<Customer> GetCustomers()
        {
            List<Customer> persons = new List<Customer>();
            Customer customer;

            var data = GetCustomerDetailsFromDb();

            foreach (DataRow row in data.Rows)
            {
                customer = new Customer
                {
                    Id = Convert.ToInt32(row["Id"]),
                    Name = row["Name"].ToString(),
                    Gender = row["Gender"].ToString(),
                    Mobile = row["Mobile"].ToString()
                };
                persons.Add(customer);
            }

            return persons;
        }

        private DataTable GetCustomerDetailsFromDb()
        {
            var query = "SELECT Id, Name, Gender, Mobile FROM Customer";
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            dataTable.Load(reader);
                        }
                    }

                    return dataTable;
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        public List<CustomerForGraph> GetCustomersForGraph()
        {
            List<CustomerForGraph> customersForGraph = new List<CustomerForGraph>();
            CustomerForGraph customerForGraph;

            var data = GetCustomersForGraphFromDb();

            foreach (DataRow row in data.Rows)
            {
                customerForGraph = new CustomerForGraph
                {
                    Gender = row["Gender"].ToString(),
                    Customers = Convert.ToInt32(row["Customers"])
                };
                customersForGraph.Add(customerForGraph);
            }

            return customersForGraph;
        }

        private DataTable GetCustomersForGraphFromDb()
        {
            var query = "SELECT Gender, COUNT(Id) Customers FROM Customer GROUP BY Gender";
            DataTable dataTable = new DataTable();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();
                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            dataTable.Load(reader);
                        }
                    }

                    return dataTable;
                }
                catch (Exception ex)
                {
                    throw;
                }
                finally
                {
                    connection.Close();
                }
            }
        }
    }
}
