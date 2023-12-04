class PathNode{

  PVector location;
  ArrayList<PathNode> neighbours;

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

//PathNode[] create_path(PathNode a, PathNode b){}
