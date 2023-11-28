class Building {
  //FIELDS
  float[] size;
  PVector location;
  BuildingType type;
  
  //CONSTRUCTOR
  Building(PVector l, BuildingType t, float[] s){
    this.location = l;
    this.type = t;
    this.size = s;
  }
  
  //METHODS
  void drawBuilding() {
    fill(255);
    rect(this.location.x, this.location.y, this.location.x + this.size[0]*grid_size, this.location.x + this.size[1]*grid_size);
  }
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home, new float[] {1,1});
  }
}
