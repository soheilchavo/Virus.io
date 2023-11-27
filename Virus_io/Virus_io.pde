Building hospital;

void setup() {
  size(800,600);

}

void draw() {
  background(128);
  
  generateBuildings();
}
void generateBuildings() {
  hospital = new Building(50); 
}
