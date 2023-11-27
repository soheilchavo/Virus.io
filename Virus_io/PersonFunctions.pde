String get_random_name(){
  return "Steve";
}

int get_random_age(Occupation o){
  return o.avg_age+round(random(-age_deviation, age_deviation));
}

float get_immunity(int age){
  return age/100;
}
