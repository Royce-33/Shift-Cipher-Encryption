//cesar_cipher
//By: Riley Adams 
//Program is designed to take input from files
//Based on user selection in GUI, encrypt/decrypt it
//And write the final result to another file
import g4p_controls.*;

boolean startClicked = false;
String option = "encrypt";


void setup(){
  createGUI();
  cipher defaultCipher = new cipher(3);
  
  defaultCipher.setupCipherText(); //setupCipherText() required for each new cipher
  defaultCipher.printMe();
  String testEncrypt = defaultCipher.encrypt("Treaty Impossible");
  println(testEncrypt);
  String testDecrypt = defaultCipher.decrypt(testEncrypt);
  println(testDecrypt);
  
  //String test = "xylophone";
  //String encryptTest = defaultCipher.encrypt(test);
  //println(encryptTest);
  
  
  //if (startClicked){
    String[] myData = loadStrings("input text.txt"); //for reading and writing to files
    PrintWriter pw = createWriter("output text.txt");
    if (option == "encrypt"){
      for(int i=0; i<myData.length; i++){
        String nextRow = myData[i];
        String encryptRow = defaultCipher.encrypt(nextRow); //placeholder for now, gui will be used to select which operation
        pw.println(encryptRow);
        
      }
    }
    //else{
      //for(int i=0; i<myData.length; i++){
        //String nextRow = myData[i];
        //String decryptRow = defaultCipher.decrypt(nextRow); //placeholder for now, gui will be used to select which operation
        //pw.println(decryptRow);
    //}
    
    pw.close();
    //}
  //}

}
