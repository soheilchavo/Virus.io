class Building {
  //FIELDS
  PVector location;
  BuildingType type;
  
  Building(PVector l, BuildingType t){
    this.location = l;
    this.type = t;
  }
  
}

class Home extends Building{
  Home(PVector l){
    super(l, BuildingType.Home);
  }
}

enum BuildingType { Home, Hospital, Workplace, School, Park, Eatery };
