/* Exercici 2A - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

//Variable per la imatge
PImage imatge; 

//Simple comptador
int counter;

//INICI SETUP
void setup() {
    imatge = loadImage("grid.png");
    surface.setResizable(true);
    surface.setSize(imatge.width,imatge.height);
}//FI SETUP

//INICI DRAW
void draw() {
   image(imatge, 0, 0);
}//FI DRAW

//INICI CLICAR TECLA
void keyPressed() {
  //Creem un while per no poder clicar M constantment
      while(counter!=1){
        if (key=='m') {
          //100-81 = 19 -> 0.19
          imatge.resize(int(imatge.width*0.19), int(imatge.height*0.19));
        } 
    //Incrementem el comptador
    counter = counter +1;
    }
}//FI CLICAR TECLA