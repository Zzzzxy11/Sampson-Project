import processing.data.Table;
import processing.data.TableRow;

Table data = new Table();
int totalDays = 7;
int hoursPerDay = 24;
int[] rooms = {204,205,206,207,208,209,210,211,212,213,214,215,216,217};


String[] columns = {"day", "hour", "room", "indoorTemp", "indoorHumidity", "outdoorTemp", "outdoorHumidity"};
for (String c : columns) data.addColumn(c);

float[] tempNoise = new float[rooms.length];
float[] humNoise = new float[rooms.length];
for (int i = 0; i < rooms.length; i++) {
  tempNoise[i] = random(1000);
  humNoise[i] = random(2000);
}

for (int day = 1; day <= totalDays; day++) {
  for (int i = 0; i < rooms.length; i++) {
    int room = rooms[i];
    for (int hour = 1; hour <= hoursPerDay; hour++) {
      TableRow row = data.addRow();
      row.setInt("day", day);
      row.setInt("hour", hour);
      row.setInt("room", room);


      float temp = map(noise(tempNoise[i]), 0, 1, 18, 26) + sin(radians(hour * 15)) * 2;
      float hum = map(noise(humNoise[i]), 0, 1, 40, 70) + random(-2, 2);
      row.setFloat("indoorTemp", constrain(temp, 16, 28));
      row.setFloat("indoorHumidity", constrain(hum, 35, 75));


      float outdoorTemp = temp - random(2, 5);  
      float outdoorHum = hum + random(5, 10);  
      row.setFloat("outdoorTemp", constrain(outdoorTemp, 10, 30));
      row.setFloat("outdoorHumidity", constrain(outdoorHum, 30, 95));

      tempNoise[i] += 0.03;
      humNoise[i] += 0.03;
    }
  }
}

saveTable(data, "sampson-week-data.csv");
exit();
