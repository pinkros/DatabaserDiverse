namespace EFLiveDemo.DAL;

public class Power
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Level { get; set; }
    public string Description { get; set; }

    //många-till-många
    public ICollection<Hero> Heroes { get; set; } = new List<Hero>();

    //en-till-många
    //public Hero Hero { get; set; }
}