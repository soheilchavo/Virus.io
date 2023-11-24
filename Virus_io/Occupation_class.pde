class Occupation{

  String occupation_name;
  float work_start_hour;
  float work_end_hour;
  
  Goal[] goals;
  
  Occupation(String n, float s, float e){
    this.occupation_name = n;
    this.work_start_hour = s;
    this.work_end_hour = e;
  }
  
}
