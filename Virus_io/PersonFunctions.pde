String getRandomName() {
  String[] random_names = loadStrings("Names.txt");
  String name = random_names[round(random(0, random_names.length-1))];

  return name;
}

// Untranslated Mouse coords
PVector getGlobalMouseCoords(){
  
  float mouse_x = (mouseX/zoom)-x_offset;
  float mouse_y = (mouseY/zoom)-y_offset;
  
  return new PVector(mouse_x, mouse_y);
}

int weightedRandom(float[] rates) {
  return round(random(rates.length-1));
}

// Returns the sum of all building rates (used for random functions)
float sumOfBuildingRates() {
  float sum = 0;
  for (float f : building_rates) {
    sum += f;
  }
  return sum;
}

ArrayList<Building> createRandomBuildings() {

  ArrayList<Building> new_b = new ArrayList<Building>();
  float s = sumOfBuildingRates();
  
  // Itterates through all building types, then generates a number (min 1) of buildings based on the user set rates 
  for (int t = 0; t < 6; t++) {
    
    BuildingType type = b_type_order[t];
    
    for (int i = 0; i < ceil((building_rates[t]/s)*city_size*city_size)+1; i++) {
      
      HashMap<BuildingType, Building> type_to_object_hash = new HashMap<BuildingType, Building>();

      type_to_object_hash.put(BuildingType.Hospital, new Hospital(new PVector(0, 0)));
      type_to_object_hash.put(BuildingType.School, new School(new PVector(0, 0)));
      type_to_object_hash.put(BuildingType.Eatery, new Eatery(new PVector(0, 0)));
      type_to_object_hash.put(BuildingType.Workplace, new Workplace(new PVector(0, 0)));
      type_to_object_hash.put(BuildingType.Park, new Park(new PVector(0, 0)));
      type_to_object_hash.put(BuildingType.Home, new Home(new PVector(0, 0)));

      new_b.add(type_to_object_hash.get(type));
    }
  }
  
  return new_b;
}

Occupation getRandomOccupation() {

  // Gets a random building type (not home)
  BuildingType b_type = BuildingType.Home;
  while (b_type == BuildingType.Home) {
    int random_index = weightedRandom(building_rates);
    b_type = b_type_order[random_index];
  }

  // Gets the correlated occupation for the building, i.e hospital -> doctor
  Occupation o = new Occupation();

  HashMap<BuildingType, Occupation> building_to_occupation_hash = new HashMap<BuildingType, Occupation>();

  building_to_occupation_hash.put(BuildingType.Hospital, new Doctor());
  building_to_occupation_hash.put(BuildingType.School, new Teacher());
  building_to_occupation_hash.put(BuildingType.Eatery, new Waiter());
  building_to_occupation_hash.put(BuildingType.Workplace, new Worker());
  building_to_occupation_hash.put(BuildingType.Park, new Homeless());

  o = building_to_occupation_hash.get(b_type);

  // Randomly chooses between student and teacher (since schools have both occupations)
  if (b_type == BuildingType.School) {
    if (random(0, 1) <= 0.9) {
      o = new Student();
    }
  }

  return o;
}

int getRandomAge(Occupation o) {
  return o.avg_age+round(random(-age_deviation, age_deviation));
}

float vectorToBuildingDist(PVector p, Building b) {
  return dist(p.x, p.y, b.location.x, b.location.y);
}

Building findClosestBuilding(PVector p, BuildingType btype) {

  Building closest_b = buildings.get(0);
  float closest_dist = Float.POSITIVE_INFINITY;

  for (Building b : buildings) {
    if (b.type == btype) {
      float d = vectorToBuildingDist(p, b);
      if (d < closest_dist) {
        closest_b = b;
        closest_dist = d;
      }
    }
  }
  return closest_b;
}

// Returns all buildings of a certain type
ArrayList<Building> getAllTypedBuildings(BuildingType t) {

  ArrayList<Building> r = new ArrayList<Building>();

  for (Building b : buildings) {
    if (b.type == t)
      r.add(b);
  }
  return r;
}

// Returns a random type of building
Building getRandomTypedBuilding(BuildingType t) {
  ArrayList<Building> allTypedBuildings = getAllTypedBuildings(t);
  return allTypedBuildings.get(int(random(0, allTypedBuildings.size())));
}
