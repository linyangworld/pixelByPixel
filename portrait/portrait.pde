import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture ourVideo; 
OpenCV opencv;

float[][] kernel = {{ -1, -1, -1}, 
                    { -1,  10, -1}, 
                    { -1, -1, -1}};
PImage img;
                    
void setup() {
  size(1280, 720);
  frameRate(120);
  ourVideo = new Capture(this, width, height); 
  opencv = new OpenCV(this, 1280, 720);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE); 
  ourVideo.start();
  img = loadImage("wow.png"); 
}

void draw() {
  opencv.loadImage(ourVideo);
  Rectangle[] faces = opencv.detect();
  if (ourVideo.available())  ourVideo.read();
  ourVideo.loadPixels();  
  loadPixels();
  
  for (int y = 1; y < ourVideo.height-1; y++) { 
    for (int x = 1; x < ourVideo.width-1; x++) { 
      float sum = 0;
      
      for (int ky = -1; ky <= 1; ky++) {
        for (int kx = -1; kx <= 1; kx++) {
          int pos = (y + ky)*ourVideo.width + (x + kx);
          float val = red(ourVideo.pixels[pos]);
          sum += kernel[ky+1][kx+1] * val;
        }
      }
      
      if (sum < 80) { 
        pixels[y*ourVideo.width + x] = color(sum, sum, sum);
      } else {
        pixels[y*ourVideo.width + x] = color(255, 255, 255);
      }
      
    }
  } 
  updatePixels();
  
  for(int i =0; i < faces.length; i++) {
    image(img, faces[i].x-200, faces[i].y-50);
  }

  println (frameRate);
}