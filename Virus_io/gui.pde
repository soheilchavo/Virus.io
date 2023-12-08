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
  global_immunity = immunityRateSlider.getValueF();
} //_CODE_:immunityRateSlider:986202:

public void populationDensitySliderChanged(GSlider source, GEvent event) { //_CODE_:populationDensitySlider:846523:
  population_density = 1/populationDensitySlider.getValueF();
} //_CODE_:populationDensitySlider:846523:

public void gridSizeSliderChanged(GSlider source, GEvent event) { //_CODE_:gridSizeSlider:873935:
  grid_size = gridSizeSlider.getValueF();
} //_CODE_:gridSizeSlider:873935:

public void timeRateSliderChanged(GSlider source, GEvent event) { //_CODE_:timeRateSlider:628616:
  sim_speed = timeRateSlider.getValueF();
} //_CODE_:timeRateSlider:628616:

public void houseRateSliderChanged(GSlider source, GEvent event) { //_CODE_:houseRateSlider:255692:
  building_rates[0] = houseRateSlider.getValueF();
} //_CODE_:houseRateSlider:255692:

public void npcSliderChanged(GSlider source, GEvent event) { //_CODE_:npcSizeSlider:944321:
  npc_size = npcSizeSlider.getValueF();
} //_CODE_:npcSizeSlider:944321:

public void npcSpeedSliderChanged(GSlider source, GEvent event) { //_CODE_:npcSpeedSlider:400537:
  npc_speed = npcSpeedSlider.getValueF()/10;
} //_CODE_:npcSpeedSlider:400537:

public void ageDeviationSliderChanged(GSlider source, GEvent event) { //_CODE_:ageDeviationSlider:274232:
  age_deviation = ageDeviationSlider.getValueI();
} //_CODE_:ageDeviationSlider:274232:

public void showPathfindOnButtonClicked(GButton source, GEvent event) { //_CODE_:showPathfindOnButton:442527:
  draw_pathfinding = true;
} //_CODE_:showPathfindOnButton:442527:

public void showPathfindOffButtonClicked(GButton source, GEvent event) { //_CODE_:showPathfindOffButton:375236:
  draw_pathfinding = false;
} //_CODE_:showPathfindOffButton:375236:

public void showBuildingsOnButtonClicked(GButton source, GEvent event) { //_CODE_:showBuildingsOnButton:978553:
  draw_buildings = true;
} //_CODE_:showBuildingsOnButton:978553:

public void showBuildingOffButtonClicked(GButton source, GEvent event) { //_CODE_:showBuildingOffButton:630229:
  draw_buildings = false;
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

public void virusStartButtonClicked(GButton source, GEvent event) { //_CODE_:virusStartButton:523430:
  if(!virus_started)
    startVirus();
} //_CODE_:virusStartButton:523430:

public void virusSpreadRadiusChanged(GSlider source, GEvent event) { //_CODE_:virusSpreadRadiusSlider:596595:
  main_virus.spreadArea = virusSpreadRadiusSlider.getValueF();
} //_CODE_:virusSpreadRadiusSlider:596595:

public void RecoverySpeedSliderChanged(GSlider source, GEvent event) { //_CODE_:RecoverySpeedSlider:956314:
  main_virus.recoverySpeed = RecoverySpeedSlider.getValueF();
} //_CODE_:RecoverySpeedSlider:956314:

public void VirusCureButtonPressed(GButton source, GEvent event) { //_CODE_:VirusCureButton:518334:
  for(NPC p: people){
    p.infected = false;
  }  
} //_CODE_:VirusCureButton:518334:

public void VirusStrengthSliderChanged(GSlider source, GEvent event) { //_CODE_:VirusStrengthSlider:811345:
  main_virus.strength = VirusStrengthSlider.getValueF();
} //_CODE_:VirusStrengthSlider:811345:

public void MaskEffectivnessSliderChanged(GSlider source, GEvent event) { //_CODE_:MaskEffectivnessSlider:860434:
  mask_effectiveness = MaskEffectivnessSlider.getValueF();
} //_CODE_:MaskEffectivnessSlider:860434:

public void VaccineEffectivenessChanged(GSlider source, GEvent event) { //_CODE_:VaccineEffectivenessSlider:538775:
  vaccine_effectiveness = VaccineEffectivenessSlider.getValueF();
} //_CODE_:VaccineEffectivenessSlider:538775:

synchronized public void win_draw2(PApplet appc, GWinData data) { //_CODE_:window2:673029:
  appc.background(230);
} //_CODE_:window2:673029:

public void MaskButtonClicked(GButton source, GEvent event) { //_CODE_:MaskButton:758874:
  if(mask_mandate){mask_mandate = false; MaskButton.setText("Mandate Masks");}
  else{mask_mandate = true; MaskButton.setText("Remove Mask Mandate");}
  
} //_CODE_:MaskButton:758874:

public void VaccineButtonClicked(GButton source, GEvent event) { //_CODE_:VaccineButton:556556:
  if(vaccine_mandate){vaccine_mandate = false; VaccineButton.setText("Mandate Vaccine");}
  else{vaccine_mandate = true; VaccineButton.setText("Remove Vaccine Mandate");}
} //_CODE_:VaccineButton:556556:

public void QuarantineButtonClicked(GButton source, GEvent event) { //_CODE_:QuarantineButton:694944:
  if(quarantine_mandate){quarantine_mandate = false; QuarantineButton.setText("Quarintine Mandate");}
  else{quarantine_mandate = true; QuarantineButton.setText("Remove Quarintine Mandate");}
} //_CODE_:QuarantineButton:694944:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  togGroup1 = new GToggleGroup();
  window1 = GWindow.getWindow(this, "Controls", 0, 0, 580, 700, JAVA2D);
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
  citySizeName = new GLabel(window1, 0, 420, 51, 20);
  citySizeName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  citySizeName.setText("City size");
  citySizeName.setOpaque(false);
  citySizeSlider = new GSlider(window1, 0, 440, 150, 50, 10.0);
  citySizeSlider.setShowValue(true);
  citySizeSlider.setShowLimits(true);
  citySizeSlider.setLimits(5.0, 4.0, 8.0);
  citySizeSlider.setNbrTicks(10);
  citySizeSlider.setShowTicks(true);
  citySizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  citySizeSlider.setOpaque(true);
  citySizeSlider.addEventHandler(this, "citySizeSliderChanged");
  immunityRateName = new GLabel(window1, 200, 210, 92, 20);
  immunityRateName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  immunityRateName.setText("Base Immunity");
  immunityRateName.setOpaque(false);
  immunityRateSlider = new GSlider(window1, 200, 230, 150, 50, 10.0);
  immunityRateSlider.setShowValue(true);
  immunityRateSlider.setShowLimits(true);
  immunityRateSlider.setLimits(0.5, 0.0, 1.0);
  immunityRateSlider.setNbrTicks(10);
  immunityRateSlider.setShowTicks(true);
  immunityRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  immunityRateSlider.setOpaque(true);
  immunityRateSlider.addEventHandler(this, "immunityRateSliderChanged");
  populationDensityName = new GLabel(window1, 200, 70, 110, 20);
  populationDensityName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  populationDensityName.setText("Population Density");
  populationDensityName.setOpaque(false);
  populationDensitySlider = new GSlider(window1, 200, 90, 150, 50, 10.0);
  populationDensitySlider.setShowValue(true);
  populationDensitySlider.setShowLimits(true);
  populationDensitySlider.setLimits(10.0, 5.0, 12.0);
  populationDensitySlider.setNbrTicks(7);
  populationDensitySlider.setShowTicks(true);
  populationDensitySlider.setNumberFormat(G4P.DECIMAL, 2);
  populationDensitySlider.setOpaque(true);
  populationDensitySlider.addEventHandler(this, "populationDensitySliderChanged");
  gridSizeName = new GLabel(window1, 0, 490, 67, 20);
  gridSizeName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  gridSizeName.setText("Grid Size");
  gridSizeName.setOpaque(false);
  gridSizeSlider = new GSlider(window1, 0, 510, 150, 50, 10.0);
  gridSizeSlider.setShowValue(true);
  gridSizeSlider.setShowLimits(true);
  gridSizeSlider.setLimits(5.0, 0.0, 10.0);
  gridSizeSlider.setNbrTicks(10);
  gridSizeSlider.setShowTicks(true);
  gridSizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  gridSizeSlider.setOpaque(true);
  gridSizeSlider.addEventHandler(this, "gridSizeSliderChanged");
  timeRateName = new GLabel(window1, 0, 560, 108, 20);
  timeRateName.setTextAlign(GAlign.LEFT, GAlign.TOP);
  timeRateName.setText("Simulation Speed");
  timeRateName.setOpaque(false);
  timeRateSlider = new GSlider(window1, 0, 580, 150, 50, 10.0);
  timeRateSlider.setShowValue(true);
  timeRateSlider.setShowLimits(true);
  timeRateSlider.setLimits(1.0, 0.01, 15.0);
  timeRateSlider.setNbrTicks(15);
  timeRateSlider.setShowTicks(true);
  timeRateSlider.setNumberFormat(G4P.DECIMAL, 2);
  timeRateSlider.setOpaque(true);
  timeRateSlider.addEventHandler(this, "timeRateSliderChanged");
  npcSizeName = new GLabel(window1, 200, 490, 55, 20);
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
  npcSizeSlider = new GSlider(window1, 200, 510, 150, 50, 10.0);
  npcSizeSlider.setShowValue(true);
  npcSizeSlider.setShowLimits(true);
  npcSizeSlider.setLimits(12.0, 1.0, 15.0);
  npcSizeSlider.setNbrTicks(14);
  npcSizeSlider.setShowTicks(true);
  npcSizeSlider.setNumberFormat(G4P.DECIMAL, 2);
  npcSizeSlider.setOpaque(true);
  npcSizeSlider.addEventHandler(this, "npcSliderChanged");
  npcSpeedName = new GLabel(window1, 200, 140, 68, 20);
  npcSpeedName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  npcSpeedName.setText("NPC speed");
  npcSpeedName.setOpaque(false);
  npcSpeedSlider = new GSlider(window1, 200, 160, 150, 50, 10.0);
  npcSpeedSlider.setShowValue(true);
  npcSpeedSlider.setShowLimits(true);
  npcSpeedSlider.setLimits(0.07, 0.0, 0.2);
  npcSpeedSlider.setNbrTicks(10);
  npcSpeedSlider.setShowTicks(true);
  npcSpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  npcSpeedSlider.setOpaque(true);
  npcSpeedSlider.addEventHandler(this, "npcSpeedSliderChanged");
  ageDeviationName = new GLabel(window1, 200, 0, 80, 20);
  ageDeviationName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ageDeviationName.setText("Age deviation");
  ageDeviationName.setOpaque(false);
  ageDeviationSlider = new GSlider(window1, 200, 20, 150, 50, 10.0);
  ageDeviationSlider.setShowValue(true);
  ageDeviationSlider.setShowLimits(true);
  ageDeviationSlider.setLimits(5.0, 0.0, 10.0);
  ageDeviationSlider.setNbrTicks(10);
  ageDeviationSlider.setShowTicks(true);
  ageDeviationSlider.setNumberFormat(G4P.DECIMAL, 2);
  ageDeviationSlider.setOpaque(true);
  ageDeviationSlider.addEventHandler(this, "ageDeviationSliderChanged");
  showPathfindName = new GLabel(window1, 425, 340, 100, 20);
  showPathfindName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  showPathfindName.setText("Draw Pathfinding");
  showPathfindName.setOpaque(false);
  showPathfindOnButton = new GButton(window1, 410, 370, 45, 20);
  showPathfindOnButton.setText("on");
  showPathfindOnButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  showPathfindOnButton.addEventHandler(this, "showPathfindOnButtonClicked");
  showPathfindOffButton = new GButton(window1, 500, 370, 45, 20);
  showPathfindOffButton.setText("off");
  showPathfindOffButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  showPathfindOffButton.addEventHandler(this, "showPathfindOffButtonClicked");
  label1 = new GLabel(window1, 427, 420, 96, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Draw Buildings");
  label1.setOpaque(false);
  showBuildingsOnButton = new GButton(window1, 410, 450, 45, 20);
  showBuildingsOnButton.setText("on");
  showBuildingsOnButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  showBuildingsOnButton.addEventHandler(this, "showBuildingsOnButtonClicked");
  showBuildingOffButton = new GButton(window1, 500, 450, 45, 20);
  showBuildingOffButton.setText("off");
  showBuildingOffButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  showBuildingOffButton.addEventHandler(this, "showBuildingOffButtonClicked");
  simulationCode = new GLabel(window1, 435, 0, 80, 20);
  simulationCode.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  simulationCode.setText("Simulation");
  simulationCode.setOpaque(false);
  simStartButton = new GButton(window1, 400, 30, 150, 50);
  simStartButton.setText("Start/Reset");
  simStartButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  simStartButton.addEventHandler(this, "simStartButtonClicked");
  simPauseButton = new GButton(window1, 400, 90, 150, 50);
  simPauseButton.setText("Pause");
  simPauseButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  simPauseButton.addEventHandler(this, "simPauseButtonClicked");
  virusStartButton = new GButton(window1, 400, 200, 150, 50);
  virusStartButton.setText("Release Virus");
  virusStartButton.setLocalColorScheme(GCScheme.RED_SCHEME);
  virusStartButton.addEventHandler(this, "virusStartButtonClicked");
  virusSpreadRadius = new GLabel(window1, 200, 280, 118, 20);
  virusSpreadRadius.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  virusSpreadRadius.setText("Virus Spread Radius");
  virusSpreadRadius.setOpaque(false);
  virusSpreadRadiusSlider = new GSlider(window1, 200, 300, 150, 50, 10.0);
  virusSpreadRadiusSlider.setShowValue(true);
  virusSpreadRadiusSlider.setShowLimits(true);
  virusSpreadRadiusSlider.setLimits(1.0, 0.0, 10.0);
  virusSpreadRadiusSlider.setNbrTicks(10);
  virusSpreadRadiusSlider.setShowTicks(true);
  virusSpreadRadiusSlider.setNumberFormat(G4P.DECIMAL, 2);
  virusSpreadRadiusSlider.setOpaque(true);
  virusSpreadRadiusSlider.addEventHandler(this, "virusSpreadRadiusChanged");
  VirusName = new GLabel(window1, 450, 170, 50, 20);
  VirusName.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  VirusName.setText("Virus");
  VirusName.setOpaque(false);
  RecoverSpeedLabel = new GLabel(window1, 200, 420, 100, 20);
  RecoverSpeedLabel.setText("Recovery Speed");
  RecoverSpeedLabel.setOpaque(false);
  RecoverySpeedSlider = new GSlider(window1, 200, 440, 150, 50, 10.0);
  RecoverySpeedSlider.setShowValue(true);
  RecoverySpeedSlider.setShowLimits(true);
  RecoverySpeedSlider.setLimits(1.0, 1.0, 10.0);
  RecoverySpeedSlider.setNbrTicks(9);
  RecoverySpeedSlider.setShowTicks(true);
  RecoverySpeedSlider.setNumberFormat(G4P.DECIMAL, 2);
  RecoverySpeedSlider.setOpaque(true);
  RecoverySpeedSlider.addEventHandler(this, "RecoverySpeedSliderChanged");
  VirusCureButton = new GButton(window1, 400, 260, 150, 50);
  VirusCureButton.setText("Cure Virus");
  VirusCureButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  VirusCureButton.addEventHandler(this, "VirusCureButtonPressed");
  VirusStrengthLabel = new GLabel(window1, 200, 350, 90, 20);
  VirusStrengthLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  VirusStrengthLabel.setText("Virus Strength");
  VirusStrengthLabel.setOpaque(false);
  VirusStrengthSlider = new GSlider(window1, 200, 370, 150, 50, 10.0);
  VirusStrengthSlider.setShowValue(true);
  VirusStrengthSlider.setShowLimits(true);
  VirusStrengthSlider.setLimits(0.5, 0.0, 1.0);
  VirusStrengthSlider.setNbrTicks(10);
  VirusStrengthSlider.setShowTicks(true);
  VirusStrengthSlider.setNumberFormat(G4P.DECIMAL, 2);
  VirusStrengthSlider.setOpaque(true);
  VirusStrengthSlider.addEventHandler(this, "VirusStrengthSliderChanged");
  MaskLabel = new GLabel(window1, 0, 630, 110, 20);
  MaskLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  MaskLabel.setText("Mask Effectiveness");
  MaskLabel.setOpaque(false);
  VaccineLabel = new GLabel(window1, 200, 560, 127, 20);
  VaccineLabel.setTextAlign(GAlign.CENTER, GAlign.TOP);
  VaccineLabel.setText("Vaccine Effectiveness");
  VaccineLabel.setOpaque(false);
  MaskEffectivnessSlider = new GSlider(window1, 0, 650, 150, 50, 10.0);
  MaskEffectivnessSlider.setShowValue(true);
  MaskEffectivnessSlider.setShowLimits(true);
  MaskEffectivnessSlider.setLimits(5.0, 0.0, 10.0);
  MaskEffectivnessSlider.setNbrTicks(10);
  MaskEffectivnessSlider.setShowTicks(true);
  MaskEffectivnessSlider.setNumberFormat(G4P.DECIMAL, 2);
  MaskEffectivnessSlider.setOpaque(true);
  MaskEffectivnessSlider.addEventHandler(this, "MaskEffectivnessSliderChanged");
  VaccineEffectivenessSlider = new GSlider(window1, 200, 580, 150, 50, 10.0);
  VaccineEffectivenessSlider.setShowValue(true);
  VaccineEffectivenessSlider.setShowLimits(true);
  VaccineEffectivenessSlider.setLimits(0.5, 0.0, 1.0);
  VaccineEffectivenessSlider.setNbrTicks(10);
  VaccineEffectivenessSlider.setShowTicks(true);
  VaccineEffectivenessSlider.setNumberFormat(G4P.DECIMAL, 2);
  VaccineEffectivenessSlider.setOpaque(true);
  VaccineEffectivenessSlider.addEventHandler(this, "VaccineEffectivenessChanged");
  window2 = GWindow.getWindow(this, "Statistics", 1270, 430, 350, 250, JAVA2D);
  window2.noLoop();
  window2.setActionOnClose(G4P.KEEP_OPEN);
  window2.addDrawHandler(this, "win_draw2");
  VirusStats = new GLabel(window2, 10, 10, 80, 20);
  VirusStats.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  VirusStats.setText("Statistics");
  VirusStats.setOpaque(false);
  PercentageInfected = new GLabel(window2, 10, 40, 120, 20);
  PercentageInfected.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  PercentageInfected.setText("Percentage Infected:");
  PercentageInfected.setOpaque(false);
  PercentageInfectedValue = new GLabel(window2, 10, 60, 70, 20);
  PercentageInfectedValue.setText("0%");
  PercentageInfectedValue.setLocalColorScheme(GCScheme.RED_SCHEME);
  PercentageInfectedValue.setOpaque(false);
  Percentage_Cured = new GLabel(window2, 10, 90, 110, 20);
  Percentage_Cured.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  Percentage_Cured.setText("Percentage Cured:");
  Percentage_Cured.setOpaque(false);
  PercentageCuredValue = new GLabel(window2, 10, 110, 80, 20);
  PercentageCuredValue.setText("0%");
  PercentageCuredValue.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  PercentageCuredValue.setOpaque(false);
  InHospital = new GLabel(window2, 10, 140, 120, 20);
  InHospital.setText("Hospital Capacity:");
  InHospital.setOpaque(false);
  HospitalCapacityValue = new GLabel(window2, 10, 160, 80, 20);
  HospitalCapacityValue.setText("0%");
  HospitalCapacityValue.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  HospitalCapacityValue.setOpaque(false);
  AvgImmunity = new GLabel(window2, 10, 190, 120, 20);
  AvgImmunity.setText("Average Immunity:");
  AvgImmunity.setOpaque(false);
  AverageImmunityValue = new GLabel(window2, 10, 210, 80, 20);
  AverageImmunityValue.setText("0%");
  AverageImmunityValue.setOpaque(false);
  GovernmentActionsLabel = new GLabel(window2, 210, 10, 80, 20);
  GovernmentActionsLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  GovernmentActionsLabel.setText("Actions:");
  GovernmentActionsLabel.setOpaque(false);
  MaskButton = new GButton(window2, 170, 40, 160, 40);
  MaskButton.setText("Mandate Masks");
  MaskButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  MaskButton.addEventHandler(this, "MaskButtonClicked");
  VaccineButton = new GButton(window2, 170, 100, 160, 40);
  VaccineButton.setText("Mandate Vaccines");
  VaccineButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  VaccineButton.addEventHandler(this, "VaccineButtonClicked");
  QuarantineButton = new GButton(window2, 170, 160, 160, 40);
  QuarantineButton.setText("Mandate Quarantine");
  QuarantineButton.setLocalColorScheme(GCScheme.ORANGE_SCHEME);
  QuarantineButton.addEventHandler(this, "QuarantineButtonClicked");
  WinConditionLabel = new GLabel(window2, 170, 210, 160, 30);
  WinConditionLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  WinConditionLabel.setOpaque(false);
  window1.loop();
  window2.loop();
}

// Variable declarations 
// autogenerated do not edit
GToggleGroup togGroup1; 
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
GButton virusStartButton; 
GLabel virusSpreadRadius; 
GSlider virusSpreadRadiusSlider; 
GLabel VirusName; 
GLabel RecoverSpeedLabel; 
GSlider RecoverySpeedSlider; 
GButton VirusCureButton; 
GLabel VirusStrengthLabel; 
GSlider VirusStrengthSlider; 
GLabel MaskLabel; 
GLabel VaccineLabel; 
GSlider MaskEffectivnessSlider; 
GSlider VaccineEffectivenessSlider; 
GWindow window2;
GLabel VirusStats; 
GLabel PercentageInfected; 
GLabel PercentageInfectedValue; 
GLabel Percentage_Cured; 
GLabel PercentageCuredValue; 
GLabel InHospital; 
GLabel HospitalCapacityValue; 
GLabel AvgImmunity; 
GLabel AverageImmunityValue; 
GLabel GovernmentActionsLabel; 
GButton MaskButton; 
GButton VaccineButton; 
GButton QuarantineButton; 
GLabel WinConditionLabel; 
