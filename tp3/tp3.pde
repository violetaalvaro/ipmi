
//Violeta Alvaro tp3, com2
// Link youtube: https://youtu.be/aKvPaAj3xM0

int cantidad = 14;   
float espacio; 
float diametro; 
float inicioX; 
float inicioY; 
PImage img;
boolean modoNegro = false; 
boolean modoArcoiris = false; 
float columnaMouse = 0; 
boolean mouseActivo = false;

void setup() {
  size(800, 400);      
  img = loadImage("22.jpg"); 
  
  espacio = 400; 
  diametro = espacio / cantidad;  
  
  inicioX = 400 + (diametro / 2);  
  inicioY = 0 + (diametro / 2); 
}

void draw() {
  // fondo
  if (modoNegro == true) {
    background(30);  
  } else {
    background(240); 
  }
  
  image(img, 0, 0, 400, 400); 
  
  if (modoArcoiris == true) {
   Arcoiris(); 
  } else if (modoNegro == true) {
    Dibujo(255); 
  } else {
    Dibujo(0);   
  }
 
  float movimiento = dist(mouseX, mouseY, pmouseX, pmouseY);
  
  // Solo se activa el movimiento si el mouse se mueve Y está del lado derecho
  if (movimiento > 0 && mouseX >= 400 && mouseX <= 800) {
    mouseActivo = true;
  }

  if (mouseX >= 400 && mouseX <= 800 && mouseActivo == true) {
    columnaMouse = (mouseX - 400) / diametro - (cantidad / 2);
  }
  
  // Ciclos FOR aninados
  for (int i = 0; i < cantidad; i++) {
    for (int j = 0; j < cantidad; j++) {
      
      float x = inicioX + (i * diametro); 
      float y = inicioY + (j * diametro); 
      
      // calcular la diagonal
      float diagonal = distancia(i, j, columnaMouse);
      
    
      float grosor = map(diagonal, 0, cantidad, 13, 1);
      
      if (grosor < 1) {
        grosor = 1;
      }
      
      strokeWeight(grosor); 
      ellipse(x, y, diametro, diametro);
    }
  }
}

// MIS FUNCIONES PROPIAS


void Dibujo(int colorBorde) {
  noFill();
  stroke(colorBorde);
}

//Genera colores usando solo mapas en RGB estándar
void Arcoiris() {
  noFill();
  

  float posicionX = mouseX;
  
 
  if (posicionX < 400) {
    posicionX = 400;
  }
  
 
  float r = map(posicionX, 400, 800, 255, 0);   
  float g = map(posicionX, 400, 800, 0, 255);   
  float b = map(posicionX, 600, 800, 0, 255);   
  
  stroke(r, g, b); 
}

float distancia (float col, float fila, float desvío) {
  float resultado = (col - fila) - desvío;
  
  if (resultado < 0) {
    resultado = resultado * -1;
  }
  
  return resultado; 
}



void mouseClicked() {
  modoNegro = !modoNegro; 
  
}

void keyPressed() {
  if (key == 'z' || key == 'Z') {
    modoArcoiris = !modoArcoiris;
  } 
  else {
    modoNegro = false; 
    modoArcoiris = false;
    columnaMouse = 0;     
    mouseActivo = false; 
  }
}
