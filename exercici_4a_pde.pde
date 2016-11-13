/* Exercici 4 - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

//Variable per la imatge
PImage imatge; 

//Variable per agafar el color del punt
color puntColor;

//Variable per el text del RGB i valors
String text;

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
  //Imatge del campus carregada
  image(imatge, 0, 0);
  
  //Variable del RGB punt 10,10
  puntColor = get(10,10);
  
  //Format del text i els valors del punt 10,10
  text = "RGB punt (10,10): " + str(int(red(puntColor))) + ", " + str(int(green(puntColor))) + ", " + str(int(blue(puntColor)));
  textSize(18);         //Mida del text
  fill(255,4,4);        //Color vermell
  text(text, 24,380);   //Col·locació del text al mig de la pantalla
}//Fi del draw