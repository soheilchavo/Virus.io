class Virus {
  float spreadArea;
  float strength;
  
  Virus(float sa, float st){
    this.spreadArea = sa;
    this.strength = st;
  }
}

void startVirus(){
  virus_started = true;
  people[int(random(people.length-1))].become_infected(); // Randomly chooses someone to be infected
  main_virus = new Virus(virus_spread_area, virus_strength);
}

// Generates an immunity based on a person's stats
float getImmunity(NPC p) {
  return (1/global_immunity)*((p.age/100)+p.occupation.base_immunity)/2;
}
