class Occupation{

  String occupation_name;
  float work_start_hour;
  float work_end_hour;
  
  int avg_age = 40;
  
  Goal[] goals;
  
  Occupation(String n, float s, float e, int a){
    this.occupation_name = n;
    this.work_start_hour = s;
    this.work_end_hour = e;
    this.avg_age = a;
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    return new Routine(p, new Goal[] { new Goal(h, 0, 24, p.home.size) });
  }
  
  Occupation(){}
  
}

class Doctor extends Occupation{
  Doctor(){
    super("Doctor", 9, 17, 34);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Hospital);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 7, b.size), 
      new Goal(b.location, 7, 17, b.size), 
      new Goal(h, 17, 24, b.size) });
  }
}

class Teacher extends Occupation{
  Teacher(){
    super("Teacher", 8, 14, 30);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.School);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8, b.size), 
      new Goal(b.location, 8, 14, b.size), 
      new Goal(h, 14, 24, b.size) });
  }
}

class Student extends Occupation{
  Student(){
    super("Student", 8, 14, 13);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.School);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8, b.size), 
      new Goal(b.location, 8, 14, b.size), 
      new Goal(h, 14, 24, b.size) });
  }
}

class Waiter extends Occupation{
  Waiter(){
    super("Waiter", 12, 22, 22);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Eatery);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8, b.size), 
      new Goal(b.location, 8, 14, b.size), 
      new Goal(h, 14, 24, b.size) });
  }
}

class Worker extends Occupation{
  Worker(){
    super("Worker", 9, 22, 36);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Workplace);
    
    return new Routine(p, new Goal[] { 
      new Goal(h, 0, 8, b.size), 
      new Goal(b.location, 8, 14, b.size), 
      new Goal(h, 14, 24, b.size) });
  }
}

class Homeless extends Occupation{
  Homeless(){
    super("Homeless", 0, 24, 45);
  }
  
  Routine initializeRoutine(PVector h, NPC p){
    Building b = findClosestBuilding(p.home.location, BuildingType.Park);
    
    return new Routine(p, new Goal[] { new Goal(b.location, 0, 24, b.size)});
  }
}
