class Building {
  //FIELDS
  float[] size;
  PVector location;
  BuildingType type;
  
  color col;
  
  //CONSTRUCTOR
  Building(PVector l, BuildingType t, float[] s, color c){
    this.location = l;
    this.type = t;
    this.size = s;
    this.col = c;
  }
  
  //METHODS
  void drawBuilding() {
    fill(this.col);
    rect(this.location.x*grid_size, this.location.y*grid_size, this.location.x + this.size[0]*grid_size, this.location.x + this.size[1]*grid_size);
  }
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home, new float[] {1,1}, color(130,115,73));
  }
}

class Hospital extends Building{
  Hospital(PVector l){
    super(l, BuildingType.Hospital, new float[] {4,4}, color(255,0,0));
  }
}

class Eatery extends Building{
  Eatery(PVector l){
    super(l, BuildingType.Eatery, new float[] {3,2}, color(0,255,22));
  }
}

class Park extends Building{
  Park(PVector l){
    super(l, BuildingType.Park, new float[] {1,8}, color(22,233,33));
  }
}
class School extends Building{
  School(PVector l){
    super(l, BuildingType.School, new float[] {7,6}, color(72,122,171));
  }
}
class Workplace extends Building{
  Workplace(PVector l){
    super(l, BuildingType.Workplace, new float[] {4,3}, color(156,171,73));
  }
}
