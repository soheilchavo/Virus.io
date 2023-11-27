class NPC{

  String name;
  int age;
  Occupation occupation;
  
  Routine routine;
  Routine sick_routine;
  
  boolean is_sick;
  float immunity;
  
  Home home;
  
  NPC(Occupation o){
  
    this.occupation = o;
    
    this.name = get_random_name();
    this.age = get_random_age(o);
    
    this.immunitiy = get_immunity(this.age);
    
    this.initialize_normal_routine();
    this.initialize_sick_routine();
    
  }
  
  void find_closest_building(BuildingType btype){
  
  }
  
  void initialize_normal_routine(){
    this.routine = new Routine(this, new Goal[ new Goal(this.home.location) ]);
  }
  
  void initialize_sick_routine(){
    
  }
  
}
