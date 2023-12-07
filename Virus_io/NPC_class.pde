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
  
  float natural_immunity = 0;
  
  Home home;
  
  PVector location;
  
  PathNode current_path_node;
  PathNode target_node = null;
  PathNode previous_node;
  ArrayList<PathNode> explored_nodes = new ArrayList<PathNode>();
  
  int days_left_to_be_infected;
  
  NPC(Occupation o){
    
    this.occupation = o;
    
    this.name = getRandomName();
    this.age = getRandomAge(o);
    
    this.immunity = getImmunity(this.age, this.occupation);
    
    this.home = (Home)getRandomTypedBuilding(BuildingType.Home);
    this.location = home.location.copy();
    
    this.routine = o.initializeRoutine(this.home, this);
    this.weekend_routine = createWeekendRoutine(this.home, this);
    
    this.initializeSickRoutine();
    
  }
  
  void check_infection_spread(){
    if(this.infected)
      for(NPC p: people)
        if(p != this && !p.infected && p.location.dist(this.location) <= virus_spread_area)
          p.calc_sickness_chance();
  }
  
  void calc_sickness_chance(){
    if(random(1) >= this.immunity+this.natural_immunity){
      this.infected = true;
    }
  }
  
  void calculate_position(){
    
    Goal c_goal = this.routine.getCurrentGoal(time_of_day);
    
    if(is_weekend)
      c_goal = this.weekend_routine.getCurrentGoal(time_of_day);
      
    if(this.infected && this.shows_symptoms)
      c_goal = this.sick_routine.getCurrentGoal(time_of_day);
    
    PVector goal_location = c_goal.location;
    
    this.current_path_node = find_closest_node(this.location);
    PathNode goal_node = find_closest_node(goal_location);
    
    if(edge_distance(goal_node, this.current_path_node) > 5){
      
      if(this.target_node == null || this.target_node.location.dist(this.location) < 0.2){
        
        PathNode closest_cell = this.current_path_node.neighbours.get(int(random(this.current_path_node.neighbours.size()-1)));
        float closest_dist = edge_distance(closest_cell, goal_node);
        
        if(this.previous_node == null)
          this.previous_node = this.current_path_node;
        
        for(PathNode n: this.current_path_node.neighbours){
          float d = edge_distance(goal_node, n);
          
          if(d <= closest_dist && n != this.previous_node){
            closest_cell = n;
            closest_dist = d;
          }
        }
        
        this.previous_node = this.target_node;
        this.target_node = closest_cell;
      }
      
      goal_location = this.target_node.location;
    }
    
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
      circle(this.location.x*grid_size, this.location.y*grid_size, virus_spread_area);
      fill(color(255,0,0));
    }
    
    circle(this.location.x*grid_size, this.location.y*grid_size, npc_size);
  }
  
  boolean isMouseHoveredOver(){
    
    float x_1 = this.location.x*grid_size - hover_margin;
    float x_2 = this.location.x*grid_size + npc_size + hover_margin;
    float y_1 = this.location.y*grid_size - hover_margin;
    float y_2 = this.location.y*grid_size + npc_size + hover_margin;
    
    if(mouseX > x_1 && mouseX < x_2 && mouseY > y_1 && mouseY < y_2)
      return true;
    
    return false;
    
  }
  
  void initializeSickRoutine(){
    Building b = (Hospital) findClosestBuilding(this.home.location, BuildingType.Hospital);
    sick_routine = new Routine(this, new Goal[] { new Goal(b, 0, 24)});
  }
  
}
