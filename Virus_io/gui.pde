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

synchronized public void win_draw1(PApplet appc, GWinData data) { //_CODE_:window1:691222:
  appc.background(230);
} //_CODE_:window1:691222:

public void hospitalRateSliderChanged(GSlider source, GEvent event) { //_CODE_:hospitalRateSlider:438463:
  building_rates[1] = hospitalRateSlider.getValueF();
} //_CODE_:hospitalRateSlider:438463:

public void workplaceRateSliderChanged(GSlider source, GEvent event) { //_CODE_:workplaceRateSlider:991023:
  building_rates[2] = workplaceRateSlider.getValueF();
} //_CODE_:workplaceRateSlider:991023:

public void schoolRateSliderChanged(GSlider source, GEvent event) { //_CODE_:schoolRateSlider:537797:
  building_rates[3] = schoolRateSlider.getValueF();
} //_CODE_:schoolRateSlider:537797:

public void eateryRateSliderChanged(GSlider source, GEvent event) { //_CODE_:eateryRateSlider:668242:
  building_rates[5] = eateryRateSlider.getValueF();
} //_CODE_:eateryRateSlider:668242:

public void parkRateSliderChanged(GSlider source, GEvent event) { //_CODE_:parkRateSlider:890325:
  building_rates[4] = parkRateSlider.getValueF();
} //_CODE_:parkRateSlider:890325:

public void citySizeSliderChanged(GSlider source, GEvent event) { //_CODE_:citySizeSlider:359799:
  city_size = citySizeSlider.getValueI();
} //_CODE_:citySizeSlider:359799:

public void immunityRateSliderChanged(GSlider source, GEvent event) { //_CODE_:immunityRateSlider:986202:
  println("immunityRateSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:immunityRateSlider:986202:

public void populationDensitySliderChanged(GSlider source, GEvent event) { //_CODE_:populationDensitySlider:846523:
  println("populationDensitySlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:populationDensitySlider:846523:

public void gridSizeSliderChanged(GSlider source, GEvent event) { //_CODE_:gridSizeSlider:873935:
  println("gridSizeSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:gridSizeSlider:873935:

public void timeRateSliderChanged(GSlider source, GEvent event) { //_CODE_:timeRateSlider:628616:
  println("timeRateSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:timeRateSlider:628616:

public void houseRateSliderChanged(GSlider source, GEvent event) { //_CODE_:houseRateSlider:255692:
  building_rates[0] = houseRateSlider.getValueF();
} //_CODE_:houseRateSlider:255692:

public void npcSliderChanged(GSlider source, GEvent event) { //_CODE_:npcSizeSlider:944321:
  println("npcSizeSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:npcSizeSlider:944321:

public void npcSpeedSliderChanged(GSlider source, GEvent event) { //_CODE_:npcSpeedSlider:400537:
  println("npcSpeedSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:npcSpeedSlider:400537:

public void ageDeviationSliderChanged(GSlider source, GEvent event) { //_CODE_:ageDeviationSlider:274232:
  println("ageDeviationSlider - GSlider >> GEvent." + event + " @ " + millis());
} //_CODE_:ageDeviationSlider:274232:

public void showPathfindOnButtonClicked(GButton source, GEvent event) { //_CODE_:showPathfindOnButton:442527:
  println("pathfindOnButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:showPathfindOnButton:442527:

public void showPathfindOffButtonClicked(GButton source, GEvent event) { //_CODE_:showPathfindOffButton:375236:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:showPathfindOffButton:375236:

public void showBuildingsOnButtonClicked(GButton source, GEvent event) { //_CODE_:showBuildingsOnButton:978553:
  println("showBuildingsOnButton - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:showBuildingsOnButton:978553:

public void showBuildingOffButtonClicked(GButton source, GEvent event) { //_CODE_:showBuildingOffButton:630229:
  println("button1 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:showBuildingOffButton:630229:

public void simStartButtonClicked(GButton source, GEvent event) { //_CODE_:simStartButton:276996:
  startSim();
  switchDay();
} //_CODE_:simStartButton:276996:

public void simPauseButtonClicked(GButton source, GEvent event) { //_CODE_:simPauseButton:467458:
  paused = !paused;
  if(paused)
    simPauseButton.setText("resume");
  else
    simPauseButton.setText("pause");
  
} //_CODE_:simPauseButton:467458:

public void button3_click1(GButton source, GEvent event) { //_CODE_:button3:547459:
  println("button3 - GButton >> GEvent." + event + " @ " + millis());
} //_CODE_:button3:547459:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  window1 = GWindow.getWindow(this, "Window title", 0, 0, 550, 430, JAVA2D);
  window1.noLoop();
  window1.setActionOnClose(G4P.KEEP_OPEN);
  window1.addDrawHandler(this, "win_draw1");
  hospitalRateName = new GLabel(window1, 0, 0, 80, 20);
  hospitalRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  hospitalRateName.setText("Hospital rate");
  hospitalRateName.setOpaque(true);
  hospitalRateSlider = new GSlider(window1, 0, 20, 150, 50, 10.0);
  hospitalRateSlider.setShowValue(true);
  hospitalRateSlider.setShowLimits(true);
  hospitalRateSlider.setLimits(5.0, 0.0, 10.0);
  hospitalRateSlider.setNbrTicks(10);
  hospitalRateSlider.setShowTicks(true);
  hospitalRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  hospitalRateSlider.setOpaque(true);
  hospitalRateSlider.addEventHandler(this, "hospitalRateSliderChanged");
  workplaceRateName = new GLabel(window1, 0, 70, 90, 20);
  workplaceRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  workplaceRateName.setText("Workplace rate");
  workplaceRateName.setOpaque(false);
  workplaceRateSlider = new GSlider(window1, 0, 90, 150, 50, 10.0);
  workplaceRateSlider.setShowValue(true);
  workplaceRateSlider.setShowLimits(true);
  workplaceRateSlider.setLimits(5.0, 0.0, 10.0);
  workplaceRateSlider.setNbrTicks(10);
  workplaceRateSlider.setShowTicks(true);
  workplaceRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  workplaceRateSlider.setOpaque(true);
  workplaceRateSlider.addEventHandler(this, "workplaceRateSliderChanged");
  schoolRateName = new GLabel(window1, 0, 140, 66, 20);
  schoolRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  schoolRateName.setText("School rate");
  schoolRateName.setOpaque(false);
  schoolRateSlider = new GSlider(window1, 0, 160, 150, 50, 10.0);
  schoolRateSlider.setShowValue(true);
  schoolRateSlider.setShowLimits(true);
  schoolRateSlider.setLimits(5.0, 0.0, 10.0);
  schoolRateSlider.setNbrTicks(10);
  schoolRateSlider.setShowTicks(true);
  schoolRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  schoolRateSlider.setOpaque(true);
  schoolRateSlider.addEventHandler(this, "schoolRateSliderChanged");
  eateryRateName = new GLabel(window1, 0, 210, 69, 20);
  eateryRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  eateryRateName.setText("Eatery Rate");
  eateryRateName.setOpaque(false);
  eateryRateSlider = new GSlider(window1, 0, 230, 150, 50, 10.0);
  eateryRateSlider.setShowValue(true);
  eateryRateSlider.setShowLimits(true);
  eateryRateSlider.setLimits(5.0, 0.0, 10.0);
  eateryRateSlider.setNbrTicks(10);
  eateryRateSlider.setShowTicks(true);
  eateryRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  eateryRateSlider.setOpaque(true);
  eateryRateSlider.addEventHandler(this, "eateryRateSliderChanged");
  parkRateName = new GLabel(window1, 0, 280, 55, 20);
  parkRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  parkRateName.setText("Park rate");
  parkRateName.setOpaque(false);
  parkRateSlider = new GSlider(window1, 0, 300, 150, 50, 10.0);
  parkRateSlider.setShowValue(true);
  parkRateSlider.setShowLimits(true);
  parkRateSlider.setLimits(5.0, 0.0, 10.0);
  parkRateSlider.setNbrTicks(10);
  parkRateSlider.setShowTicks(true);
  parkRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  parkRateSlider.setOpaque(true);
  parkRateSlider.addEventHandler(this, "parkRateSliderChanged");
  citySizeName = new GLabel(window1, 200, 0, 51, 20);
  citySizeName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  citySizeName.setText("City size");
  citySizeName.setOpaque(false);
  citySizeSlider = new GSlider(window1, 200, 20, 150, 50, 10.0);
  citySizeSlider.setShowValue(true);
  citySizeSlider.setShowLimits(true);
  citySizeSlider.setLimits(5.0, 0.0, 10.0);
  citySizeSlider.setNbrTicks(10);
  citySizeSlider.setShowTicks(true);
  citySizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  citySizeSlider.setOpaque(true);
  citySizeSlider.addEventHandler(this, "citySizeSliderChanged");
  immunityRateName = new GLabel(window1, 400, 0, 80, 20);
  immunityRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  immunityRateName.setText("immunity %");
  immunityRateName.setOpaque(true);
  immunityRateSlider = new GSlider(window1, 400, 20, 150, 50, 10.0);
  immunityRateSlider.setShowValue(true);
  immunityRateSlider.setShowLimits(true);
  immunityRateSlider.setLimits(5.0, 0.0, 100.0);
  immunityRateSlider.setNbrTicks(10);
  immunityRateSlider.setShowTicks(true);
  immunityRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  immunityRateSlider.setOpaque(true);
  immunityRateSlider.addEventHandler(this, "immunityRateSliderChanged");
  populationDensityName = new GLabel(window1, 400, 70, 104, 20);
  populationDensityName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  populationDensityName.setText("population density");
  populationDensityName.setOpaque(false);
  populationDensitySlider = new GSlider(window1, 400, 90, 150, 50, 10.0);
  populationDensitySlider.setShowValue(true);
  populationDensitySlider.setShowLimits(true);
  populationDensitySlider.setLimits(5.0, 0.0, 10.0);
  populationDensitySlider.setNbrTicks(10);
  populationDensitySlider.setShowTicks(true);
  populationDensitySlider.setNumberFormat(G4P.DECIMAL, 2);
  populationDensitySlider.setOpaque(true);
  populationDensitySlider.addEventHandler(this, "populationDensitySliderChanged");
  gridSizeName = new GLabel(window1, 200, 70, 52, 20);
  gridSizeName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  gridSizeName.setText("grid size");
  gridSizeName.setOpaque(false);
  gridSizeSlider = new GSlider(window1, 200, 90, 150, 50, 10.0);
  gridSizeSlider.setShowValue(true);
  gridSizeSlider.setShowLimits(true);
  gridSizeSlider.setLimits(5.0, 0.0, 10.0);
  gridSizeSlider.setNbrTicks(10);
  gridSizeSlider.setShowTicks(true);
  gridSizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  gridSizeSlider.setOpaque(true);
  gridSizeSlider.addEventHandler(this, "gridSizeSliderChanged");
  timeRateName = new GLabel(window1, 200, 280, 82, 20);
  timeRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  timeRateName.setText("time multiplier");
  timeRateName.setOpaque(false);
  timeRateSlider = new GSlider(window1, 200, 300, 150, 50, 10.0);
  timeRateSlider.setShowValue(true);
  timeRateSlider.setShowLimits(true);
  timeRateSlider.setLimits(5.0, 0.01, 10.0);
  timeRateSlider.setNbrTicks(10);
  timeRateSlider.setShowTicks(true);
  timeRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  timeRateSlider.setOpaque(true);
  timeRateSlider.addEventHandler(this, "timeRateSliderChanged");
  npcSizeName = new GLabel(window1, 200, 140, 55, 20);
  npcSizeName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  npcSizeName.setText("NPC size");
  npcSizeName.setOpaque(false);
  houseRateName = new GLabel(window1, 0, 350, 65, 20);
  houseRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  houseRateName.setText("House rate");
  houseRateName.setOpaque(false);
  houseRateSlider = new GSlider(window1, 0, 370, 150, 50, 10.0);
  houseRateSlider.setShowValue(true);
  houseRateSlider.setShowLimits(true);
  houseRateSlider.setLimits(5.0, 0.0, 10.0);
  houseRateSlider.setNbrTicks(10);
  houseRateSlider.setShowTicks(true);
  houseRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  houseRateSlider.setOpaque(true);
  houseRateSlider.addEventHandler(this, "houseRateSliderChanged");
  npcSizeSlider = new GSlider(window1, 200, 160, 150, 50, 10.0);
  npcSizeSlider.setShowValue(true);
  npcSizeSlider.setShowLimits(true);
  npcSizeSlider.setLimits(5.0, 0.0, 10.0);
  npcSizeSlider.setNbrTicks(10);
  npcSizeSlider.setShowTicks(true);
  npcSizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  npcSizeSlider.setOpaque(true);
  npcSizeSlider.addEventHandler(this, "npcSliderChanged");
  npcSpeedName = new GLabel(window1, 200, 210, 68, 20);
  npcSpeedName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  npcSpeedName.setText("NPC speed");
  npcSpeedName.setOpaque(false);
  npcSpeedSlider = new GSlider(window1, 200, 230, 150, 50, 10.0);
  npcSpeedSlider.setShowValue(true);
  npcSpeedSlider.setShowLimits(true);
  npcSpeedSlider.setLimits(5.0, 0.0, 10.0);
  npcSpeedSlider.setNbrTicks(10);
  npcSpeedSlider.setShowTicks(true);
  npcSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  npcSpeedSlider.setOpaque(true);
  npcSpeedSlider.addEventHandler(this, "npcSpeedSliderChanged");
  ageDeviationName = new GLabel(window1, 200, 350, 80, 20);
  ageDeviationName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ageDeviationName.setText("Age deviation");
  ageDeviationName.setOpaque(false);
  ageDeviationSlider = new GSlider(window1, 200, 370, 150, 50, 10.0);
  ageDeviationSlider.setShowValue(true);
  ageDeviationSlider.setShowLimits(true);
  ageDeviationSlider.setLimits(5.0, 0.0, 10.0);
  ageDeviationSlider.setNbrTicks(10);
  ageDeviationSlider.setShowTicks(true);
  ageDeviationSlider.setNumberFormat(G4P.DECIMAL, 2);
  ageDeviationSlider.setOpaque(true);
  ageDeviationSlider.addEventHandler(this, "ageDeviationSliderChanged");
  showPathfindName = new GLabel(window1, 433, 210, 84, 20);
  showPathfindName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  showPathfindName.setText("Show Pathfind");
  showPathfindName.setOpaque(false);
  showPathfindOnButton = new GButton(window1, 420, 240, 40, 20);
  showPathfindOnButton.setText("on");
  showPathfindOnButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  showPathfindOnButton.addEventHandler(this, "showPathfindOnButtonClicked");
  showPathfindOffButton = new GButton(window1, 490, 240, 40, 20);
  showPathfindOffButton.setText("off");
  showPathfindOffButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  showPathfindOffButton.addEventHandler(this, "showPathfindOffButtonClicked");
  label1 = new GLabel(window1, 427, 270, 96, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Show Buildings");
  label1.setOpaque(false);
  showBuildingsOnButton = new GButton(window1, 420, 300, 40, 20);
  showBuildingsOnButton.setText("on");
  showBuildingsOnButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  showBuildingsOnButton.addEventHandler(this, "showBuildingsOnButtonClicked");
  showBuildingOffButton = new GButton(window1, 490, 300, 40, 20);
  showBuildingOffButton.setText("off");
  showBuildingOffButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  showBuildingOffButton.addEventHandler(this, "showBuildingOffButtonClicked");
  simulationCode = new GLabel(window1, 435, 330, 80, 20);
  simulationCode.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  simulationCode.setText("simulation");
  simulationCode.setOpaque(false);
  simStartButton = new GButton(window1, 405, 360, 43, 20);
  simStartButton.setText("start");
  simStartButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  simStartButton.addEventHandler(this, "simStartButtonClicked");
  simPauseButton = new GButton(window1, 454, 360, 43, 20);
  simPauseButton.setText("pause");
  simPauseButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  simPauseButton.addEventHandler(this, "simPauseButtonClicked");
  button3 = new GButton(window1, 504, 360, 43, 20);
  button3.setText("reset");
  button3.setLocalColorScheme(GCScheme.RED_SCHEME);
  button3.addEventHandler(this, "button3_click1");
  window1.loop();
}

// Variable declarations 
// autogenerated do not edit
GWindow window1;
GLabel hospitalRateName; 
GSlider hospitalRateSlider; 
GLabel workplaceRateName; 
GSlider workplaceRateSlider; 
GLabel schoolRateName; 
GSlider schoolRateSlider; 
GLabel eateryRateName; 
GSlider eateryRateSlider; 
GLabel parkRateName; 
GSlider parkRateSlider; 
GLabel citySizeName; 
GSlider citySizeSlider; 
GLabel immunityRateName; 
GSlider immunityRateSlider; 
GLabel populationDensityName; 
GSlider populationDensitySlider; 
GLabel gridSizeName; 
GSlider gridSizeSlider; 
GLabel timeRateName; 
GSlider timeRateSlider; 
GLabel npcSizeName; 
GLabel houseRateName; 
GSlider houseRateSlider; 
GSlider npcSizeSlider; 
GLabel npcSpeedName; 
GSlider npcSpeedSlider; 
GLabel ageDeviationName; 
GSlider ageDeviationSlider; 
GLabel showPathfindName; 
GButton showPathfindOnButton; 
GButton showPathfindOffButton; 
GLabel label1; 
GButton showBuildingsOnButton; 
GButton showBuildingOffButton; 
GLabel simulationCode; 
GButton simStartButton; 
GButton simPauseButton; 
GButton button3; 
