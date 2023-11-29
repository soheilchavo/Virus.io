class NPC{

  String name;
  int age;
  Occupation occupation;
  
  Routine routine;
  Routine sick_routine;
  
  boolean is_sick;
  float immunity;
  
  Home home;
  
  PVector location;
  
  NPC(Occupation o){
    this.occupation = o;
    
    this.name = getRandomName();
    this.age = getRandomAge(o);
    
    this.immunity = getImmunity(this.age);
    
    this.home = (Home)getRandomTypedBuilding(BuildingType.Home);
    this.location = home.location;
    
    this.initializeNormalRoutine();
    this.initializeSickRoutine();
  }
  
  void drawNPC() {
    fill(color(0,255,0));
    circle(this.location.x*grid_size, this.location.y*grid_size, 7);
  }
  
  void initializeNormalRoutine(){
    this.routine = new Routine(this, new Goal[] { new Goal(this.home.location, 0, 0) });
  }
  
  void initializeSickRoutine(){
    sick_routine = new Routine(this, new Goal[] { new Goal(findClosestBuilding(this.location, BuildingType.Hospital).location, 0, 0) });
  }
  
}
