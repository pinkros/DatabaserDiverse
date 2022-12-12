using Microsoft.EntityFrameworkCore;

namespace EFLiveDemo.DAL;

public class HeroContext : DbContext
{
    public DbSet<Hero> Heroes { get; set; }

    public DbSet<Power> Powers { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);

        //Connection string från SQL Server Explorer, skriv in Initial Catalog manuellt (namn = DB namn)
        optionsBuilder.UseSqlServer("Data Source=LAPTOP-MRHJ7U09;Initial Catalog=HeroDb;Integrated Security=True;Connect Timeout=30;Encrypt=False;TrustServerCertificate=False;ApplicationIntent=ReadWrite;MultiSubnetFailover=False");

        //I Package manager console: först add-migration [förslagsvis "init"], sen update-database för att skapa DB.
    }
}