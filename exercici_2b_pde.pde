/* Exercici 2B - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

/* Copy de Exercici2.pde v1 */

//Variable per la imatge
PImage imatge; 

//Simple comptador
int counter;

//INICI SETUP
void setup() {
    counter = 0;
    imatge = loadImage("grid.png");
    size(1,1);
    surface.setResizable(true);
    surface.setSize(int(imatge.width), int(imatge.height));
    //imageMode (CENTER);
}//FI SETUP

//INICI DRAW
void draw() {
   image(imatge, 0, 0);
}//FI DRAW

//INICI CLICAR
void keyPressed() {
    //Creem un while per no poder clicar M constantment
    while(counter!=1){
      if (key=='m') {
        //Feim un resize de la pantalla - NO REALITZAT EN EL 2A
        imatge.resize(int(imatge.width*0.19), int(imatge.height*0.19));
        surface.setResizable(true);
        surface.setSize(int(imatge.width), int(imatge.height));
        
        //Imprimir imatge dins del IF no fora
        image(imatge, 0, 0);
        save("imatge_2b.png");
      }
      //Incrementem el comptador
      counter = counter +1;
      }
    }//FI CLICAR