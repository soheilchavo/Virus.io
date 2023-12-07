class Occupation{

  String occupation_name;
  float work_start_hour = 0;
  float work_end_hour = 24;
  
  int avg_age = 40;
  
  float base_immunity = 0.5;
  
  Goal[] goals;
  
  Occupation(String n, float s, float e, int a, float b){
    this.occupation_name = n;
    this.work_start_hour = s;
    this.work_end_hour = e;
    this.avg_age = a;
    this.base_immunity = b;
  }
  
  Routine initializeRoutine(Building h, NPC p){
    return new Routine(p, new Goal[] { new Goal(h, 0, 24) });
  }
  
  Occupation(){}
  
}

class Doctor extends Occupation{
  Doctor(){
    super("Doctor", 9, 17, 34, 0.9);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Hospital);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 7), 
      new Goal(b, 7, 17), 
      new Goal(h, 17, 24) });
  }
}

class Teacher extends Occupation{
  Teacher(){
    super("Teacher", 8, 14, 30, 0.6);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.School);
    Building park = findClosestBuilding(p.home.location, BuildingType.Park);
    Building eatery = findClosestBuilding(p.home.location, BuildingType.Eatery);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8), 
      new Goal(b, 8, 14), 
      new Goal(new Building[] {h,park, eatery}, 14, 17),
      new Goal(new Building[] {h,park,eatery}, 17, 19),
      new Goal(h, 19, 24) });
  }
}

class Student extends Occupation{
  Student(){
    super("Student", 8, 14, 13, 0.8);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.School);
    Building park = findClosestBuilding(p.home.location, BuildingType.Park);
    Building eatery = findClosestBuilding(p.home.location, BuildingType.Eatery);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8), 
      new Goal(b, 8, 14), 
      new Goal(new Building[] {h,park,eatery}, 14, 22),
      new Goal(h, 22, 24) });
  }
}

class Waiter extends Occupation{
  Waiter(){
    super("Waiter", 12, 22, 22, 0.5);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Eatery);
    Building park = findClosestBuilding(p.home.location, BuildingType.Park);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 7), 
      new Goal(new Building[] {h,park}, 7, 9),
      new Goal(b, 9, 22), 
      new Goal(h, 22, 24) });
  }
}

class Worker extends Occupation{
  Worker(){
    super("Worker", 9, 22, 36, 0.45);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Workplace);
    Building park = findClosestBuilding(p.home.location, BuildingType.Park);
    Building eatery = findClosestBuilding(p.home.location, BuildingType.Eatery);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 9), 
      new Goal(b, 9, 17), 
      new Goal(new Building[] {h,park,eatery}, 17, 21),
      new Goal(h, 21, 24) });
  }
}

class Homeless extends Occupation{
  Homeless(){
    super("Unhoused Person", 0, 24, 45, 0.2);
  }
  
  Routine initializeRoutine(Building h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Park);
    Building eatery = findClosestBuilding(p.home.location, BuildingType.Eatery);
    
    return new Routine(p, new Goal[] { 
      new Goal(b, 0, 14), 
      new Goal(new Building[] {b,eatery}, 14, 22),
      new Goal(b, 22, 24) });
  }
}
