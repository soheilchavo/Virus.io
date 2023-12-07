class Virus {
  float spreadArea;
  
  Virus(float s){
    this.spreadArea = s;
  }
}

void startVirus(){
  virus_started = true;
  people[int(random(people.length-1))].become_infected();
  main_virus = new Virus(virus_spread_area);
}

float getImmunity(int age, Occupation o) {
  //println((1/global_immunity)*((age/100)+o.base_immunity)/2);
  return (1/global_immunity)*((age/100)+o.base_immunity)/2;
}
