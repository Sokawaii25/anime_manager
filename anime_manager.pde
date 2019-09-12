JSONObject anime, un, deux, trois;
JSONArray encours, finis, suggestions, sites;
PImage neko, icone, param, retour, rendu, button, fondparam, check, tuto;
PFont boutons, defaut;
String name1, name2, name3, name, suggestion, gumgum, voiranime, lien, ep, suggest;
int choix=0, ep1, ep2, ep3, suggestionindex, popupstate, brightness, red, blue, green, helpstate;
double dimx, dimy;
boolean once, site, parametres, nopopupspam, bright, help;
color graylvl, pixel;

second popup;

void settings() {
  size(700, 700);
}

void setup() {
  surface.setTitle("Anime manager");
  icone=loadImage("icone.png");
  surface.setIcon(icone);
  anime = loadJSONObject("animes.json");
  suggestions = anime.getJSONArray("animés à regarder");
  suggestionindex = int(random(0, suggestions.size()));
  suggestion = suggestions.getString(suggestionindex);
  neko = loadImage("image"+int(random(1, 19))+".jpg");
  fondparam = loadImage("fondparam.png");
  boutons = loadFont("Gunship.vlw");
  defaut = loadFont("defaut.vlw");
  name = name1;
  ep = str(ep1);
  sites = anime.getJSONArray("sites");
  gumgum = sites.getString(0);
  voiranime = sites.getString(1);
  lien = gumgum;
  param = loadImage("param.png");
  retour = loadImage("retour.png");
  rendu = loadImage("image"+int(random(1, 15))+".jpg");
  button = loadImage("button.png");
  check = loadImage("ok.png");
  suggest = "";
  popupstate = helpstate = 0;
}

void draw() {
  if (parametres == false) {
    background(neko);
    brightnessing();

    encours = anime.getJSONArray("animés en cours");
    finis = anime.getJSONArray("animés finis");
    un = encours.getJSONObject(0);
    deux = encours.getJSONObject(1);
    trois = encours.getJSONObject(2);
    name1 = un.getString("name");
    name2 = deux.getString("name");
    name3 = trois.getString("name");
    ep1 = un.getInt("ep");
    ep2 = deux.getInt("ep");
    ep3 = trois.getInt("ep");

    if (once!=true) {
      name=name1;
      ep=str(ep1);
      once=true;
    }

    input();
    textAlign(CENTER);
    rectMode(CENTER);
    stroke(5);
    strokeWeight(2);

    image(param, width-75, 15, 60, 60);

    //nom de l'animé en cours
    textFont(boutons, 15);
    if (bright) fill(0); 
    else fill(255);
    text("Anime you're watching :", 0.5*width, 0.06*height);
    if (choix==1) {
      fill(150, 80);
    } else {
      fill(100, 80);
    }
    rect(0.5*width, 0.1*height, 300, 30, 10);
    if (bright) fill(0); 
    else fill(255);
    textFont(defaut, 15);
    if (choix==1) {
      text(input, width/2, 0.11*height);
      if (keyCode==ENTER) {
        if (input.equals("fini")==true) {
          finis.append(name);
          if (name==name1) {
            un.setString("name", "new");
            un.setInt("ep", 0);
          } else if (name==name2) {
            deux.setString("name", "new");
            deux.setInt("ep", 0);
          } else {
            trois.setString("name", "new");
            trois.setInt("ep", 0);
          }
          name = "new";
          ep = "0";
        } else {
          if (name==name1) {
            un.setString("name", input);
          } else if (name==name2) {
            deux.setString("name", input);
          } else {
            trois.setString("name", input);
          }
          name = input;
          keyCode=0;
          input="";
          choix=0;
        }
      }
    } else {
      text(name, width/2, 0.11*height);
    }

    if (mouseX>0.285*width&&mouseX<0.71*width&&mouseY>0.08*height&&mouseY<0.12*height&&mousePressed) {
      choix=1;
      input = name;
    }

    //numéro de l'épisode à regarder
    textFont(boutons, 15);
    text("n° of next episode :", 0.5*width, 0.17*height);
    if (choix==2) {
      fill(150, 80);
    } else {
      fill(100, 80);
    }
    rect(0.5*width, 0.205*width, 100, 30, 10);
    if (bright) fill(0); 
    else fill(255);
    textFont(defaut, 15);
    if (choix==2) {
      text(input, width/2, 0.215*height);
      if (keyCode==ENTER) {
        if (input.equals("finished")==true) {
          finis.append(name);
          if (name==name1) {
            un.setString("name", "new");
            un.setInt("ep", 0);
          } else if (name==name2) {
            deux.setString("name", "new");
            deux.setInt("ep", 0);
          } else {
            trois.setString("name", "new");
            trois.setInt("ep", 0);
          }
          name = "new";
          ep = "0";
        } else {
          ep = input;
          if (name==name1) {
            un.setInt("ep", int(input));
          } else if (name==name2) {
            deux.setInt("ep", int(input));
          } else {
            trois.setInt("ep", int(input));
          }
        }
        keyCode=0;
        input="";
        choix=0;
        loop();
      }
    } else {
      text(ep, width/2, 0.215*height);
    }
    textSize(18);

    if (mouseX>0.425*width&&mouseX<0.57*width&&mouseY>0.185*height&&mouseY<0.225*height&&mousePressed) {
      input = ep;
      choix=2;
    }

    if (!(mouseX>0.285*width&&mouseX<0.71*width&&mouseY>0.08*height&&mouseY<0.12*height)&&!(mouseX>0.425*width&&mouseX<0.57*width&&mouseY>0.185*height&&mouseY<0.225*height)&&mousePressed) {
      choix=0;
    }

    //bouton animé 1
    mouseOver(0.0625*width, 0.3125*width, 0.1875*width, 0.3*height, 0.3*height+40, 0.325*height, 0.25*width, 40);
    text(name1, 0.1875*width, 0.335*height);

    //bouton animé 2
    mouseOver(0.375*width, 0.625*width, 0.5*width, 0.3*height, 0.3*height+40, 0.325*height, 0.25*width, 40);
    text(name2, 0.5*width, 0.335*height);

    //bouton animé 3
    mouseOver(0.6875*width, 0.9375*width, 0.8125*width, 0.3*height, 0.3*height+40, 0.325*height, 0.25*width, 40);
    text(name3, 0.8125*width, 0.335*height);

    //suggestion
    textSize(16);
    fill(100, 80);
    rect(0.5*width, 0.26*height, 0.5*width, 30, 10);
    if (bright) fill(0); 
    else fill(255);
    text("Suggested : "+suggestion, 0.5*width, 0.27*height);

    textFont(boutons);

    /*
    //bouton sauvegarde
     fill(100, 80);
     mouseOver(0.2*width, 0.4*width, 0.3*width, 0.85*height, 0.935*height, 0.895*height, 0.2*width, 60);
     fill(50, 230, 255);
     text("SAVE", 0.3*width, 0.91*height);
     
     //bouton redirection
     mouseOver(0.6*width, 0.8*width, 0.7*width, 0.85*height, 0.935*height, 0.895*height, 0.2*width, 60);
     fill(50, 250, 255);
     text("GO !", 0.7*width, 0.91*height);*/

    mouseOver(0.4*width, 0.6*width, 0.5*width, 0.895*height-30, 0.895*height+30, 0.895*height, 0.2*width, 60);
    //rect(0.5*width, 0.85*height+30, 0.2*width, 60, 10);
    fill(50, 250, 255);
    text("SAVE", 0.5*width, 0.91*width);
  } else {
    param();
  }
}

void mouseReleased() {
  if (mouseX>0.4*width&&mouseX<0.6*width&&mouseY>0.895*height-30&&mouseY<0.895*height+30) {
    saveJSONObject(anime, "data/animes.json");
  }
  /*if (mouseX>0.6*width&&mouseX<0.8*width&&mouseY>0.85*height&&mouseY<0.93*height) {
   name=name.replaceAll(" ", "-");
   if (int(ep)<10) {
   ep="0"+ep;
   }
   link("https://"+lien+name+"-"+ep+"-vostfr/");
   saveJSONObject(anime, "data/animes.json");
   exit();
   }*/

  if (mouseX>0.0625*width&&mouseX<0.3125*width&&mouseY>0.3*height&&mouseY<0.3*height+40) {
    name=name1;
    ep = str(ep1);
  }

  if (mouseX>0.375*width&&mouseX<0.625*width&&mouseY>0.3*height&&mouseY<0.3*height+40) {
    name=name2;
    ep = str(ep2);
  }

  if (mouseX>0.6875*width&&mouseX<0.9375*width&&mouseY>0.3*height&&mouseY<0.3*height+40) {
    name=name3;
    ep = str(ep3);
  }

  if (parametres && mouseX>0.02*width&&mouseX<0.105*width&&mouseY>0.02*height&&mouseY<0.105*height) {
    parametres = false;
  }

  if (parametres == false && mouseX>0.89*width&&mouseX<0.98*width&&mouseY>0.02*height&&mouseY<0.105*height) {
    parametres = true;
  }

  if (mouseX>0.1*width&&mouseX<0.4*width&&mouseY>0.83*height-30&&mouseY<0.83*height+30&&parametres) {
    extract();
  }

  if (mouseX>0.3*width&&mouseX<0.7*width&&mouseY>0.26*height-15&&mouseY<0.26*height+15) {
    if (suggestions.size()==1) {
      suggestions.append("add suggestions");
    }
    if (!suggestion.equals("add suggestions")) {
      if (name==name1) {
        un.setString("name", suggestion);
        un.setInt("ep", 1);
      } else if (name==name2) {
        deux.setString("name", suggestion);
        deux.setInt("ep", 1);
      } else if (name == name3) {
        trois.setString("name", suggestion);
        trois.setInt("ep", 1);
      }
    }

    suggestions.remove(suggestionindex);
    suggestionindex = int(random(0, suggestions.size()));
    suggestion = suggestions.getString(suggestionindex);
  }

  if (help) {
    loop();
  }
  if (parametres && sqrt(pow(-mouseX+0.915*width, 2)+pow(-mouseY+(0.93*height), 2))<20) {
    helpstate = (helpstate+1)%3;
  }
  nopopupspam = false;
}

void mouseOver(float x1, float x2, float x, float y1, float y2, float y, float w, float h) {
  if (mouseX>x1&&mouseX<x2&&mouseY>y1&&mouseY<y2) {
    fill(150, 80);
    rect(x, y, w, h, 10);
  } else {
    fill(100, 80);
    rect(x, y, w, h, 10);
  }
  if (bright) fill(0); 
  else fill(255);
}

void brightnessing() {
  for (int j=1; j<height; j++) {
    for (int i=1; i<width; i++) {
      pixel = get(i, j);
      red = (pixel >> 16) & 0xFF;
      green = (pixel >> 8) & 0xFF;
      blue = pixel & 0xFF;
      brightness += (red+blue+green)/3;
    }
  }
  brightness /= width*height;
  if (brightness>160) bright = true; 
  else bright = false;
}

void help() {
  switch(helpstate) {
    case (1) :
    tuto = loadImage("tuto 1.png");
    break;
    case(2) :
    tuto = loadImage("tuto 2.png");
    break;
  }
  background(tuto);
  fill(150, 80);
  ellipse(0.915*width, 0.93*height, 80, 50);
  fill(255);
  textSize(15);
  text("next", 0.89*width-13, 0.95*height-8);
}

void exit() {
  saveJSONObject(anime, "data/animes.json");
  super.exit();
}

/*A rajouter :
 gogoanimé
 
 bugs connus :
 l'app ne veut pas se fermer** (to test on linux)
 */
