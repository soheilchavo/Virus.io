import g4p_controls.*;

int city_size = 50;
float grid_size;

float time_of_day = 0;
int day = 0;
boolean is_weekend;

float sim_speed = 1.3;
int age_deviation = 5;

int cell_padding = 2;
float npc_size = 14;

float hover_margin = 2;
boolean hovering_over_npc = false;

ArrayList<Building> buildings = new ArrayList<Building>();

boolean simOngoing = true;

enum BuildingType { Home, Hospital, Workplace, School, Park, Eatery };
float[] building_rates = new float[] {0.4, 0.13, 0.2, 0.2, 0.1};

float npc_speed = 0.1;

BuildingType[] b_type_order = new BuildingType[] { 
  BuildingType.Home, 
  BuildingType.Hospital, 
  BuildingType.Workplace,
  BuildingType.School,
  BuildingType.Park,
  BuildingType.Eatery,
};


int num_people;
NPC[] people;

PImage photo;

void setup() {
  size(600,600);
  grid_size = width/city_size;
  
  
  startSim();
}

void draw() {
  
  background(128);

  if(simOngoing){
    
    for(Building b: buildings){
      b.drawBuilding();
      //photo = loadImage(b.sprite);
    }
    
    for(NPC p: people){
      p.drawNPC();
    }
    
    draw_hover_text();
    
    fill(0);
    textSize(12);
    text("day " + day + ", is weekend: " + str(is_weekend) + ", time of day (military): " + str(time_of_day), 5,11);
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
}

void generateBuildings() {

  int curr_x = cell_padding;
  int curr_y = cell_padding;
  
  ArrayList<Building> new_buildings = new ArrayList<Building>();
  while(new_buildings.size() == 0){
    new_buildings = createRandomBuildings();
  }
  
  while(curr_y + cell_padding < city_size-cell_padding){
    
    curr_x = cell_padding;
    int largest_y = 0;
    
    while(curr_x + cell_padding < city_size-cell_padding){
    
      try{
        int index = round(random(new_buildings.size()-1));
        Building b = new_buildings.get(index);
        new_buildings.remove(index);
        
        b.location = new PVector(curr_x, curr_y);
        
        if(curr_x + b.size[0] + cell_padding < city_size){
          largest_y = (int) max(largest_y, b.size[1]);
          buildings.add(b);
        }
        
        curr_x += b.size[0]+cell_padding*2;
      }
      catch(Exception e) {  }
      
    }
    
    curr_y += largest_y + cell_padding*2;
  }
}

void generatePeople(){
  num_people = int(city_size*0.75);
  people = new NPC[num_people];
  
  for(int i = 0; i < num_people; i++){
    people[i] = new NPC(getRandomOccupation());
  }
}

void startVirus(){}

void switchDay(){
  time_of_day = 0;
  
  day += 1;
  if(day > 6){
    day = 0;
    is_weekend = false;
  }
  if(day >= 5){
    is_weekend = true;
  }
}
