String getRandomName(){
  String[] random_names = loadStrings("Names.txt");
  return random_names[round(random(0, random_names.length))];
}

int weightedRandom(float[] weights){
  float r = random(1);
  
  for(int i = 0; i < weights.length; i++){
    if(weights[i] >= r)
      return i;
  }
  
  return 0;
}

Building createRandomBuilding(PVector l){
  int random_index = weightedRandom(building_rates);
  BuildingType b_type = b_type_order[random_index];
  
  HashMap<BuildingType, Building> type_to_object_hash = new HashMap<BuildingType, Building>();
  
  type_to_object_hash.put(BuildingType.Hospital, new Hospital(l));
  type_to_object_hash.put(BuildingType.School, new School(l));
  type_to_object_hash.put(BuildingType.Eatery, new Eatery(l));
  type_to_object_hash.put(BuildingType.Workplace, new Workplace(l));
  type_to_object_hash.put(BuildingType.Park, new Park(l));
  type_to_object_hash.put(BuildingType.Home, new Home(l));
  
  return type_to_object_hash.get(b_type);
}

Occupation getRandomOccupation(){
  
  BuildingType b_type = BuildingType.Home;
  
  while(b_type == BuildingType.Home){
    int random_index = weightedRandom(building_rates);
    b_type = b_type_order[random_index];
  }
  
  Occupation o = new Occupation();
  
  HashMap<BuildingType, Occupation> building_to_occupation_hash = new HashMap<BuildingType, Occupation>();
  
  building_to_occupation_hash.put(BuildingType.Hospital, new Doctor());
  building_to_occupation_hash.put(BuildingType.School, new Teacher());
  building_to_occupation_hash.put(BuildingType.Eatery, new Waiter());
  building_to_occupation_hash.put(BuildingType.Workplace, new Worker());
  building_to_occupation_hash.put(BuildingType.Park, new Homeless());
  
  o = building_to_occupation_hash.get(b_type);
  
  if(b_type == BuildingType.School){
    if(random(0,1) <= 0.9){
      o = new Student();
    }
  }
  
  return o;
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
  
  Building closest_b = buildings.get(0);
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

ArrayList<Building> getAllTypedBuildings(BuildingType t){

  ArrayList<Building> r = new ArrayList<Building>();
  
  for(Building b: buildings){
    if(b.type == t)
      r.add(b);
  }
  
  return r;
}

Building getRandomTypedBuilding(BuildingType t){
  ArrayList<Building> allTypedBuildings = getAllTypedBuildings(t);
  return allTypedBuildings.get(int(random(0, allTypedBuildings.size())));
}
