class cipher{
  //fields
  int dis; //displacement
  String[] plaintext = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"}; 
  String[] ciphertext = new String[plaintext.length];
  String[] revPlainText = {"z","y","x","w","v","u","t","s","r","q","p","o","n","m","l","k","j","i","h","g","f","e","d","c","b","a"};
  String[] numbers = {"1","2","3","4","5","6","7","8","9","0"};
  //String[] pts = str(plaintext); //String version of the char plaintext array
  
  //constructor
  cipher(int displacement){ //displacement being how far the regular alphabet is displaced by
    this.dis = displacement; 
  }
  
  void setupCipherText(){
    for(int i=0; i<plaintext.length; i++){
      ciphertext[i] = plaintext[(i+this.dis)%26]; //using modulo so that the letters at the end of the alphabet move to the front when displaced
    }
  }
  
  void printMe(){
    println("The ciphertext array displaces the letters of the alphabet by", this.dis, "and is:");
    printArray(ciphertext);
  }
  
  String encrypt(String pti){
    boolean[] uppercase = new boolean[pti.length()]; //keeping track of where a letter is uppercase
    String[] ptList = new String[pti.length()];
    String[] ctList = new String[pti.length()];
    for (int i=0; i<pti.length();i++){ 
      ptList[i] = str(pti.charAt(i)); //using charAt to find the character at the specified index
    }
    //printArray(ptList);
    
    for (int i=0; i<pti.length();i++){ //checking to see if the character is capitalized or not
      if(ptList[i].equals( plaintext[i] )){} //essentially making a 'does not equal to' else statement
      
      else{
        ptList[i] = ptList[i].toLowerCase(); //changing to lower-case for encryption, will change back to uppercase in encrypted version
        uppercase[i] = true; //remembering which character in the array is upper-case
      }
      
    }
    //printArray(ptList);
    
    for(int i=0; i<ptList.length;i++){ //converting plaintext characters to ciphertext
      //println(i);
      if(ptList[i].equals(" ")){ //retaining the space position from plainText to cipherText
        ctList[i] = " ";
        //println("copying the space.");
      }
      
      else if(ptList[i].equals(",")){ //retaining position for any other basic punctuation 
        ctList[i] = ","; 
      }
      
      else if(ptList[i].equals(".")){
        ctList[i] = "."; 
      }
      
      else if(ptList[i].equals("?")){
        ctList[i] = "?"; 
      }
      
      else if(ptList[i].equals("!")){
        ctList[i] = "!"; 
      }
      
      else if(ptList[i].equals("'")){
        ctList[i] = "'"; 
      }
      
      else if(ptList[i].equals(";")){
        ctList[i] = ";"; 
      }
      
      else if(ptList[i].equals(":")){
        ctList[i] = ":"; 
      }
  
      else{
        int ptIndex = binarySearch(plaintext, ptList[i], 0, 25);
        //println(ptIndex);
        //println("The index of", ptList[i], "is", ptIndex);
        ctList[i] = ciphertext[ptIndex];
        //printArray(ctList);
      }
    }
    
    String ctFinal = "";
    //printArray(uppercase);
    for(int i=0; i<pti.length();i++){
      String currChar = ctList[i];
      //if(uppercase[i]){ //attempt to try to re-convert to upper-case, DO THIS LATER, get core functionality working first
      //  currChar = currChar.toUpperCase();
      //}
      ctFinal += currChar;
    }
    
    return ctFinal;
  }
  
  String decrypt(String cti){
    boolean[] uppercase = new boolean[cti.length()]; //keeping track of where a letter is uppercase
    String[] ptList = new String[cti.length()];
    String[] ctList = new String[cti.length()];
    
    for (int i=0; i<cti.length();i++){ 
      ctList[i] = str(cti.charAt(i)); //using charAt to find the character at the specified index
    }
    
    
    for (int i=0; i<cti.length();i++){ //checking to see if the character is capitalized or not
      if(ctList[i].equals( ciphertext[i] )){} //essentially making a 'does not equal to' else statement
      
      else{
        ctList[i] = ctList[i].toLowerCase(); //changing to lower-case for encryption, will change back to uppercase in encrypted version
        uppercase[i] = true; //remembering which character in the array is upper-case
      }
    }
    
    
    for(int i=0; i<ctList.length;i++){ //converting plaintext characters to ciphertext
      //println(i);
      if(ctList[i].equals(" ")){ //retaining the space position from plainText to cipherText
        ptList[i] = " ";
        //println("copying the space.");
      }
      
      else if(ctList[i].equals(",")){ //retaining position for any other basic punctuation
        ptList[i] = ","; 
      }
      
      else if(ctList[i].equals(".")){
        ptList[i] = "."; 
      }
      
      else if(ctList[i].equals("?")){
        ptList[i] = "?"; 
      }
      
      else if(ctList[i].equals("!")){
        ptList[i] = "!"; 
      }
      
      else if(ctList[i].equals("'")){
        ptList[i] = "'"; 
      }
      
      else if(ctList[i].equals(";")){
        ptList[i] = ";"; 
      }
      
      else if(ctList[i].equals(":")){
        ptList[i] = ":"; 
      }
      
      
      else{
        int ctIndex = binarySearch(ciphertext, ctList[i], 0, 25);
        //println(ctIndex);
        //println("The index of", ctList[i], "is", ctIndex);
        
        if (ctIndex == -1){ //if the index of the current letter is not found, 
          println("ctIndex is -1. Now using reverse plaintext to locate index.");
          String[] tempCt = new String[plaintext.length];
          for(int j=0; j<plaintext.length;j++){
            tempCt[j] = plaintext[abs((j-this.dis)%26)];
            if (j < this.dis){
                //value of plaintext (25 - j)
              tempCt[j] = plaintext[(plaintext.length+(j-this.dis))-1];
              ptList[i] = tempCt[j];
            }
            println("The temp array at index", j, "is", tempCt[j]);
          }
        }
        if (ctIndex == -1){}
        else{
        ptList[i] = plaintext[ctIndex];
        }
        //printArray(ptList);
      }
    }
    String ptFinal = "";
    
    
    for(int i=0; i<cti.length();i++){
      String currChar = ptList[i];
      //if(uppercase[i]){ //attempt to try to re-convert to upper-case, DO THIS LATER, get core functionality working first
      //  currChar = currChar.toUpperCase();
      //}
      ptFinal += currChar;
    }
    
    
    return ptFinal;
  }
  
  
  
  
  
  
  
  
}


int binarySearch(String a[], String w, int low, int high){ //using binary search to find the index of characters
  //println("Now looking for", w, "from low:", low, "to high:", high);
  if (low>=high){
    if (w.equals(a[low])){
      return low; //found at low index
    }
    else
      return -1; //not found
  }
  else{
    int mid = (low+high)/2;
    
    if (w.equals(a[mid])){
      //println("Found", w, "at", mid);
      return mid; //found in the middle
    }
    
    
    else if(w.compareTo(a[mid]) < 0){
      return binarySearch(a,w,low,mid-1);
    }
    
    else{
      return binarySearch(a,w,mid+1,high);
      
    }
  }
  
  
}
