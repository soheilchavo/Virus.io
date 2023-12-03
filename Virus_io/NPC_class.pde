class NPC{

  String name;
  int age;
  
  Occupation occupation;
  
  Routine routine;
  Routine weekend_routine;
  Routine sick_routine;
  
  boolean is_sick;
  float immunity;
  
  Home home;
  
  PVector location;
  
  NPC(Occupation o){
    
    this.occupation = o;
    
    this.name = getRandomName();
    this.age = getRandomAge(o);
    
    this.immunity = getImmunity(this.age);
    
    this.home = (Home)getRandomTypedBuilding(BuildingType.Home);
    this.location = home.location.copy();
    
    this.routine = o.initializeRoutine(this.home, this);
    this.weekend_routine = createWeekendRoutine(this.home, this);
    
    this.initializeSickRoutine();
  }
  
  void calculate_position(){
    
    Goal c_goal = this.routine.getCurrentGoal(time_of_day);
    if(is_weekend)
      c_goal = this.weekend_routine.getCurrentGoal(time_of_day);
      
    float t = npc_speed*min(1, (time_of_day-c_goal.start_time)/(c_goal.duration/4));
    this.location.lerp(c_goal.location, t);
  }
  
  void drawNPC() {
    
    this.calculate_position();
    
    fill(color(239,202,168));
    if(this.occupation.occupation_name == "Homeless")
      fill(color(0,0,255));
    
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
