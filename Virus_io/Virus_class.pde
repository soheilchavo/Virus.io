class Virus {
  float spreadRate;
  
  Virus(float s){
    this.spreadRate = s;
  }
}

void startVirus(){
  
  NPC random_target = people[int(random(people.length-1))];
  
  random_target.infected = true;
  
}
