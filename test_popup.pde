class second extends PApplet {

  private int popupstate;
  public second(int testing) {
    super();
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    popupstate = testing;
  }

  public void settings() {
    size(400, 200);
    smooth();
    noLoop();
  }

  public void draw() {
    textAlign(CENTER);
    background(0);
    if (popupstate == 0) {
      textFont(boutons, 25);
      text("Background set", 0.5*width, 0.2*height);
      image(check, 0.5*width-50, 0.4*height, 100, 100);
    }
  }

  void exit() {
    dispose();
    popup = null;
  }
}

/*
fonctions :
 alerte TEMPORAIRE de changement d'écran
 affichage de la liste d'animés finis
 
 problemes :
 le TEMPORAIRE marche pas
 */
