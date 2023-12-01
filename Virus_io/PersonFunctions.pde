String getRandomName(){
  String[] random_names = loadStrings("Names.txt");
  return random_names[round(random(0, random_names.length-1))];
}

void draw_hover_text(){

  for(NPC person: people){
    if(true){
      textSize(7);
      
      String textstr = person.name + ", " + person.age + " year old " + person.occupation.occupation_name;
      
      fill(0);
      text(textstr, person.location.x*grid_size, person.location.y*grid_size); 
      //return;
    }
  }
  
}

int weightedRandom(float[] rates){
  
  return round(random(0,rates.length));
  
  //float r = random(1);
  
  //float sum = 0;
  //for(float f: rates){
  //  sum += f;
  //}
  
  //HashMap<Float, Integer> weighthash = new HashMap<Float, Integer>();
  //float[] weights = new float[rates.length];
  
  //for(int i = 0; i < rates.length; i++){
  //  float weight = rates[i]/sum;
  //  weighthash.put(weight, i);
  //  weights[i] = weight;
  //}
  
  //sort(weights);
  
  //for(int i = 0; i < weights.length; i++){
  //  if(i == weights.length-1 || (weights[i] <= r && weights[i+1] > r))
  //    return weighthash.get(weights[i]);
  //}
  
  //return 0;
}

float sumOfRates(){
  float sum = 0;
  
  for(float f: building_rates){
    sum += f;
  }
  
  return sum;
}

ArrayList<Building> createRandomBuildings(){
  
  ArrayList<Building> new_b = new ArrayList<Building>();
  
  for(int t = 0; t < b_type_order.length-1; t++){
    println("t:" + t);
    BuildingType type = b_type_order[t];
    
    for(int i = 0; i < round((building_rates[t]/sumOfRates())*(city_size/1.5)); i++){
      
      HashMap<BuildingType, Building> type_to_object_hash = new HashMap<BuildingType, Building>();
      
      type_to_object_hash.put(BuildingType.Hospital, new Hospital(new PVector(0,0)));
      type_to_object_hash.put(BuildingType.School, new School(new PVector(0,0)));
      type_to_object_hash.put(BuildingType.Eatery, new Eatery(new PVector(0,0)));
      type_to_object_hash.put(BuildingType.Workplace, new Workplace(new PVector(0,0)));
      type_to_object_hash.put(BuildingType.Park, new Park(new PVector(0,0)));
      type_to_object_hash.put(BuildingType.Home, new Home(new PVector(0,0)));
      
      new_b.add(type_to_object_hash.get(type));
      
    }
    
  }
  
  return new_b;
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
