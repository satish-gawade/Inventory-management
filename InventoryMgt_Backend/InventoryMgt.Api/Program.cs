using InventoryMgt.Api.Extensions;  // This line must be included
using InventoryMgt.Api.Middlewares;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.RegisterServices(); // <--- updated line
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();
app.UseCors();
app.UseAuthorization();
app.ConfigureExceptionMiddleware();
app.MapControllers();

app.Run();
