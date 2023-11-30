class Goal {

  PVector location;
  float start_time;
  float end_time;
  
  float duration;
  
  boolean day_based_goal;
  PVector[] day_based_locations;
  
  boolean variable_goal;
  PVector[] variable_locations;
  
  Goal(PVector l, float s, float e, float[] size){
    this.location = new PVector(l.x + (size[0]/2) + random(-cell_padding/2, cell_padding/2), l.y + (size[1]/2) + random(-cell_padding/2, cell_padding/2) );
    this.start_time = s;
    this.end_time = e;
    
    this.duration = e-s;
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
  
  void printGoals(){
    println();
    for(Goal g: goals){
      print(g.location);
    }
  }
  
  
  Goal getCurrentGoal(float t){
    
    Goal target_goal = this.goals[0];
    
    for(Goal g: this.goals){
      if((t >= g.start_time) && (t <= g.end_time)){
        return g;
      }
    }
    
    return target_goal;
  
  }
  
}
