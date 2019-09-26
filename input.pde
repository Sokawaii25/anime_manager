String input="";
char letter;
boolean write;

void keyReleased() {
  if (keyCode!=SHIFT&&keyCode!=BACKSPACE&&keyCode!=ENTER&&keyCode!=DELETE&&keyCode!=CONTROL&&keyCode!=20&&keyCode!=LEFT&&keyCode!=RIGHT&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=ALT) {
    letter=key;
    write=true;
  }
  if (keyCode==DELETE) {
    input="_";
  }
  if (keyCode==BACKSPACE&&input.length()>1) {
    input=input.substring(0, input.length()-2);
    input+="_";
  }
  if (key == 'Z'){
    popupstate = 1;
    popup = new second(popupstate);
  }
}

void input() {
  if (write) {
    input=input.substring(0, input.length()-1);
    input+=letter+"_";
    write=false;
  }
}
