class Transition {
  DFAState start;
  DFAState end;
  String symbol;
  
  public Transition(String symbol, DFAState start, DFAState end) {
    this.symbol = symbol;
    this.start = start;
    this.end = end;
  }
  
  public DFAState getStart() {
    return this.start;
  }
  
  public DFAState getEnd() {
    return this.end;
  }
  
  public String getSymbol() {
    return this.symbol;
  }
  
  public void draw() {
    // Getting info for and drawing the transition
    float xPosStart = this.start.getX();
    float yPosStart = this.start.getY();
    float xPosEnd = this.end.getX();
    float yPosEnd = this.end.getY();
    
    line(xPosStart, yPosStart, xPosEnd, yPosEnd);
    
    // Placing and drawing the label for the transition
    float halfwayX = (xPosStart + xPosEnd) / 2;
    float halfwayY = ((yPosStart + yPosEnd) / 2) - 10;
    text(this.symbol, halfwayX, halfwayY);
  }
  
}
