class NPC{

  String name;
  int age;
  
  Occupation occupation;
  
  Routine routine;
  Routine weekend_routine;
  Routine sick_routine;
  
  boolean shows_symptoms;
  
  boolean infected;
  boolean cured;
  
  boolean wearing_mask;
  boolean vaccinated;
  
  float immunity;
  float natural_immunity = 0; // Built up after they're cured
  
  Home home;
  PVector location;
  
  PathNode current_path_node = null; // Path node they're currently on
  PathNode target_node = null; // Path node they want to go to
  PathNode previous_node = null; // Last Path node they were on
  
  int days_left_to_be_cured; // Number of days it takes to be cured
  
  boolean selected = false;
  boolean has_been_infected = false;
  
  Goal current_goal;
  
  NPC(Occupation o){
    
    this.occupation = o;
    
    this.name = getRandomName();
    this.age = getRandomAge(o);
    
    this.immunity = getImmunity(this);
    
    this.home = (Home)getRandomTypedBuilding(BuildingType.Home);
    this.location = home.location.copy();
    
    this.routine = o.initializeRoutine(this.home, this);
    this.weekend_routine = createWeekendRoutine(this.home, this);
    this.initializeSickRoutine();
    
  }
  
  // Check if they're infecting anybody else
  void check_infection_spread(){
    if(this.infected){
      for(NPC p: people){
        if(p != this && !p.infected && p.location.dist(this.location) <= main_virus.spreadArea){
          if(this.wearing_mask){
            if(random(1) >= mask_effectiveness)
              p.calc_sickness_chance();}
          else{
            p.calc_sickness_chance();}
        }
      }
    }
  }
  
  void become_infected(){
    this.cured = false;
    this.has_been_infected = true;
    this.infected = true;
    this.days_left_to_be_cured = min(10, ceil((this.immunity+this.natural_immunity)/main_virus.recoverySpeed));
    
    if(random(1) > 0.55)
      this.shows_symptoms = true;
      
  }
  
  // Chance they'll get sick upon contact
  void calc_sickness_chance(){
    this.immunity = getImmunity(this);
    
    float vaccine_weight = 1;
    if(this.vaccinated)
      vaccine_weight = (1-vaccine_effectiveness);
    
    if(random(1) >= vaccine_weight*(this.immunity+(this.natural_immunity/2))*(1/main_virus.strength))
      become_infected();
  }
  
  
  void calculate_position(){
    
    // Current Goal
    Goal c_goal = this.routine.getCurrentGoal(time_of_day);
    
    //Switch to weekend goal
    if(is_weekend) 
      c_goal = this.weekend_routine.getCurrentGoal(time_of_day);
    
    // Switch to sick routine
    if(this.infected && this.shows_symptoms){ 
      c_goal = this.sick_routine.getCurrentGoal(time_of_day);
    }
    
    // Chooses whether a person stays home or not because of the virus, either by chance or by quarantine mandate
    if(virus_started && !infected && quarantine_mandate && this.occupation.occupation_name != "Unhoused Person"){
      c_goal = this.routine.getCurrentGoal(0);
    }
    
    PVector goal_location = c_goal.location;
    this.current_goal = c_goal;
    
    this.current_path_node = find_closest_node(this.location);
    PathNode goal_node = find_closest_node(goal_location);
    
    // If we still have a ways to go in our pathfinding (we're not right next to the building)
    if(edge_distance(goal_node, this.current_path_node) > 5){
      
      // If we need to switch to the next node in the path
      if(current_path_node.neighbours.size() > 0 && this.target_node == null || this.target_node.location.dist(this.location) < 0.2){
        
        // The closest cell out of the neighbours to the goal
        PathNode closest_cell = this.current_path_node.neighbours.get(int(random(this.current_path_node.neighbours.size()-1)));
        // Distance between the closest cell and the goal
        float closest_dist = edge_distance(closest_cell, goal_node);
        
        if(this.previous_node == null)
          this.previous_node = this.current_path_node;
        
        for(PathNode n: this.current_path_node.neighbours){
          float d = edge_distance(goal_node, n);
          if(d <= closest_dist && n != this.previous_node){ // the previous node statement is to ensure people don't ping pong back and forth between nodes
            closest_cell = n;
            closest_dist = d;
          }
        }
        
        this.previous_node = this.target_node;
        this.target_node = closest_cell;
      
      }
      goal_location = this.target_node.location;
      
    }
    
    // Linearly interpolate to goal
    float t = npc_speed*min(1, (time_of_day-c_goal.start_time)/(c_goal.duration/4));
    
    this.location.lerp(goal_location, t*2);
  }
  
  void drawNPC() {
    
    if(simOngoing){
      this.calculate_position();
      shapeMode(CENTER);
      
      fill(color(239,202,168));
      
      if(this.infected){
        fill(color(188,34,34, 44));
        circle(this.location.x*grid_size, this.location.y*grid_size, main_virus.spreadArea*50);
        fill(color(255,0,0));
      }
      
      if(this.vaccinated && !this.infected)
        fill(color(40, 67, 230));
      
      if(this.selected){
        stroke(255,0,0); strokeWeight(2); }
      else{
        stroke(0,0,0); strokeWeight(1);}
        
      circle(this.location.x*grid_size, this.location.y*grid_size, npc_size);
      
      fill(255);
      if(this.wearing_mask)
        rect(this.location.x*grid_size-4, this.location.y*grid_size, npc_size-4, npc_size/2);
    }
  }
  
  void initializeSickRoutine(){
    Building b = (Hospital) findClosestBuilding(this.home.location, BuildingType.Hospital);
    sick_routine = new Routine(this, new Goal[] { new Goal(b, 0, 24)});
  }
  
}
