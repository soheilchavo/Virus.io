class Goal {

  PVector location;
  Building target_building;
  float start_time;
  float end_time;
  
  float duration;
  
  boolean variable_goal;
  Building[] variable_buildings;
  
  Goal(Building b, float s, float e){
    
    this.location = new PVector(
      b.location.x + b.size[0]/3 + random(-b.size[0]/4, b.size[0]/4), 
      b.location.y + b.size[1]/3 +  random(-b.size[1]/4, b.size[1]/4)
    );
    
    this.target_building = b;
    
    this.start_time = s;
    this.end_time = e;
    
    this.duration = e-s;
  }
  
  Goal(Building[] v_goals, float s, float e){
    this.variable_buildings = v_goals;
    this.variable_goal = true;
    this.start_time = s;
    this.end_time = e;
  }
  
  void setGoal(){
    if(this.variable_goal){
      Building b = variable_buildings[round(random(0, variable_buildings.length-1))];
      this.location = new PVector(
        b.location.x + b.size[0]/3 + random(-b.size[0]/4, b.size[0]/4), 
        b.location.y + b.size[1]/3 +  random(-b.size[1]/4, b.size[1]/4)
      );
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
  
  void setGoals(){
    for(Goal g: this.goals){
      g.setGoal();
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

Routine createWeekendRoutine(Building home, NPC p){
  
  Building eatery = findClosestBuilding(p.home.location, BuildingType.Eatery);
  Building park = findClosestBuilding(p.home.location, BuildingType.Park);
  
  return new Routine(p, new Goal[] { 
    new Goal(home, 0, 11), 
    new Goal(new Building[] { home, eatery, park }, 11, 13), 
    new Goal(new Building[] { home, eatery, park }, 13, 16),
    new Goal(new Building[] { home, eatery, park }, 16, 18),
    new Goal(new Building[] { home, eatery, park }, 18, 19),
    new Goal(home, 19, 24)});
}
