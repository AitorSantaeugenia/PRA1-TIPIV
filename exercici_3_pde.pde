/* Exercici 3 - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

/* Copy de Exercici2.pde v1 */
/*Exemples a https://processing.org/reference/filter_.html */

//Variable per la imatge
PImage imatge; 

//Inici del setup
void setup() {
    //Carregam la imatge del campus
    imatge = loadImage("foto_carnet.png");
    size(1,1);
    surface.setResizable(true);
    
    //SetSize del exercici 2, no influeix si te ínteger o no
    surface.setSize(int(imatge.width), int(imatge.height));
}//Fi del setup

//Inici del draw
void draw() {
    if (frameCount == 1) {
      image(imatge, 0, 0);
    }
    
    switch (key) {
      case 'q': // POSTERITZACIÓ si és Q
        image(imatge, 0, 0);
        filter(POSTERIZE, 2);    //Valors de 2 a 255 - Menors valors = millor
        break;
      case 'w': // DILATACIÓ si és W
        image(imatge, 0, 0);
        filter(DILATE);  
        break;
      case 'e': // EROSIO si és E
        image(imatge, 0, 0);
        filter(ERODE);
        break;
      case 'r': // INVERSIÓ si és R
        image(imatge, 0, 0);
        filter(INVERT);
        break;
     case 'z': // IMATGE ORIGINAL si és Z
        image(imatge, 0, 0);
        break;
    }
}//Fi del draw