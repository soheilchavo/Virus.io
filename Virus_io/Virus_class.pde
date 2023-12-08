class Virus {
  float spreadArea;
  float strength;
  float recoverySpeed;
  
  Virus(float sa, float st, float rs){
    this.spreadArea = sa;
    this.strength = st;
    this.recoverySpeed = rs;
  }
}

void startVirus(){
  virus_started = true;
  people[int(random(people.length-1))].become_infected(); // Randomly chooses someone to be infected
  main_virus = new Virus(virusSpreadRadiusSlider.getValueF(), VirusStrengthSlider.getValueF(), RecoverySpeedSlider.getValueF());
}

// Generates an immunity based on a person's stats
float getImmunity(NPC p) {
  return (1/global_immunity)*((p.age/100)+p.occupation.base_immunity)/2;
}
