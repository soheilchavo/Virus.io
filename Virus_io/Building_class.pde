class Building {
  //FIELDS
  float size;
  
  //CONSTRUCTOR
  Building(float s) {
    this.size = s; 
  }
  
  //METHODS
  void createBuilding() {
    fill(255);
    square(width/2,height/2,this.size);
  }
}
