void param() {
  background(fondparam);
  //println((float)mouseX/width+" "+(float)mouseY/width);
  
  image(retour, 15, 15, 60, 60);

  textAlign(CENTER);
  rectMode(CENTER);

  fill(255);
  textFont(boutons, 40);
  text("SETTINGS", 0.5*width, 0.07*height);

  //ajout suggestions
  input();
  textFont(boutons, 15);
  fill(255);
  text("Add a suggestion :", 0.2*width, 0.2*height);
  if (choix==3) {
    fill(150, 80);
  } else {
    fill(100, 80);
  }
  stroke(5);
  strokeWeight(2);
  rect(0.25*width, 0.24*height, 300, 30, 10);
  fill(255);
  textFont(defaut, 15);
  if (choix==3) {
    text(input, width/4, 0.245*height+3);
    if (keyCode==ENTER && input.equals("")==false && input.equals(" ")==false) {
      suggestions.append(input);
      keyCode=0;
      input="";
      choix=0;
      for (int x=0; x<=suggestions.size()-1; x++){
        if(suggestions.getString(x).equals("add suggestions")){
          suggestions.remove(x);
          suggestionindex = int(random(0, suggestions.size()));
          suggestion = suggestions.getString(suggestionindex);
        }
      }
    }
  } else {
    text(suggest, width/4, 0.245*height+3);
  }
  if (mouseX>0.25*width-150&&mouseX<0.25*width+150&&mouseY>0.24*height-15&&mouseY<0.24*height+15&&mousePressed) {
    choix=3;
    input = suggest;
  }
  if (!(mouseX>0.25*width-150&&mouseX<0.25*width+150&&mouseY>0.24*height-15&&mouseY<0.24*height+15)&&mousePressed) {
    choix = 0;
  }

  //changement fond d'écran
  textFont(boutons, 15);
  fill(255);
  text("Change background :", 0.2*width+15, 0.3*height+15);
  image(button, 0.5*width-60, 0.42*height-40, 120, 120);
  if (mousePressed && sqrt(pow(0.5*width-mouseX, 2)+pow((0.45*height-2-mouseY), 2))<60) {
    rendu = loadImage("image"+int(random(1, 19))+".jpg");
  }

  stroke(graylvl);
  strokeWeight(10);
  rect(0.06*width+100, 0.35*height+100, 205, 205);
  image(rendu, 0.06*width, 0.35*height, 200, 200);
  noStroke();

  if (mousePressed && mouseX>0.06*width&&mouseX<0.06*width+200&&mouseY>0.35*height&&mouseY<0.35*height+200) {
    neko = rendu;
    graylvl = 120;
    if (nopopupspam == false) {
      popup = new second(popupstate);
      nopopupspam = true;
    }
  } else graylvl = 180;

  textAlign(LEFT);
/*
  //choix site
  text("Change website :", 0.2*width-5, 0.71*height);
  fill(255);

  textFont(defaut, 15);
  ellipse(0.06*width, 0.75*height-5, 10, 10);
  text("Gum-gum streaming", 0.075*width, 0.75*height);
  ellipse(0.36*width, 0.75*height-5, 10, 10);
  text("Voiranime", 0.375*width, 0.75*height);
  if (site==false) {
    fill(0);    
    ellipse(0.06*width, 0.75*height-5, 7, 7);
    lien = gumgum;
  } else {
    fill(0);
    ellipse(0.36*width, 0.75*height-5, 7, 7);
    lien = voiranime;
  }
  if (mousePressed&&sqrt(pow(-mouseX+0.06*width, 2)+pow(-mouseY+(0.75*height-5), 2))<8) {
    site=false;
  }
  if (mousePressed&&sqrt(pow(-mouseX+0.36*width, 2)+pow(-mouseY+(0.75*height-5), 2))<8) {
    site=true;
  }
  */

  //bouton d'extraction des vus
  fill(100, 80);
  stroke(0);
  strokeWeight(3);
  mouseOver(0.1*width, 0.4*width, 0.25*width, 0.83*height-30, 0.83*height+30, 0.83*height, 0.3*width, 60);
  fill(50, 230, 255);
  textFont(boutons, 15);
  text("Extract\nwatched\nanimés", 0.17*width, 0.82*height);
  
  //bouton help
  fill(150, 80);
  ellipse(0.915*width, 0.93*height, 50, 50);
  fill(255);
  textSize(40);
  text("?", 0.89*width-2, 0.95*height);
  if(helpstate>0) {
    help();
  }
}

void extract() {
  String[] extracting = new String[finis.size()];
  String userDesktop = System.getProperty("user.home");
  for (int x = 0; x <= finis.size()-1; x++) {
    extracting[x] = finis.getString(x);
  }
  print(userDesktop);
  saveStrings(userDesktop+"/Desktop/Watched animés list.txt", extracting);
}

/*à mettre dans param :
 */
