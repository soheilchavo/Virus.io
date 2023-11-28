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
  
  Occupation(){}
  
}

class Doctor extends Occupation{
  Doctor(){
    super("Doctor", 9, 17, 34);
  }
}

class Teacher extends Occupation{
  Teacher(){
    super("Teacher", 8, 14, 30);
  }
}

class Student extends Occupation{
  Student(){
    super("Student", 8, 14, 13);
  }
}

class Waiter extends Occupation{
  Waiter(){
    super("Waiter", 12, 22, 22);
  }
}

class Worker extends Occupation{
  Worker(){
    super("Worker", 9, 22, 36);
  }
}

class Homeless extends Occupation{
  Homeless(){
    super("Homeless", 0, 24, 45);
  }
}
