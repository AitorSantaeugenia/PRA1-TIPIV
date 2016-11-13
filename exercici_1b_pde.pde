/* Exercici 1B - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

//Variable per la Imatge
PImage imatge; 

//INICI SETUP
void setup() {
  imatge = loadImage("foto_carnet.png");
  surface.setResizable(true);
  surface.setSize(imatge.width,imatge.height);
}//FI SETUP

//INICI DRAW
void draw() {
   if(frameCount == 1) {
    image(imatge, 0, 0);
  }
  
  switch (key) {
  //Clicam la A per escala de grisos
  case 'a': // Escala de grisos
    image(imatge, 0, 0);
    //Apliquem un filtre
    filter(GRAY);
    break;
  //Clicam la S per imatge original
  case 's': // Imatge original
  //Carreguem la imatge normal sense filtre
  image(imatge, 0, 0);
    break;
  }
}//FI DRAW