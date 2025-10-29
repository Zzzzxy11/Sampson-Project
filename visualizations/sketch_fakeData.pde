import processing.data.Table;
import processing.data.TableRow;

Table data = new Table();
int totalDays = 14;
int hoursPerDay = 24;
String[] columns = {"day", "hour", "indoorTemp", "outdoorTemp", "indoorHumidity", "outdoorHumidity"};
for (String c : columns) data.addColumn(c);
float indoorTempNoise = random(1000);
float outdoorTempNoise = random(2000);
float indoorHumNoise = random(3000);
float outdoorHumNoise = random(4000);

for (int day = 1; day <= totalDays; day++) {
  for (int hour = 1; hour <= hoursPerDay; hour++) {
    TableRow row = data.addRow();
    row.setInt("day", day);
    row.setInt("hour", hour);
    float indoorTemp = map(noise(indoorTempNoise), 0, 1, 19, 25) + sin(radians(hour * 15)) * 1.5 + (day - 7) * 0.1;
    float outdoorTemp = map(noise(outdoorTempNoise), 0, 1, 15, 28) + sin(radians(hour * 15)) * 2.5 + (day - 7) * 0.2;
    float indoorHum = map(noise(indoorHumNoise), 0, 1, 40, 60) + random(-2, 2);
    float outdoorHum = map(noise(outdoorHumNoise), 0, 1, 60, 80) + random(-3, 3);
    indoorHum = constrain(indoorHum, 30, 70);
    outdoorHum = constrain(outdoorHum, 50, 90);
    row.setFloat("indoorTemp", indoorTemp);
    row.setFloat("outdoorTemp", outdoorTemp);
    row.setFloat("indoorHumidity", indoorHum);
    row.setFloat("outdoorHumidity", outdoorHum);
    indoorTempNoise += 0.03;
    outdoorTempNoise += 0.03;
    indoorHumNoise += 0.03;
    outdoorHumNoise += 0.03;
  }
}

saveTable(data, "sampson-fake-data.csv");
exit();
