class Building {
  //FIELDS
  float[] size;
  PVector location;
  BuildingType type;
  //String sprite = new String sprite;
  
  color col;
  
  //CONSTRUCTOR
  Building(PVector l, BuildingType t, float[] s, color c, String p){
    this.location = l;
    this.type = t;
    this.size = s;
    this.col = c;
    //this.sprite = p;
  }
  
  //METHODS
  void drawBuilding() {
    //println(this.type, this.size[0], this.size[1]);
    
    //image(photo, this.location.x*grid_size, this.location.y*grid_size);
    
    fill(this.col);
    rect(this.location.x*grid_size, this.location.y*grid_size, this.size[0]*grid_size, this.size[1]*grid_size);
    fill(0);
    text(this.type.name(), this.location.x*grid_size, this.location.y*grid_size); 
   
  }
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home, new float[] {5,5}, color(130,115,73), "home sprite.png");
  }
}

class Hospital extends Building{
  Hospital(PVector l){
    super(l, BuildingType.Hospital, new float[] {8,8}, color(255,0,0), "hospital sprite.png");
  }
}

class Eatery extends Building{
  Eatery(PVector l){
    super(l, BuildingType.Eatery, new float[] {6,3}, color(177,122,155), "eatery sprite.png");
  }
}

class Park extends Building{
  Park(PVector l){
    super(l, BuildingType.Park, new float[] {5,5}, color(22,233,33), "park sprite.png");
  }
}
class School extends Building{
  School(PVector l){
    super(l, BuildingType.School, new float[] {9,6}, color(72,122,171), "school sprite.png");
  }
}
class Workplace extends Building{
  Workplace(PVector l){
    super(l, BuildingType.Workplace, new float[] {7,6}, color(156,171,73), "workplace sprite.png");
  }
}
