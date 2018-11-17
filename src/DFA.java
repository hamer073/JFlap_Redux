import java.util.*;

public class DFA {

  private ArrayList<DFAState> states;
  private DFAState startState;
  private ArrayList<DFAState> acceptStates;

  public DFA() {
  }

  public void addState(String name) {
    states.add(new State(name));
  }

  public void removeState(String name) {
    for(DFAState state : states) {
      if(state.getName().equals(name)){
        states.remove(state);
        break;
      }
    }
    System.out.println("Error: Could not find specified state");
  }

  public void setAccept() {
    acceptStates.add(this);
  }

  public void removeAccept() {
    acceptStates.remove(this);
  }

  public void setInitial() {
    startState = this;
  }

}
