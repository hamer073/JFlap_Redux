import static javax.swing.JOptionPane.*;

ArrayList<DFAState> states = new ArrayList<DFAState>(); 
ArrayList<Transition> transitions = new ArrayList<Transition>();
DFAState dragState;
DFAState transitionStartState;
DFAState transitionEndState;
DFAState startState;

// we're just going to store the mode as a boolean
// true means that we're in state mode (Creating states and moving states)
// false means that we're in transition mode (Creating a transition between states);
boolean mode = true;
float newTransitionStartX = -100;
float newTransitionStartY = -100;

// Some general purpose helper functions
float dist(float x, float y, DFAState state) {
  return (float) Math.sqrt(Math.pow((x - state.getX()), 2) + Math.pow((y - state.getY()), 2));
}

DFAState onState() {
  for(DFAState state : states) {
    if(dist(mouseX, mouseY, state) <= 40) {
      return state; 
    }
  }
  return null;
}

boolean runDFA(String word) {
  DFAState currentState = this.startState;
  char[] brokenWord = word.toCharArray();
  for(char character :  brokenWord) {
    println("The current character: " + character);
    if(currentState == null) {
      return false;
    }
    currentState = currentState.transition(character);
  }
  
  boolean result = currentState.isFinal();
  print(result);
  return result;
}

void openDropdown(DFAState state, float xPos, float yPos) {
  
}

// All of the built in functions that we have doing things

void setup() {
  size(800, 600);
  stroke(255);
}

void draw() {
  background(0);
  
  String modeDisplay;
  if(mode) {
    modeDisplay = "State";
  } else {
    modeDisplay = "Transition";
  }
  text(modeDisplay, 10, 30);
  
  // Draw states
  for(DFAState state : states) {
    state.draw();
    if(this.startState == state) {
      // Need to draw some indicator that this state is the start state
      // Probably a triangle to the left like JFlap
      fill(204, 102, 0);
      text("Start", state.getX(), state.getY());
      fill(255);
    }
  }
  
  // Draw transitions
  // For now these are just straight lines, will need to change so that they don't overlap
  // Use a curved line eventually
  for(Transition  transition : transitions) {
    transition.draw();
  }
  
  if(newTransitionStartX != -100) {
    line(newTransitionStartX, newTransitionStartY, mouseX, mouseY);
  }
}

void mouseClicked() {
  if(mouseButton == LEFT) {
    if(mode) {
      DFAState newState = new DFAState(mouseX, mouseY);
      states.add(newState);
      if(this.startState == null) {
        this.startState = newState;
      }
    }
  } else if(mouseButton == RIGHT) {
    DFAState state = onState();
    if(state != null) {
      state.flipFinal();
      openDropdown(state, mouseX, mouseY);
    }
  }
}

void mousePressed() {
  if(mode){
    dragState = onState();
  } else {
    transitionStartState = onState();
    if(transitionStartState != null) {
      newTransitionStartX = transitionStartState.getX();
      newTransitionStartY = transitionStartState.getY();
    }
  }
}

void mouseReleased() {
  if(mode) {
    dragState = null;
  } else {
    DFAState transitionEndState = onState();
    if(transitionStartState != null && transitionEndState != null) {
      String symbol = showInputDialog("Enter Symbol");
      if(symbol != null) {
        transitions.add(new Transition(symbol, transitionStartState, transitionEndState));
        transitionStartState.addTransition(symbol, transitionEndState);
      }
    }
    newTransitionStartX = -100;
    newTransitionStartY = -100;
    transitionStartState = null;
  }
}

void mouseDragged() {
  if(dragState != null) {
    dragState.xPos = mouseX;
    dragState.yPos = mouseY;
  }
}

void keyPressed() {
  if(key == 'm') {
    mode = !mode;
  } else if(key == 'r') {
    String word = showInputDialog("Enter word to test");
    runDFA(word);
  }
}
