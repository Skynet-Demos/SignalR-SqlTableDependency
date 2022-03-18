using SignalR_SqlTableDependency.Models;
using System.Data;
using System.Data.SqlClient;

namespace SignalR_SqlTableDependency.Repositories
{
    public class SaleRepository
    {
        string connectionString;

        public SaleRepository(string connectionString)
        {
            this.connectionString = connectionString;
        }

        public List<Sale> GetSales()
        {
            List<Sale> sales = new List<Sale>();
            Sale sale;

            var data = GetSaleDetailsFromDb();

            foreach (DataRow row in data.Rows)
            {
                sale = new Sale
                {
                    Id = Convert.ToInt32(row["Id"]),
                    Customer = row["Customer"].ToString(),
                    Amount = Convert.ToDecimal(row["Amount"]),
                    PurchasedOn = Convert.ToDateTime(row["PurchasedOn"]).ToString("dd-MM-yyyy")
                };

                sales.Add(sale);
            }

            return sales;
        }

        private DataTable GetSaleDetailsFromDb()
        {
            var query = "SELECT Id, Customer, Amount, PurchasedOn FROM Sale";
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

        public List<SaleForGraph> GetSalesForGraph()
        {
            List<SaleForGraph> salesForGraph = new List<SaleForGraph>();
            SaleForGraph saleForGraph;

            var data = GetSalesForGraphFromDb();

            foreach (DataRow row in data.Rows)
            {
                saleForGraph = new SaleForGraph
                {
                    PurchasedOn = Convert.ToDateTime(row["PurchasedOn"]).ToString("dd//MM"),
                    Amount = Convert.ToDecimal(row["Amount"])
                };

                salesForGraph.Add(saleForGraph);
            }

            return salesForGraph;
        }

        private DataTable GetSalesForGraphFromDb()
        {
            var query = "SELECT PurchasedOn, SUM(Amount) Amount FROM Sale GROUP BY PurchasedOn";
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
