class DFAState {
  private float xPos;
  private float yPos;
  HashMap<String, DFAState> transition = new HashMap<String, DFAState>();
  private boolean isFinal = false;
  
  public DFAState(float x, float y) {
    this.xPos = x;
    this.yPos = y;
  }
  
  public void addTransition(String symbol, DFAState endState) {
    this.transition.put(symbol, endState);
  }
  
  public DFAState transition(char symbol) {
    return this.transition.get(symbol);
  }
  
  // Have the draw function here so the draw function in the main file looks a little better  
  public void draw() {
    ellipse(this.xPos, this.yPos, 40, 40);
    if(this.isFinal) {
      stroke(0);
      ellipse(this.xPos, this.yPos, 35, 35);
    }
    stroke(255);
  }
  
  // Some general getter and setter functions
  public boolean isFinal() {
    return this.isFinal;
  }
  
  public void flipFinal() {
    this.isFinal = !this.isFinal;
  }
  
  public float getX() {
    return this.xPos;
  }
  
  public float getY() {
    return this.yPos;
  }
  
  public void setX(float newX) {
    this.xPos = newX;
  }
  
  public void setY(float newY) {
    this.yPos = newY;
  }
}
