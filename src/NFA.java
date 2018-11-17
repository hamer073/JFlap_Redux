import java.util.*;

public class NFA {

  private ArrayList<NFAState> states;
  private NFAState startState;
  private ArrayList<NFAState> acceptStates;

  public NFA(){
  }

  public void addState(String name) {
    states.add(new State(name));
  }

  public void removeState() {
    states.remove(this);
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
