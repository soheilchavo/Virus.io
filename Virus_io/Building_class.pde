class Building {
  //FIELDS
  float size;
  PVector location;
  BuildingType type;
  
  //CONSTRUCTOR
  Building(PVector l, BuildingType t, float s){
    this.location = l;
    this.type = t;
    this.size = s;
  }
  
  //METHODS
  void createBuilding() {
    fill(255);
    square(width/2,height/2,this.size);
  }
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home);
  }
}

enum BuildingType { Home, Hospital, Workplace, School, Park, Eatery };
