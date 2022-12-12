using System.Security.AccessControl;

namespace EFLiveDemo.DAL;

public class Hero
{
    public int Id { get; set; }
    public string FirstName { get; set; }
    public string LastName { get; set; }
    public string HeroName { get; set; }
    public ICollection<Power> Powers { get; set; } = new List<Power>();

    public Alignment Alignment { get; set; }
}