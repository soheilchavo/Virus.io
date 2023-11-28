String getRandomName(){
  return "Steve";
}

int getRandomAge(Occupation o){
  return o.avg_age+round(random(-age_deviation, age_deviation));
}

float getImmunity(int age){
  return age/100;
}

float vectorToBuildingDist(PVector p, Building b){
  return dist(p.x, p.y, b.location.x, b.location.y);
}


Building findClosestBuilding(PVector p, BuildingType btype){
  
  Building closest_b = buildings[0];
  float closest_dist = Float.POSITIVE_INFINITY;
  
  for(Building b: buildings){
    if(b.type == btype){
      float d = vectorToBuildingDist(p, b);
      if(d < closest_dist){
        closest_b = b;
        closest_dist = d;
      }
    }
  }
  
  return closest_b;
}
