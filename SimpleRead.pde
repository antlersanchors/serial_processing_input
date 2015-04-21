import processing.serial.*;

Serial myPort;  
float num;
boolean firstContact = false;


void setup() 
{
  size(200, 200);

  String portName = Serial.list()[2];
  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil ('\n');
}

void draw()
{  
  
  if(millis() % 100 == 0) {
  myPort.write(65);
  }
  
  while ( myPort.available() > 0) {  // If data is available,
  println("port available!");
  val = myPort.readStringUntil(lf);
  if(val!=null) {
  
//  print("val" + "  " + val);
  num = float(val);
  println("value" + "   " + num);
  
  
  }
    myPort.clear();       // read it and store it in val
//    println("control comes here");
//    println(val);
  }
}

void serialEvent (Serial myPort) {
  String val = myPort.readStringUntil ('\n');
  if (val != null) {
    num = trim(num);
    println(num);
    
    if (firstContact == false) {
      if (val.equals("Hello")) {
        myPort.clear();
        firstContact = true;
        usbPort.write('A');
        println("contact");
      }
    }
    
  }
}
      
  


