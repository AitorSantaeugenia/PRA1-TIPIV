/* Exercici 1A - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

//Variable Imatge
PImage imatge; 

//INICI SETUP
void setup() {
  imatge = loadImage("foto_carnet.png");
  surface.setResizable(true);
  surface.setSize(imatge.width,imatge.height);
}//FI SETUP

//INICI DRAW
void draw() {
  image(imatge, 0, 0);
}//FI DRAW