/**
 * Brightness Thresholding 
 * by Golan Levin. 
 *
 * Determines whether a test location (such as the cursor) is contained within
 * the silhouette of a dark object. 
 */


import processing.video.*;

color black = color(0);
color white = color(255);
int numPixels;
Capture video;

int[] pixelvalue;

void setup() {
  size(640, 480); // Change size to 320 x 240 if too slow at 640 x 480
  strokeWeight(5);
  
  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  
  // Start capturing the images from the camera
  video.start(); 
  
  numPixels = video.width * video.height;
  pixelvalue=new int[numPixels];
  for(int i=0;i<pixelvalue.length;i++){
    pixelvalue[i]=0;
  }
  noCursor();
  smooth();
}

void draw() {
  if (video.available()) {
    int changenum=0;
    video.read();
    video.loadPixels();
    int threshold = 127; // Set the threshold value
    float pixelBrightness; // Declare variable to store a pixel's color
    // Turn each pixel in the video frame black or white depending on its brightness
    loadPixels();
    for (int i = 0; i < numPixels; i++) {
      pixelBrightness = brightness(video.pixels[i]);
      if (pixelBrightness > threshold) { // If the pixel is brighter than the
        pixels[i] = white; // threshold value, make it white
        if(pixelvalue[i]==0){
          changenum++;pixelvalue[i]=1;
        }
      } 
      else { // Otherwise,
        pixels[i] = black; // make it black
        if(pixelvalue[i]==1){
          changenum++;pixelvalue[i]=0;
        }
      }
    }
    updatePixels();
    float changerate=(float)changenum/numPixels;
    println(changerate);
    // Test a location to see where it is contained. Fetch the pixel at the test
    // location (the cursor), and compute its brightness
    int testValue = get(mouseX, mouseY);
    float testBrightness = brightness(testValue);
    if (testBrightness > threshold) { // If the test location is brighter than
      fill(black); // the threshold set the fill to black
    } 
    else { // Otherwise,
      fill(white); // set the fill to white
    }
    ellipse(mouseX, mouseY, 20, 20);
  }
}
