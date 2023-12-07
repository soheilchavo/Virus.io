class NPC{

  String name;
  int age;
  
  Occupation occupation;
  
  Routine routine;
  Routine weekend_routine;
  Routine sick_routine;
  
  boolean shows_symptoms;
  
  boolean infected;
  
  float immunity;
  float natural_immunity = 0; // Built up after they're cured
  
  Home home;
  PVector location;
  
  PathNode current_path_node = null; // Path node they're currently on
  PathNode target_node = null; // Path node they want to go to
  PathNode previous_node = null; // Last Path node they were on
  
  int days_left_to_be_cured; // Number of days it takes to be cured
  
  boolean selected = false;
  
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
    if(this.infected)
      for(NPC p: people)
        if(p != this && !p.infected && p.location.dist(this.location) <= virus_spread_area)
          p.calc_sickness_chance();
  }
  
  void become_infected(){
    this.infected = true;
    this.days_left_to_be_cured = ceil(5/this.immunity);
  }
  
  // Chance they'll get sick upon contact
  void calc_sickness_chance(){
    this.immunity = getImmunity(this);
    if(random(1) >= this.immunity+this.natural_immunity)
      become_infected();
  }
  
  
  void calculate_position(){
    
    // Current Goal
    Goal c_goal = this.routine.getCurrentGoal(time_of_day);
    
    if(is_weekend) //Switch to weekend goal
      c_goal = this.weekend_routine.getCurrentGoal(time_of_day);
    
    // Become cured! Extra random statement is to add a bit more variety in when they become cured
    if(this.days_left_to_be_cured <= 0 && random(1) > 0.86){
        this.infected = false;
        this.natural_immunity = 1;
    }
    
    if(this.infected && this.shows_symptoms){ // Switch to sick routine
      c_goal = this.sick_routine.getCurrentGoal(time_of_day);
    }
    
    PVector goal_location = c_goal.location;
    
    this.current_path_node = find_closest_node(this.location);
    PathNode goal_node = find_closest_node(goal_location);
    
    // If we still have a ways to go in our pathfinding (we're not right next to the building)
    if(edge_distance(goal_node, this.current_path_node) > 5){
      
      // If we need to switch to the next node in the path
      if(this.target_node == null || this.target_node.location.dist(this.location) < 0.2){
        
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
    this.location.lerp(goal_location, t);
  }
  
  void drawNPC() {
    
    this.calculate_position();
    shapeMode(CENTER);
    
    fill(color(239,202,168));
    
    if(this.occupation.occupation_name == "Homeless")
      fill(color(0,0,255));
    
    if(this.infected){
      fill(color(188,34,34, 44));
      circle(this.location.x*grid_size, this.location.y*grid_size, main_virus.spreadArea*50);
      fill(color(255,0,0));
    }
    
    if(this.selected){
      stroke(255,0,0); strokeWeight(2); }
    else{
      stroke(0,0,0); strokeWeight(1);}
      
    circle(this.location.x*grid_size, this.location.y*grid_size, npc_size);
  }
  
  void initializeSickRoutine(){
    Building b = (Hospital) findClosestBuilding(this.home.location, BuildingType.Hospital);
    sick_routine = new Routine(this, new Goal[] { new Goal(b, 0, 24)});
  }
  
  void displayInfo(){
    
    String period_text = ", ";
    String conditional_text = "not"; // prefix for being "not" infected / infected
    if(this.infected)
      conditional_text = "";
    
    String statText = this.name + period_text + this.age + " year old " + 
      this.occupation.occupation_name + period_text + conditional_text + 
      " infected" + period_text + " immunity of " + str(this.immunity+this.natural_immunity).substring(0, 4);
      
    fill(255);
    stroke(255);
    rect(this.location.x*grid_size, this.location.y*grid_size-10, statText.length()*5.9, 11); 
    
    fill(0);
    stroke(0);
    textSize(12);
    text(statText, this.location.x*grid_size, this.location.y*grid_size);
  }
  
}
