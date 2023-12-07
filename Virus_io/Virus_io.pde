import g4p_controls.*;

boolean simOngoing = false;
boolean paused = false;
float sim_speed = 0.5;

int city_size = 5;
float grid_size = 19;
float npc_size = 12;

float shift_sensitivity = 10;
float zoom_sensitivity = 0.04;
float mouse_sensitivity = 1.3;

float population_density = 0.1;

float hover_margin = 2;

float global_immunity = 0.5;

float time_of_day = 0;
int day = 0;
boolean is_weekend;

int age_deviation = 5;

int cell_padding = 2;

ArrayList<Building> buildings = new ArrayList<Building>();

enum BuildingType { Home, Hospital, Workplace, School, Park, Eatery };
float[] building_rates = new float[] {0.8, 0.13, 0.2, 0.1, 0.3, 0.2};

float npc_speed = 0.07;

BuildingType[] b_type_order = new BuildingType[] { 
  BuildingType.Home, 
  BuildingType.Hospital, 
  BuildingType.Workplace,
  BuildingType.School,
  BuildingType.Park,
  BuildingType.Eatery
};


int num_people;
NPC[] people;

float zoom = 1;
float x_offset = 0;
float y_offset = 0;

PImage photo;

String[] days = new String[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

ArrayList<PathNode> path_nodes = new ArrayList<PathNode>();

boolean draw_pathfinding = false;
boolean draw_people = true;
boolean draw_buildings = true;

boolean virus_started = false;

Virus main_virus;

float virus_spread_area = 56;

void setup() {
  size(600,600);
  createGUI();
}


void draw() {
 if(paused == false){
  background(120);
  
  if(simOngoing){
    
    pushMatrix();
    
    // Center the zooming
    float centerX = width / 2.0;
    float centerY = height / 2.0;
    translate(centerX, centerY);
    scale(zoom);
    translate(-centerX, -centerY);
    translate(x_offset, y_offset);
    
    if(draw_pathfinding){
      for(PathNode p: path_nodes){
        p.draw_node();
      }
    }
    
    if(draw_buildings){
      for(Building b: buildings){
        b.drawBuilding();
        
      }
    }
    
    if(draw_people){
      for(NPC p: people){
        p.drawNPC();
        p.check_infection_spread();
      }
    }
    
    draw_hover_text();
    
    popMatrix();
    
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
}

void startSim(){
  simOngoing = false;
  virus_started = false;
  generateBuildings();
  generatePeople();
  simOngoing = true;
}

void generateBuildings() {
  
  buildings = new ArrayList<Building>();
  path_nodes = new ArrayList<PathNode>();

  int curr_x = cell_padding;
  int curr_y = cell_padding;
  
  ArrayList<Building> new_buildings = new ArrayList<Building>();
  new_buildings = createRandomBuildings();
  
  int[] largest_ys = new int[city_size];
  
  for(int y = 0; y < city_size; y++){
    
    curr_x = cell_padding;
    int largest_y = 0;
    
    for(int x = 0; x < city_size; x++){
  
      int index = round(random(new_buildings.size()-1));
      
      if(index != 0){
        Building b = new_buildings.get(index);
        new_buildings.remove(index);
        
        b.location = new PVector(curr_x, curr_y);
        
        largest_y = (int) max(largest_y, b.size[1]);
        buildings.add(b);
        
        curr_x += b.size[0]+cell_padding*2;
      }
      
    }
    
    largest_ys[y] = largest_y;
    curr_y += largest_y + cell_padding*2;
  }
  
  
  //Draw nodes per building (up, down, right, left)
  for(int i = 0; i < buildings.size(); i++){
    
    curr_y = largest_ys[floor(i/city_size)];
    Building b = buildings.get(i);
    
    float pad = cell_padding/2;
    
    PVector[] path_locations = new PVector[] {
      new PVector(b.location.x-pad, b.location.y-pad),
      new PVector(b.location.x+b.size[0]+pad, b.location.y-pad),
      new PVector(b.location.x-pad, b.location.y+curr_y+pad),
      new PVector(b.location.x+b.size[0]+pad, b.location.y+curr_y+pad),
    };
    
    for(int j = 0; j < path_locations.length; j++){
      PathNode p = new PathNode(path_locations[j]);
      if(!is_duplicate_node(p))
        path_nodes.add(p);
    }
  }
  
  //Connect Neighbours

  for(PathNode p: path_nodes){
    for(PathNode c: path_nodes){
      float slope =  abs((c.location.y-p.location.y)/(c.location.x-p.location.x));
      if(c.location.dist(p.location) < grid_size*0.6 && (slope < 0.3 || slope > 80))
        p.neighbours.add(c);
    }
  }
  
}

void generatePeople(){
  num_people = int(pow(city_size,2)/population_density);
  people = new NPC[num_people];
  
  for(int i = 0; i < num_people; i++){
    people[i] = new NPC(getRandomOccupation());
  }
}

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
    person.weekend_routine.setGoals();
    
    person.days_left_to_be_infected -= 1;
    person.days_left_till_immunity -= 1;
    
    if(person.immune && person.days_left_till_immunity <= 0)
      person.immune = false;
    
    if(person.infected && person.days_left_to_be_infected <= 0)
      person.infected = false;
      person.days_left_till_immunity = int((1/person.immunity)*5);
      person.immune = true;
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

void clampOffsets(){
  x_offset = clamp(x_offset, -500, ceil(city_size)*200);
  y_offset = clamp(y_offset, -500, ceil(city_size)*200);
}

void mouseDragged(MouseEvent event){
  x_offset += (-pmouseX+mouseX)*mouse_sensitivity*(1/zoom);
  y_offset += (-pmouseY+mouseY)*mouse_sensitivity*(1/zoom);
  
  clampOffsets();
}

void keyPressed(){
  if(key == 'a')
    x_offset += shift_sensitivity*(1/zoom);
  
  if(key == 'd')
    x_offset -= shift_sensitivity*(1/zoom);
  
  if(key == 'w')
    y_offset += shift_sensitivity*(1/zoom);
  
  if(key == 's')
    y_offset -= shift_sensitivity*(1/zoom);
  
  clampOffsets();
}  
