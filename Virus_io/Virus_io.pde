import g4p_controls.*;

boolean simOngoing = false;
boolean paused = false;

float sim_speed = 0.5;

int city_size = 5;
float grid_size = 19; // Physical size of buildings

float npc_size = 12;
float npc_speed = 0.07;

float shift_sensitivity = 10; // How sensitive WASD keys are
float zoom_sensitivity = 0.04; // How sensitive zoom is
float mouse_sensitivity = 1.4; // How sensitive dragging is

float population_density = 0.1;

float global_immunity = 3; // Base immunity variable (set by user)

float time_of_day = 0; // 0-24 h
int day = 0; // 0-6, Monday-Sunday
boolean is_weekend; // True if it is Saturday or Sunday

int age_deviation = 5; // Age range for each occupation

int cell_padding = 2; // Number of cells between buildings

ArrayList<Building> buildings = new ArrayList<Building>(); // Holds all buildings

enum BuildingType { 
  Home, Hospital, Workplace, School, Park, Eatery
};
float[] building_rates = new float[] {0.8, 0.13, 0.2, 0.1, 0.3, 0.2}; // Rates of building spawns

BuildingType[] b_type_order = new BuildingType[] { 
  BuildingType.Home, 
  BuildingType.Hospital, 
  BuildingType.Workplace, 
  BuildingType.School, 
  BuildingType.Park, 
  BuildingType.Eatery
}; // Order of building types for hashmap purposes

int num_people; // Calculated later in the program by city size

NPC[] people; // Holds all people

float zoom = 1; // How much the canvas is zoomed in
float x_offset = 0;
float y_offset = 0;

String[] days = new String[] { "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"};

ArrayList<PathNode> path_nodes = new ArrayList<PathNode>(); // Holds all pathfinding nodes

boolean draw_pathfinding = false;
boolean draw_people = true;
boolean draw_buildings = true;

boolean virus_started = false;

Virus main_virus = new Virus(0, 0, 0);

NPC selected_npc = null;

float centerX;
float centerY;

boolean mask_mandate;
boolean vaccine_mandate;
boolean quarantine_mandate;

float mask_effectiveness = 0.5;
float vaccine_effectiveness = 0.5;

void setup() {
  size(600, 600);
  centerX = width / 2.0;
  centerY = height / 2.0;
  createGUI();
}

void draw() {
  
  pushMatrix(); // Required for translating the screen
  // Zooming
  scale(zoom);
  // Translating left and right
  translate(x_offset, y_offset);
  
  if (!paused && simOngoing) {
    background(90);
    time_of_day += 0.01*sim_speed;
    //Update stats window
    float n_infected = 0;
    float n_cured = 0;
    float hospital_cap = 0;
    float sum_immunity = 0;

    for (NPC p : people) {

      sum_immunity += p.immunity+p.natural_immunity;

      if (p.infected) {
        n_infected++;
        if (p.shows_symptoms)
          hospital_cap++;
      }  

      if (p.cured)
        n_cured++;
    }

    PercentageInfectedValue.setText(str(round(100*(n_infected/people.length))) + "%");
    PercentageCuredValue.setText(str(round(100*(n_cured/people.length))) + "%");
    HospitalCapacityValue.setText(str(hospital_cap));
    AverageImmunityValue.setText(str(sum_immunity/people.length));

    if(virus_started && n_infected == 0){
      WinConditionLabel.setText("Virus eradicated, reset to start new sim");
    }
    
    if(virus_started && n_infected == people.length){
      WinConditionLabel.setText("Everyone is infected, reset to start new sim");
    }

    if (draw_pathfinding) {
      for (PathNode p : path_nodes) {
        p.draw_node();
      }
    }

    if (draw_buildings) {
      for (Building b : buildings) {
        b.drawBuilding();
      }
    }

    for (NPC p : people) {
      p.drawNPC();
      p.check_infection_spread();
    }

    
    //Draw time of day text
    fill(255);
    textSize(23);
    text(days[day] + ", time of day: " + str(time_of_day).substring(0,4) + ", zoom: " + str(zoom).substring(0,min(str(zoom).length(), 4)) + "x", 5, 23);
    
    //If the end of the hour is reached
    if (time_of_day-floor(time_of_day) >= 0.6) {
      time_of_day = floor(time_of_day)+1;
    }
  
    if (time_of_day >= 24) {
      switchDay();
    }
    
    
  }
  
  popMatrix(); // Goes back to untranslated screen
  
  if (selected_npc != null){
    displayInfo();
  }
}

void startSim() {
  
  WinConditionLabel.setText("");
  
  simOngoing = false;
  virus_started = false;
  
  generateBuildings();
  generatePeople();
  simOngoing = true;
}

void generateBuildings() {

  // Initialize arraylists
  buildings = new ArrayList<Building>();
  path_nodes = new ArrayList<PathNode>();

  // Current coords for building generation
  int curr_x = cell_padding;
  int curr_y = cell_padding;

  //Set of random buildings based on city size
  ArrayList<Building> new_buildings = createRandomBuildings();
  int n_buildings = new_buildings.size();

  int largest_y = 0;
  int max_y = 0;

  for(int i = 0; i < n_buildings; i++){
    
    int index = int(random(new_buildings.size()-1));
    
    Building b = new_buildings.get(index);
    new_buildings.remove(index); // Removes it from the list to ensure it's not duplicated
    
    b.location = new PVector(curr_x, curr_y);

    largest_y = (int) max(largest_y, b.size[1]); // Picks the biggest y between the current largest and this building's size
    max_y = (int) max(largest_y, max_y); // Picks the biggest y
    
    buildings.add(b);

    curr_x += b.size[0]+cell_padding*2;
    
    if(curr_x >= 0.56*city_size*grid_size){
      curr_x = cell_padding;
      curr_y += largest_y + cell_padding*2;
      largest_y = 0;
    }
    
  }
  
  float pad = cell_padding/2; // Padding for Pathfinding nodes

  //Draw nodes per building corner (up, down, left, right)
  for (int i = 0; i < buildings.size(); i++) {

    Building b = buildings.get(i);

    // The coords for the four corners of the building in pvector form
    PVector[] path_locations = new PVector[] { 
      new PVector(b.location.x-pad, b.location.y-pad), 
      new PVector(b.location.x+b.size[0]+pad, b.location.y-pad), 
      new PVector(b.location.x-pad, b.location.y+max_y+pad), 
      new PVector(b.location.x+b.size[0]+pad, b.location.y+max_y+pad), 
    };

    //Add the corner path nodes to the path nodes arraylist
    for (int j = 0; j < path_locations.length; j++) {

      PathNode p = new PathNode(path_locations[j]);

      if (!is_duplicate_node(p)) // Ensures we're not adding a duplicate path node
        path_nodes.add(p);
    }
  }

  // Connects each node to it's neighbours
  for (PathNode p : path_nodes) {
    for (PathNode c : path_nodes) {

      // Just to make sure there isn't any connections going through buildings
      float slope =  abs((c.location.y-p.location.y)/(c.location.x-p.location.x));

      // These constants create the best looking path network, found through trial and error
      if (c.location.dist(p.location) < grid_size*0.6 && (slope < 0.3 || slope > 80))
        p.neighbours.add(c);
    }
  }
}

void generatePeople() {
  num_people = int(pow(city_size, 2)/population_density);
  people = new NPC[num_people];

  for (int i = 0; i < num_people; i++) {
    people[i] = new NPC(getRandomOccupation());
    
    if(random(1) > 0.97)
      people[i].vaccinated = true;
  }
}

void switchDay() {

  time_of_day = 0;
  day += 1;

  // Resets week
  if (day > 6) {
    day = 0;
    is_weekend = false;
  }

  if (day >= 5) {
    is_weekend = true;
  }

  for (NPC person : people) {
    person.routine.setGoals(); // Finds randomized goals for the day
    person.weekend_routine.setGoals(); // Sets weekend goals (only works if it is weekend)

    person.natural_immunity -= 0.1; // Takes down natural immunity (is reset after being cured)

    // Wears a mask today if there is a mandate or they randomly want to
    person.wearing_mask = false;
    if(mask_mandate || random(1) > 0.9)
      person.wearing_mask = true;
    
    if(vaccine_mandate)
      person.vaccinated = true;

    if (person.days_left_to_be_cured > 0)
      person.days_left_to_be_cured -= 1;

    // Become cured! Extra random statement is to add a bit more variety in when they become cured
    if (person.has_been_infected && person.days_left_to_be_cured <= 0 && random(1) > 0.5) {
      person.infected = false;
      person.natural_immunity = 1;
      person.cured = true;
    }

    //Randomly decides if a person shows symptoms or not (decides whether they go to the hospital)
    if (person.infected && random(1) < 0.8)
      person.shows_symptoms = true;
  }
}


void displayInfo(){
  
  float rect_size = -200;
  
  fill(255);
  stroke(255);
  rect(width, 0, rect_size, 120); 
  
  fill(0);
  stroke(0);
  textSize(12);
  
  text(selected_npc.name, width+rect_size+7, 10);
  text(selected_npc.age + " years old", width+rect_size+7, 25);
  text("Occupation: " + selected_npc.occupation.occupation_name, width+rect_size+7, 40);
  text("Immunity: " + selected_npc.immunity, width+rect_size+7, 55);
  text("Natural Immuntiy: " + selected_npc.natural_immunity, width+rect_size+7, 70);
  
  try{
    text("Goal: " + selected_npc.current_goal.target_building.typestring, width+rect_size+7, 85);
  } catch(Exception e) {}
  
  String infected_text = "Not infected"; // prefix for being "not" infected / infected
  if(selected_npc.infected) {
    infected_text = "Infected"; 
    fill(255,0,0); 
  }
  
  text(infected_text, width+rect_size+7, 100);
  
  fill(0); 
  if(selected_npc.infected)
    text("Sick Days Left: " + selected_npc.days_left_to_be_cured, width+rect_size+7, 115);
}

float clamp(float val, float min, float max) {
  if (val < min) 
    return min;
  if (val > max) 
    return max;
  return val;
}

void mouseWheel(MouseEvent event)
{
  zoom = clamp(zoom - event.getCount()*zoom_sensitivity, 0.1, 4);
}

// Restricts user from going out of bounds 
void clampOffsets() {
  zoom = clamp(zoom, 0.25, 3);
  x_offset = clamp(x_offset, -2000*zoom, ceil(city_size)*2000*zoom);
  y_offset = clamp(y_offset, -2000*zoom, ceil(city_size)*2000*zoom);
}

void mouseDragged(MouseEvent event) {
  x_offset += (-pmouseX+mouseX)*mouse_sensitivity*(1/zoom);
  y_offset += (-pmouseY+mouseY)*mouse_sensitivity*(1/zoom);

  clampOffsets();
}

void mouseReleased() {
  
  if(simOngoing){
  
    PVector mouse_coords = getGlobalMouseCoords();
    selected_npc = null;
  
    for (NPC p : people) {
      PVector l = p.location;
      if (selected_npc == null && l.x*grid_size > mouse_coords.x && l.x*grid_size < mouse_coords.x+npc_size*2*zoom &&
        l.y*grid_size > mouse_coords.y && l.y*grid_size < mouse_coords.y+npc_size*2*zoom) {
        selected_npc = p;
        p.selected = true;
      } else {
        p.selected = false;
        if (selected_npc == p) { 
          selected_npc = null;
        }
      }
    }
    
  }
}

void keyPressed() {
  if (key == 'a')
    x_offset += shift_sensitivity*(1/zoom);

  if (key == 'd')
    x_offset -= shift_sensitivity*(1/zoom);

  if (key == 'w')
    y_offset += shift_sensitivity*(1/zoom);

  if (key == 's')
    y_offset -= shift_sensitivity*(1/zoom);
    
  if (key == '=' || key == 'o')
    zoom += zoom_sensitivity;
  
  if (key == '_' || key == 'i')
    zoom -= zoom_sensitivity;

  clampOffsets();
  
}  
