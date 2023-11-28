class Goal {

  PVector location;
  float start_time;
  float end_time;
  
  boolean day_based_goal;
  PVector[] day_based_locations;
  
  boolean variable_goal;
  PVector[] variable_locations;
  
  Goal(PVector l, float s, float e){
    this.location = l;
    this.start_time = s;
    this.end_time = e;
  }
  
  void setGoals(){
    if(this.variable_goal){
      this.location = variable_locations[int(random(0, variable_locations.length-1))];
    }
    else if(this.day_based_goal){
      this.location = day_based_locations[int(is_weekend)];
    }
  }
  
}

class Routine {

  NPC parent;
  Goal[] goals;
  
  Routine(NPC p, Goal[] g){
    this.parent = p;
    this.goals = g;
  }
  
  PVector getCurrentGoal(){
    
    Goal target_goal = this.goals[0];
    
    for(Goal g: this.goals){
      if(time_of_day > g.start_time && time_of_day < g.end_time)
        return target_goal.location;
    }
    
    return null;
  
  }
  
}
