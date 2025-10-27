Table data = new Table();

void setup() {
  int numberOfStations = 3;
  int hoursInDay = 24;

  String[] columns = {"timestamp", "station id", "temperature (C)", "humidity (%)"};
  for (String c : columns) data.addColumn(c);

  for (int i = 0; i < hoursInDay; i++) {
    for (int j = 0; j < numberOfStations; j++) {
      TableRow r = data.addRow();
      String timestamp = "2025-10-27 " + nf(i, 2) + ":00";
      r.setString("timestamp", timestamp);
      r.setInt("station id", j + 1);
      float baseTemp = 20 + j * 0.8;
      float temperature = baseTemp + random(-1.5, 1.5);
      r.setFloat("temperature (C)", temperature);
      float humidity = random(35, 60);
      r.setFloat("humidity (%)", humidity);
    }
  }

  saveTable(data, "sampson-fake-data.csv");
  exit();
}
