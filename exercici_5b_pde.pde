/* Exercici 5 - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/

/* EXEMPLE CONVULSION A PROCESSING.ORG
https://processing.org/examples/convolution.html*/

//Variable per la imatge original i la imatge amb el filtre de la matriu
PImage imgOriginal;
PImage imgFilter;

//Imatge fake per el Menu al clicar Z
PImage fakeImage;

//Variable per el text
String text;


/* REALÇAMENT DE CONTORNS */
//---------------------------------------------------------------------------
// Mascara per realçar contorns expressada com a matriu
float[][] matrix = {
        { -1, -1, -1 },
        { -1, 9, -1 },
        { -1, -1, -1 } 
      };
      
// Dimensió de la matiru
int matrixsize = 3;
//---------------------------------------------------------------------------


/* DETECCIÓ DE CONTORNS*/
//---------------------------------------------------------------------------
// // Mascara per detectar contorns expressada com a matriu
float[][] matrix2 = {
      { -1, -1, -1 },
      { -1, 8, -1 },
      { -1, -1, -1 } 
};

// Dimensió de la matiru
int matrixsize2 = 3;

int offset2 = 128;
//---------------------------------------------------------------------------


/* SUAVITZACIÓ DE CONTORNS*/
//---------------------------------------------------------------------------
// // Mascara per suavitzar la imatge expressada com a matriu
float[][] matrix3 = {
{ 1/9f, 1/9f, 1/9f },
{ 1/9f, 1/9f, 1/9f },
{ 1/9f, 1/9f, 1/9f } 
};

// Dimensió de la matiru
int matrixsize3 = 3;
//---------------------------------------------------------------------------



//INICI SETUP
void setup() {
    // Carreguem la imatge
    imgOriginal = loadImage("foto_carnet.png");
    
    // Imatge amb les dimensions de la original
    imgFilter = createImage(imgOriginal.width, imgOriginal.height, RGB);
    
    //Imatge fake per el menú
    fakeImage = createImage(imgOriginal.width, imgOriginal.height, RGB);

    // Mides de la finestra
    surface.setSize(2*imgOriginal.width, imgOriginal.height);
    
    // ELIMINEM NO LOOP, s'ha d'executar draw() més d'un cop
    //noLoop();                                    
    
}//FI SETUP



//INICI DRAW
void draw() { 
      //Realitzem un SWITCH
      switch (key) {
        
        
        //---------------------------------------------------------------------------------
        case 'q': // REALÇAMENT DE CONTORNS si es Q
          //Crida a les funcions per els arrays
          imgOriginal.loadPixels();
          imgFilter.loadPixels();

          // Recorrem tots els píxels de la imatge
          for (int x = 0; x < imgOriginal.width; x++) {
              for (int y = 0; y < imgOriginal.height; y++) {
                  // Càlcul de la convolució espacial
                  int c = convolution(x, y, matrix, matrixsize, imgOriginal);
                  // Generem un nou píxel a la imatge filtrada
                  int loc = x + y * imgOriginal.width;
                  imgFilter.pixels[loc] = color(c);
              }
          }
          // Si fem modificacions sobre els píxels, sempre hem d'actualitzar
          // l'array amb la funció updatePixels()
          imgFilter.updatePixels();
          // La funció image() permet visualitzar les dues imatges
          image(imgOriginal, 0, 0);
          image(imgFilter, imgOriginal.width, 0);
          // Guardem el resultat a la carpeta "data" del projecte
          imgFilter.save(dataPath("exercici_5b1.png"));
        break;
        //---------------------------------------------------------------------------------
        
        
        //---------------------------------------------------------------------------------
        case 'w': // DETECCIÓ DE CONTORNS si és W
          //Crida a les funcions per els arrays
          imgOriginal.loadPixels();
          imgFilter.loadPixels();
          
          // Recorrem tots els píxels de la imatge
          for (int x = 0; x < imgOriginal.width; x++) {
              for (int y = 0; y < imgOriginal.height; y++) {
                  // Càlcul de la convolució espacial
                  int c = convolution2(x, y, matrix2, matrixsize2, offset2, imgOriginal);
                  // Generem un nou píxel a la imatge filtrada
                  int loc = x + y * imgOriginal.width;
                  imgFilter.pixels[loc] = color(c);
              }
          }
          // Si fem modificacions sobre els píxels, sempre hem d'actualitzar
          // l'array amb la funció updatePixels()
          imgFilter.updatePixels();
          // La funció image() permet visualitzar les dues imatges
          image(imgOriginal, 0, 0);
          image(imgFilter, imgOriginal.width, 0);
          // Guardem el resultat a la carpeta "data" del projecte
          imgFilter.save(dataPath("exercici_5b2.png")); 
        break;
        //---------------------------------------------------------------------------------
        
        
        //---------------------------------------------------------------------------------
        case 'e': // SUAVITZACIÓ DE LA IMATGE si és E
          //Crida a les funcions per els arrays
          imgOriginal.loadPixels();
          imgFilter.loadPixels();
          
          // Recorrem tots els píxels de la imatge
          for (int x = 0; x < imgOriginal.width; x++) {
              for (int y = 0; y < imgOriginal.height; y++) {
                  // Càlcul de la convolució espacial
                  int c = convolution3(x, y, matrix3, matrixsize3, imgOriginal);
                  // Generem un nou píxel a la imatge filtrada
                  int loc = x + y * imgOriginal.width;
                  imgFilter.pixels[loc] = color(c);
              }
          }
          // Si fem modificacions sobre els píxels, sempre hem d'actualitzar
          // l'array amb la funció updatePixels()
          imgFilter.updatePixels();
          // La funció image() permet visualitzar les dues imatges
          image(imgOriginal, 0, 0);
          image(imgFilter, imgOriginal.width, 0);
          // Guardem el resultat a la carpeta "data" del projecte
          imgFilter.save(dataPath("exercici_5b3.png"));
        break;
        
        case 'z':
        //IMATGE ORIGINAL
          image(imgOriginal, 0, 0);
          image(fakeImage, imgOriginal.width, 0);
          
          //TEXT PER EL "MENU"
          text = "En aquest exercici podem clicar: \n Q) Realçament de contorns \n W) Detecció de contorns \n E) Suavització de la imatge \n Z) Tornar al menú";
          textSize(18);         //Mida del text
          fill(255,4,4);        //Color vermell
          text(text, imgOriginal.width+30,imgOriginal.height/2-60);   //Col·locació del text al mig de la pantalla
        break;
          
          
      }//FI DEL SWITCH 
      //---------------------------------------------------------------------------------
      
      //COMPTADOR DE FRAMES
      if (frameCount == 1) {
          //IMATGE ORIGINAL
          image(imgOriginal, 0, 0);
          image(fakeImage, imgOriginal.width, 0);
          
          //TEXT PER EL "MENU"
          text = "En aquest exercici podem clicar: \n Q) Realçament de contorns \n W) Detecció de contorns \n E) Suavització de la imatge \n Z) Tornar al menú";
          textSize(18);         //Mida del text
          fill(255,4,4);        //Color vermell
          text(text, imgOriginal.width+30,imgOriginal.height/2-60);   //Col·locació del text al mig de la pantalla
          
      }
}//FI DRAW


/* He creat una funció convulsció per cada un dels exercicis */
/* PER AL REALÇÄMENT DE CONTORNS */
// ------------------------------------------------------------------------------------------
// Funció que calcula la convolució espacial
color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img){
    float rtotal = 0.0;
    float gtotal = 0.0;
    float btotal = 0.0;
    int offset = 0;
    for (int i = 0; i < matrixsize; i++){
      for (int j= 0; j < matrixsize; j++){
        // What pixel are we testing
        int xloc = x+i-offset;
        int yloc = y+j-offset;
        int loc = xloc + img.width*yloc;
        // Make sure we haven't walked off our image, we could do better here
        loc = constrain(loc,0,img.pixels.length-1);
        // Calculate the convolution
        rtotal += (red(img.pixels[loc]) * matrix[i][j]);
        gtotal += (green(img.pixels[loc]) * matrix[i][j]);
        btotal += (blue(img.pixels[loc]) * matrix[i][j]);
      }
    }
    // Make sure RGB is within range
    rtotal = constrain(rtotal, 0, 255);
    gtotal = constrain(gtotal, 0, 255);
    btotal = constrain(btotal, 0, 255);
    // Return the resulting color
    return color(rtotal, gtotal, btotal);
}//FI CONVULCIO ESPACIAL REALÇAMENT CONTORNS
// ------------------------------------------------------------------------------------------


// Funció que calcula la convolució espacial - PER LA PRIMERA
/* PER A LA DETECCIÓ DE CONTORNS */
// ------------------------------------------------------------------------------------------
color convolution2(int x, int y, float[][] matrix2, int matrixsize2, int offset2, PImage img){
    float rtotal = 0.0;
    float gtotal = 0.0;
    float btotal = 0.0;
    int half = matrixsize / 2;
    for (int i = 0; i < matrixsize2; i++){
      for (int j= 0; j < matrixsize2; j++){
        // What pixel are we testing
        int xloc = x+i-half;
        int yloc = y+j-half;
        int loc = xloc + img.width*yloc;
        // Make sure we haven't walked off our image, we could do better here
        loc = constrain(loc,0,img.pixels.length-1);
        // Calculate the convolution
        rtotal += (red(img.pixels[loc]) * matrix2[i][j]);
        gtotal += (green(img.pixels[loc]) * matrix2[i][j]);
        btotal += (blue(img.pixels[loc]) * matrix2[i][j]);
      }
    }
    // Make sure RGB is within range
    rtotal = constrain(rtotal, 0, 255);
    gtotal = constrain(gtotal, 0, 255);
    btotal = constrain(btotal, 0, 255);
    
    //Apliquem el OFFSET per aquesta máscara
    rtotal += offset2;
    gtotal += offset2;
    btotal += offset2;
    // Return the resulting color
    return color(rtotal, gtotal, btotal);
}//FI CONVULCIO ESPACIAL DETECCIÓ CONTORNS
// ------------------------------------------------------------------------------------------


// Funció que calcula la convolució espacial - PER LA PRIMERA
/* PER A LA SUAVITZACIÓ IMATGE */
// ------------------------------------------------------------------------------------------
color convolution3(int x, int y, float[][] matrix3, int matrixsize3, PImage img){
    float rtotal = 0.0;
    float gtotal = 0.0;
    float btotal = 0.0;
    int offset3 = 0;
    for (int i = 0; i < matrixsize3; i++){
      for (int j= 0; j < matrixsize3; j++){
        // What pixel are we testing
        int xloc = x+i-offset3;
        int yloc = y+j-offset3;
        int loc = xloc + img.width*yloc;
        // Make sure we haven't walked off our image, we could do better here
        loc = constrain(loc,0,img.pixels.length-1);
        // Calculate the convolution
        rtotal += (red(img.pixels[loc]) * matrix3[i][j]);
        gtotal += (green(img.pixels[loc]) * matrix3[i][j]);
        btotal += (blue(img.pixels[loc]) * matrix3[i][j]);
      }
    }
    // Make sure RGB is within range
    rtotal = constrain(rtotal, 0, 255);
    gtotal = constrain(gtotal, 0, 255);
    btotal = constrain(btotal, 0, 255);
    // Return the resulting color
    return color(rtotal, gtotal, btotal);
}//FI CONVULCIO ESPACIAL SUAVITZACIÓ IMATGE
// ------------------------------------------------------------------------------------------