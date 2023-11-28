int city_size = 40;
float grid_size;

float time_of_day = 0;
int day = 0;
boolean is_weekend;

float sim_speed = 1;
int age_deviation = 5;

Building[] buildings;

boolean simOngoing = false;

float hospital_rate = 0.5;
float work_place_rate = 0.5;
float social_place_rate = 0.5;
float school_rate = 0.5;
float home_to_workplace_rate = 0.5;

int num_people;
NPC[] People;

void setup() {
  size(600,600);
  grid_size = width/city_size;
  
  startSim();
}

void draw() {
  
  background(128);

  if(simOngoing){
    time_of_day += 0.01*sim_speed;
    
    if(time_of_day-floor(time_of_day) >= 0.6){
      time_of_day = floor(time_of_day)+1;
    }
    
    if(time_of_day >= 24){
      switchDay();
    }
  }
}

void startSim(){
  
  generateBuildings();
  generatePeople();
  
  //Calculate the number of people
  
  People = new NPC[num_people];
}

void generateBuildings() {}

void generatePeople(){}

void startVirus(){}

void switchDay(){
  day += 1;
  if(day > 6){
    day = 0;
    is_weekend = false;
  }
  if(day >= 5){
    is_weekend = true;
  }
}
