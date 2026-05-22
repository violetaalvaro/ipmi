
//Violeta alvaro comi2
//videojuego The Sims 4

PImage Imagen1, Imagen2, Imagen3, Imagen4, Imagen5, Imagen6, Imagen7, Imagen8; 
PFont miFuente;

int pantalla = 0; 
// clic en iniciar
int tiempoInicio = 0; 
 // Tiempo que dura cada pantalla 3 segundos
int duracion = 3000;   

// Variables para las animaciones del texto
float animacion = 0;   
float animacionX = -100;   
float animacionEscala = 10; 

 // Controla el movimiento de izquierda a derecha de la Imagen 8 
float animacionImagen8 = -640;

// Variable auxiliar para controlar los reseteos de animación entre pantallas
int ultimaPantalla = 0;

void setup() {
  size(640, 480); 

  Imagen1 = loadImage("imagen1.png");
  Imagen2 = loadImage("imagen2.png");
  Imagen3 = loadImage("imagen3.png");
  Imagen4 = loadImage("imagen4.png");
  Imagen5 = loadImage("imagen5.png");
  Imagen6 = loadImage("imagen6.png");
  Imagen7 = loadImage("imagen7.png"); 
  Imagen8 = loadImage("imagen8.png"); 

  miFuente = createFont("Arial", 48); 
  textFont(miFuente);
}

void draw() {
  background(0);
  
  if (pantalla == 0) {
    pantallaInicio(); 
  } 
  else if (pantalla >= 1 && pantalla <= 6) {
    dibujarPresentacion();
    tiempo(); 
  } 
  else if (pantalla == 7) {
    pantallaReiniciar(); 
  }
}
void pantallaInicio() {
  if (Imagen1 != null) {
    image(Imagen1, 0, 0, width, height); 
  }
  
  // Boton iniciar
  fill(0, 0, 0, 150); 
  stroke(255);        
  rect(220, 215, 200, 50); 
  
  fill(255);
  noStroke();
  textSize(22);
  textAlign(CENTER, CENTER);
  text("INICIAR", 320, 238);
}

void tiempo() {
  int tiempo1 = millis() - tiempoInicio;
  
  if (tiempo1 < duracion) {
    pantalla = 1;
  } else if (tiempo1< duracion * 2) {
    pantalla = 2;
  } else if (tiempo1 < duracion * 3) {
    pantalla = 3;
  } else if (tiempo1 < duracion * 4) {
    pantalla = 4;
  } else if (tiempo1 < duracion * 5) {
    pantalla = 5;
  } else if (tiempo1 < duracion * 6) {
    pantalla = 6; 
  } else {
    pantalla = 7; 
  }
  
  // Si cambia de pantalla, resetea las animaciones automáticamente
  if (pantalla != ultimaPantalla) {
    animacion = 0;
    animacionX = -100;
    animacionEscala = 10;
    
    // Si entramos a la pantalla 7, nos aseguramos de que la Imagen 8 empiece bien a la izquierda
    if (pantalla == 7) {
      animacionImagen8 = -640; 
    }
    
    ultimaPantalla = pantalla;
  }
}

void dibujarPresentacion() {
  textAlign(LEFT, BASELINE); 
  
  // PANTALLA 1 (Imagen 7)
  if (pantalla == 1 && Imagen7 != null) {
    image(Imagen7, 0, 0, width, height);
    if (animacion < 255) { animacion = animacion + 5; }
    fill(0, animacion); 
    textSize(24);
    text("¿De qué trata el juego?:The Sims 4 es un videojuego de simulación de vida donde el jugador crea personajes llamados Simsy controla sus actividades diarias. El juego permite vivir diferentes experiencias, formar familias, trabajar y desarrollar relaciones.", 10, 0, 600, 400); 
  }
  
  // - PANTALLA 2 (Imagen 2) 
  if (pantalla == 2 && Imagen2 != null) {
    image(Imagen2, 0, 0, width, height);
    if (animacion < 255) { animacion = animacion + 5; }
    fill(20, 20, 20, animacion); 
    textSize(20);
    text("Creación de personajes:El jugador puede personalizar completamente a sus Sims, cambiando su apariencia, ropa, personalidad y aspiraciones. Esto permite crear personajes únicos y diferentes historias.", 5, 200, 200, 600);
  }
  
  //  PANTALLA 3 (Imagen 3)
  if (pantalla == 3 && Imagen3 != null) {
    image(Imagen3, 0, 0, width, height);
    if (animacionX < 50) { animacionX = animacionX + 4; }
    fill(225);
    textSize(20);
    text("Construcción y decoración:Una parte importante del juego es construir y decorar casas. El jugador puede elegir muebles, colores, habitaciones y objetos para diseñar espacios según sus gustos.", animacionX, 385, 600, 600);
  }
  
  // PANTALLA 4 (Imagen 4) 
  if (pantalla == 4 && Imagen4 != null) {
    image(Imagen4, 0, 0, width, height);
    if (animacionEscala < 20) { animacionEscala = animacionEscala + 0.4; }
    fill(245,245,245);
    textSize(animacionEscala);
    text("Relaciones y vida cotidiana:Los Sims pueden hacer amigos, enamorarse, trabajar, estudiar y realizar actividades diarias. Las decisiones del jugador afectan el estado de ánimo y la vida de los personajes.", 50, 385, 550,600);
  }
  
  // PANTALLA 5 (Imagen 5) 
  if (pantalla == 5 && Imagen5 != null) { 
    image(Imagen5, 0, 0, width, height);
    if (animacion < 255) { animacion = animacion + 8; }
    fill(255, animacion);
    textSize(30);
    text("Objetivo y experiencia del juego:El juego no tiene un final específico. El objetivo principal es crear historias y controlar la vida de los personajes de manera libre y creativa. Cada jugador puede vivir una experiencia diferente según las decisiones que tome.", 30, 150, 600, 400);
  }

  // PANTALLA 6 (Imagen 6) 
  if (pantalla == 6 && Imagen6 != null) {
    image(Imagen6, 0, 0, width, height); 
    fill(0); 
    textSize(19);
    text("Conclusión:The Sims 4 es un videojuego que permite crear historias y tomar decisiones libremente dentro de un mundo virtual. A través de la personalización, las relaciones y la construcción, el jugador puede desarrollar una experiencia única y creativa. Esto hace que el juego vuelva constantemente a su idea principal: simular la vida cotidiana de diferentes maneras según las elecciones de cada jugador.",5,5,200,600);
  }
}

// PANTALLA 7 (Imagen 8) 
void pantallaReiniciar() {
  // Animación de desplazamiento: incrementa X hasta llegar a 0 (puedes cambiar el '+ 15' para regular la velocidad)
  if (animacionImagen8 < 0) { 
    animacionImagen8 = animacionImagen8 + 15; 
  } else {
    animacionImagen8 = 0; 
  }

  if (Imagen8 != null) {
    image(Imagen8, animacionImagen8, 0, width, height); 
  }
  
  // El botón aparece encima una vez que la imagen se acomodó o se va moviendo en su lugar fijo
  fill(255, 50, 50, 200); 
  stroke(255);            
  rect(220, 215, 200, 50); 
  
  fill(255);
  noStroke();
  textSize(20);
  textAlign(CENTER, CENTER);
  text("REINICIAR", 320, 238);
}

void mousePressed() {
  if (pantalla == 0) {
    if (mouseX > 220 && mouseX < 420 && mouseY > 215 && mouseY < 265) {
      pantalla = 1; 
      tiempoInicio = millis(); 
      ultimaPantalla = 1;
      
      animacion = 0;
      animacionX = -100;
      animacionEscala = 10;
    }
  }
  
  if (pantalla == 7) {
    if (mouseX > 220 && mouseX < 420 && mouseY > 215 && mouseY < 265) {
      pantalla = 0; 
      ultimaPantalla = 0;
      
      animacion = 0;
      animacionX = -100;
      animacionEscala = 10;
      animacionImagen8 = -640; 
    }
  }
}
