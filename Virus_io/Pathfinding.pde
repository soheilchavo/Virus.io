class PathNode{

  PVector location;
  ArrayList<PathNode> neighbours;
  boolean explored = false;

  PathNode(PVector l){
    this.location = l;
    this.neighbours = new ArrayList<PathNode>();
  }
  
  void draw_node(){
    fill(0,0,255);
    circle(this.location.x*grid_size, this.location.y*grid_size, npc_size);
    
    fill(50,50,50);
    for(PathNode p: this.neighbours)
      if(p != null)
        line(this.location.x*grid_size, this.location.y*grid_size, p.location.x*grid_size, p.location.y*grid_size);
  }

}

boolean is_duplicate_node(PathNode p){
  for(PathNode d: path_nodes){
    if(d.location == p.location)
      return true;
  }
  return false;
}

float edge_distance(PathNode a, PathNode b){
  return dist(a.location.x, a.location.y, b.location.x, b.location.y);
}

void resetPathNodes(){
  for(PathNode p: path_nodes)
    p.explored = false;
}

PathNode find_closest_node(PVector location){
  
  float closest_dist = Float.POSITIVE_INFINITY;
  PathNode closest_node = path_nodes.get(0);
  
  for(PathNode p: path_nodes){
    float local_dist = location.dist(p.location);
    if(local_dist < closest_dist){
      closest_dist = local_dist;
      closest_node = p;
    }
  }
  
  return closest_node;
}

ArrayList<PathNode> find_path(PathNode a, PathNode b){
  
  ArrayList<PathNode> queue = new ArrayList<PathNode>();
  
  queue.add(a);
  a.explored = true;
  
  ArrayList<PathNode> parent_nodes = new ArrayList<PathNode>();
  
  while(queue.size() > 0){
  
    PathNode node = queue.get(0);
    queue.remove(0);
    
    ArrayList<PathNode> neighbours = node.neighbours;
    
    for(PathNode n: neighbours){
      if(n.explored == false){
        queue.add(n);
        n.explored = true;
        parent_nodes.add(node);
        if(node == b){ break; }
      }
    }
    
  }
  //println(parent_nodes.get(parent_nodes.size()-1) == b);
  ArrayList<PathNode> path = new ArrayList<PathNode>();
  
  for(int i = parent_nodes.size()-1; i >= 0; i--){
    path.add(parent_nodes.get(i));
  }
  
  resetPathNodes();
  return path;
  
}

boolean is_node_in_arraylist(PathNode p, ArrayList<PathNode> pa){
  
  for(PathNode i: pa)
    if(p == i)
      return true;
      
   return false;
  
}
