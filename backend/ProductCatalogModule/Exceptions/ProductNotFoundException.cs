namespace Backend.ProductCatalogModule;

public class ProductNotFoundException : Exception
{
    public ProductNotFoundException(Guid id) : base($"Product with id {id} was not found.")
    {
    }
}