import processing.data.Table;
import processing.data.TableRow;

Table data = new Table();

void setup() {
  int hoursInDay = 24;

  String[] columns = {"timestamp", "station id", "temperature (C)", "humidity (%)"};
  for (String c : columns) data.addColumn(c);

  for (int i = 1; i <= hoursInDay; i++) {
    TableRow r = data.addRow();
    r.setInt("timestamp", i);        
    r.setInt("station id", 0);       
    float temperature = 20 + random(-2, 2);
    r.setFloat("temperature (C)", temperature);
    float humidity = random(40, 60);
    r.setFloat("humidity (%)", humidity);
  }

  saveTable(data, "fake-data.csv");
  println("✅ simple-fake-data.csv saved!");
  exit();
}
