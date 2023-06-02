using Backend.ImageUploadModule;
using Azure.Storage.Blobs;
using Azure.Storage.Blobs.Models;
using System.Drawing;

namespace Backend.MockImplementations;

public class MockImageUploadService : IImageStorageService
{
   // private readonly IConfiguration _configuration;
   // public MockImageUploadService(IConfiguration config)
   // {
   //         _configuration = config;
   // }
    public async Task<string> UploadImageAsync(Guid imageId, Stream imageStream)
    {
        var blobServiceClient = new BlobServiceClient("DefaultEndpointsProtocol=https;AccountName=mystorageaccount2712156;AccountKey=MjU0hIurewGF3xWzPtPAiTzVHa3ESsQbCnVNO7uiBew7EveEurQTfqUByD3/Iymp0npwq1vvcF/6+AStgaoN+g==;EndpointSuffix=core.windows.net");
        BlobContainerClient containerClient = blobServiceClient.GetBlobContainerClient("mycontainer");

        BlobClient blobClient = containerClient.GetBlobClient($"{imageId.ToString()}.jpg");
        await blobClient.UploadAsync(imageStream, true);
        return imageId.ToString() + ".jpg";
    }
}