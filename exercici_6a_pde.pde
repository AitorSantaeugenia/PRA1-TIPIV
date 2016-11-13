/* Exercici 6 - PRA1 Tractament i publicació d'imatge i vídeo */
/* Aitor Javier Santaeugenia Marí */
/* Universitat Oberta de Catalunya*/


//Variable per la imatge original i la imatge amb el filtre de la matriu
PImage imgOriginal;
PImage imgFilter;

// Valors per la corba d'aclariment i enfoscament
int x0 = 23;
int x1 = 250;
int y0 = 65;
int y1 = 240;


//INICI SETUP
void setup() {
    // Càrrega de la imatge foto_carnet_bw.png
    imgOriginal = loadImage("foto_carnet_bw.png");
    
    // Imatge amb les dimensions de la original
    imgFilter = createImage(imgOriginal.width, imgOriginal.height, RGB);
    
    // Mides de la finestra
    surface.setSize(2*imgOriginal.width, imgOriginal.height);
    
    //No creació de LOOPS - NOLOOP
    noLoop();
}//FI SETUP


//INICI DRAW
void draw() {
    //Crida a les funcions per els arrays
    imgOriginal.loadPixels();
    imgFilter.loadPixels();
    
    //Comptador per recorre arrays
    int i= 0;
    
    // Recorra els pixels de la imatge original
    while (i < imgOriginal.pixels.length) {
        //Consultam un dels canals
        float b = imgOriginal.pixels[i] & 0xFF;
        
        // Algoritme - Transformació Puntual (Aclariment i Enfosquiment)
        if ( b < x0 ) {
          imgFilter.pixels[i] = color(int(map(b, 0, x0, 0, y0)));
        } else if ( b < x1 ) {
          imgFilter.pixels[i] = color(int(map(b, x0, x1, y0, y1)));
        } else {
          imgFilter.pixels[i] = color(int(map(b, x1, 255, y1, 255)));
        }
        i++;
    }
    //Actualitzar els arrays
    imgFilter.updatePixels();
    
    // Visualitzam la imatge original y la imatge amb el filtre
    image(imgOriginal, 0, 0);
    image(imgFilter, imgOriginal.width, 0);
    
    //Guardem el resultat de la imatge amb el filtre
    imgFilter.save(dataPath("exercici_6a_png.png"));
}//FI DRAW