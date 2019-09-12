String input="";
char letter;
boolean write;

void keyReleased() {
  if (keyCode!=SHIFT&&keyCode!=BACKSPACE&&keyCode!=ENTER&&keyCode!=DELETE&&keyCode!=CONTROL&&keyCode!=20&&keyCode!=LEFT&&keyCode!=RIGHT&&keyCode!=UP&&keyCode!=DOWN&&keyCode!=ALT) {
    letter=key;
    write=true;
  }
  if (keyCode==DELETE) {
    input="";
  }
  if (keyCode==BACKSPACE&&input.length()>0) {
    input=input.substring(0, input.length()-1);
  }
}

void input() {
  if (write) {
    input+=letter;
    write=false;
  }
}
