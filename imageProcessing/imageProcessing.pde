int R, G, B, A;
PImage ourImage;
float t;

void setup() {
  size(2000, 1210);
  frameRate(120);
  ourImage = loadImage("landscape.jpg");
  ourImage.resize (width, height);  
  ourImage.loadPixels();

  t = 0;
}
void draw() {
  background(0);
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      PxPGetPixel(x, y, ourImage.pixels, width);

      int posterizeAmount = int(map(noise(t), 0, 1, 20, width - 20));           
      if ((R+G+B) % posterizeAmount < posterizeAmount/2) {    
        R=255;
        G=(R+G+B)/3;
        B=(R+G+B)/3;                                          
      } else {                                        
        R=0;
        G=(R+G+B)/3;
        B=(R+G+B)/3;                                        
      } 

      PxPSetPixel(x, y, R, G, B, 255, pixels, width);
    }
  }
  updatePixels();
  println (frameRate);
  t += 0.01;
}

void PxPGetPixel(int x, int y, int[] pixelArray, int pixelsWidth) {
  int thisPixel = pixelArray[x + y * pixelsWidth];
  A = (thisPixel >> 24) & 0xFF;
  R = (thisPixel >> 16) & 0xFF;
  G = (thisPixel >> 8) & 0xFF;
  B = thisPixel & 0xFF;
}

void PxPSetPixel(int x, int y, int r, int g, int b, int a, int[] pixelArray, int pixelsWidth) {
  a = a << 24; 
  r = r << 16; 
  g = g << 8;
  color argb = a | r | g | b;
  pixelArray[x+y*pixelsWidth]= argb;
}
