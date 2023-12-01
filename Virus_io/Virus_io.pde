import g4p_controls.*;

int city_size = 50;

float grid_relative_size;
float grid_size;

float shift_sensitivity = 10;
float zoom_sensitivity = 0.04;

float time_of_day = 0;
int day = 0;
boolean is_weekend;

float sim_speed = 1;
int age_deviation = 5;

int cell_padding = 2;

float npc_set_size;
float npc_size;

float hover_margin = 0;

ArrayList<Building> buildings = new ArrayList<Building>();

boolean simOngoing = true;

enum BuildingType { Home, Hospital, Workplace, School, Park, Eatery };
float[] building_rates = new float[] {0.4, 0.13, 0.2, 0.1, 0.6};

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

float zoom = 1;
float x_offset = 0;
float y_offset = 0;

PImage photo;

String[] days = new String[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

void setup() {
  size(600,600);
  grid_relative_size = width/city_size;
  
  npc_set_size = city_size*0.28;
  startSim();
}

void draw() {
  
  background(128);

  if(simOngoing){
    
    npc_size = npc_set_size*1;
    grid_size = grid_relative_size*(1);
    
    scale(zoom);
    translate(x_offset, y_offset);
    
    for(Building b: buildings){
      b.drawBuilding();
      //photo = loadImage(b.sprite);
    }
    
    for(NPC p: people){
      p.drawNPC();
    }
    
    draw_hover_text();
    
    resetMatrix();
    
    fill(0);
    textSize(12);
    text(days[day] + ", time of day: " + str(time_of_day), 5,11);
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
  new_buildings = createRandomBuildings();
  
  while(curr_y + cell_padding < city_size-cell_padding){
    
    curr_x = cell_padding;
    int largest_y = 0;
    
    while(curr_x + cell_padding < city_size-cell_padding){
  
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
  
  for(NPC person: people){
    person.routine.setGoals();
  }
}

float clamp(float val, float min, float max)
{
  if (val < min) {
    return min;
  }
  if (val > max) {
    return max;
  }
  return val;
}

void mouseWheel(MouseEvent event)
{
  zoom = clamp(zoom - event.getCount()*zoom_sensitivity, 0.1, 4);
}

void keyPressed(){
  if(key == 'a')
    x_offset += shift_sensitivity;
  
  if(key == 'd')
    x_offset -= shift_sensitivity;
  
  if(key == 'w')
    y_offset += shift_sensitivity;
  
  if(key == 's')
    y_offset -= shift_sensitivity;
}  
