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

void setup() {
  size(600, 600);
  centerX = width / 2.0;
  centerY = height / 2.0;
  createGUI();
}

void draw() {

  if (paused == false) {

    background(90);

    // If the simulation has started
    if (simOngoing) {
      pushMatrix(); // Required for translating the screen

      // Zooming
      scale(zoom);
      // Translating left and right
      translate(x_offset, y_offset);

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

      if (selected_npc != null)
        selected_npc.displayInfo();

      popMatrix(); // Goes back to untranslated screen

      //Draw time of day text
      fill(0);
      textSize(12);
      text(days[day] + ", time of day: " + str(time_of_day) + ", zoom: " + zoom, 5, 11);
      time_of_day += 0.01*sim_speed;

      //If the end of the hour is reached
      if (time_of_day-floor(time_of_day) >= 0.6) {
        time_of_day = floor(time_of_day)+1;
      }

      if (time_of_day >= 24) {
        switchDay();
      }
    }
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

  // Stores the biggest buildings in the array to create consistent path nodes afterwards
  int[] largest_ys = new int[city_size];

  for (int y = 0; y < city_size; y++) {

    curr_x = cell_padding;
    int largest_y = 0; // biggest building in the y axis

    for (int x = 0; x < city_size; x++) {

      int index = round(random(new_buildings.size()-1)); // Gets random new building

      if (index != 0) { // Saftey check

        Building b = new_buildings.get(index);
        new_buildings.remove(index); // Removes it from the list to ensure it's not duplicated

        b.location = new PVector(curr_x, curr_y);

        largest_y = (int) max(largest_y, b.size[1]); // Picks the biggest y between the current largest and this building's size
        buildings.add(b);

        curr_x += b.size[0]+cell_padding*2;
      }
    }

    largest_ys[y] = largest_y;
    curr_y += largest_y + cell_padding*2;
  }

  float pad = cell_padding/2; // Padding for Pathfinding nodes

  //Draw nodes per building corner (up, down, left, right)
  for (int i = 0; i < buildings.size(); i++) {

    curr_y = largest_ys[floor(i/city_size)]; // Gets largest y for it's row
    Building b = buildings.get(i);

    // The coords for the four corners of the building in pvector form
    PVector[] path_locations = new PVector[] { 
      new PVector(b.location.x-pad, b.location.y-pad), 
      new PVector(b.location.x+b.size[0]+pad, b.location.y-pad), 
      new PVector(b.location.x-pad, b.location.y+curr_y+pad), 
      new PVector(b.location.x+b.size[0]+pad, b.location.y+curr_y+pad), 
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

    if (person.days_left_to_be_cured > 0)
      person.days_left_to_be_cured -= 1;

    // Become cured! Extra random statement is to add a bit more variety in when they become cured
    if (person.has_been_infected && person.days_left_to_be_cured <= 0 && random(1) > 0.5) {
      person.infected = false;
      person.natural_immunity = 1;
      person.cured = true;
    }

    //Randomly decides if a person shows symptoms or not (decides whether they go to the hospital)
    if (person.infected && random(1) < 0.92)
      person.shows_symptoms = true;
  }
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
  x_offset = clamp(x_offset, -500, ceil(city_size)*200);
  y_offset = clamp(y_offset, -500, ceil(city_size)*200);
}

void mouseDragged(MouseEvent event) {
  x_offset += (-pmouseX+mouseX)*mouse_sensitivity*(1/zoom);
  y_offset += (-pmouseY+mouseY)*mouse_sensitivity*(1/zoom);

  clampOffsets();
}

void mousePressed() {
  PVector mouse_coords = getGlobalMouseCoords();
  selected_npc = null;

  for (NPC p : people) {
    PVector l = p.location;
    if (selected_npc == null && l.x*grid_size > mouse_coords.x && l.x*grid_size < mouse_coords.x+npc_size*zoom &&
      l.y*grid_size > mouse_coords.y && l.y*grid_size < mouse_coords.y+npc_size*zoom) {
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

void keyPressed() {
  if (key == 'a')
    x_offset += shift_sensitivity*(1/zoom);

  if (key == 'd')
    x_offset -= shift_sensitivity*(1/zoom);

  if (key == 'w')
    y_offset += shift_sensitivity*(1/zoom);

  if (key == 's')
    y_offset -= shift_sensitivity*(1/zoom);

  clampOffsets();
}  
