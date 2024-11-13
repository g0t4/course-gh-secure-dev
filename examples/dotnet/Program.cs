// json parser
var json = System.IO.File.ReadAllText("data.json");
var data = Newtonsoft.Json.JsonConvert.DeserializeObject<dynamic>(json);

Console.WriteLine(data.name);
Console.WriteLine(data.age);
Console.WriteLine(data.address.city);
Console.WriteLine(data.address.state);
