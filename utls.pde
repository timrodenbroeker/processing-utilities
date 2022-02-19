// trcc utilities version 1.0.1

import com.hamoid.*;
VideoExport videoExport;

/*
 ------------------------------------------
 Generate Sketchname
 ------------------------------------------
 */

final String sketchname = getClass().getName();

/*
 ------------------------------------------
 Generate timestamp
 ------------------------------------------
 */

String timestamp() {
  int y = year();   // 2003, 2004, 2005, etc.
  int m = month();  // Values from 1 - 12
  int d = day();    // Values from 1 - 31
  int h = hour();   // 2003, 2004, 2005, etc.
  int mi = minute();   // 2003, 2004, 2005, etc.
  int sec = second();
  int mill = millis();

  String val =
    "_" +
    String.valueOf(y) +
    String.valueOf(m) +
    String.valueOf(d) + "_" +
    String.valueOf(h) + "_" +
    String.valueOf(mi) + "_" +
    String.valueOf(sec) + "_" +
    String.valueOf(mill);

  return val;
}

/*
 ------------------------------------------
 record video
 ------------------------------------------
 */

void rec(int rate, int dur) {
  if (frameCount == 1) {
    videoExport = new VideoExport(this, "../"+sketchname+".mp4");
    videoExport.setFrameRate(rate);
    videoExport.startMovie();
  }

  videoExport.saveFrame();

  if (frameCount == dur) {
    exit();
  }
  println(frameCount);
}

/*
 ------------------------------------------
 Generate Thumbnail
 ------------------------------------------
 */

void thumb(int count) {
  if (frameCount ==  count) {
    saveFrame("../" + sketchname + ".png");
  }
}

/*
 ------------------------------------------
 render image sequence
 ------------------------------------------
 */

void rImg(int stop) {
  saveFrame("out/####.png");
  if (frameCount == stop) {
    exit();
  }
}

/*
 ------------------------------------------
 Counter
 ------------------------------------------
 */

int counter = 0;

void count(int modulo, int min, int max, boolean log) {
  if (frameCount % modulo == 0) {
    if (counter >= max) {
      counter = min;
    } else {
      counter++;
    }
  }
  if (log == true) {
    println(counter);
  }
}
