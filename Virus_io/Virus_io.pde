Building hospital;
float sim_time = 0;

float time_of_day = 0;
int day = 0;
boolean is_weekend;

int age_deviation = 5;

Building[] buildings;

void setup() {
  size(800,600);
}

void draw() {
  background(128);

  generateBuildings();
}

void generateBuildings() { 

}

void switch_day(){
  day += 1;
  if(day > 6){
    day = 0;
    is_weekend = false;
  }
  if(day >= 5){
    is_weekend = true;
  }
}
