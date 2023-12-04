class PathNode{

  PVector location;
  PathNode[] neighbours;

  PathNode(PVector l){
    this.location = l;
  }
  
  void draw_node(){
    fill(0,0,255);
    circle(this.location.x, this.location.y, npc_size);
    
    fill(50,50,50);
    for(PathNode p: this.neighbours)
      line(this.location.x, this.location.y, p.location.x, p.location.y);
  }

}

//PathNode[] create_path(PathNode a, PathNode b){}
