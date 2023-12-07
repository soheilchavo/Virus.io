class Building {
  
  float[] size; // x and y sizes in discrete cell multiples
  PVector location;
  BuildingType type;
  PImage sprite;
  
  Building(PVector l, BuildingType t, float[] s, String p){
    this.location = l;
    this.type = t;
    this.size = s;
    this.sprite = loadImage("/Sprites/"+p);
  }
  
  void drawBuilding() {
    shapeMode(CORNER);
    
    // Sets opacity lower if people are inside the building
    tint(255,255);
    if(this.npc_in_building())
      tint(255,150);
    
    image(this.sprite, this.location.x*grid_size, this.location.y*grid_size, this.size[0]*grid_size, this.size[1]*grid_size);
  }
  
  boolean npc_in_building(){
    try{ // Saftey try statement, sometimes gives errors when user resets in the middle of the function
      for(NPC p: people)
        if(p.location.x > this.location.x && 
           p.location.x < this.location.x+size[0] &&
           p.location.y > this.location.y && 
           p.location.y < this.location.y+size[1])
           return true;
    }
    catch(Exception e) {}
    return false;
  }
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home, new float[] {5,4}, "home.png");
  }
}

class Hospital extends Building{
  Hospital(PVector l){
    super(l, BuildingType.Hospital, new float[] {7.5,8}, "hospital.png");
  }
}

class Eatery extends Building{
  Eatery(PVector l){
    super(l, BuildingType.Eatery, new float[] {7,6}, "eatery.png");
  }
}

class Park extends Building{
  Park(PVector l){
    super(l, BuildingType.Park, new float[] {8,6}, "park.png");
  }
}
class School extends Building{
  School(PVector l){
    super(l, BuildingType.School, new float[] {8,8}, "school.png");
  }
}
class Workplace extends Building{
  Workplace(PVector l){
    super(l, BuildingType.Workplace, new float[] {8,7}, "workplace.png");
  }
}
