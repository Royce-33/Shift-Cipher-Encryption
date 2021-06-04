/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:options:229447:
  appc.background(230);
} //_CODE_:options:229447:

public void encrypt_clicked(GCheckbox source, GEvent event) { //_CODE_:encrypt_checkbox:853958:
  option = "encrypt";
  //println("Option set to encrypt file.");
  decrypt.setSelected(false);

} //_CODE_:encrypt_checkbox:853958:

public void decrypt_clicked(GCheckbox source, GEvent event) { //_CODE_:decrypt:647742:
  option = "decrypt";
  //println("Option set to decrypt file.");
  encrypt_checkbox.setSelected(false);

} //_CODE_:decrypt:647742:

public void start_button_clicked(GButton source, GEvent event) { //_CODE_:start_button:535892:
  startClicked = true;
} //_CODE_:start_button:535892:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  options = GWindow.getWindow(this, "Options", 0, 0, 300, 300, JAVA2D);
  options.noLoop();
  options.setActionOnClose(G4P.KEEP_OPEN);
  options.addDrawHandler(this, "win_draw1");
  title = new GLabel(options, 100, 15, 100, 20);
  title.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  title.setText("Options");
  title.setTextBold();
  title.setOpaque(false);
  encrypt_checkbox = new GCheckbox(options, 36, 105, 120, 20);
  encrypt_checkbox.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  encrypt_checkbox.setText("Encrypt");
  encrypt_checkbox.setTextBold();
  encrypt_checkbox.setOpaque(false);
  encrypt_checkbox.addEventHandler(this, "encrypt_clicked");
  encrypt_checkbox.setSelected(true);
  decrypt = new GCheckbox(options, 169, 105, 120, 20);
  decrypt.setIconAlign(GAlign.LEFT, GAlign.MIDDLE);
  decrypt.setText("Decrypt");
  decrypt.setTextBold();
  decrypt.setLocalColorScheme(GCScheme.RED_SCHEME);
  decrypt.setOpaque(false);
  decrypt.addEventHandler(this, "decrypt_clicked");
  start_button = new GButton(options, 106, 205, 100, 40);
  start_button.setText("Start");
  start_button.setLocalColorScheme(GCScheme.GOLD_SCHEME);
  start_button.addEventHandler(this, "start_button_clicked");
  find_hint = new GLabel(options, 36, 264, 225, 20);
  find_hint.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  find_hint.setText("Check the file output.txt for results!");
  find_hint.setTextBold();
  find_hint.setTextItalic();
  find_hint.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  find_hint.setOpaque(false);
  explanation = new GLabel(options, 28, 44, 250, 50);
  explanation.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  explanation.setText("This window is for selecting whether the software will encrypt, or decrypt the input file.");
  explanation.setTextBold();
  explanation.setTextItalic();
  explanation.setLocalColorScheme(GCScheme.PURPLE_SCHEME);
  explanation.setOpaque(false);
  options.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow options;
GLabel title; 
GCheckbox encrypt_checkbox; 
GCheckbox decrypt; 
GButton start_button; 
GLabel find_hint; 
GLabel explanation; 